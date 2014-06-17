package entites;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name = "evenement")
public class Evenement implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(length = 100, nullable = false)
	private String nom;// nom de l'evenement
	@Column(nullable = false)
	private Double budget; //le budget de l'evenement
	@Column(nullable = false)
	private Double depense; //les depenses totalisees pour un type d'evenement
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateEvent;// la date de l'evenement
	
	public Evenement() {
	}
	public Evenement(String nomEvenement, Double budget, Double depenseTotale,
			Date dateEvenement) {
		super();
		this.nom = nomEvenement;
		this.budget = budget;
		this.depense = depenseTotale;
		this.dateEvent = dateEvenement;
	}
	public Evenement(String nomEvenement, Double budget, Date dateEvenement) {
		super();
		this.nom = nomEvenement;
		this.budget = budget;
		this.dateEvent = dateEvenement;
	}
	public String getNomEvenement() {
		return nom;
	}
	public Double getBudget() {
		return budget;
	}
	public Double getDepense() {
		return depense;
	}
	public Date getDateEvenement() {
		return dateEvent;
	}
	public void setNomEvenement(String nomEvenement) {
		this.nom = nomEvenement;
	}
	public void setBudget(Double budget) {
		this.budget = budget;
	}
	public void setDepense(Double depenseTotale) {
		this.depense = depenseTotale;
	}
	public void setDateEvenement(Date dateEvenement) {
		this.dateEvent = dateEvenement;
	}
	@Override
	public String toString() {
		return this.nom;
				/*"Evenement [nomEvenement=" + nom
				+ ", budget=" + budget + ", depenseTotale=" + depense
				+ ", dateEvenement=" + dateEvent + "]";*/
	}
}
