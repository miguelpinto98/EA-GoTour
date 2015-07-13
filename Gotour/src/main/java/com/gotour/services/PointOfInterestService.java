package com.gotour.services;

import com.gotour.models.PointOfInterest;
import java.util.List;
import java.util.Set;

public interface PointOfInterestService {

  public List<PointOfInterest> getPoints();

  public List<PointOfInterest> getSelectedPoints(String[] points);

  public void addPointOfInterest(PointOfInterest point);

  public PointOfInterest getPointOfInterestById(long id);

  public Set<PointOfInterest> getPointsOfCity(long cityid);
}
