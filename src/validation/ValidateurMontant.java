package validation;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

public class ValidateurMontant extends Validateur {
	private static final String MONTANT_PATTERN = "\\d{1,6}[.]?\\d{1,2}";
	
	
	public ValidateurMontant(TextField texte, Text labelErr, boolean nullable,
			ValidationErreur validationErr) {
		super(texte, labelErr, nullable, validationErr);
		initValiderMontant(texte, labelErr);
	}

	@Override
	public boolean valider() {
		boolean valide = false;
		valide = super.valider(MONTANT_PATTERN); 
		return valide;
	}
	
	// validation champ telephone
		private void initValiderMontant(TextField textField, Text textErr) {
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
