package entites;

import dao.DahiraDao;
import daoimpl.DahiraDaoImpl;

public class ManagerEntiteDahira {
	
	/** Constructeur privé */
	private ManagerEntiteDahira() {
	}

	/** Instance unique non préinitialisée */
	private static ManagerEntiteDahira INSTANCE = null;

	/** Point d'accès pour l'instance unique du singleton */
	public static synchronized ManagerEntiteDahira getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new ManagerEntiteDahira();
		}
		return INSTANCE;
	}
	
	private final String DAHIRA = "select c from Dahira c";
	private Dahira dahira;
	
	
	public Dahira getDahira() {
		if(dahira == null)
			loadDahira();
		return dahira;
	}

	// importer membre dans la base de donnée
	public void loadDahira(){
		DahiraDaoImpl dahiraDao = new DahiraDaoImpl();
		dahira = dahiraDao.get(DAHIRA);
	}
	
	//mettre à jour un membre dans la base de donnée
	public void updateDahira(Dahira dahira) {
			DahiraDao dahiraDao = new DahiraDaoImpl();
			dahiraDao.update(dahira);
	}
	
	//mettre à jour un membre dans la base de donnée
		public void createDahira(Dahira dahira) {
				DahiraDao dahiraDao = new DahiraDaoImpl();
				dahiraDao.create(dahira);
		}
}
