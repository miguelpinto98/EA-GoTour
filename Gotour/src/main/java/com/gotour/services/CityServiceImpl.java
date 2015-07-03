
package com.gotour.services;

import com.gotour.daos.CityDAO;
import com.gotour.models.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("cityService")
@Transactional
public class CityServiceImpl implements CityService{

    @Autowired
    private CityDAO dao;
    
    public void saveCity(City c) {
        dao.saveCity(c);
    }

}
