package com.gotour.services;

import com.gotour.daos.ReviewDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("reviewService")
@Transactional
public class ReviewServiceImpl implements ReviewService {
  
  @Autowired ReviewDao reviewDao;
}
