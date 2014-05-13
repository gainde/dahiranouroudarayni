package daoimpl;

import dao.UtilisateurDao;
import entites.Utilisateur;

public class UtilisateurDaoImpl extends GeneriqueDao<Utilisateur, Integer> implements UtilisateurDao {

	@Override
	public boolean verifierLoginPass(String login, String pass) {
		// TODO Auto-generated method stub
		return false;
	}

}
