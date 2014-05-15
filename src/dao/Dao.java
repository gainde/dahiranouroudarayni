package dao;

import java.io.Serializable;
import java.util.List;

public interface Dao<T, PK extends Serializable> {
	void demarerTransaction();
	void commitTransaction();
	void finirTransaction();
    T create(T t);
    T read(PK id);
    T update(T t);
    void delete(T t);
    List getAll(String query);
}
