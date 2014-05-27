package validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private static final String TELEPHONE_PATTERN = "\\d{3}-\\d{3}-\\d{4}";
	private static final String CODE_POSTALE_PATTERN = "^[ABCEGHJKLMNPRSTVXY]\\d[ABCEGHJKLMNPRSTVWXYZ]( )?\\d[ABCEGHJKLMNPRSTVWXYZ]\\d$";
	private static boolean valide = false; 
	
	private static Pattern pattern;
	private static Matcher matcher;
	
	public static boolean validerEmail(String email, boolean nullable){
		if(email == null || email.isEmpty()){
			return valide = nullable;
		}
		else{
			//TODO check if pattern match
			matcher = Pattern.compile(EMAIL_PATTERN).matcher(email);
			return matcher.matches();
		}
	}
	
	public static boolean validerTelephone(String telephone, boolean nullable){
		if(telephone == null || telephone.isEmpty())
			return valide = nullable;
		else{
			pattern = Pattern.compile(TELEPHONE_PATTERN);
			matcher = pattern.matcher(telephone);
			return  matcher.matches();
		}
	}
	
	public static boolean validerCodePostale(String codePostale, boolean nullable){
		if(codePostale == null || codePostale.isEmpty())
			return valide = nullable;
		else{
			matcher = Pattern.compile(CODE_POSTALE_PATTERN).matcher(codePostale);
			return matcher.matches();
		}
	}
	
	public static boolean validerChaine(String chaine, int tailleMax, boolean nullable){
		if(chaine == null || chaine.isEmpty())
			return valide = nullable;
		else
			return valide = (chaine.length()<=tailleMax);
	}
	
	public static boolean validerNombre(String nombre, int min, int max, boolean nullable){
		return false;
	}

}
