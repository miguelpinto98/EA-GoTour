package com.gotour.services;

import com.gotour.daos.PointOfInterestDao;
import com.gotour.models.PointOfInterest;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("poiService")
@Transactional
public class PointOfInterestServiceImpl implements PointOfInterestService {

  @Autowired private PointOfInterestDao poiDao;

  public List<PointOfInterest> getPoints() {
    return poiDao.getAll();
  }

  public List<PointOfInterest> getSelectedPoints(String[] points) {
    List<PointOfInterest> lpoints = new ArrayList<PointOfInterest>();
    
    for (String id : points) {
      PointOfInterest p = poiDao.find(Long.parseLong(id));
      lpoints.add(p);
    }
    
    return lpoints;
  }
}
