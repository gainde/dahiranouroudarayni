package dao;

import entites.CotisationKST;

public interface CotisationKSTDao extends Dao<CotisationKST, Integer> {
	Double getMontant(String query);
}
