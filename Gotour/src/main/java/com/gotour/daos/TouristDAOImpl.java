
package com.gotour.daos;

import com.gotour.models.Tourist;
import org.springframework.stereotype.Repository;

@Repository("touristDao")
public class TouristDaoImpl extends GenericDaoImpl<Tourist> implements TouristDao{
    public Tourist getTourist(String email) {
        return find("email", email).get(0);
    }
}
