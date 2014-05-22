package daoimpl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.math.BigDecimal;
import java.util.List;
import java.util.Vector;

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
	public List<T> getAll(String query) {
    	List<T> l;
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
	public List<T> getAll(String query, String param) {
    	List<T> l;
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
    
    @Override
    public T get(String query) {
    	T t;
    	try{
    	tx.begin();
    	t = (T) entityManager.createQuery(query).getSingleResult();
    	 t = (T) entityManager.createQuery(query).getSingleResult();
    	tx.commit();
    	}catch(NoResultException e){
    		return null;		
    	}catch(Exception e){
    		return null;
    	}
    	return t;
	}
    
    @Override
    public Double getMontant(String query, String id, String annee){
    	Double t;
    	try{
	    	tx.begin();
	    	Vector singleResult = (Vector)entityManager.createNativeQuery(query).setParameter(1, id).setParameter(2, annee).getSingleResult();
	    	t = (Double)singleResult.get(0);
	    	tx.commit();
    	}catch(NoResultException e){
    		e.printStackTrace();
    		return null;		
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}
    	return t;
    }
    
}
