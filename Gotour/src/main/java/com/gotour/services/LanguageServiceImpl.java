package com.gotour.services;


import com.gotour.daos.LanguageDao;
import com.gotour.models.Language;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("languageService")
@Transactional
public class LanguageServiceImpl implements LanguageService {

  @Autowired public LanguageDao langDao;
  
  public List<Language> getLanguages() {
    return langDao.getAll();
  }
}