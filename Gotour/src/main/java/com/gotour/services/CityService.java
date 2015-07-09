package com.gotour.services;

import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import java.util.List;
import java.util.Set;

public interface CityService {

  void addCity(City c);

  void addPointOfInterest(City c, PointOfInterest poi);

  City getCity(String name);

  Set<PointOfInterest> getPointsOfInterest(City c);

  List<City> getCities();

  City getCityByID(Long id);
}
