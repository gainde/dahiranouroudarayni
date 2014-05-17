package entites;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="cotisationmembre")
public class CotisationLoyer implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;
	
	@Column(nullable = false)
	private Double montant;//le montant cotise par membres
	
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date datecotisation;// la date de cotisation
	
	//private Membre membre;
	
	@Column(nullable = false)
	private String idMembre = "";
	
	//@ManyToOne(fetch=FetchType.LAZY)
    //@JoinColumn
	//private Membre membre;
	
	public CotisationLoyer() {
	}
	
	public CotisationLoyer(Double montant, Date date) {
		super();
		this.montant = montant;
		//this.groupe = groupe;
		this.datecotisation = date;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getDatecotisation() {
		return datecotisation;
	}
	public void setDatecotisation(Date datecotisation) {
		this.datecotisation = datecotisation;
	}
	public String getIdMembre() {
		return idMembre;
	}
	public void setIdMembre(String idMembre) {
		this.idMembre = idMembre;
	}
	
	public Double getMontant() {
		return montant;
	}
	public void setMontant(Double montant) {
		this.montant = montant;
	}
	public Date getDate() {
		return datecotisation;
	}
	public void setDate(Date date) {
		this.datecotisation = date;
	}
	
	
	/*public Membre getMembre() {
		return membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}*/

	@Override
	public String toString() {
		return "CotisationMensDahira [id= "+id+" montant=" + montant 
				+ ", date=" + /*new SimpleDateFormat("dd/MM/yyyy").format(*/datecotisation//) 
				+ "]";
	}
}
