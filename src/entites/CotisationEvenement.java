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
@Table(name = "cotisationevenement")
public class CotisationEvenement implements Serializable{
	@Id
	@GeneratedValue
	private int id;
	
	@Column(nullable = false)
	private Double montant;//le montant cotise par membres
	
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateCotisation;// la date de cotisation
	
	@Column
	private String idEven =  "Autre";
	
	@Column
	private String idMembre = "Anonyme";
	
	/*@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn
	private Evenement evenement;*/
	
	/*@ManyToOne
    @JoinColumn(name="idMembre")
	private Membre membre;*/
	
	public CotisationEvenement() {
		super();
	}

	public CotisationEvenement(Double montantCotiser, Date dateCotisationEven) {
		super();
		this.montant = montantCotiser;
		this.dateCotisation = dateCotisationEven;
	}
	public CotisationEvenement(Double montantCotiser, Date dateCotisationEven, String even) {
		this(montantCotiser, dateCotisationEven);
		this.idEven = even;
	}

	public Double getMontant() {
		return montant;
	}

	public void setMontant(Double montantCotiser) {
		this.montant = montantCotiser;
	}

	public Date getDateCotisation() {
		return dateCotisation;
	}

	public void setDateCotisation(Date dateCotisationEven) {
		this.dateCotisation = dateCotisationEven;
	}

	/*public Evenement getEvenement() {
		return evenement;
	}

	public void setEvenement(Evenement evenement) {
		this.evenement = evenement;
	}*/

	public String getIdMembre() {
		return idMembre;
	}

	public void setIdMembre(String idM) {
		this.idMembre = idM;
	}

	public String getIdEven() {
		return idEven;
	}

	public void setIdEven(String idEven) {
		this.idEven = idEven;
	}

	/*public Membre getMembre() {
		return this.membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}*/
	
	
	
}
