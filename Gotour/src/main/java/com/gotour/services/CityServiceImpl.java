
package com.gotour.services;

import com.gotour.daos.CityDAO;
import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("cityService")
@Transactional
public class CityServiceImpl implements CityService{

    @Autowired
    private CityDAO dao;
    
    public void addCity(City c) {
        dao.saveOrUpdate(c);
    }

    public void addPointOfInterest(City c, PointOfInterest poi) {
        c.getPoints_of_interest().add(poi);
        dao.saveOrUpdate(c);
    }

}
