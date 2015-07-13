package com.gotour.services;

import com.gotour.models.Guide;
import com.gotour.models.Tourist;
import com.gotour.models.User;

public interface UserService {

  void addTourist(Tourist t);

  void addGuide(Guide g);

  Guide getGuide(String email);

  Tourist getTourist(String email);

  public User authenticateUser(String email, String password);

  public User getUser(long id);

  public void updateTourist(Tourist tourist);

  public void updateGuide(Guide guide);
}
