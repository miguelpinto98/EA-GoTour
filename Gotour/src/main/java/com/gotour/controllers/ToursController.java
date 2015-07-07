package com.gotour.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/tours")
public class ToursController {

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String index(ModelMap map) {
    map.put("msg", "Hello World!");
    return "tour/list";
  }
  
  @RequestMapping(value = "/{tourId}", method = RequestMethod.GET)
  public String show(@PathVariable int tourId, ModelMap map) {

    return "tour/show";
  }
  
  @RequestMapping(value = "/new", method = RequestMethod.GET)
  public String newTour(ModelMap map) {

    return "tour/new";
  }
  
  
}
