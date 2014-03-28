package entites;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@SuppressWarnings("serial")
@Table(name="cotisationkst")
public class CotisationKST implements Serializable{
	@Column(nullable = false)
	private float montant;// montant cotise par membres
	@Column(length = 2, nullable = false)
	private String typeDeCotisation;//type de cotisation si c est de type mensuel ou non
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateCotisationKST;// la date de cotisation
	
	private Membre membre;
	public CotisationKST() {
	}
	
	public CotisationKST(float montant, String typeDeCotisation,
			Date dateCotisationKST) {
		super();
		this.montant = montant;
		this.typeDeCotisation = typeDeCotisation;
		this.dateCotisationKST = dateCotisationKST;
	}

	public float getMontant() {
		return montant;
	}
	public void setMontant(float montant) {
		this.montant = montant;
	}
	public String getTypeDeCotisation() {
		return typeDeCotisation;
	}
	public void setTypeDeCotisation(String typeDeCotisation) {
		this.typeDeCotisation = typeDeCotisation;
	}
	
	public Date getDateCotisationKST() {
		return dateCotisationKST;
	}

	public void setDateCotisationKST(Date dateCotisationKST) {
		this.dateCotisationKST = dateCotisationKST;
	}

	@Override
	public String toString() {
		return "CotisationKST [montant=" + montant + ", typeDeCotisation="
				+ typeDeCotisation + ", dateCotisationKST=" + dateCotisationKST
				+ "]";
	}
	
	
}
