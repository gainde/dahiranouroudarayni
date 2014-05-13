package entites;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Embeddable
@Table(name="cotisationmensdahira")
public class CotisationMensDahira implements Serializable{
	@Id
	@GeneratedValue
	private int id;
	@Column(nullable = false)
	private float montant;//le montant cotise par membres
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateCotisationKST;// la date de cotisation

	private Membre membre;
	
	private GroupeDeCotisation groupe;//les groupes de cotisation
	
	public CotisationMensDahira() {
	}
	public CotisationMensDahira(float montant, String groupe,
			Date dateCotisationKST) {
		super();
		this.montant = montant;
		this.dateCotisationKST = dateCotisationKST;
	}
	public int getId() {
		return id;
	}
	public float getMontant() {
		return montant;
	}
	public Date getDateCotisationKST() {
		return dateCotisationKST;
	}
	public Membre getMembre() {
		return membre;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public void setMontant(float montant) {
		this.montant = montant;
	}
	public void setDateCotisationKST(Date dateCotisationKST) {
		this.dateCotisationKST = dateCotisationKST;
	}
	public void setMembre(Membre membre) {
		this.membre = membre;
	}
	
	@Override
	public String toString() {
		return "CotisationMensDahira [id=" + id + ", montant=" + montant
				+ ", dateCotisationKST=" + dateCotisationKST + ", membre="
				+ membre + ","  + "]";
	}
	
}
