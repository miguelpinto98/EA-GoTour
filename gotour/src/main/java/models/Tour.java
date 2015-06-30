package models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tours")
public class Tour implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private String title;

    private String description;

    @Column(precision = 3, scale = 2, nullable = false)
    private BigDecimal price;

    @ManyToOne
    @JoinColumn(name = "theme")
    private Theme theme;

    @ManyToMany
    @JoinTable(name = "tours_languages")
    private Set<Language> languages;

    @ManyToOne
    @JoinColumn(name = "city")
    private City city;

    @ManyToMany
    @JoinTable(name = "tours_points_of_interest")
    private Set<PointOfInterest> pointsOfInterest;

    @ManyToOne
    @JoinColumn(name = "guide")
    private Guide guide;

    @OneToMany
    @JoinColumn(name = "tour_id")
    private Set<Review> reviews;

    @OneToMany(mappedBy="tour")
    @MapKeyColumn(name = "date")
    Map<Date,Enrollments> enrollments;

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
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
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
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
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
    public Set<PointOfInterest> getPointsOfInterest() {
        return pointsOfInterest;
    }

    /**
     * @param pointsOfInterest the pointsOfInterest to set
     */
    public void setPointsOfInterest(Set<PointOfInterest> pointsOfInterest) {
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

}
