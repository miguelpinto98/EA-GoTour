
package com.gotour.daos;

import com.gotour.models.Tourist;
import org.springframework.stereotype.Repository;

@Repository("touristDAO")
public class TouristDAOImpl extends AbstractDAO implements TouristDAO{

    @Override
    public void saveTourist(Tourist t) {
        persist(t);
    }

}
