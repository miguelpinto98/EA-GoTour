
import models.*;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Zé
 */
public class InitDatabase {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Tourist u = new Tourist();
        u.setName("Teste");
        
        SessionFactory s = new AnnotationConfiguration().configure().buildSessionFactory();
        org.hibernate.Session se = s.openSession();
        se.beginTransaction();
        
        se.save(u);
        
        se.getTransaction().commit();
        s.close();
    }

}
