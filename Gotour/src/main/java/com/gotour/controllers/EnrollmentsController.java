/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.controllers;

import com.gotour.models.User;
import com.gotour.services.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value = "/enrollments")
@SessionAttributes("user")
public class EnrollmentsController {

  @Autowired
  private TourService ts;

  @RequestMapping(value = "/{enrollmentsId}", method = RequestMethod.POST)
  @ResponseBody
  public boolean enrollTourist(@PathVariable Long enrollmentsId, @ModelAttribute User user) {
    return ts.enrollTourist(enrollmentsId, user.getId());
  }

  @RequestMapping(value = "/{enrollmentsId}/users", method = RequestMethod.GET)
  @ResponseBody
  public boolean isEnrolled(@PathVariable Long enrollmentsId, @ModelAttribute User user) {
    return ts.isEnrolled(enrollmentsId, user.getId());
  }
}
