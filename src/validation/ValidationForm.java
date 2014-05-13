package validation;

import javax.swing.JLabel;

import logique.TypeValidation;


public class ValidationForm {
	private String fieldText;
	private JLabel lb;
	private String msgError;
	private boolean nullable;
	
	private TypeValidation type;
	
	public ValidationForm(String texte, JLabel lb, String msgError,
			boolean nullable, TypeValidation typeValidation) {
		super();
		this.fieldText = texte;
		this.lb = lb;
		this.msgError = msgError;
		this.nullable = nullable;
		this.type = typeValidation;
	}
	public String getField() {
		return fieldText;
	}
	public JLabel getLb() {
		return lb;
	}
	public String getMsgError() {
		return msgError;
	}
	public boolean isNullable() {
		return nullable;
	}
	public void setField(String text) {
		this.fieldText = text;
	}
	public void setLb(JLabel lb) {
		this.lb = lb;
	}
	public void setMsgError(String msgError) {
		this.msgError = msgError;
	}
	public void setNullable(boolean nullable) {
		this.nullable = nullable;
	}
	
	public void valider(){
		
	}
	
	
}
