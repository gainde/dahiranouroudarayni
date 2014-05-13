package validation;

public enum ValidationErreur {
	EMAIL_ERR("100","Email invalide"),
	TELEPHONE_ERR("101", "Telephone invalide"),
	CODEPOSTALE_ERR("102", "Code postale invalide");
	
	private String code;
	private String messageErr;
	
	ValidationErreur(String code, String message){
		this.code = code;
		messageErr = message;
	}
	
	public String getCodeErreur(){
		return this.code;
	}
	
	public String getMessageErr(){
		return this.messageErr;
	}
	
	public String toString(){
		return this.code + " : " + this.messageErr;
	}
}
