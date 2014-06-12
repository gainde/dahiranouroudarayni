package daoimpl;

import java.util.Vector;

import javax.persistence.NoResultException;

import dao.ProjetDao;
import entites.ProjetKST;


public class ProjetDaoImpl extends GeneriqueDao<ProjetKST, Integer> implements ProjetDao{
	@SuppressWarnings("rawtypes")
	@Override
    public Double getMontant(String query){
    	Double t;
    	try{
	    	tx.begin();
	    	Vector singleResult = (Vector)entityManager.createNativeQuery(query).getSingleResult();
	    	t = (Double)singleResult.get(0);
	    	tx.commit();
    	}catch(NoResultException e){
    		tx.rollback();
    		return null;		
    	}catch(Exception e){
    		tx.rollback();
    		e.printStackTrace();
    		return null;
    	}
    	return t;
    }
}