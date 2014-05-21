package daoimpl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import persistance.EMF;
import dao.Dao;

public abstract class GeneriqueDao<T, PK extends Serializable> implements Dao<T, PK> {
	
	protected Class<T> entityClass;

    @PersistenceContext
    protected EntityManager entityManager = EMF.getEntityManager("jpa");
    protected EntityTransaction tx = entityManager.getTransaction();
    		
    @SuppressWarnings("unchecked")
	public GeneriqueDao() {
        ParameterizedType genericSuperclass = (ParameterizedType) getClass()
             .getGenericSuperclass();
        this.entityClass = (Class<T>) genericSuperclass.getActualTypeArguments()[0];
    }

    @Override
    public T create(T t) {
    	try{
	    	tx.begin();
	        this.entityManager.persist(t);
	        tx.commit();
    	}catch(NoResultException e){
    		return null;		
    	}catch(Exception e){
    		return null;
    	}
        return t;
    }

    @Override
    public T read(PK id) {
    	T t;
    	try{
	    	tx.begin();
	        t = this.entityManager.find(entityClass, id);
	        tx.commit();
    	}catch(NoResultException e){
    		return null;		
    	}catch(Exception e){
    		return null;
    	}
    	return t;
    }

    @Override
    public T update(T t) {
    	try{
	    	tx.begin();
	        t = this.entityManager.merge(t);
	        tx.commit();
    	}catch(NoResultException e){
    		return null;		
    	}catch(Exception e){
    		return null;
    	}
        return t;
    }

    @Override
    public void delete(T t) {
    	tx.begin();
        t = this.entityManager.merge(t);
        this.entityManager.remove(t);
        tx.commit();
    }
    
    @Override
	public List getAll(String query) {
    	List l;
    	try{
	    	tx.begin();
	    	l = entityManager.createQuery(query).getResultList();
	    	tx.commit();
    	}catch(NoResultException e){
    		return null;		
    	}catch(Exception e){
    		return null;
    	}
    	return l;
	}
    
    @Override
	public List getAll(String query, String param) {
    	List l;
    	try{
	    	tx.begin();
	    	l = entityManager.createQuery(query).setParameter(1, param).getResultList();
	    	tx.commit();
    	}catch(NoResultException e){
    		return null;		
    	}catch(Exception e){
    		return null;
    	}
    	return l;
	}
}
