package com.gotour.daos;

import java.util.List;

public interface GenericDao<T> {
    public T find(Long id);
    public List<T> find(String property, Object value);
    public T findUnique(String property, Object value);
    public void delete(T obj);
    public void save(T obj);
    public void update(T obj);
    public List<T> getAll();
    public List<T> getAll(int offset, int limit);
}