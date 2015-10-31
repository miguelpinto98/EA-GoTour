package com.gotour.models;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.*;

@Entity
@Table(name = "tourists")
public class Tourist extends User implements Serializable {

  @OneToMany(fetch = FetchType.EAGER)
  @JoinColumn(name = "tourist_fk")
  private Set<Review> reviews;

  @ManyToMany(mappedBy = "tourists", fetch = FetchType.EAGER)
  private Set<Enrollments> enrollments;

  public Tourist() {
  }
  
  public Tourist(String name, String email, String password) {
    super(name,email,password);
  }

  /**
   * @return the reviews
   */
  public Set<Review> getReviews() {
    return reviews;
  }

  /**
   * @param reviews the reviews to set
   */
  public void setReviews(Set<Review> reviews) {
    this.reviews = reviews;
  }

  /**
   * @return the enrollments
   */
  public Set<Enrollments> getEnrollments() {
    return enrollments;
  }

  /**
   * @param enrollments the enrollments to set
   */
  public void setEnrollments(Set<Enrollments> enrollments) {
    this.enrollments = enrollments;
  }

}
