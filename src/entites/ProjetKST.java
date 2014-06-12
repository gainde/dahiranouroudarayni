package entites;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
@Table(name="projet")
public class ProjetKST {
	@Id
	@Column(nullable = false)
	private String nom;
	@Column(nullable = false)
	private String description;
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateDebut;
	@Column
	@Temporal(TemporalType.DATE)
	private Date dateFin;
	@Column(nullable = false)
	private double budget;
	
	public ProjetKST() {
	}
	public ProjetKST(String nom, String description, Date dateDebut,
			Date dateFin, double budget) {
		super();
		this.nom = nom;
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.budget = budget;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}
	public Date getDateFin() {
		return dateFin;
	}
	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}
	public double getBudget() {
		return budget;
	}
	public void setBudget(double budget) {
		this.budget = budget;
	}
	
}
