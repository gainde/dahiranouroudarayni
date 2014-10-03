package javafx.impot;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.itextpdf.text.DocumentException;

import dao.CotisationEvenementDao;
import dao.CotisationKSTDao;
import dao.CotisationLoyerDao;
import dao.MembreDao;
import daoimpl.CotisationEvenementImpl;
import daoimpl.CotisationKSTImpl;
import daoimpl.CotisationLoyerImpl;
import daoimpl.MembreDaoImpl;
import entites.Dahira;
import entites.Impot;
import entites.ManagerEntiteDahira;
import entites.Membre;
import entites.Utilisateur;
import javafx.GenererPdf;
import javafx.SendMessage;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.home.Home;
import javafx.scene.Node;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyEvent;

public class ManagerImpot {
	
	private Utilisateur user;
	private final String QUERY_ALL_MEMBRE = "select m from Membre m";
	private final String COTISATION_LOYER = "select sum(l.montant) from cotisationmembre l where l.idMembre=?1 and YEAR(l.datecotisation) = ?2";
	private final String COTISATION_KST = "select sum(k.montant) from cotisationkst k where k.idMembre=?1 and YEAR(K.datecotisation) = ?2";
	private final String COTISATION_EVENEMENT = "select sum(e.montant) from cotisationevenement e where e.idMembre=?1 and YEAR(e.datecotisation) = ?2";

	private List<Membre> listMembre = new ArrayList<Membre>();
	private ArrayList<Impot> listImpot = new ArrayList<Impot>();
	private Label lbDossier;
	private TextField txtObjet;
	private TextArea txtAMsg;
	
	private String nameFile;
	
	public ArrayList<Impot> getListImpot() {
		return listImpot;
	}

	public void setUser(Utilisateur user) {
		this.user = user;
	}

	public void setListMembre(List<Membre> listMembre) {
		this.listMembre = listMembre;
	}

	

	public void setTxtObjet(TextField txtObjet) {
		this.txtObjet = txtObjet;
	}

	public void setTxtAMsg(TextArea txtAMsg) {
		this.txtAMsg = txtAMsg;
	}

	public void setLbDossier(Label lbDossier) {
		this.lbDossier = lbDossier;
	}

	//pour remplir le combo box
	public void fillComboBox(ComboBox<Integer> cmbAnnee) {
		ObservableList<Integer> options = FXCollections.observableArrayList();
		Calendar calendar = new GregorianCalendar();
		int annee = calendar.get(Calendar.YEAR);
		for (int i = 1; i < 5; i++) {
			options.add(annee - i);
		}
		cmbAnnee.setItems(options);
		cmbAnnee.setValue(annee - 1);

	}
	
	public void loadData(int annee, Date date) {
		Double tmp;
		for (Membre membre : listMembre) {
			CotisationLoyerDao loyerDao = new CotisationLoyerImpl();

			tmp = loyerDao.getMontant(COTISATION_LOYER, membre.getEmail(),
					String.valueOf(annee));
			Double montantLoyer = 0.0;
			if (tmp != null)
				montantLoyer = tmp.doubleValue();

			CotisationEvenementDao evenementDao = new CotisationEvenementImpl();
			tmp = evenementDao.getMontant(COTISATION_KST, membre.getEmail(),
					String.valueOf(annee));
			Double montantEvenement = 0.0;
			if (tmp != null)
				montantEvenement = tmp.doubleValue();

			CotisationKSTDao kstDao = new CotisationKSTImpl();
			tmp = kstDao.getMontant(COTISATION_EVENEMENT, membre.getEmail(),
					String.valueOf(annee));
			Double montantKST = 0.0;
			if (tmp != null)
				montantKST = tmp.doubleValue();

			listImpot
					.add(new Impot(membre,
							(montantLoyer + montantEvenement + montantKST),
							annee, date));
		}
		//executer(listImpot);
	}
	
	public void envoyerEmail(Impot impotMembre,int numero) {
		Dahira dahira = ManagerEntiteDahira.getInstance().getDahira();

		nameFile = lbDossier.getText() + "/"
				+ impotMembre.getMembre().getPrenom() + "_"
				+ impotMembre.getMembre().getNom() + ".pdf";
		System.out.println("chemin : "+nameFile);
		// GenererPdf(String dateIpmot, String dateDelivrance,String montant)
		String annee = String.valueOf(impotMembre.getAnnee());
		String montant = String.valueOf(impotMembre.getMontantCotisation());
		String date = new SimpleDateFormat("dd/MM/yyyy").format(impotMembre
				.getDateDeliv());
		GenererPdf impot = new GenererPdf(annee, date, montant);
		try {
			impot.createPdf(nameFile, impotMembre.getMembre(), dahira, "", numero);
		} catch (DocumentException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		SendMessage mess = new SendMessage();
		mess.setObjet(txtObjet.getText());
		mess.setMessage(txtAMsg.getText());
		mess.setEmailDestination(impotMembre.getMembre().getEmail());
		mess.setPathFile(nameFile);
		mess.sendMessage(user.getLogin(), user.getPass());

	}
	
	//utile juste pour envoie d'un membre, duplicata
	public void deletePdf(){
		Process p;
		try {
		p = Runtime.getRuntime().exec("rm "+ nameFile);
			p.waitFor();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// stop to write
		public void setNodeStopWriten(Node node, String text, int caractereMax) {
			node.addEventHandler(KeyEvent.KEY_TYPED, new EventHandler<KeyEvent>() {
				public void handle(final KeyEvent keyEvent) {
					if (text.length() >= caractereMax) {
						keyEvent.consume();
					}
				}
			});
		}
		
		//vérifier la validité du mot de passe
		public Boolean validerMotDePasse(String motdePass,String motdePass2){
			if(!motdePass.isEmpty() && !motdePass2.isEmpty())
				if(motdePass.compareTo(motdePass2) == 0)
					return true;
			return false;
		}
}
