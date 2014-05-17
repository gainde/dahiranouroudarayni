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

public class ValideurEmail extends Validateur {
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	
	public ValideurEmail(TextField texte, Text labelErr, boolean nullable,
			ValidationErreur validationErr) {
		super(texte, labelErr, nullable, validationErr);
	}

	@Override
	public boolean valider() {
		return super.valider(EMAIL_PATTERN);
	}
	
	// validation champ email
		public void validerEmail(TextField textField, Text textErr) {
			textErr.setVisible(false);
			textField.focusedProperty().addListener(new ChangeListener<Boolean>() {
				@Override
				public void changed(ObservableValue<? extends Boolean> observable,
						Boolean oldValue, Boolean newValue) {
					if (!newValue) {
						valider();
					}
				}
			});
		}

}
