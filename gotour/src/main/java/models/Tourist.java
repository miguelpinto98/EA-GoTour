/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.*;

/**
 *
 * @author Zé
 */
@Entity
@Table(name="tourists")
public class Tourist extends User implements Serializable  {

    @OneToMany
    @JoinColumn(name="tourist_id")
    private Set<Review> reviews;
    
    @ManyToMany
    @JoinTable(name = "tourists_enrollments")
    private Set<Enrollments> enrollments;

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
