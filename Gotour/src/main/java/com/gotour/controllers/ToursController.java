package com.gotour.controllers;

import com.gotour.models.Tour;
import com.gotour.services.CityService;
import com.gotour.services.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/tours")
public class ToursController {

    @Autowired
    private TourService ts;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap map) {
        map.put("msg", "Hello World!");
        return "tour/list";
    }

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

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newTour(ModelMap map) {

        return "tour/new";
    }

}
