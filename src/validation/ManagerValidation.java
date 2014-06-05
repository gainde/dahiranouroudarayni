package validation;

import java.util.ArrayList;

import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.Text;
import entites.ManagerEntite;

public class ManagerValidation{
	
	/** Constructeur privé */
	private ManagerValidation() {
		
	}

	/** Instance unique non préinitialisée */
	private static ManagerValidation INSTANCE = null;

	/** Point d'accès pour l'instance unique du singleton */
	public static synchronized ManagerValidation getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new ManagerValidation();
		}
		return INSTANCE;
	}
	
	
	private ArrayList<Validateur> valideList = new ArrayList<Validateur>();
	
	
	public ArrayList<Validateur> getValideList() {
		return valideList;
	}

	public void setValideList(ArrayList<Validateur> valideList) {
		this.valideList = valideList;
	}

	// Valider le chaine de caracteres
	public void validerChaine(TextField texte, Text textErr, Boolean nullable,
			int taille) {
		ValidateurChaine valideur = new ValidateurChaine(texte, textErr,
				nullable, ValidationErreur.CHAINE_ERR, taille);
		valideur.validerChaine(texte, textErr);
		add(valideur);
	}

	// Valider le chaine de caracteres
	public void validerChaine(TextArea texte, Text textErr, Boolean nullable,
			int taille) {
		ValidateurChaine valideur = new ValidateurChaine(texte, textErr,
				nullable, ValidationErreur.CHAINE_ERR, taille);
		valideur.validerChaine(texte, textErr);
		add(valideur);
	}

	// Valider email
	public void validerEmail(TextField texte, Text textErr, Boolean nullable,
			int taille) {
		ValideurEmail valideur = new ValideurEmail(texte, textErr, nullable,
				ValidationErreur.EMAIL_ERR, taille);
		valideur.validerEmail(texte, textErr);
		add(valideur);
	}

	// Valider code postale
	public void validerCodePostal(TextField texte, Text textErr,
			Boolean nullable) {
		ValideurCodePostale valideur = new ValideurCodePostale(texte, textErr,
				nullable, ValidationErreur.CODEPOSTALE_ERR);
		valideur.validerCodePostal(texte, textErr);
		add(valideur);
	}

	// Valider code postale
	public void validerTelephone(TextField texte, Text textErr, Boolean nullable) {
		ValideurTelephone valideur = new ValideurTelephone(texte, textErr,
				nullable, ValidationErreur.TELEPHONE_ERR);
		valideur.validerTelephone(texte, textErr);
		add(valideur);
	}

	// Valider Montant
		public void validerMontant(TextField texte, Text textErr, Boolean nullable) {
			ValidateurMontant valideur = new ValidateurMontant(texte, textErr,
					nullable, ValidationErreur.MONTANT_ERR);
			valideur.validerMontant(texte, textErr);
			add(valideur);
		}
	
		// Valider Montant
		public Validateur validerUnMontant(TextField texte, Text textErr, Boolean nullable) {
				ValidateurMontant valideur = new ValidateurMontant(texte, textErr,
							nullable, ValidationErreur.MONTANT_ERR);
					valideur.validerMontant(texte, textErr);
					return valideur;
		}
	public void add(Validateur val) {
		valideList.add(val);
	}

	public Boolean toutEstValide() {
		for (Validateur p : valideList) {
			if (!p.valider())
				return false;
		}
		return true;
	}
	public Boolean unEstValide(Validateur p) {
		return p.valider();
	}
	
	public void setVisibleImageValidate(){
		
	}
	
	// effacer la liste de validation
	public void clearListOfValidation(){
		if(!valideList.isEmpty())
			valideList.clear();
	}
}
