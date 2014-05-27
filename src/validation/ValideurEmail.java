package validation;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.EventHandler;

import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.text.Text;

public class ValideurEmail extends Validateur {
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private int tailleMax;

	public ValideurEmail(TextField texte, Text labelErr, boolean nullable,
			ValidationErreur validationErr, int tailleMax) {
		super(texte, labelErr, nullable, validationErr);
		this.tailleMax = tailleMax;
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

		textField.addEventHandler(KeyEvent.KEY_TYPED,
				new EventHandler<KeyEvent>() {
					public void handle(final KeyEvent keyEvent) {
						if (textField.getText().length() > tailleMax - 4) {
							keyEvent.consume();
						}
					}
				});
	}

	// validation champ email
	public void validerEmail(TextField textField, Text textErr,
			ImageView imageView) {
		textErr.setVisible(false);
		textField.focusedProperty().addListener(new ChangeListener<Boolean>() {
			@Override
			public void changed(ObservableValue<? extends Boolean> observable,
					Boolean oldValue, Boolean newValue) {
				if (!newValue) {
					valider();
					if (valider())
						imageView.setVisible(true);
					else
						imageView.setVisible(false);
				}
			}
		});
	}
}
