/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Guide;


public interface GuideDao extends GenericDao<Guide>{

    public Guide getGuide(String email);

}
