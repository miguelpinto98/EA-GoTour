/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.models;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author José Morgado
 */
@Entity
@Table(name = "guides")
public class Guide extends User implements Serializable {

  private String phone;

  @OneToMany(mappedBy = "guide", fetch = FetchType.EAGER)
  private Set<Tour> tours;

  public Guide() {
  }

  public Guide(String name, String email, String password, String phone) {
    super(name, email, password);
    this.phone = phone;
    this.tours = null;
  }

  /**
   * @return the phone
   */
  public String getPhone() {
    return phone;
  }

  /**
   * @param phone the phone to set
   */
  public void setPhone(String phone) {
    this.phone = phone;
  }

  /**
   * @return the tours
   */
  public Set<Tour> getTours() {
    return tours;
  }

  /**
   * @param tours the tours to set
   */
  public void setTours(Set<Tour> tours) {
    this.tours = tours;
  }

}
