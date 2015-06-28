/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.controllers;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
  
  private static final Logger logger = Logger.getLogger(HomeController.class);

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String index(ModelMap map) {
    
    if(logger.isDebugEnabled()){
			logger.debug("getIndex is executed!");
		}
    
    map.put("msg", "Hello World!");
    return "index";
  }
}
