package validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

import javax.swing.JLabel;
import javax.swing.JTextField;

public class ValideurCodePostale extends Validateur{
	private static final String CODE_POSTALE_PATTERN = "^[ABCEGHJKLMNPRSTVXY]\\d[ABCEGHJKLMNPRSTVWXYZ]( )?\\d[ABCEGHJKLMNPRSTVWXYZ]\\d$";
	
	
	public ValideurCodePostale(TextField texte, Text labelErr,
			boolean nullable, ValidationErreur validationErr) {
		super(texte, labelErr, nullable, validationErr);
		
	}

	@Override
	public boolean valider() {
		
		return super.valider(CODE_POSTALE_PATTERN);
	}
	
	// validation champ
		public void validerCodePostal(TextField textField, Text textErr) {

			textErr.setVisible(false);
			textField.focusedProperty().addListener(
					new ChangeListener<Boolean>() {
						@Override
						public void changed(
								ObservableValue<? extends Boolean> observable,
								Boolean oldValue, Boolean newValue) {
							if (!newValue) {
								valider();
							}
						}
					});
		}
}
