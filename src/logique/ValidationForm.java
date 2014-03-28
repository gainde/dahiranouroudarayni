package logique;

import javax.swing.JLabel;

import logique.Validation.TypeValidation;

public class ValidationForm {
	private Object field;
	private JLabel lb;
	private String msgError;
	private boolean nullable;
	private int min = -1; 
	private int max = -1;
	private TypeValidation type;
	public ValidationForm(Object field, JLabel lb, String msgError,
			boolean nullable, TypeValidation typeValidation) {
		super();
		this.field = field;
		this.lb = lb;
		this.msgError = msgError;
		this.nullable = nullable;
		this.type = typeValidation;
	}
	public Object getField() {
		return field;
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
	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}
	public void setField(Object field) {
		this.field = field;
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
	public void setMin(int min) {
		this.min = min;
	}
	public void setMax(int max) {
		this.max = max;
	}
	
	public void valider(){
		
	}
	
	
}
