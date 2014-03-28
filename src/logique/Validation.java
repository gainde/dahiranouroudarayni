package logique;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {
	public enum TypeValidation {EMAIL, TELEPHONE, CHAINE, CODEPOSTALE};
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private static final String TELEPHONE_PATTERN = "[0-9]{10}";
	private static final String CODE_POSTALE_PATTERN = "([A-Za-z][0-9]){3}";
	private static boolean valide = false; 
	
	private static Pattern pattern;
	private static Matcher matcher;
	
	public static boolean validerEmail(String email, boolean nullable){
		if(email == null || email.isEmpty())
			return valide = nullable;
		else{
			//TODO check if pattern match
			matcher = Pattern.compile(EMAIL_PATTERN).matcher(email);
			return matcher.matches();
		}
	}
	
	public static boolean valideTelephone(String telephone, boolean nullable){
		if(telephone == null || telephone.isEmpty())
			return valide = nullable;
		else{
			//TODO check if pattern match
		}
		return false;
	}
	
	public static boolean validerCodePostale(String codePostale, boolean nullable){
		if(codePostale == null || codePostale.isEmpty())
			return valide = nullable;
		else{
			//TODO check if pattern match
		}
		return false;
	}
	
	public static boolean validerChaine(String chaine, int tailleMax, boolean nullable){
		if(chaine == null || chaine.isEmpty())
			return valide = nullable;
		else
			return valide = (chaine.length()<=tailleMax);
	}

}
