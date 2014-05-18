package validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

import javax.swing.JLabel;
import javax.swing.JTextField;

public abstract  class Validateur {
	protected TextField texte;
	protected Text labelErr;
	protected boolean nullable;
	protected ValidationErreur validationErr;
	
	
	public Validateur(TextField texte, Text labelErr, boolean nullable,
			ValidationErreur validationErr) {
		super();
		this.texte = texte;
		this.labelErr = labelErr;
		this.nullable = nullable;
		this.validationErr = validationErr;
	}

	public abstract boolean valider();

	public String getTexte() {
		return texte.getText();
	}

	public Text getLabelErr() {
		return labelErr;
	}

	public boolean isNullable() {
		return nullable;
	}

	public ValidationErreur getValidationErr() {
		return validationErr;
	}

	public void setTexte(String texte) {
		this.texte.setText(texte);
	}

	public void setLabelErr(Text labelErr) {
		this.labelErr = labelErr;
	}

	public void setNullable(boolean nullable) {
		this.nullable = nullable;
	}

	public void setValidationErr(ValidationErreur validationErr) {
		this.validationErr = validationErr;
	}
	
	//
	public  boolean valider(String textPatern){
		boolean valide = false;
		String email = texte.getText();
		if(email == null || email.isEmpty()){
			if(!nullable){
				texte.getStyleClass().add("error");
				labelErr.setText(validationErr.getMessageErr());
				labelErr.setVisible(true);
			}
			valide = nullable;
		}
		else{
			//TODO check if pattern match
			Matcher matcher = Pattern.compile(textPatern).matcher(email);
			valide = matcher.matches();
			if(!valide){
				texte.getStyleClass().add("error");
				labelErr.setText(validationErr.getMessageErr2());
				labelErr.setVisible(true);
			}
			if(valide){
				texte.getStyleClass().remove("error");
				labelErr.setVisible(false);
			}
			texte.getStyleClass().remove("error");
		}
		return valide;
	}
	
}
