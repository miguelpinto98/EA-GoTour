
package com.gotour.daos;

import com.gotour.models.Tourist;
import org.springframework.stereotype.Repository;

@Repository("touristDAO")
public class TouristDAOImpl extends GenericDaoImpl<Tourist> implements TouristDAO{
}
