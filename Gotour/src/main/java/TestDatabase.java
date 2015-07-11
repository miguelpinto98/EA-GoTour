
import com.gotour.config.HibernateConfiguration;
import com.gotour.models.City;
import com.gotour.models.Guide;
import com.gotour.models.Language;
import com.gotour.models.PointOfInterest;
import com.gotour.models.Review;
import com.gotour.models.Theme;
import com.gotour.models.Tour;
import com.gotour.models.Tourist;
import com.gotour.services.CityService;
import com.gotour.services.TourService;
import com.gotour.services.UserService;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class TestDatabase {

  @Autowired
  CityService cs;
  @Autowired
  TourService ts;
  @Autowired
  UserService us;

  public static void main(String[] args) {
    AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
    ctx.register(HibernateConfiguration.class);
    ctx.register(TestDatabase.class);
    ctx.scan("com.gotour.daos");
    ctx.scan("com.gotour.services");
    ctx.refresh();
    TestDatabase x = ctx.getBean(TestDatabase.class);
    x.addCities();
    x.addPOIs();
    x.addThemes();
    x.addLanguages();
    x.addUsers();
    x.addTours();
    x.addEnrollments();
    x.addReviews();
  }

  void addCities() {
    City c = new City();
    c.setName("Porto");
    cs.addCity(c);
    c = new City();
    c.setName("Braga");
    cs.addCity(c);
  }

  void addPOIs() {
    PointOfInterest p1 = new PointOfInterest(), p2 = new PointOfInterest();
    p1.setName("Sameiro");
    p1.setDescription("The Sanctuary of Our Lady of Sameiro (or Sanctuary of Sameiro) is a sanctuary and Marian shrine located in Braga, in the surroundings of the city of Braga, Portugal.");
    p1.setLocation("WTF?");
    p2.setName("Bom Jesus");
    p2.setDescription("Bom Jesus (or Sanctuary of Sameiro) is a sanctuary and Marian shrine located in Braga, in the surroundings of the city of Braga, Portugal.");
    p2.setLocation("Gers");
    cs.addPointOfInterest(cs.getCity("Braga"), p1);
    cs.addPointOfInterest(cs.getCity("Braga"), p2);
  }

  void addThemes() {
    Theme t = new Theme();
    t.setName("Free");
    ts.addTheme(t);
    t = new Theme();
    t.setName("Food");
    ts.addTheme(t);
    t = new Theme();
    t.setName("Walking");
    ts.addTheme(t);
    t = new Theme();
    t.setName("Night");
    ts.addTheme(t);
  }

  void addLanguages() {
    Language l1 = new Language(), l2 = new Language();
    l1.setName("English");
    l1.setCode("gb");
    l2.setName("Portuguese");
    l2.setCode("pt");
    ts.addLanguage(l1);
    ts.addLanguage(l2);
  }

  void addUsers() {
    Tourist t = new Tourist();
    t.setName("robert");
    t.setEmail("robert@gotour.com");
    t.setPassword("robert");
    us.addTourist(t);
    t = new Tourist();
    t.setName("angelina");
    t.setEmail("angelina@gotour.com");
    t.setPassword("angelina");
    us.addTourist(t);
    t = new Tourist();
    t.setName("barack");
    t.setEmail("barack@gotour.com");
    t.setPassword("barack");
    us.addTourist(t);
    
    Guide g = new Guide();
    g.setName("Guia");
    g.setEmail("guia@guia.com");
    g.setPassword("guia");
    g.setPhone("912312123");
    g.setDescription("guide description");
    us.addGuide(g);
  }

  private void addTours() {
    Tour t = new Tour();
    City c = cs.getCity("Braga");
    t.setCity(c);
    t.setDescription("Find out about Braga's mysteries by taking a tour through its narrow and medieval streets. Learn about the legends, be amazed by the 'gverreiros' way of living and enjoy the city through the local's perspective.");
    t.setDuration("2 hours");
    t.setGuide(us.getGuide("guia@guia.com"));
    Set<Language> l = new HashSet<Language>();
    l.add(ts.getLanguage("English"));
    l.add(ts.getLanguage("Portuguese"));
    t.setLanguages(l);
    t.setName("Enchanted Tour");
    t.setPointsOfInterest(new ArrayList<PointOfInterest>(cs.getPointsOfInterest(c)));
    t.setNormalPrice("5�");
    t.setStudentPrice("2.5�");
    t.setTheme(ts.getTheme("Free"));
    ts.addTour(t);
  }

  private void addEnrollments() {
    Tour t = ts.getTour(1L);
    DateTime date = new DateTime();
    ts.addTourDate(t, ts.getLanguage("Portuguese"), date, 1);
    ts.enrollTourist(t, date, us.getTourist("angelina@gotour.com"));
    date = new DateTime(2015, 7, 25, 15, 15);
    ts.addTourDate(t, ts.getLanguage("English"), date, 20);
    ts.addTourDate(t, ts.getLanguage("Portuguese"), date, 1);
    ts.enrollTourist(t, date, us.getTourist("robert@gotour.com"));
  }

  private void addReviews() {
    Review r = new Review();
    r.setComment("It's totally awesome, we're could imagine life without it!");
    r.setRating((byte) 5);
    r.setTitle("Awesome!");
    ts.addReview(ts.getTour(1L), us.getTourist("barack@gotour.com"), r);
    r = new Review();
    r.setComment("10 out of 10, highly recommended!");
    r.setRating((byte) 4);
    r.setTitle("Top!");
    ts.addReview(ts.getTour(1L), us.getTourist("angelina@gotour.com"), r);
    r = new Review();
    r.setComment("Our productivity &amp; sales are up! Couldn't be happier with this product!");
    r.setRating((byte) 3);
    r.setTitle("Nice!");
    ts.addReview(ts.getTour(1L), us.getTourist("robert@gotour.com"), r);
  }
}
