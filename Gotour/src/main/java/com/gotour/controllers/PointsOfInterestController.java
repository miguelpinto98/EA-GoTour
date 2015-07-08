package com.gotour.controllers;

import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import com.gotour.services.CityService;
import com.gotour.services.PointOfInterestService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/points")
public class PointsOfInterestController {

  @Autowired private PointOfInterestService poiService;
  @Autowired private CityService cityService;
  
  @RequestMapping(value = "/create", method = RequestMethod.POST)
  public @ResponseBody String create(@RequestParam String name,@RequestParam String description, @RequestParam String location,@RequestParam String cityid) {
    PointOfInterest point = new PointOfInterest();
    City city = cityService.getCityByID(Long.parseLong(cityid));
    
    point.setName(name);
    point.setDescription(description);
    point.setLocation(location);
    point.setCity(city);
    
    poiService.addPointOfInterest(point);
        
    return "{\"id\": "+point.getId()+", \"name\": \""+point.getName()+"\"}";
  }
}
