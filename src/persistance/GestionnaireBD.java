package persistance;

import javax.persistence.EntityManager;

public class GestionnaireBD {
	private String name;
	
	public GestionnaireBD(String name){ 
		this.name = name;
	}
	
	public EntityManager getEntityManager(){
		return EMF.getEntityManager(name);
	}

}
