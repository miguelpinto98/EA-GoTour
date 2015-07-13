/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.controllers;

import com.gotour.services.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

  @Autowired private TourService ts;
  
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String index(ModelMap model) {
    System.out.println(ts.getLastReviews(3));
    model.addAttribute("reviews", ts.getLastReviews(3));
    return "index";
  }
  
  @RequestMapping(value = "/searchByCityTour", method = RequestMethod.POST)
  public String search(ModelMap map) {
    
    return "";
  }
}
