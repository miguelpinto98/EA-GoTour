/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import java.util.Set;


public interface PointOfInterestDao extends GenericDao<PointOfInterest>{

    public Set<PointOfInterest> getPointsOfInterest(City c);

}
