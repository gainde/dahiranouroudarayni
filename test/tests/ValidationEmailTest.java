package tests;


import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import validation.Validation;


public class ValidationEmailTest {
	private static final String VALID_EMAILS [] = new String[] { "moussa@yahoo.com",
			"moussa-100@yahoo.com", "moussa.100@yahoo.com",
			"moussa111@moussa.com", "moussa-100@moussa.net",
			"moussa.100@moussa.com.au", "moussa@1.com",
			"moussa@gmail.com.com", "moussa+100@gmail.com",
			"moussa-100@yahoo-test.com" } ;
	
	private static final String INVALID_EMAILS [] = new String [] { "moussa", "moussa@.com.my",
			"moussa123@gmail.a", "moussa123@.com", "moussa123@.com.com",
			".moussa@moussa.com", "moussa()*@gmail.com", "moussa@%*.com",
			"moussa..2002@gmail.com", "moussa.@gmail.com",
			"moussa@moussa@gmail.com", "moussa@gmail.com.1a" };
	 
	@BeforeClass
	public static void initData() {
	}
 
	
	@Test
	public void ValidEmailTest() {
 
		for (String email : VALID_EMAILS) {
			boolean valide = Validation.validerEmail(email, true);
			System.out.println("Email est valide : " + email + " , " + valide);
			Assert.assertEquals(valide, true);
		}
 
	}
	
	@Test
	public void InValidEmailTest() {
		
		for (String email : INVALID_EMAILS) {
			boolean valide = Validation.validerEmail(email, true);
			System.out.println("Email est invalide : " + email + " , " + valide);
			Assert.assertEquals(valide, false);
		}
	}
}
