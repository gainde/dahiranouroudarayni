package persistance;

import javax.persistence.EntityManager;

public class GestionnaireBD {
	private EMF emf;
	private String name;
	
	public GestionnaireBD(String name){ 
		this.name = name;
	}
	
	public EntityManager getEntityManager(){
		return emf.getEntityManager(name);
	}

}
