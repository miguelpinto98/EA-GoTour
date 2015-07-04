package com.gotour.daos;

import java.util.List;

public interface GenericDao<T> {
    public T find(Long id);
    public void delete(T obj);
    public void save(T obj);
    public void update(T obj);
    public List<T> getAll();
}