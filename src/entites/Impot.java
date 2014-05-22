package entites;

import java.util.Date;

public class Impot {
	private Membre membre;
	private Double montantCotisation;
	private int annee;
	private Date dateDeliv;
	public Impot(Membre membre, Double montantCotisation, int an, Date date) {
		super();
		this.membre = membre;
		this.montantCotisation = montantCotisation;
		this.annee = an;
		this.dateDeliv = date;
	}
	public Membre getMembre() {
		return membre;
	}
	public void setMembre(Membre membre) {
		this.membre = membre;
	}
	public Double getMontantCotisation() {
		return montantCotisation;
	}
	public void setMontantCotisation(Double montantCotisation) {
		this.montantCotisation = montantCotisation;
	}
	public int getAnnee() {
		return annee;
	}
	public void setAnnee(int an) {
		annee = an;
	}
	public Date getDateDeliv() {
		return dateDeliv;
	}
	public void setDateDeliv(Date dateDeliv) {
		this.dateDeliv = dateDeliv;
	}
	
}
