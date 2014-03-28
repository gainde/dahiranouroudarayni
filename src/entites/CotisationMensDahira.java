package entites;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Embeddable
@Table(name="cotisationmensdahira")
public class CotisationMensDahira implements Serializable{
	@Column(nullable = false)
	private float montant;//le montant cotise par membres
	@Column(length = 30, nullable = false)
	private String groupe;//les groupes de cotisation
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateCotisationKST;// la date de cotisation
	private Membre membre;
	
	public CotisationMensDahira() {
	}
	public CotisationMensDahira(float montant, String groupe,
			Date dateCotisationKST) {
		super();
		this.montant = montant;
		this.groupe = groupe;
		this.dateCotisationKST = dateCotisationKST;
	}
	public float getMontant() {
		return montant;
	}
	public void setMontant(float montant) {
		this.montant = montant;
	}
	public String getGroupe() {
		return groupe;
	}
	public void setGroupe(String groupe) {
		this.groupe = groupe;
	}
	public Date getDateCotisationKST() {
		return dateCotisationKST;
	}
	public void setDateCotisationKST(Date dateCotisationKST) {
		this.dateCotisationKST = dateCotisationKST;
	}
	@Override
	public String toString() {
		return "CotisationMensDahira [montant=" + montant + ", groupe="
				+ groupe + ", dateCotisationKST=" + dateCotisationKST + "]";
	}
}
