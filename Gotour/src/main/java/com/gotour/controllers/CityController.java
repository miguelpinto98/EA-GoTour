package com.gotour.controllers;

import com.gotour.models.Review;
import com.gotour.services.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value = "/cities")
@SessionAttributes("user")
public class CityController {

  @Autowired private CityService cityService;

  
  @RequestMapping(method = RequestMethod.GET)
  public String index(ModelMap model) {
    model.addAttribute("cityList",cityService.getCities());
    
    return "city/list";
  }
}
