/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Enrollments;
import com.gotour.models.Tour;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

@Repository("enrollmentsDao")
public class EnrollmentsDaoImpl extends GenericDaoImpl<Enrollments> implements EnrollmentsDao{

    public Enrollments get(Tour tour, DateTime date) {
        Criteria crit = getSession().createCriteria(Enrollments.class);
        crit.add(Restrictions.eq("tour", tour));
        crit.add(Restrictions.eq("date", date));
        return (Enrollments) crit.list().get(0);
    }
    
}
