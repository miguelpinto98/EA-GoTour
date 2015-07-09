package com.gotour.services;

import com.gotour.models.Theme;
import java.util.List;

public interface ThemeService {

  Theme getThemeByID(Long id);

  public List<Theme> getThemes();
}
