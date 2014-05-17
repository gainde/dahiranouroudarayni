package validation;

import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

import javax.swing.JLabel;
import javax.swing.JTextField;

public class ValideurLogin extends Validateur {
	private int tailleMax;
	public ValideurLogin(TextField texte, Text labelErr, boolean nullable,
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
