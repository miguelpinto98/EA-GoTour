
package com.gotour.daos;

import com.gotour.models.City;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

@Repository("cityDao")
public class CityDaoImpl extends GenericDaoImpl<City> implements CityDao {
    
    public City getCity(String name){
        return find("name", name).get(0);
    }
    
}
