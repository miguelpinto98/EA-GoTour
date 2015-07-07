
package com.gotour.daos;

import com.gotour.models.City;

public interface CityDao extends GenericDao<City>{
    public City getCity(String name);
}
