package entites;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@SuppressWarnings("serial")
@Entity
@Table(name="cotisationkst")
public class CotisationKST implements Serializable{
	@Id
	@GeneratedValue
	private int id;
	
	@Column(nullable = false)
	private Double montant;// montant cotise par membres
	
	@Column(name="type", length = 1, nullable = false)
	private char type;//type de cotisation si c est de type mensuel ou non
	
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateCotisation;// la date de cotisation
	
	@Column(nullable = false)
	private String idMembre = "";
	
	/*@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn
	private Membre membre;*/
	
	public CotisationKST() {
	}
	
	public CotisationKST(Double montant, char typeDeCotisation,
			Date dateCotisationKST) {
		super();
		this.montant = montant;
		this.type = typeDeCotisation;
		this.dateCotisation = dateCotisationKST;
	}

	public Double getMontant() {
		return montant;
	}
	public void setMontant(Double montant) {
		this.montant = montant;
	}
	public char getTypeDeCotisation() {
		return type;
	}
	public void setTypeDeCotisation(char typeDeCotisation) {
		this.type = typeDeCotisation;
	}
	
	public Date getDateCotisationKST() {
		return dateCotisation;
	}

	public void setDateCotisationKST(Date dateCotisationKST) {
		this.dateCotisation = dateCotisationKST;
	}
	
	
	
	public String getIdMembre() {
		return idMembre;
	}

	public void setIdMembre(String idMembre) {
		this.idMembre = idMembre;
	}

	/*public Membre getMembre() {
		return membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}*/
	
	/*public Membre getMembre() {
		return membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}*/
	
	@Override
	public String toString() {
		return "CotisationKST [montant=" + montant + ", typeCotisation="
				+ type + ", dateCotisation=" + dateCotisation
				+ "]";
	}

	
	
	
}
