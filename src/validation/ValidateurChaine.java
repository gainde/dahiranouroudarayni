package validation;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;

import javafx.event.EventHandler;

import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

import javafx.scene.input.KeyEvent;
import javafx.scene.text.Text;



public class ValidateurChaine extends Validateur {
	private static final String CHAINE_PATTERN = "(?=\\w)(\\w|[éàèôù.,;#-]|\\s)*";
	private static final String CHAINE_PATTERN2 = "(\\w|[éàèôùç]|\\p{Punct}|\\s)*";
	private int tailleMax;
	private Boolean choice;
	private TextArea texteArea;
	
	public ValidateurChaine(TextField texte, Text labelErr, boolean nullable,
			ValidationErreur validationErr, int taille) {
		super(texte, labelErr, nullable, validationErr);
		this.tailleMax = taille;
		this.choice = false;
		initValiderChaine(texte, labelErr);
	}
	
	public ValidateurChaine(TextArea texteArea, Text labelErr, boolean nullable,
			ValidationErreur validationErr, int taille) {
		super(labelErr, nullable, validationErr);
		this.tailleMax = taille;
		this.choice = true;
		this.texteArea = texteArea;
		initValiderChaine(texteArea, labelErr);
	}
	@Override
	public boolean valider() {
		if(choice)
			return validerTextArea();
		else
			return super.valider(CHAINE_PATTERN);
	}
	
	// validation champ
		private void initValiderChaine(TextField textField, Text labelErr) {
			labelErr.setVisible(false);
			textField.focusedProperty().addListener(new ChangeListener<Boolean>() {
				@Override
				public void changed(ObservableValue<? extends Boolean> observable,
						Boolean oldValue, Boolean newValue) {
					if (!newValue) {
						valider();
				}}
			});
			
			textField.addEventHandler(KeyEvent.KEY_TYPED, new EventHandler<KeyEvent>() {
				public void handle(final KeyEvent keyEvent) {
					if (textField.getText().length() >= tailleMax) {
						keyEvent.consume();
					}
				}
			});
		}
		
		// validation champ
				private void initValiderChaine(TextArea textArea, Text labelErr) {
					labelErr.setVisible(false);
					textArea.focusedProperty().addListener(new ChangeListener<Boolean>() {
						@Override
						public void changed(ObservableValue<? extends Boolean> observable,
								Boolean oldValue, Boolean newValue) {
							if (!newValue) {
								valider();
						}}
					});
					
				}
				
				//validateur super classe
				public  boolean validerTextArea(){
					boolean valide = false;
					String email = texteArea.getText();
					if(email == null || email.isEmpty()){
						if(!nullable){
							texteArea.getStyleClass().add("error");
							labelErr.setText(validationErr.getMessageErr());
							labelErr.setVisible(true);
						}
						valide = nullable;
					}
					else{
						//TODO check if pattern match
						Matcher matcher = Pattern.compile(CHAINE_PATTERN2).matcher(email);
						valide = matcher.matches();
						if(!valide){
							texteArea.getStyleClass().add("error");
							labelErr.setText(validationErr.getMessageErr2());
							labelErr.setVisible(true);
						}
						if(valide){
							texteArea.getStyleClass().remove("error");
							labelErr.setVisible(false);
						}
						texteArea.getStyleClass().remove("error");
					}
					return valide;
				}
}
