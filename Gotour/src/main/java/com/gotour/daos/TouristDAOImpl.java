/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Tourist;
import org.springframework.stereotype.Repository;

@Repository("touristDAO")
public class TouristDAOImpl extends AbstractDAO implements TouristDAO{

    @Override
    public void saveTourist(Tourist t) {
        persist(t);
    }

}
