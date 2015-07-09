package com.gotour.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "tours")
public class Tour implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.TABLE)
  private Long id;

  @Column(nullable = false)
  private String name;

  private String description;

  private String normalPrice;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "theme_fk")
  private Theme theme;

  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(name = "tours_languages")
  private Set<Language> languages;

  private String studentPrice;

  private String duration;

  @Transient
  private boolean free;

  @ManyToMany(fetch = FetchType.EAGER)
  @Fetch(FetchMode.SELECT)
  @JoinTable(name = "tours_points_of_interest")
  private List<PointOfInterest> pointsOfInterest;

  @OneToMany(fetch = FetchType.EAGER)
  @JoinColumn(name = "tour_fk")
  private Set<Review> reviews;

  @OneToMany(mappedBy = "tour", fetch = FetchType.EAGER)
  @Fetch(FetchMode.SELECT)
  private List<Enrollments> enrollments;

  @ManyToOne
  @JoinColumn(name = "city_fk")
  private City city;

  @Transient
  private String[] points;

  @ManyToOne
  private Guide guide;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  @Override
  public int hashCode() {
    int hash = 0;
    hash += (id != null ? id.hashCode() : 0);
    return hash;
  }

  @Override
  public boolean equals(Object object) {
    // TODO: Warning - this method won't work in the case the id fields are not set
    if (!(object instanceof Tour)) {
      return false;
    }
    Tour other = (Tour) object;
    if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "models.Tour[ id=" + id + " ]";
  }

  /**
   * @return the title
   */
  public String getName() {
    return name;
  }

  /**
   * @param name the title to set
   */
  public void setName(String name) {
    this.name = name;
  }

  /**
   * @return the description
   */
  public String getDescription() {
    return description;
  }

  /**
   * @param description the description to set
   */
  public void setDescription(String description) {
    this.description = description;
  }

  /**
   * @return the price
   */
  public String getNormalPrice() {
    return this.normalPrice;
  }

  /**
   * @param price the price to set
   */
  public void setNormalPrice(String price) {
    this.normalPrice = price;
  }

  /**
   * @return the price
   */
  public String getStudentPrice() {
    return this.studentPrice;
  }

  /**
   * @param price the price to set
   */
  public void setStudentPrice(String price) {
    this.studentPrice = price;
  }

  public String getDuration() {
    return duration;
  }

  public void setDuration(String duration) {
    this.duration = duration;
  }

  public boolean isFree() {
    return free;
  }

  public void setFree(boolean free) {
    this.free = free;
  }

  public String[] getPoints() {
    return points;
  }

  public void setPoints(String[] points) {
    this.points = points;
  }

  /**
   * @return the theme
   */
  public Theme getTheme() {
    return theme;
  }

  /**
   * @param theme the theme to set
   */
  public void setTheme(Theme theme) {
    this.theme = theme;
  }

  /**
   * @return the languages
   */
  public Set<Language> getLanguages() {
    return languages;
  }

  /**
   * @param languages the languages to set
   */
  public void setLanguages(Set<Language> languages) {
    this.languages = languages;
  }

  /**
   * @return the city
   */
  public City getCity() {
    return city;
  }

  /**
   * @param city the city to set
   */
  public void setCity(City city) {
    this.city = city;
  }

  /**
   * @return the guide
   */
  public Guide getGuide() {
    return guide;
  }

  /**
   * @param guide the guide to set
   */
  public void setGuide(Guide guide) {
    this.guide = guide;
  }

  /**
   * @return the pointsOfInterest
   */
  public List<PointOfInterest> getPointsOfInterest() {
    return pointsOfInterest;
  }

  /**
   * @param pointsOfInterest the pointsOfInterest to set
   */
  public void setPointsOfInterest(List<PointOfInterest> pointsOfInterest) {
    this.pointsOfInterest = pointsOfInterest;
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
  public List<Enrollments> getEnrollments() {
    return enrollments;
  }

  /**
   * @param enrollments the enrollments to set
   */
  public void setEnrollments(List<Enrollments> enrollments) {
    this.enrollments = enrollments;
  }

  public List<Enrollments> getAvailableEnrollments() {
    List<Enrollments> res = new ArrayList<Enrollments>();
    for (Enrollments e : enrollments) {
      if (e.getDate().isAfterNow() && !e.full()) {
        res.add(e);
      }
    }
    return res;
  }
}
