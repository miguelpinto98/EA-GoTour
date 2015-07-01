package com.gotour.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ToursController {

  @RequestMapping(value = "tours", method = RequestMethod.GET)
  public String index(ModelMap map) {
    map.put("msg", "Hello World!");
    return "tour/list";
  }
}
