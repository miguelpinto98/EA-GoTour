/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Guide;
import org.springframework.stereotype.Repository;

@Repository("guideDao")
public class GuideDaoImpl extends GenericDaoImpl<Guide> implements GuideDao {   

    public Guide getGuide(String email) {
        return findUnique("email", email);
    }
}
