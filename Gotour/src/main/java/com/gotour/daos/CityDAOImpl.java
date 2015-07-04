
package com.gotour.daos;

import com.gotour.models.City;
import org.springframework.stereotype.Repository;

@Repository("cityDAO")
public class CityDAOImpl extends GenericDaoImpl<City> implements CityDAO {
}
