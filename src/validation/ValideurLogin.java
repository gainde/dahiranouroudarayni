package validation;

import javax.swing.JLabel;
import javax.swing.JTextField;

public class ValideurLogin extends Validateur {
	private int tailleMax;
	public ValideurLogin(JTextField texte, JLabel labelErr, boolean nullable,
			ValidationErreur validationErr, int tailleMax) {
		super(texte, labelErr, nullable, validationErr);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean valider() {
		Validation.validerChaine(texte.getText(), tailleMax, nullable);
		return false;
	}

}
