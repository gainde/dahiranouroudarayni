package daoimpl;

import javax.persistence.NoResultException;

import dao.UtilisateurDao;
import entites.Utilisateur;

public class UtilisateurDaoImpl extends GeneriqueDao<Utilisateur, Integer> implements UtilisateurDao {

	@Override
	public Utilisateur verifierLoginPass(String query, String login, String pass) {
		// TODO Auto-generated method stub
		Utilisateur user;
		try{
			tx.begin();
	    	user  = (Utilisateur) entityManager.createQuery(query).setParameter(1, login)
	    									.setParameter(2, pass)
	    									.getSingleResult();
	    	tx.commit();
		}catch(NoResultException e){
			return null;
		}catch(Exception e){
			return null;
		}
		return user;
	}

}
