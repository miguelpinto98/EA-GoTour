package com.gotour.controllers;

import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import com.gotour.models.Theme;
import com.gotour.models.Tour;
import com.gotour.services.CityService;
import com.gotour.services.ThemeService;
import com.gotour.services.TourService;
import com.gotour.services.PointOfInterestService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/tours")
public class ToursController {

  @Autowired
  private TourService tourService;
  @Autowired
  private CityService cityService;
  @Autowired
  private ThemeService themeService;
  @Autowired
  private PointOfInterestService poiService;

  @Autowired
  private TourService ts;

  @RequestMapping(value = "/{tourId}", method = RequestMethod.GET)
  public String show(@PathVariable Long tourId, ModelMap model) {
    Tour t = ts.getTour(tourId);
    model.addAttribute("tour", t);
    model.addAttribute("guide", t.getGuide());
    model.addAttribute("city", t.getCity());
    model.addAttribute("theme", t.getTheme());
    model.addAttribute("idioms", t.getLanguages());
    model.addAttribute("pois", t.getPointsOfInterest());
    model.addAttribute("reviews", t.getReviews());
    model.addAttribute("enrollments", t.getAvailableEnrollments());
    return "tour/show";
  }

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String index(Map<String, Object> model) {
    model.put("cityList", cityService.getCities());

    return "tour/list";
  }

  @RequestMapping(value = "/new", method = RequestMethod.GET)
  public String newTour(Map<String, Object> model) {
    Tour t = new Tour();

    List<City> cities = cityService.getCities();
    List<Theme> themes = themeService.getThemes();
    List<PointOfInterest> pois = poiService.getPoints();

    model.put("tourForm", t);
    model.put("cityList", cities);
    model.put("themeList", themes);
    model.put("poisList", pois);

    return "tour/new";
  }

  @RequestMapping(value = "/create", method = RequestMethod.POST)
  public String create(@ModelAttribute("userForm") Tour tour, Map<String, Object> model) {

    City c = cityService.getCityByID(tour.getCity().getId());
    Theme t = themeService.getThemeByID(tour.getTheme().getId());
    List<PointOfInterest> poi = poiService.getSelectedPoints(tour.getPoints());
    tour.setPointsOfInterest(poi);
    tour.setCity(c);
    tour.setTheme(t);

    System.out.println("name: " + tour.getName());
    System.out.println("desc: " + tour.getDescription());
    System.out.println("city: " + tour.getCity().getName());
    System.out.println("Theme: " + tour.getTheme().getName());
    System.out.println("Duration: " + tour.getDuration());
    System.out.println("Normal Price: " + tour.getNormalPrice());
    System.out.println("Student Price: " + tour.getStudentPrice());
    System.out.println("Free?: " + tour.isFree());
    System.out.println("POIS: " + tour.getPointsOfInterest().toString());
    tourService.addTour(tour);

    return "redirect:/tours/"+String.valueOf(tour.getId());
  }

  @RequestMapping(value = "/theme/{id}", method = RequestMethod.GET)
  public String ByTheme(@PathVariable String id, ModelMap map) {
    map.put("msg", id);
    return "tour/list";
  }
  
  @RequestMapping(value = "/{id}/schedule", method = RequestMethod.GET)
  public String schedule(@PathVariable Long id, ModelMap model) {
    Tour t = tourService.getTour(id);
    
    model.addAttribute("tour", t);
    
    return "tour/schedule";
  }
}
