/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Enrollments;
import com.gotour.models.Tour;
import org.joda.time.DateTime;

public interface EnrollmentsDao extends GenericDao<Enrollments>{

    public Enrollments get(Tour tour, DateTime date);

}
