package entites;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Table(name = "groupe")
public class GroupeDeCotisation implements Serializable{
	@Id
	@GeneratedValue
	private int id;//la cle du groupe
	private Membre membre;//le nom du groupe
	@OneToMany(mappedBy = "Membre")
	private List<Membre> listeGroupe = new ArrayList<Membre>();//les groupes de cotisation
	
}
