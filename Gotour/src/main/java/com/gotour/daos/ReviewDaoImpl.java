/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Review;
import org.springframework.stereotype.Repository;

@Repository("repositoryDao")
public class ReviewDaoImpl extends GenericDaoImpl<Review> implements ReviewDao{

}
