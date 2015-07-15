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
    City c = cityService.getCityByID(2L);
    
    model.addAttribute("cityList",cityService.getCities());
   
    List<Tour> tours = tourService.getToursByCity(c);    
    model.addAttribute("cityTours", tours);
    model.addAttribute("thematics", themeService.getThemes());
    
    return "city/list";
  }
  
  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public String index(@PathVariable long id, ModelMap model) {
    City c = cityService.getCityByID(id);
    if(c==null)
      c = cityService.getCityByID(2L);
    
    model.addAttribute("cityList",cityService.getCities());
   
    List<Tour> tours = tourService.getToursByCity(c);    
    model.addAttribute("cityTours", tours);
    model.addAttribute("thematics", themeService.getThemes());
    
    return "city/list";
  }
}
