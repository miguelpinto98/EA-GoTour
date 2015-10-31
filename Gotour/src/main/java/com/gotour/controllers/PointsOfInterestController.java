package com.gotour.controllers;

import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import com.gotour.services.CityService;
import com.gotour.services.PointOfInterestService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/points")
public class PointsOfInterestController {

  @Autowired
  private PointOfInterestService poiService;
  @Autowired
  private CityService cityService;

  @ResponseBody
  @RequestMapping(value = "/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
  public PointOfInterest create(@RequestParam String name, @RequestParam String description, @RequestParam String location, @RequestParam long cityid, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
    PointOfInterest point = new PointOfInterest();
    City city = cityService.getCityByID(cityid);

    point.setName(name);
    point.setDescription(description);
    point.setLocation(location);

    if (!file.isEmpty()) {
      try {
        String realPath = request.getServletContext().getRealPath("WEB-INF/resources/img/points_of_interest");
        String filename = file.getOriginalFilename();
        String finalPath = realPath + "/" + filename;
        
        File serverFile = new File(finalPath);

        byte[] bytes = file.getBytes();

        // Stream to write data to file in server.
        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
        stream.write(bytes);
        stream.close();
                
        point.setImage(filename);
        System.out.println("Write file: " + serverFile);
      } catch (Exception e) {
        return null;
      }
      
      point.setCity(city);
      poiService.addPointOfInterest(point);
      return point;
    }
    return null;
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.GET)
  public List<PointOfInterest> list() {
    return poiService.getPoints();
  }

  @ResponseBody
  @RequestMapping(value = "/city/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
  public Set<PointOfInterest> list(@PathVariable long id) {
    return poiService.getPointsOfCity(id);
  }

  @ResponseBody
  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public PointOfInterest show(@PathVariable long id) {
    return poiService.getPointOfInterestById(id);
  }
}
