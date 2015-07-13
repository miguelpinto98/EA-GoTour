/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.services;

import com.gotour.daos.GuideDao;
import com.gotour.daos.ReviewDao;
import com.gotour.daos.TourDao;
import com.gotour.daos.TouristDao;
import com.gotour.models.Guide;
import com.gotour.models.Review;
import com.gotour.models.Tourist;
import com.gotour.models.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

  @Autowired
  private TouristDao tourists;
  @Autowired
  private GuideDao guides;
  @Autowired
  private ReviewDao reviewDao;

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

  public User authenticateUser(String email, String password) {
    User u = tourists.findUnique("email", email);
    
    if(u == null){
      u = guides.findUnique("email", email);
    }
    
    if (u != null && !u.getPassword().equals(password)){
      u = null;
    }
           
    return u;
  }

  public User getUser(long id) {
    User user = null;
    
    if(user==null) {
      user = guides.find(id);
    }
    if(user==null) {
      user = tourists.find(id);
    }
    return user;
  }

  public void updateTourist(Tourist tourist) {
    tourists.update(tourist);
  }

  public void updateGuide(Guide guide) {
    guides.update(guide);
  }
}
