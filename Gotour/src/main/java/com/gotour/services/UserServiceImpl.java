/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.services;

import com.gotour.daos.TouristDAO;
import com.gotour.models.Tourist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private TouristDAO dao;

    @Override
    public void saveTourist(Tourist t) {
        dao.saveTourist(t);
    }   
}
