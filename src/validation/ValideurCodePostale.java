package validation;

import javax.swing.JLabel;
import javax.swing.JTextField;

public class ValideurCodePostale extends Validateur{

	public ValideurCodePostale(JTextField texte, JLabel labelErr,
			boolean nullable, ValidationErreur validationErr) {
		super(texte, labelErr, nullable, validationErr);
		
	}

	@Override
	public boolean valider() {
		return Validation.validerCodePostale(texte.getText(), nullable);
	}
	
}
