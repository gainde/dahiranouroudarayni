import javax.swing.JLabel;
import javax.swing.JTextField;

import validation.Validateur;
import validation.Validation;
import validation.ValidationErreur;



public class ValidateurChaine extends Validateur {
	private int tailleMax;
	
	public ValidateurChaine(JTextField texte, JLabel labelErr, boolean nullable,
			ValidationErreur validationErr, int taille) {
		super(texte, labelErr, nullable, validationErr);
		this.tailleMax = taille;
	}

	@Override
	public boolean valider() {
		boolean valide = false;
		valide = Validation.validerChaine(texte.getText(), tailleMax, nullable);
		if(!valide) labelErr.setText(validationErr.getMessageErr());
		return valide;
	}

}
