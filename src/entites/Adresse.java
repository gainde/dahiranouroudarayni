package entites;

public class Adresse {
	private String rue;
	private String ville;
	private String province;
	private String codepostale;
	private String pays;
	
	public Adresse(){
		
	}

	public String getRue() {
		return rue;
	}

	public String getVille() {
		return ville;
	}

	public String getProvince() {
		return province;
	}

	public String getCodepostale() {
		return codepostale;
	}

	public String getPays() {
		return pays;
	}

	public void setRue(String rue) {
		this.rue = rue;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public void setCodepostale(String codepostale) {
		this.codepostale = codepostale;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}
	
	

}
