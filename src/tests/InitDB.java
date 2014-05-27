package tests;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import entites.CotisationLoyer;

public class InitDB {
	// constantes
	private final static String TABLE_NAME = "MEMBRE";

	public static void main(String[] args) throws ParseException {
		// r�cup�rer un EntityManagerFactory � partir de l'unit� de persistance
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
		// r�cup�rer un EntityManager � partir de l'EntityManagerFactory
		EntityManager em = emf.createEntityManager();
		// d�but transaction
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		// supprimer les �l�ments de la table Test
		////em.createNativeQuery("delete from " + TABLE_NAME).executeUpdate();
		// mettre des �l�ments dans la table Test
		/****Membre p1 = new Membre("Dieng", "Ousmane", new SimpleDateFormat("dd/MM/yy").parse("03/08/1985"), "5142960552", "test@gmail.com");
		Adresse a1 = new Adresse("arthur-peloquin", "montreal", "quebec", "h3s1r7", "Canada");
		p1.setAdresse(a1);
		em.persist(p1);***/
		
		Date date = new SimpleDateFormat("dd/MM/yy").parse("10/02/2009");
		System.out.println("Date = "+date);
		
		CotisationLoyer cotisation = new CotisationLoyer(1000d, date);
		em.persist(cotisation);
		
		System.out.println("[Cotisation]");
		for (Object p : em.createQuery("select c from CotisationLoyer c order by c.datecotisation asc").getResultList()) {
			System.out.println(p);
		}
		//em.persist(p2);
		// affichage personnes
		/***System.out.println("[Membre]");
		for (Object p : em.createQuery("select m from Membre m order by m.nom asc").getResultList()) {
			System.out.println(p);
		}***/
		// fin transaction
		tx.commit();
		// fin EntityManager
		em.close();
		// fin EntityManagerFactory
		emf.close();
		// log
		System.out.println("termin� ...");
	}
}
