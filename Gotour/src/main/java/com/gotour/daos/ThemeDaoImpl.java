/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Theme;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("themeDao")
public class ThemeDaoImpl extends GenericDaoImpl<Theme> implements ThemeDao {

    public Theme getTheme(String theme) {
        return findUnique("name", theme);
    }

}
