
package com.gotour.services;

import com.gotour.daos.CityDao;
import com.gotour.daos.PointOfInterestDao;
import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("cityService")
@Transactional
public class CityServiceImpl implements CityService{

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

}
