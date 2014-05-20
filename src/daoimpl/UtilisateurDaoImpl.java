package daoimpl;

import java.util.List;

import dao.UtilisateurDao;
import entites.Utilisateur;

public class UtilisateurDaoImpl extends GeneriqueDao<Utilisateur, Integer> implements UtilisateurDao {

	@Override
	public Utilisateur verifierLoginPass(String query, String login, String pass) {
		// TODO Auto-generated method stub
		tx.begin();
    	Utilisateur user  = (Utilisateur) entityManager.createQuery(query).setParameter(1, login)
    									.setParameter(2, pass)
    									.getSingleResult();
    	tx.commit();
		return user;
	}

}
