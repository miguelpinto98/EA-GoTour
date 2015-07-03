
import com.gotour.config.HibernateConfiguration;
import com.gotour.models.City;
import com.gotour.services.CityService;
import java.util.ArrayList;
import java.util.List;
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
        List<City> cities = cities();

        for (City c : cities) {
            cs.saveCity(c);
        }
    }

    List<City> cities() {
        String[] cityNames = {
            "Aveiro",
            "Beja",
            "Braga",
            "Bragança",
            "Castelo Branco",
            "Coimbra",
            "Évora",
            "Faro",
            "Guarda",
            "Leiria",
            "Lisboa",
            "Portalegre",
            "Porto",
            "Santarém",
            "Setúbal",
            "Viana do Castelo",
            "Vila Real",
            "Viseu"
        };

        List<City> cities = new ArrayList<City>();
        City city;

        for (String c : cityNames) {
            city = new City();
            city.setName(c);
            cities.add(city);
        }

        return cities;
    }
}
