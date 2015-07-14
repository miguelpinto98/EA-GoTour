package com.gotour.services;

import com.gotour.models.Enrollments;
import com.gotour.models.Tour;

public interface EnrollmentsService {

  public void add(Enrollments enroll);

  public Object getEnrollmentsByTour(Tour t);
  
}
