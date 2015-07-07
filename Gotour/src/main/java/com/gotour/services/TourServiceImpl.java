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

    @Autowired private ThemeDao themes;
    @Autowired private LanguageDao languages;
    @Autowired private TourDao tours;
    @Autowired private EnrollmentsDao enrollments;
    @Autowired private ReviewDao reviews;
    
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

    public void addTourDate(Tour t, Language l, DateTime date, int maxEnrollments) {
        Enrollments e = new Enrollments();
        e.setLanguage(l);
        e.setMaxEnrollments(maxEnrollments);
        e.setTour(t);
        e.setDate(date);
        enrollments.save(e);
    }

    public boolean enrollTourist(Tour tour, DateTime date, Tourist tourist) {
        Enrollments e = enrollments.get(tour, date);
        if (e.addEnrollment(tourist)){
            enrollments.update(e);
            return true;
        }
        else return false;
    }

    public void addReview(Tour tour, Tourist tourist, String comment, byte rating) {
        Review r = new Review();
        r.setComment(comment);
        r.setDate(new DateTime());
        r.setRating(rating);
        r.setTourist(tourist);
        r.setTour(tour);
        reviews.save(r);
    }

    public List<Tour> getTours(City c, Theme t, int pageNumber, int pageSize) {
        return tours.getTours(c, t, pageNumber, pageSize);
    }

}
