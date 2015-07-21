/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.services;

import com.gotour.daos.EnrollmentsDao;
import com.gotour.daos.LanguageDao;
import com.gotour.daos.ReviewDao;
import com.gotour.daos.ThemeDao;
import com.gotour.daos.TourDao;
import com.gotour.daos.TouristDao;
import com.gotour.models.City;
import com.gotour.models.Enrollments;
import com.gotour.models.Language;
import com.gotour.models.Review;
import com.gotour.models.Theme;
import com.gotour.models.Tour;
import com.gotour.models.Tourist;
import java.util.List;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("tourService")
@Transactional
public class TourServiceImpl implements TourService {

  @Autowired
  private ThemeDao themes;
  @Autowired
  private LanguageDao languages;
  @Autowired
  private TourDao tours;
  @Autowired
  private EnrollmentsDao enrollments;
  @Autowired
  private ReviewDao reviews;
  @Autowired
  private TouristDao tourists;

  public void addTheme(Theme t) {
    themes.save(t);
  }

  public void addLanguage(Language l) {
    languages.save(l);
  }

  public Language getLanguage(String language) {
    return languages.getLanguage(language);
  }

  public Theme getTheme(String theme) {
    return themes.getTheme(theme);
  }

  public void addTour(Tour t) {
    tours.save(t);
  }

  public Enrollments addTourDate(Tour t, Language l, DateTime date, int maxEnrollments) {
    Enrollments e = new Enrollments();
    e.setLanguage(l);
    e.setMaxEnrollments(maxEnrollments);
    e.setTour(t);
    e.setDate(date);
    enrollments.save(e);
    return e;
  }

  public boolean enrollTourist(Long enrollmentsId, Long touristId) {
    Enrollments e = enrollments.find(enrollmentsId);
    if (e.addEnrollment(tourists.find(touristId))) {
      enrollments.update(e);
      return true;
    } else {
      return false;
    }
  }

  public void addReview(Tour tour, Tourist tourist, Review r) {
    r.setDate(new DateTime());
    r.setTourist(tourist);
    r.setTour(tour);
    reviews.save(r);
  }

  public List<Tour> getTours(City c, Theme t, int pageNumber, int pageSize) {
    return tours.getTours(c, t, pageNumber, pageSize);
  }

  public Tour getTour(Long tourId) {
    return tours.find(tourId);
  }

  public List<Review> getLastReviews(int n) {
    return reviews.getLast(n);
  }

  public boolean isEnrolled(Long enrollmentsId, Long touristId) {
    return enrollments.find(enrollmentsId).getTourists().contains(tourists.find(touristId));
  }

  public void update(Tour tour) {
    tours.update(tour);
  }

  public List<Tour> getToursByCity(City city) {
    return tours.getTours(city);
  }

  public List<Tour> getToursByCityAndTheme(City city, Theme theme) {
    return tours.getTours(city,theme);
  }

  public List<Tour> getToursByTheme(Theme t) {
    return tours.getTours(t);
  }

  public List<Tour> getTours() {
    return tours.getAll();
  }

  public void delete(Tour tour) {
    tours.delete(tour);
  }
}
