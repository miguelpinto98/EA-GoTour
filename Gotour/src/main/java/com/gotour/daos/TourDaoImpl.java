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
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("tourDao")
public class TourDaoImpl extends GenericDaoImpl<Tour> implements TourDao {

  public List<Tour> getTours(City c, Theme t, int pageNumber, int pageSize) {
    Criteria crit = getSession().createCriteria(getType());
    crit.add(Restrictions.eq("city", c));
    crit.add(Restrictions.eq("theme", t));
    return getPageByCriteria(pageNumber, pageSize, crit);
  }

  public List<Tour> getTours(City city) {
    String hql = "from Tour t where city_fk = :city";
    Query query = getSession().createQuery(hql);
    query.setLong("city", city.getId());
    return query.list();
  }
}
