
import com.gotour.config.HibernateConfiguration;
import com.gotour.models.City;
import com.gotour.models.Guide;
import com.gotour.models.Language;
import com.gotour.models.PointOfInterest;
import com.gotour.models.Theme;
import com.gotour.models.Tour;
import com.gotour.models.Tourist;
import com.gotour.services.CityService;
import com.gotour.services.TourService;
import com.gotour.services.UserService;
import java.math.BigDecimal;
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
    t.setName("Free Tours");
    t = new Theme();
    ts.addTheme(t);
    t = new Theme();
    t.setName("Food Tours");
    ts.addTheme(t);
    t = new Theme();
    t.setName("Walking Tours");
    ts.addTheme(t);
    t = new Theme();
    t.setName("Night Tours");
    ts.addTheme(t);
  }

  void addLanguages() {
    Language l1 = new Language(), l2 = new Language();
    l1.setName("English");
    l2.setName("Portuguese");
    ts.addLanguage(l1);
    ts.addLanguage(l2);
  }

  void addUsers() {
    Tourist t = new Tourist();
    t.setName("Teste");
    t.setEmail("teste@teste.com");
    t.setPassword("teste");
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
    t.setGuide(us.getGuide("guia@guia.com"));
    Set<Language> l = new HashSet<Language>();
    l.add(ts.getLanguage("English"));
    l.add(ts.getLanguage("Portuguese"));
    t.setLanguages(l);
    t.setName("Enchanted Tour");
    t.setPointsOfInterest(new ArrayList<PointOfInterest>(cs.getPointsOfInterest(c)));
    t.setNormalPrice("2.5€");
    t.setTheme(ts.getTheme("Free"));
    ts.addTour(t);
  }

  private void addEnrollments() {
    Tour t = ts.getTours(cs.getCity("Braga"), ts.getTheme("Free"), 1, 1).get(0);
    DateTime date = new DateTime();
    ts.addTourDate(t, ts.getLanguage("Portuguese"), date, 20);
    ts.enrollTourist(t, date, us.getTourist("teste@teste.com"));
  }

  private void addReviews() {
    ts.addReview(ts.getTours(cs.getCity("Braga"), ts.getTheme("Free"), 1, 1).get(0), us.getTourist("teste@teste.com"), "Muito bom!", (byte) 2);
  }
}