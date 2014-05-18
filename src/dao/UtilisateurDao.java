package dao;

import entites.Utilisateur;

public interface UtilisateurDao extends Dao<Utilisateur, Integer> {
	Utilisateur verifierLoginPass(String query, String login, String pass); 
}
