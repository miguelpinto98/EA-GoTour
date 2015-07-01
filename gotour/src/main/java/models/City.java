package models;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="cities")
public class City implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    
    @OneToMany
    @JoinColumn(name="city_fk")
    private Set<PointOfInterest> points_of_interest;
    
    @OneToMany(mappedBy="city")
    private Set<Tour> tours;
    
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
        if (!(object instanceof City)) {
            return false;
        }
        City other = (City) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.City[ id=" + id + " ]";
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
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

    /**
     * @return the points_of_interest
     */
    public Set<PointOfInterest> getPoints_of_interest() {
        return points_of_interest;
    }

    /**
     * @param points_of_interest the points_of_interest to set
     */
    public void setPoints_of_interest(Set<PointOfInterest> points_of_interest) {
        this.points_of_interest = points_of_interest;
    }

}
