package entites;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;


@SuppressWarnings("serial")
@Embeddable
public class Adresse implements Serializable{
	
	@Column(name="adresse", length = 30)
	private String rue;
	
	@Column(length = 30)
	private String ville;
	
	@Column(length = 30)
	private String province;
	
	@Column(length = 30)
	private String codepostale;
	
	@Column(length = 30)
	private String pays;
	
	public Adresse(){
		
	}
	
	public Adresse(String rue, String ville, String province,
			String codepostale, String pays) {
		super();
		this.rue = rue;
		this.ville = ville;
		this.province = province;
		this.codepostale = codepostale;
		this.pays = pays;
	}



	public String getRue() {
		return rue != null ? rue : "";
	}

	public String getVille() {
		return ville != null ? ville : "";
	}

	public String getProvince() {
		return province != null ? province : "";
	}

	public String getCodepostale() {
		return codepostale != null ? codepostale : "";
	}

	public String getPays() {
		return pays != null ? pays : "";
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
	
	public String toString() {
		return String.format("%s, %s, %s, %s, %s", getRue(), getCodepostale(), getVille(), getProvince(), getPays());
	}

}
