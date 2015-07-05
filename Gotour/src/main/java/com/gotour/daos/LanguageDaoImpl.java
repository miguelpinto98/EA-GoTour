/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gotour.daos;

import com.gotour.models.Language;
import org.springframework.stereotype.Repository;

@Repository("languageDao")
public class LanguageDaoImpl extends GenericDaoImpl<Language> implements LanguageDao {

    public Language getLanguage(String language) {
        return find("name", language).get(0);
    }
}
