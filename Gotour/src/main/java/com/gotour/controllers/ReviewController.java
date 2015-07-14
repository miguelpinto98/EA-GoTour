package com.gotour.controllers;

import com.gotour.models.Review;
import com.gotour.models.Tour;
import com.gotour.models.Tourist;
import com.gotour.services.ReviewService;
import com.gotour.services.TourService;
import com.gotour.services.UserService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value = "/reviews")
@SessionAttributes("user")
public class ReviewController {

  @Autowired private TourService tourService;
  @Autowired private UserService userService;
  @Autowired private ReviewService reviewService;
  

  @RequestMapping(value = "/new", method = RequestMethod.POST)
  public String review(@ModelAttribute("reviewForm") Review review, Map<String, Object> model) {    
    Tour tour = tourService.getTour(review.getTour().getId());
    Tourist tourist = (Tourist) userService.getUser(review.getTour().getId());
    
    review.setTour(tour);
    review.setTourist(tourist);

    reviewService.add(review);
    
    return "redirect:/tours/"+tour.getId();
  }
}
