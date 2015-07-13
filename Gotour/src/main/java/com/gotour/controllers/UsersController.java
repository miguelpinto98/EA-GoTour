package com.gotour.controllers;

import com.gotour.models.Guide;
import com.gotour.models.Tourist;
import com.gotour.models.User;
import com.gotour.services.ReviewService;

import com.gotour.services.UserService;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;
import javax.imageio.ImageIO;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/users")
@SessionAttributes("user")
public class UsersController {

  @Autowired UserService userService;
  @Autowired ReviewService reviewService;

  @RequestMapping(value = "/signup", method = RequestMethod.GET)
  public String signup(ModelMap map) {
    User user = new User() {
    };
    int type = 0;

    map.addAttribute("userForm", user);
    map.addAttribute("userType", type);

    return "user/signup";
  }

  @RequestMapping(value = "/new", method = RequestMethod.POST)
  public String register(@RequestParam Map<String, String> requestParams, ModelMap model) {
    int userType = Integer.valueOf(requestParams.get("userType"));
    String name = requestParams.get("name");
    String email = requestParams.get("email");
    String password = requestParams.get("password");
    String phone = requestParams.get("phone");

    if (userType == 0) {
      Tourist user = new Tourist(name, email, password);
      userService.addTourist(user);
    } else {
      Guide user = new Guide(name, email, password, phone);
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
  public String profile(ModelMap map, @PathVariable long id) {
    User user = userService.getUser(id);

    if (user instanceof Guide) {
      map.addAttribute("user", ((Guide) user));
      map.addAttribute("type", 1);
      map.addAttribute("lastReviews", null);
    } else {
      map.addAttribute("user", ((Tourist) user));
      map.addAttribute("type", 0);
    }
    return "user/profile";
  }

  @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
  public String edit(ModelMap map, @PathVariable long id) {
    User user = userService.getUser(id);

    if (user instanceof Guide) {
      map.addAttribute("userForm", ((Guide) user));
      map.addAttribute("type", 1);
    } else {
      map.addAttribute("userForm", ((Tourist) user));
      map.addAttribute("type", 0);
    }

    return "user/edit";
  }

  @RequestMapping(value = "/edit", method = RequestMethod.POST)
  public String edit(@RequestParam Map<String, String> params, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
    System.out.println("$$$$$$: " + params.toString());
    long id = Long.valueOf(params.get("id"));
    int type = Integer.valueOf(params.get("type"));
    String password = params.get("password");
    
    User user = userService.getUser(id);
    if (user.getPassword().equals(password)) {
      String name = params.get("name");
      String email = params.get("email");
      String desc = params.get("description");
      String phone = params.get("phone");
      
      String conf_password = params.get("conf_password");
      if(!conf_password.isEmpty()) {
        user.setPassword(conf_password);
      }
      
      user.setName(name);
      user.setEmail(email);
      user.setDescription(desc);

      if (!file.isEmpty()) {
        try {
          String realPath = request.getServletContext().getRealPath("WEB-INF/resources/img/users");
          String filename = file.getOriginalFilename();
          String finalPath = realPath + "/" + id + "_" + filename;

          File serverFile = new File(finalPath);

          byte[] bytes = file.getBytes();

          // Stream to write data to file in server.
          BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
          stream.write(bytes);
          stream.close();

          user.setAvatar(id+"_"+filename);
          System.out.println("Write file: " + serverFile);
        } catch (Exception e) {
          return "You failed to upload " + id + " => " + e.getMessage();
        }
      }
      if(type==0){
        userService.updateTourist((Tourist)user);
      } else {
        ((Guide)user).setPhone(phone);
        userService.updateGuide((Guide)user);
      }
    }

    return "redirect:/users/" + id;
  }
}
