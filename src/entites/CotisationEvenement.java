package entites;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@SuppressWarnings("serial")
@Table(name = "cotisation_evenement")
public class CotisationEvenement implements Serializable{
	@Column(nullable = false)
	private float montantCotiser;//le montant cotise par membres
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateCotisationEven;// la date de cotisation
	
	@Embedded
	private Evenement evenement;
	
	private Membre membre;

	public CotisationEvenement(float montantCotiser, Date dateCotisationEven) {
		super();
		this.montantCotiser = montantCotiser;
		this.dateCotisationEven = dateCotisationEven;
	}

	public float getMontantCotiser() {
		return montantCotiser;
	}

	public void setMontantCotiser(float montantCotiser) {
		this.montantCotiser = montantCotiser;
	}

	public Date getDateCotisationEven() {
		return dateCotisationEven;
	}

	public void setDateCotisationEven(Date dateCotisationEven) {
		this.dateCotisationEven = dateCotisationEven;
	}

	public Evenement getEvenement() {
		return evenement;
	}

	public void setEvenement(Evenement evenement) {
		this.evenement = evenement;
	}

	public Membre getMembre() {
		return membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}
	
	
	
}
