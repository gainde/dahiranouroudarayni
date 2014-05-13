package entites;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Embeddable
@Table(name = "evenement")
public class Evenement implements Serializable{
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 100, nullable = false)
	private String nomEvenement;// nom de l'evenement
	@Column(nullable = false)
	private float budget; //le budget de l'evenement
	@Column(nullable = false)
	private float depenseTotale; //les depenses totalisees pour un type d'evenement
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateEvenement;// la date de l'evenement
	
	public Evenement() {
	}
	public Evenement(int id, String nomEvenement, float budget, float depenseTotale,
			Date dateEvenement) {
		super();
		this.id = id;
		this.nomEvenement = nomEvenement;
		this.budget = budget;
		this.depenseTotale = depenseTotale;
		this.dateEvenement = dateEvenement;
	}
	public int getId() {
		return id;
	}
	public String getNomEvenement() {
		return nomEvenement;
	}
	public float getBudget() {
		return budget;
	}
	public float getDepenseTotale() {
		return depenseTotale;
	}
	public Date getDateEvenement() {
		return dateEvenement;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNomEvenement(String nomEvenement) {
		this.nomEvenement = nomEvenement;
	}
	public void setBudget(float budget) {
		this.budget = budget;
	}
	public void setDepenseTotale(float depenseTotale) {
		this.depenseTotale = depenseTotale;
	}
	public void setDateEvenement(Date dateEvenement) {
		this.dateEvenement = dateEvenement;
	}
	@Override
	public String toString() {
		return "Evenement [id=" + id + ", nomEvenement=" + nomEvenement
				+ ", budget=" + budget + ", depenseTotale=" + depenseTotale
				+ ", dateEvenement=" + dateEvenement + "]";
	}
}
