package com.gotour.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

@Entity
@Table(name = "reviews")
public class Review implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;

    @Column(name = "date")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    private DateTime date;

    @ManyToOne
    @JoinColumn(name = "tourist_fk")
    private Tourist tourist;

    private String title;
    private String comment;
    private Byte rating;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "tour_fk")
    private Tour tour;
    
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
        if (!(object instanceof Review)) {
            return false;
        }
        Review other = (Review) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Review[ id=" + id + " ]";
    }

    /**
     * @return the date
     */
    public DateTime getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(DateTime date) {
        this.date = date;
    }

    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * @return the rating
     */
    public Byte getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(Byte rating) {
        this.rating = rating;
    }

    /**
     * @return the tourist
     */
    public Tourist getTourist() {
        return tourist;
    }

    /**
     * @param tourist the tourist to set
     */
    public void setTourist(Tourist tourist) {
        this.tourist = tourist;
    }

    /**
     * @return the tour
     */
    public Tour getTour() {
        return tour;
    }

    /**
     * @param tour the tour to set
     */
    public void setTour(Tour tour) {
        this.tour = tour;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

}
