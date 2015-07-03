
package com.gotour.daos;

import com.gotour.models.City;
import org.springframework.stereotype.Repository;

@Repository("cityDAO")
public class CityDAOImpl extends AbstractDAO implements CityDAO {

    @Override
    public void saveCity(City c) {
        persist(c);
    }

}
