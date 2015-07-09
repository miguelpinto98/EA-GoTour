package com.gotour.controllers;

import com.gotour.models.User;

import com.gotour.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
    return "user/signup";
  }

  @RequestMapping(value = "/new", method = RequestMethod.POST)
  public String register(ModelMap model) {
    return "";
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
  
  @RequestMapping(value = "/profile", method = RequestMethod.GET)
  public String profile(ModelMap map) {

    return "user/profile";
  }
}
