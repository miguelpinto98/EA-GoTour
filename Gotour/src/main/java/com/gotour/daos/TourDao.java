/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.daos;

import com.gotour.models.City;
import com.gotour.models.Theme;
import com.gotour.models.Tour;
import java.util.List;

public interface TourDao extends GenericDao<Tour> {

  public List<Tour> getTours(City c, Theme t, int pageNumber, int pageSize);

  public List<Tour> getTours(City city);
}
