package com.gotour.controllers;


import com.gotour.models.Guide;
import com.gotour.models.Tourist;
import com.gotour.models.User;


import com.gotour.services.UserService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionAttributeStore;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;


@Controller
@RequestMapping("/users")
@SessionAttributes("user")
public class UsersController {

  @Autowired
  UserService userService;

  @RequestMapping(value = "/signup", method = RequestMethod.GET)
  public String signup(ModelMap map) {
    User user = new User() {};
    int type = 0;
    
    map.addAttribute("userForm", user);
    map.addAttribute("userType", type);
    
    return "user/signup";
  }

  @RequestMapping(value = "/new", method = RequestMethod.POST)
  public String register(@RequestParam Map<String,String> requestParams, ModelMap model) {
    int userType = Integer.valueOf(requestParams.get("userType"));
    String name = requestParams.get("name");
    String email = requestParams.get("email");
    String password = requestParams.get("password");
    String phone = requestParams.get("phone");
    
    if(userType==0){
      Tourist user = new Tourist(name,email,password);
      userService.addTourist(user);
    } else {
      Guide user = new Guide(name,email,password, phone);
      userService.addGuide(user);
    }
        
    return "redirect:/users/login";
  }

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login(ModelMap map) {
    map.put("msg", "Hello World!");
    return "user/login";
  }

  @RequestMapping(value = "/signin", method = RequestMethod.POST)
  public String signin(@RequestParam String email, @RequestParam String password, ModelMap map) {
    User u = userService.authenticateUser(email, password);
    if (u != null) {
      map.addAttribute("user", u);
      return "redirect:/";
    } else {
      return "redirect:/users/login";
    }
  }

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(SessionStatus status) {
    status.setComplete();
    return "redirect:/";
  }
  
  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public String profile(ModelMap map) {
    User user = userService.getTourist("guia@guia.com");
    
    //map.addAttribute("user", user);
    
    return "user/profile";
  }
  
  @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
  public String edit(ModelMap map, @PathVariable long id) {
    User user = userService.getTourist("guia@guia.com");
    

    return "user/edit";
  }
  
  @RequestMapping(value = "/edit", method = RequestMethod.POST)
  public String edit() {
    
    
    return "user/profile";
  }
}
