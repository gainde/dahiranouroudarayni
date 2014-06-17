package daoimpl;

import java.util.Vector;

import javax.persistence.NoResultException;

import dao.CotisationKSTDao;
import entites.CotisationKST;

public class CotisationKSTImpl extends GeneriqueDao<CotisationKST, Integer>
		implements CotisationKSTDao {
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
    		e.printStackTrace();
    		return null;		
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}
    	return t;
    }

}
