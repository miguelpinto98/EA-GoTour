package com.gotour.services;

import com.gotour.models.PointOfInterest;
import java.util.List;

public interface PointOfInterestService {

  public List<PointOfInterest> getPoints();

  public List<PointOfInterest> getSelectedPoints(String[] points);
}
