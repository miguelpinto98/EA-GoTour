package com.gotour.controllers;

import com.gotour.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/users")
public class UsersController {

  @Autowired
  UserService userService;

  @RequestMapping(value = "/signup", method = RequestMethod.GET)
  public String signup(ModelMap map) {
    map.put("msg", "Hello World!");
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
  public String signin(ModelMap map) {

    return "";
  }

  @RequestMapping(value = "/profile", method = RequestMethod.GET)
  public String profile(ModelMap map) {

    return "user/profile";
  }
}
