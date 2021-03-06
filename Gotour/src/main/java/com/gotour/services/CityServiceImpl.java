package com.gotour.services;

import com.gotour.daos.CityDao;
import com.gotour.daos.PointOfInterestDao;
import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("cityService")
@Transactional
public class CityServiceImpl implements CityService {

  @Autowired
  private CityDao cityDao;

  @Autowired
  private PointOfInterestDao poiDao;

  public void addCity(City c) {
    cityDao.save(c);
  }

  public void addPointOfInterest(City c, PointOfInterest poi) {
    poi.setCity(c);
    poiDao.save(poi);
  }

  public City getCity(String name) {
    return cityDao.getCity(name);
  }

  public Set<PointOfInterest> getPointsOfInterest(City c) {
    return poiDao.getPointsOfInterest(c);
  }

  public List<City> getCities() {
    return (List<City>) cityDao.getAll();
  }

  public City getCityByID(Long id) {
    return cityDao.find(id);
  }

  public Set<City> getUniqueCities() {
    Set<City> cities = new HashSet<City>();
    
    for(City c : cityDao.getAll())
      cities.add(c);
    
    return cities;
  }
}
