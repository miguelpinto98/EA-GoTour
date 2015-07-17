
import com.github.javafaker.Address;
import com.github.javafaker.Faker;
import com.github.javafaker.Lorem;
import com.gotour.config.HibernateConfiguration;
import com.gotour.models.City;
import com.gotour.models.Enrollments;
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
import java.util.Iterator;
import java.util.List;
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

  int POIS = 100;
  int TOURISTS = 4;
  int GUIDES = 4;
  int TOURS = 40;
  int ENROLLMENTS = 100;
  int REVIEWS = 3;

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
        cs.addPointOfInterest(cs.getCityByID((long) r.nextInt(18) + 1), p3);
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
    int i = 1;
    for (String user : users) {
      t = new Tourist();
      t.setName(user);
      t.setEmail(user + "@gotour.com");
      t.setPassword("gotour");
      t.setAvatar(i + "_" + user);
      t.setDescription(faker.lorem().sentence());
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
      g.setDescription(faker.lorem().paragraph(1));
      g.setAvatar(i + "_" + user);
      us.addGuide(g);
      i++;
    }

  }

  private void addTours() {
    Language[] ls = new Language[]{
      ts.getLanguage("Portuguese"),
      ts.getLanguage("English"),
      ts.getLanguage("Spanish"),
      ts.getLanguage("Chinese")
    };

    Theme[] th = new Theme[]{
      ts.getTheme("Free"),
      ts.getTheme("Food"),
      ts.getTheme("Walking"),
      ts.getTheme("Night")
    };

    List<Guide> gs = new ArrayList<Guide>();

    for (String guide : new String[]{"kate", "obama", "robert", "steve"}) {
      gs.add(us.getGuide(guide + "@gotour.com"));
    }

    Tour t;
    City c;
    List<PointOfInterest> p;
    Iterator<PointOfInterest> it;
    for (Guide g : gs) {
      for (int i = 0; i < 10; i++) {
        t = new Tour();
        c = cs.getCityByID((long) r.nextInt(18) + 1);
        t.setCity(c);
        t.setDescription(faker.lorem().paragraph(1));
        t.setDuration((r.nextInt(4) + 1) + " hours");
        t.setGuide(g);
        Set<Language> l = new HashSet<Language>();
        int n = r.nextInt(4) + 1;
        for (int k = 0; k < n; k++) {
          l.add(ls[r.nextInt(4)]);
        }
        t.setLanguages(l);
        t.setName(faker.lorem().sentence(r.nextInt(3) + 1));
        p = new ArrayList<PointOfInterest>();
        it = c.getPointsOfInterest().iterator();
        for (int j = 0; it.hasNext() && i < 4; j++) {
          p.add(it.next());
        }
        t.setPointsOfInterest(p);
        int price = r.nextInt(21) + 5;
        t.setNormalPrice(price + "€");
        t.setStudentPrice((price - (price * 2 / 3)) + "€");
        t.setTheme(th[r.nextInt(4)]);
        ts.addTour(t);
      }
    }
  }

  private void addEnrollments() {
    Tour t;
    DateTime date;
    Language[] ls = new Language[4];
    Enrollments e;
    int j, m, n;
    for (long i = 1; i <= 40; i++) {
      for (j = 0; j < 1; j++) {
        t = ts.getTour(i);
        date = new DateTime(2015, 7, 16 + r.nextInt(11), r.nextInt(24), r.nextInt(60));
        ls = t.getLanguages().toArray(ls);
        int max = r.nextInt(TOURISTS) + 1;
        e = ts.addTourDate(t, ls[r.nextInt(ls.length)], date, max);
        for (m = 1, n = r.nextInt(max); m <= n; m++) {
          ts.enrollTourist(e.getId(), (long) m);
        }
      }
    }
  }

  private void addReviews() {
    Review rv;

    String[] users = new String[]{"adele", "bono", "jimi", "jolie"};
    int j=1;
    for (long i = 1; i < TOURS; i++, j++) {
      rv = new Review();
      rv.setComment("It's totally awesome, we couldn't imagine life without it!");
      rv.setRating((new Integer(r.nextInt(5) + 1)).byteValue());
      rv.setTitle("Awesome!");
      ts.addReview(ts.getTour(i), us.getTourist((users[j%4]+1)+"@gotour.com"), rv);
      
      rv = new Review();
      rv.setComment("10 out of 10, highly recommended!");
      rv.setTitle("Top!");
      rv.setRating((new Integer(r.nextInt(5) + 1)).byteValue());
      ts.addReview(ts.getTour(i), us.getTourist((users[j%4]+1)+"@gotour.com"), rv);
      
      rv = new Review();
      rv.setComment("Couldn't be happier with this tour!");
      rv.setTitle("Amazing!");
      rv.setRating((new Integer(r.nextInt(5) + 1)).byteValue());
      ts.addReview(ts.getTour(i), us.getTourist((users[j%4]+1)+"@gotour.com"), rv);
    }
  }

}
