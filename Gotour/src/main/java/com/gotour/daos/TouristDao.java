
package com.gotour.daos;

import com.gotour.models.Tourist;

public interface TouristDao extends GenericDao<Tourist>{
    public Tourist getTourist(String email);
}
