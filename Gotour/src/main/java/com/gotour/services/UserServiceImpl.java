/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.services;

import com.gotour.daos.GuideDao;
import com.gotour.daos.TouristDao;
import com.gotour.models.Guide;
import com.gotour.models.Tourist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
    
    @Autowired private TouristDao tourists;
    @Autowired private GuideDao guides;
    
    @Override
    public void addTourist(Tourist t) {
        tourists.save(t);
    }   

    public void addGuide(Guide g) {
        guides.save(g);
    }

    public Guide getGuide(String email) {
        return guides.getGuide(email);
    }

    public Tourist getTourist(String email) {
        return tourists.getTourist(email);
    }
}