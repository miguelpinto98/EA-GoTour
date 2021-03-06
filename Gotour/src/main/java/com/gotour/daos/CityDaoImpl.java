
package com.gotour.daos;

import com.gotour.models.City;
import org.springframework.stereotype.Repository;

@Repository("cityDao")
public class CityDaoImpl extends GenericDaoImpl<City> implements CityDao {
    
    public City getCity(String name){
        return findUnique("name", name);
    }

}
