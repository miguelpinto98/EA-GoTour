package com.gotour.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsersController {

  @RequestMapping(value = "/users/signup", method = RequestMethod.GET)
  public String signup(ModelMap map) {
    map.put("msg", "Hello World!");
    return "user/signup";
  }
  
  @RequestMapping(value = "/users/new", method = RequestMethod.POST)
  public String register(ModelMap map) {
    
    return "";
  }
  
  @RequestMapping(value = "/users/login", method = RequestMethod.GET)
  public String login(ModelMap map) {
    map.put("msg", "Hello World!");
    return "user/login";
  }
}
