package dao;

import entites.ProjetKST;


public interface ProjetDao extends Dao<ProjetKST, Integer>{
	Double getMontant(String query);
}