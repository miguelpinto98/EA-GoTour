/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gotour.daos;

import java.lang.reflect.ParameterizedType;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class GenericDaoImpl<T> implements GenericDao<T> {

    private Class<T> type;

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public Class<T> getType() {
        return type;
    }

    public GenericDaoImpl() {
        this.type = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    @Override
    public T find(Long id) {
        return (T) getSessionFactory().getCurrentSession().get(getType(), id);
    }

    @Override
    public void delete(T obj) {
        getSessionFactory().getCurrentSession().delete(obj);
    }

    @Override
    public void saveOrUpdate(T obj) {
        getSessionFactory().getCurrentSession().saveOrUpdate(obj);
    }

    public List<T> getAll() {
        final Session session = sessionFactory.getCurrentSession();
        final Criteria crit = session.createCriteria(type);
        return crit.list();
    }
}
