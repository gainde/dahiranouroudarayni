package validation;

import javax.swing.JLabel;
import javax.swing.JTextField;

public class ValideurEmail extends Validateur {
	
	public ValideurEmail(JTextField texte, JLabel labelErr, boolean nullable,
			ValidationErreur validationErr) {
		super(texte, labelErr, nullable, validationErr);
	}

	@Override
	public boolean valider() {
		return false;
	}
 

}
