package dao;

import entites.Utilisateur;

public interface UtilisateurDao extends Dao<Utilisateur, Integer> {
	boolean verifierLoginPass(String login, String pass);
}
