package entites;

import dao.DahiraDao;
import daoimpl.DahiraDaoImpl;
import javafx.loadview.LoadManagerView;

public class ManagerEntite {
	
	/** Constructeur privé */
	private ManagerEntite() {
	}

	/** Instance unique non préinitialisée */
	private static ManagerEntite INSTANCE = null;

	/** Point d'accès pour l'instance unique du singleton */
	public static synchronized ManagerEntite getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new ManagerEntite();
		}
		return INSTANCE;
	}
	
	private final String DAHIRA = "select c from Dahira c";
	// importer membre dans la base de donnée
	public Dahira loadDahira(){
		DahiraDaoImpl dahiraDao = new DahiraDaoImpl();
		return dahiraDao.get(DAHIRA);
	}
	
	//mettre à jour un membre dans la base de donnée
	public void updateDahira(Dahira dahira) {
			DahiraDao dahiraDao = new DahiraDaoImpl();
			dahiraDao.update(dahira);
	}
}
