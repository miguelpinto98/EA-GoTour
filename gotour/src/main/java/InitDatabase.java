
import com.gotour.config.HibernateConfiguration;
import com.gotour.models.City;
import com.gotour.models.PointOfInterest;
import com.gotour.services.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class InitDatabase {

    @Autowired
    private CityService cs;

    public static void main(String[] args) {
        AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
        ctx.register(HibernateConfiguration.class);
        ctx.register(InitDatabase.class);
        ctx.scan("com.gotour.daos");
        ctx.scan("com.gotour.services");
        ctx.refresh();
        InitDatabase x = ctx.getBean(InitDatabase.class);
        x.load();
    }

    void load() {
        City c = new City();
        c.setName("Braga");
        cs.addCity(c);
        PointOfInterest p = new PointOfInterest();
        p.setName("Sameiro");
        p.setDescription("The Sanctuary of Our Lady of Sameiro (or Sanctuary of Sameiro) is a sanctuary and Marian shrine located in Braga, in the surroundings of the city of Braga, Portugal.");
        p.setLocation("WTF?");
        cs.addPointOfInterest(c,p);
    }

}
