package entites;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Embeddable
@SuppressWarnings({"serial" })
@Entity
@Table(name="membre")
public class Membre implements Serializable{

	@Id
	@GeneratedValue
	private int id;
	
	@Column(length = 30, nullable = false, unique = true)
	private String nom;
	
	@Column(length = 30, nullable = false, unique = true)
	private String prenom;
	
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateNaissance;
	
	@Column(length = 30, nullable = false, unique = true)
	private String telephone;
	
	@Column(length = 30, nullable = false, unique = true)
	private String email;
	
	@Embedded
	private Adresse adresse;
	
	public Membre(){
	}
	
	

	public Membre(String nom, String prenom, Date dateNaissance,
			String telephone, String email) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.dateNaissance = dateNaissance;
		this.telephone = telephone;
		this.email = email;
	}



	public int getId() {
		return id;
	}

	public String getNom() {
		return nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public Date getDateNaissance() {
		return dateNaissance;
	}

	public String getTelephone() {
		return telephone;
	}

	public String getEmail() {
		return email;
	}

	public Adresse getAdresse() {
		return adresse;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public void setDateNaissance(Date dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}
	
	public String toString() {
		return String.format("Membre [%d,%s,%s,%s,%s,%s,%s]", getId(), getNom(), getPrenom(),
				new SimpleDateFormat("dd/MM/yyyy").format(getDateNaissance()), getTelephone(), getEmail(), adresse.toString());
	}
	
	

}
