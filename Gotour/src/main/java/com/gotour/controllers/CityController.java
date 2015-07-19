package com.gotour.controllers;

import com.gotour.models.City;
import com.gotour.models.Theme;
import com.gotour.models.Tour;
import com.gotour.services.CityService;
import com.gotour.services.ThemeService;
import com.gotour.services.TourService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    City c = cityService.getCityByID(1L);
    
    List<Tour> tours = tourService.getToursByCity(c);    
    model.addAttribute("cityTours", tours);
    
    model.addAttribute("cities", cityService.getUniqueCities());
    model.addAttribute("thematics", themeService.getThemes());
    
    model.addAttribute("actualCity", null);
    model.addAttribute("actualTheme", null);
        
    return "city/list";
  }
  
  @RequestMapping(value = "/{cityID}/{themeID}", method = RequestMethod.GET)
  public String list(@PathVariable long cityID, @PathVariable long themeID, ModelMap model) {
    List<Tour> tours = null;
    City c = null;
    Theme t = null;
    if(cityID != 0 && themeID != 0){
      c = cityService.getCityByID(cityID);
      t = themeService.getThemeByID(themeID);
      tours = tourService.getToursByCityAndTheme(c,t);
    } else {
      if(cityID == 0 && themeID != 0) {
        t = themeService.getThemeByID(themeID);
        tours = tourService.getToursByTheme(t);
      } else {
        if(cityID != 0 && themeID == 0) {
          return "redirect:/cities/"+cityID;
        } else {
          return "redirect:/cities";
        }
      }
    }
    
    model.addAttribute("actualCity", c);
    model.addAttribute("actualTheme", t);
    
    model.addAttribute("cityTours", tours);
    model.addAttribute("cities", cityService.getUniqueCities());
    model.addAttribute("thematics", themeService.getThemes());
    
    return "city/list";
  }
  
  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public String index(@PathVariable long id, ModelMap model) {
    City c = cityService.getCityByID(id);
    if(c==null)
      c = cityService.getCityByID(2L);
    
    List<Tour> tours = tourService.getToursByCity(c);    
    model.addAttribute("cityTours", tours);
   
    model.addAttribute("cities", cityService.getUniqueCities());
    model.addAttribute("thematics", themeService.getThemes());
    
    model.addAttribute("actualCity", c);
    model.addAttribute("actualTheme", null);
    
    return "city/list";
  }
}
