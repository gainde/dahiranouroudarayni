package validation;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

import javax.swing.JLabel;
import javax.swing.JTextField;

import validation.Validateur;
import validation.Validation;
import validation.ValidationErreur;



public class ValidateurChaine extends Validateur {
	private static final String CHAINE_PATTERN = "[A-Za-z0-9]*";
	private int tailleMax;
	
	public ValidateurChaine(TextField texte, Text labelErr, boolean nullable,
			ValidationErreur validationErr, int taille) {
		super(texte, labelErr, nullable, validationErr);
		this.tailleMax = taille;
	}

	@Override
	public boolean valider() {
		return super.valider(CHAINE_PATTERN);
	}
	
	// validation champ
		public void validerChaine(TextField textField, Text labelErr) {
			labelErr.setVisible(false);
			textField.focusedProperty().addListener(new ChangeListener<Boolean>() {
				@Override
				public void changed(ObservableValue<? extends Boolean> observable,
						Boolean oldValue, Boolean newValue) {
					if (!newValue) {
						valider();
				}}
			});
		}
}
