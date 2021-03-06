/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.services;

import com.gotour.models.City;
import com.gotour.models.Enrollments;
import com.gotour.models.Language;
import com.gotour.models.Review;
import com.gotour.models.Theme;
import com.gotour.models.Tour;
import com.gotour.models.Tourist;
import java.util.List;
import org.joda.time.DateTime;

public interface TourService {

  public void addTheme(Theme t);

  public void addLanguage(Language l);

  public Language getLanguage(String language);

  public Theme getTheme(String theme);

  public void addTour(Tour t);

  public Enrollments addTourDate(Tour t, Language l, DateTime date, int maxEnrollments);

  public boolean enrollTourist(Long enrollmentsId, Long touristId);

  public void addReview(Tour tour, Tourist tourist, Review r);

  public Tour getTour(Long tourId);

  public List<Tour> getTours(City c, Theme t, int pageNumber, int pageSize);

  public List<Review> getLastReviews(int n);

  public boolean isEnrolled(Long enrollmentsId, Long touristId);

  public void update(Tour tour);

  public List<Tour> getToursByCity(City city);

  public List<Tour> getToursByCityAndTheme(City c, Theme t);

  public List<Tour> getToursByTheme(Theme t);

  public List<Tour> getTours();

  public void delete(Tour t);
}
