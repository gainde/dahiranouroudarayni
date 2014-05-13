package validation;

import javax.swing.JLabel;
import javax.swing.JTextField;

public class ValideurTelephone extends Validateur {

	
	public ValideurTelephone(JTextField texte, JLabel labelErr, boolean nullable,
			ValidationErreur validationErr) {
		super(texte, labelErr, nullable, validationErr);
	}

	@Override
	public boolean valider() {
		boolean valide = false;
		valide = Validation.valideTelephone(texte.getText(), nullable);
		if(!valide) labelErr.setText(validationErr.getMessageErr());
		return valide;
	}
	
}
