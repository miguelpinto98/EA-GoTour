
package com.gotour.services;

import com.gotour.models.City;
import com.gotour.models.PointOfInterest;

public interface CityService {
    void addCity(City c);
    void addPointOfInterest(City c, PointOfInterest poi);
}
