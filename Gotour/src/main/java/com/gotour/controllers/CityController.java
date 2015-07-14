package com.gotour.controllers;

import com.gotour.models.City;
import com.gotour.models.Tour;
import com.gotour.services.CityService;
import com.gotour.services.ThemeService;
import com.gotour.services.TourService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value = "/cities")
@SessionAttributes("user")
public class CityController {

  @Autowired private CityService cityService;
  @Autowired private TourService tourService;
  @Autowired private ThemeService themeService;

  @RequestMapping(method = RequestMethod.GET)
  public String index(ModelMap model) {
    model.addAttribute("cityList",cityService.getCities());
    
    City c = cityService.getCityByID(2L);
    List<Tour> tours = tourService.getToursByCity(c);    
    model.addAttribute("cityTours", tours);
    model.addAttribute("thematics", themeService.getThemes());
    
    return "city/list";
  }
  
  @ResponseBody
  @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
  public List<Tour> toursByCityID(@PathVariable long id) {
    System.out.println("asdasdasdasdas");
    City c = cityService.getCityByID(id);
    return tourService.getToursByCity(c);
  }
}
