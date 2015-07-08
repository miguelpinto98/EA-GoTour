
package com.gotour.services;

import com.gotour.models.Guide;
import com.gotour.models.Tourist;

public interface UserService {
    void addTourist(Tourist t);
    void addGuide(Guide g);
    Guide getGuide(String email);
    Tourist getTourist(String email);
}
