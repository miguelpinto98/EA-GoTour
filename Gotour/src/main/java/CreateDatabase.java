
import com.github.javafaker.Address;
import com.github.javafaker.Faker;
import com.github.javafaker.Lorem;
import com.github.javafaker.Name;
import com.github.javafaker.Options;
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
import java.util.Collection;
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
public class CreateDatabase {

  @Autowired
  CityService cs;
  @Autowired
  TourService ts;
  @Autowired
  UserService us;

  Random r = new Random();
  Faker faker = new Faker();

  int CITIES = 5;
  int POIS = 50;
  int TOURISTS = 20;
  int GUIDES = 4;
  int TOURS = 25;
  int ENROLLMENTS = 75;
  int REVIEWS = 75;

  String[] tourists = new String[]{"obama", "bono", "robert", "steve"};
  String[] guides = new String[]{"jolie", "kate", "adele", "jimi"};

  public static void main(String[] args) throws FileNotFoundException, IOException {
    AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
    ctx.register(HibernateConfiguration.class);
    ctx.register(CreateDatabase.class);
    ctx.scan("com.gotour.daos");
    ctx.scan("com.gotour.services");
    ctx.refresh();
    CreateDatabase x = ctx.getBean(CreateDatabase.class);
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
      c.setName(line);
      cs.addCity(c);
    }
  }

  void addPOIs() throws IOException {
    PointOfInterest p3;
    Lorem l = faker.lorem();
    Address a = faker.address();
    City c;
    for (int j = 1; j <= CITIES; j++) {
      c = cs.getCityByID((long) j);
      for (int i = 0; i < POIS / CITIES; i++) {
        p3 = new PointOfInterest();
        p3.setName(l.fixedString(6));
        p3.setDescription(l.sentence() + " (" + i + ")");
        p3.setLocation(a.latitude() + ";" + a.longitude());
        cs.addPointOfInterest(c, p3);
      }
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
    Tourist t;
    int i = 1;
    for (String user : tourists) {
      t = new Tourist();
      t.setName(user);
      t.setEmail(user + "@gotour.com");
      t.setPassword("gotour");
      t.setAvatar(i + "_" + user);
      t.setDescription(faker.lorem().sentence());
      us.addTourist(t);
      i++;
    }

    Name p = faker.name();
    String name;
    for (int j = 1; j <= TOURISTS; j++) {
      t = new Tourist();
      name = "test" + j;
      t.setName(name);
      t.setEmail(name.toLowerCase() + "@gotour.com");
      t.setPassword("gotour");
      t.setDescription(faker.lorem().sentence());
      us.addTourist(t);
    }

    Guide g;
    for (String user : guides) {
      g = new Guide();
      g.setName(user);
      g.setEmail(user + "@gotour.com");
      g.setPassword("gotour");
      g.setPhone(faker.phoneNumber().phoneNumber());
      g.setDescription(faker.lorem().paragraph(2));
      g.setAvatar(i + "_" + user);
      us.addGuide(g);
      i++;
    }

    for (int k = 0; k < GUIDES - guides.length; k++) {
      g = new Guide();
      name = p.firstName();
      g.setName(name);
      g.setEmail(name.toLowerCase() + "@gotour.com");
      g.setPassword("gotour");
      g.setPhone(faker.phoneNumber().phoneNumber());
      g.setDescription(faker.lorem().paragraph(2));
      us.addGuide(g);
    }
  }

  private void addTours() {
    Language[] ls = new Language[]{
      ts.getLanguage("English"),
      ts.getLanguage("Portuguese"),
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

    for (String guide : guides) {
      gs.add(us.getGuide(guide + "@gotour.com"));
    }

    Tour t;
    City c;
    List<PointOfInterest> p;
    Iterator<PointOfInterest> it;
    for (long city = 1; city <= CITIES; city++) {
      c = cs.getCityByID(city);
      Collection<PointOfInterest> pois = c.getPointsOfInterest();
      for (int m = 0, aux = 1; m < TOURS / CITIES; m++, aux++) {
        t = new Tour();
        t.setCity(c);
        t.setDescription(faker.lorem().paragraph(2));
        t.setDuration((r.nextInt(3) + 2) + " hours");
        t.setGuide(gs.get(aux % gs.size()));
        Set<Language> l = new HashSet<Language>();
        int n = r.nextInt(4) + 1;
        for (int k = 0; k < n; k++) {
          l.add(ls[k]);
        }
        t.setLanguages(l);
        t.setName(faker.lorem().sentence(1).replace(".", ""));
        p = new ArrayList<PointOfInterest>();
        it = pois.iterator();
        for (int j = 0; it.hasNext() && j < 4; j++) {
          p.add(it.next());
        }
        t.setPointsOfInterest(p);
        int price = r.nextInt(21) + 5;
        t.setNormalPrice(price + "€");
        t.setStudentPrice((price - (price / 3)) + "€");
        t.setTheme(th[r.nextInt(4)]);
        ts.addTour(t);
      }
    }
  }

  private void addEnrollments() {
    Tour t;
    DateTime date;
    List<Language> ls;
    Enrollments e;
    int j, m, n;
    for (long i = 1; i <= TOURS; i++) {
      t = ts.getTour(i);
      ls = new ArrayList<Language>(t.getLanguages());
      for (j = 0; j < ENROLLMENTS / TOURS; j++) {
        int day = 21 + (j % 2 == 0 ? r.nextInt(5) : -r.nextInt(5));
        date = new DateTime(2015, 7, day, 8 + r.nextInt(15), 0);
        int max = 10 + r.nextInt(11);
        e = ts.addTourDate(t, ls.get(r.nextInt(ls.size())), date, max);
      }
    }
    /*
    Tourist tt;
    long z = 1;
    for (String a : tourists) {
      tt = us.getTourist(a + "@gotour.com");
      for (int zz = 0; zz < 3; zz++, z++) {
        ts.enrollTourist(z % TOURS, tt.getId());
      }
    }
    */
  }

  private void addReviews() {
    Review rv;
    String[] comments = new String[]{
      "This tour sucks! Not recomended.",
      "It's was nice, we couldn't imagine life without it!",
      "8 out of 10, highly recommended!",
      "Couldn't be happier with this tour!"
    };
    String[] titles = new String[]{
      "Boring",
      "Nice!",
      "Great!",
      "Top!"
    };
    Tour t;
    List<Tourist> tou = new ArrayList<Tourist>();
    for (String a : tourists) {
      tou.add(us.getTourist(a + "@gotour.com"));
    }
    for (int i = 1, aux=0, aux2; i <= TOURS; i++) {
      t = ts.getTour((long) i);

      for (int j = 0; j < REVIEWS / TOURS; j++, aux++) {
        rv = new Review();
        aux2 = aux % 4;
        rv.setComment(comments[aux2]);
        rv.setRating((byte) (aux2 + 2));
        rv.setTitle(titles[aux2]);
        ts.addReview(t, tou.get(aux % tourists.length), rv);
      }
    }
  }

}
