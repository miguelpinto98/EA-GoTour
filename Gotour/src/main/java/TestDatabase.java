
import com.github.javafaker.Address;
import com.github.javafaker.Faker;
import com.github.javafaker.Lorem;
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
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;
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
  Random r = new Random();
  Faker faker = new Faker();

  public static void main(String[] args) throws FileNotFoundException, IOException {
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

  void addCities() throws IOException {
    ClassLoader classloader = Thread.currentThread().getContextClassLoader();
    InputStream is = classloader.getResourceAsStream("database/cities.txt");
    BufferedReader br = new BufferedReader(new InputStreamReader(is));
    City c;
    for (String line = br.readLine(); line != null; line = br.readLine()) {
      c = new City();
      c.setName(line.split(";")[1]);
      cs.addCity(c);
    }
  }

  void addPOIs() throws IOException {
    PointOfInterest p1 = new PointOfInterest(), p2 = new PointOfInterest(), p3;
    p1.setName("Sameiro");
    p1.setDescription("The Sanctuary of Our Lady of Sameiro (or Sanctuary of Sameiro) is a sanctuary and Marian shrine located in Braga, in the surroundings of the city of Braga, Portugal.");
    p1.setLocation("60,425883;90,987497");
    p2.setName("Bom Jesus");
    p2.setDescription("Bom Jesus (or Sanctuary of Sameiro) is a sanctuary and Marian shrine located in Braga, in the surroundings of the city of Braga, Portugal.");
    p2.setLocation("-43,115498;-34,285392");
    cs.addPointOfInterest(cs.getCity("Braga"), p1);
    cs.addPointOfInterest(cs.getCity("Braga"), p2);

    Lorem l = faker.lorem();
    Address a = faker.address();
    try {
      for (int i = 0; i < 100; i++) {
        p3 = new PointOfInterest();
        p3.setName(l.fixedString(6));
        p3.setDescription(l.sentence());
        p3.setLocation(a.latitude() + ";" + a.longitude());
        cs.addPointOfInterest(cs.getCityByID((long) r.nextInt(17) + 1), p3);
      }
    } catch (Exception e) {
    }
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
    l2 = new Language();
    l2.setName("Spanish");
    l2.setCode("es");
    ts.addLanguage(l2);
    l2 = new Language();
    l2.setName("Chinese");
    l2.setCode("cn");
    ts.addLanguage(l2);
  }

  void addUsers() {
    String[] users = new String[]{"adele", "bono", "jimi", "jolie"};
    Tourist t;
    int i=1;
    for (String user : users) {
      t = new Tourist();
      t.setName(user);
      t.setEmail(user + "@gotour.com");
      t.setPassword("gotour");
      t.setAvatar(i+"_"+user);
      us.addTourist(t);
      i++;
    }

    users = new String[]{"kate", "obama", "robert", "steve"};
    Guide g;
    for (String user : users) {
      g = new Guide();
      g.setName(user);
      g.setEmail(user + "@gotour.com");
      g.setPassword("gotour");
      g.setPhone(faker.phoneNumber().phoneNumber());
      g.setDescription(faker.lorem().paragraph());
      g.setAvatar(i+"_"+user);
      us.addGuide(g);
      i++;
    }

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
    t.setNormalPrice("5€");
    t.setStudentPrice("2.5€");
    t.setTheme(ts.getTheme("Free"));
    ts.addTour(t);
  }

  private void addEnrollments() {
    Tour t = ts.getTour(1L);
    DateTime date = new DateTime();
    ts.addTourDate(t, ts.getLanguage("Portuguese"), date, 1);
    ts.enrollTourist(1L, 1L);
    date = new DateTime(2015, 7, 25, 15, 15);
    ts.addTourDate(t, ts.getLanguage("English"), date, 20);
    date = new DateTime(2015, 7, 30, 15, 30);
    ts.addTourDate(t, ts.getLanguage("Portuguese"), date, 2);
    ts.enrollTourist(3L, 1L);
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
