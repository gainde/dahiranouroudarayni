package daoimpl;

import javax.persistence.NoResultException;

import securite.SecurePass;
import dao.UtilisateurDao;
import entites.Utilisateur;

public class UtilisateurDaoImpl extends GeneriqueDao<Utilisateur, Integer> implements UtilisateurDao {

	@Override
	public Utilisateur verifierLoginPass(String query, String login, String pass) {
		// TODO Auto-generated method stub
		Utilisateur user;
		try{
			System.out.println(entityManager.createQuery(query));
			tx.begin();
	    	user  = (Utilisateur) entityManager.createQuery(query).setParameter(1, login)
	    									.setParameter(2, SecurePass.md5(pass)).getSingleResult();
	    	tx.commit();
		}catch(NoResultException e){
			e.printStackTrace();
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return user;
	}

}
