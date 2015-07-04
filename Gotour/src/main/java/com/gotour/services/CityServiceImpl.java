
package com.gotour.services;

import com.gotour.daos.CityDAO;
import com.gotour.daos.PointOfInterestDAO;
import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("cityService")
@Transactional
public class CityServiceImpl implements CityService{

    @Autowired
    private CityDAO cityDao;
   
    @Autowired
    private PointOfInterestDAO poiDao;
    
    public void addCity(City c) {
        cityDao.save(c);
    }

    public void addPointOfInterest(City c, PointOfInterest poi) {
        poi.setCity(c);
        poiDao.save(poi);
    }

}
