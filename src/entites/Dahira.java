package entites;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@SuppressWarnings("serial")
@Table(name="dahira")
public class Dahira implements Serializable{
	@Id
	@Column(name = "nom", length = 30, nullable = false)
	private String nomDahira;// nom de la dahira
	@Column(length = 1000, nullable = false)
	private String description;//une petite description sur la dahira cote administratif
	@Column(nullable = false)
	private String numeroEnregistrement;//numero d'enregistrement de la dahira
	private String telephone;
	private String email;
	private String siteWeb;
	
	@Embedded
	private Adresse adresse;//adresse de la dahira
	
	public Dahira() {
	}
	public Dahira(String nomDahira, String description,
			String numeroEnregistrement, String telephone, String email,
			String siteWeb, Adresse adresse) {
		super();
		this.nomDahira = nomDahira;
		this.description = description;
		this.numeroEnregistrement = numeroEnregistrement;
		this.telephone = telephone;
		this.email = email;
		this.siteWeb = siteWeb;
		this.adresse = adresse;
	}
	public String getNomDahira() {
		return nomDahira;
	}
	public String getDescription() {
		return description;
	}
	public String getNumeroEnregistrement() {
		return numeroEnregistrement;
	}
	public String getTelephone() {
		return telephone;
	}
	public String getEmail() {
		return email;
	}
	public String getSiteWeb() {
		return siteWeb;
	}
	public Adresse getAdresse() {
		return adresse;
	}
	public void setNomDahira(String nomDahira) {
		this.nomDahira = nomDahira;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setNumeroEnregistrement(String numeroEnregistrement) {
		this.numeroEnregistrement = numeroEnregistrement;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setSiteWeb(String siteWeb) {
		this.siteWeb = siteWeb;
	}
	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}
	@Override
	public String toString() {
		return "Dahira [nomDahira=" + nomDahira + ", description="
				+ description + ", numeroEnregistrement="
				+ numeroEnregistrement + ", adresse=" + adresse
				+ "]";
	}

}
