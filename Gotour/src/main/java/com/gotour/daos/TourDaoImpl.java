/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Tour;
import org.springframework.stereotype.Repository;

@Repository("tourDao")
public class TourDaoImpl extends GenericDaoImpl<Tour> implements TourDao{

}
