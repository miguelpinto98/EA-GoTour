/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.daos;

import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import java.util.HashSet;
import java.util.Set;
import org.springframework.stereotype.Repository;

@Repository("pointOfInterestDao")
public class PointOfInterestDaoImpl extends GenericDaoImpl<PointOfInterest> implements PointOfInterestDao {

  public Set<PointOfInterest> getPointsOfInterest(City c) {
    return new HashSet<PointOfInterest>(find("city", c));
  }
}
