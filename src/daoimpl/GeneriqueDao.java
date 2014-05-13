package daoimpl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import persistance.EMF;
import dao.Dao;

public abstract class GeneriqueDao<T, PK extends Serializable> implements Dao<T, PK> {
	
	protected Class<T> entityClass;

    @PersistenceContext
    protected EntityManager entityManager = EMF.getEntityManager("jpa");

    @SuppressWarnings("unchecked")
	public GeneriqueDao() {
        ParameterizedType genericSuperclass = (ParameterizedType) getClass()
             .getGenericSuperclass();
        this.entityClass = (Class<T>) genericSuperclass.getActualTypeArguments()[0];
    }

    @Override
    public T create(T t) {
        this.entityManager.persist(t);
        return t;
    }

    @Override
    public T read(PK id) {
        return this.entityManager.find(entityClass, id);
    }

    @Override
    public T update(T t) {
        return this.entityManager.merge(t);
    }

    @Override
    public void delete(T t) {
        t = this.entityManager.merge(t);
        this.entityManager.remove(t);
    }
    
    @Override
	public List getAll(String query) {
    	return entityManager.createQuery(query).getResultList();
	}

}
