package com.gotour.services;

import com.gotour.daos.ThemeDao;
import com.gotour.models.Theme;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("themeService")
@Transactional
public class ThemeServiceImpl implements ThemeService {

  @Autowired
  private ThemeDao themeDao;

  public Theme getThemeByID(Long id) {
    return themeDao.find(id);
  }

  public List<Theme> getThemes() {
    return themeDao.getAll();
  }
}
