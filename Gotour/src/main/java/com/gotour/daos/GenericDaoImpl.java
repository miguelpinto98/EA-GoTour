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
import org.hibernate.criterion.Restrictions;
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

  protected Session getSession() {
    return sessionFactory.getCurrentSession();
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
  public void save(T obj) {
    getSessionFactory().getCurrentSession().save(obj);
  }

  @Override
  public void update(T obj) {
    getSessionFactory().getCurrentSession().update(obj);
  }

  @Override
  public List<T> getAll() {
    Session session = sessionFactory.getCurrentSession();
    Criteria crit = session.createCriteria(type);
    crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
    return crit.list();
  }

  @Override
  public List<T> getPage(int pageNumber, int pageSize) {
    Criteria crit = getSession().createCriteria(type);
    crit.setFirstResult((pageNumber - 1) * pageSize);
    crit.setMaxResults(pageSize);
    return crit.list();
  }

  @Override
  public List<T> find(String property, Object value) {
    Criteria crit = getSession().createCriteria(type);
    crit.add(Restrictions.eq(property, value));
    return crit.list();
  }

  @Override
  public T findUnique(String property, Object value) {
    Criteria crit = getSession().createCriteria(type);
    crit.add(Restrictions.eq(property, value));
    crit.setMaxResults(1);
    return (T) crit.uniqueResult();
  }

  protected List<T> getPageByCriteria(int pageNumber, int pageSize, Criteria crit) {
    crit.setFirstResult((pageNumber - 1) * pageSize);
    crit.setMaxResults(pageSize);
    return crit.list();
  }
}
