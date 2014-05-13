package entites;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@SuppressWarnings("serial")
@Table(name = "cotisation_evenement")
public class CotisationEvenement implements Serializable{
	@Id
	@GeneratedValue
	private int id;
	@Column(nullable = false)
	private float montantCotiser;//le montant cotise par membres
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateCotisationEven;// la date de cotisation

	private Evenement evenement;
	
	private Membre membre;
}
