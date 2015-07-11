/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.daos;

import com.gotour.models.Review;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository("repositoryDao")
public class ReviewDaoImpl extends GenericDaoImpl<Review> implements ReviewDao {
  
  public List<Review> getLast(int n) {
    String hql = "from Review r order by r.id desc";
    Query query = getSession().createQuery(hql);
    return query.list();
  }
  
}
