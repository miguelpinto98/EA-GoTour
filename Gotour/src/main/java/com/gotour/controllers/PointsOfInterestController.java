package com.gotour.controllers;

import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import com.gotour.services.CityService;
import com.gotour.services.PointOfInterestService;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping(value = "/points")
public class PointsOfInterestController {

  @Autowired private PointOfInterestService poiService;
  @Autowired private CityService cityService;
  
  @RequestMapping(value = "/create", method = RequestMethod.POST)
  public PointOfInterest create(@RequestParam String name, @RequestParam String description, @RequestParam String location, @RequestParam long cityid) {
    PointOfInterest point = new PointOfInterest();
    City city = cityService.getCityByID(cityid);
    
    point.setName(name);
    point.setDescription(description);
    point.setLocation(location);
    point.setCity(city);
    
    poiService.addPointOfInterest(point);
        
    //return "{\"id\": "+point.getId()+", \"name\": \""+point.getName()+"\"}";
    return point;
  }
  
  @ResponseBody
  @RequestMapping(method = RequestMethod.GET)
  public List<PointOfInterest> list() {
    return poiService.getPoints();
  }
  
  @ResponseBody
  @RequestMapping(value = "/city/{id}" ,method = RequestMethod.GET)
  public Set<PointOfInterest> list(@PathVariable long id) {
    return poiService.getPointsOfCity(id);
  }
}
