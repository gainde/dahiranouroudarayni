package persistance;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class EMF {
	private static volatile EntityManagerFactory emf;
	private EMF(String name){
		getEntityManager( name);
	}
	
	public static EntityManager getEntityManager(String name){
		if(emf == null)
			emf = Persistence.createEntityManagerFactory(name);
		return emf.createEntityManager();
	}
	

}
