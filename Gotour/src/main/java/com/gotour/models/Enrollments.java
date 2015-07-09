package com.gotour.models;

import java.io.Serializable;
import java.util.HashSet;
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
import javax.persistence.Table;
import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

@Entity
@Table(name = "enrollments")
public class Enrollments implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "tour_fk")
    private Tour tour;

    @Column(name = "date")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    private DateTime date;

    @Column(name = "max_enrollments")
    private int maxEnrollments;

    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(
            name="tourists_enrollments",
            joinColumns=@JoinColumn(name="enrollments_id"),
            inverseJoinColumns=@JoinColumn(name="tourist_id")
    )
    private Set<Tourist> tourists;

    @ManyToOne
    @JoinColumn(name = "language_fk")
    private Language language;

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
        if (!(object instanceof Enrollments)) {
            return false;
        }
        Enrollments other = (Enrollments) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Enrollments[ id=" + id + " ]";
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
     * @return the limit
     */
    public int getMaxEnrollments() {
        return maxEnrollments;
    }

    /**
     * @param maxEnrollments the limit to set
     */
    public void setMaxEnrollments(int maxEnrollments) {
        this.maxEnrollments = maxEnrollments;
    }

    /**
     * @return the tourists
     */
    public Set<Tourist> getTourists() {
        return tourists;
    }

    /**
     * @param tourists the tourists to set
     */
    public void setTourists(Set<Tourist> tourists) {
        this.tourists = tourists;
    }

    /**
     * @return the language
     */
    public Language getLanguage() {
        return language;
    }

    /**
     * @param language the language to set
     */
    public void setLanguage(Language language) {
        this.language = language;
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

    public boolean full() {
        return tourists.size() == maxEnrollments;
    }

    public boolean addEnrollment(Tourist t) {
        if (full()) {
            return false;
        }
        tourists.add(t);
        return true;
    }
}
