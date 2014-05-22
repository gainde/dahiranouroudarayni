package dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Vector;

public interface Dao<T, PK extends Serializable> {
    T create(T t);
    T read(PK id);
    T update(T t);
    void delete(T t);
    List<T> getAll(String query);
    public List<T> getAll(String query, String param);
	T get(String query);
	Double getMontant(String query, String id, String annee);
}
