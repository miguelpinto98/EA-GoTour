/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.controllers;

import com.gotour.models.City;
import com.gotour.models.Review;
import com.gotour.services.CityService;
import com.gotour.services.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

  @Autowired private TourService ts;
  @Autowired private CityService cityService;
  
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String index(ModelMap model) {
    
    model.addAttribute("citySearch", new City());
    model.addAttribute("cityList", cityService.getCities());
    model.addAttribute("reviews", ts.getLastReviews(3));
    
    return "index";
  }
  
  @RequestMapping(value = "/search", method = RequestMethod.POST)
  public String search(@ModelAttribute("citySearch") City city, ModelMap map) {
    City c = cityService.getCity(city.getName());
    
    map.addAttribute("city", c);
    
    return "city/show";
  }
}
