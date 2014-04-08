package validation;

import javax.swing.JLabel;
import javax.swing.JTextField;

public abstract  class Validateur {
	protected JTextField texte;
	protected JLabel labelErr;
	protected boolean nullable;
	protected ValidationErreur validationErr;
	
	
	public Validateur(JTextField texte, JLabel labelErr, boolean nullable,
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

	public JLabel getLabelErr() {
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

	public void setLabelErr(JLabel labelErr) {
		this.labelErr = labelErr;
	}

	public void setNullable(boolean nullable) {
		this.nullable = nullable;
	}

	public void setValidationErr(ValidationErreur validationErr) {
		this.validationErr = validationErr;
	}
	
	
}
