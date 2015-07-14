package com.gotour.services;

import com.gotour.daos.EnrollmentsDao;
import com.gotour.models.Enrollments;
import com.gotour.models.Tour;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("enrollmentsService")
@Transactional
public class EnrollmentsServiceImpl implements EnrollmentsService {

  @Autowired public EnrollmentsDao enrollmentsDao;
  
  public void add(Enrollments enroll) {
    enrollmentsDao.save(enroll);
  }

  public List<Enrollments> getEnrollmentsByTour(Tour t) {
    return enrollmentsDao.find("tour_fk", t.getId());
  }
}