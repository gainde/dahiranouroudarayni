package validation;

public enum ValidationErreur {
	EMAIL_ERR("100","Le champ ne doit pas être vide","Email invalide"),
	TELEPHONE_ERR("101", "", "Telephone invalide"),
	CODEPOSTALE_ERR("102","","Code postale invalide"),
	CHAINE_ERR("103","Le champ ne doit pas être vide", "Invalide seulement alpha numerique"), 
	MONTANT_ERR("104","", "Montant invalide Ex : 20.00 ou 20");
	
	private String code;
	private String messageErr;
	private String messageErr2;
	
	private ValidationErreur(String code, String message, String message2){
		this.code = code;
		messageErr = message;
		messageErr2 = message2;
	}
	
	public String getCodeErreur(){
		return this.code;
	}
	
	public String getMessageErr(){
		return this.messageErr;
	}
	public String getMessageErr2(){
		return this.messageErr2;
	}
	
	public String toString(){
		return this.code + " : " + this.messageErr;
	}
}
