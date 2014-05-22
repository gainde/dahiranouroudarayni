package javafx.impot;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.ResourceBundle;

import javafx.GenererPdf;
import javafx.SendMessage;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.TextField;
import javafx.stage.DirectoryChooser;
import javafx.stage.Stage;

import com.itextpdf.text.DocumentException;

import dao.CotisationEvenementDao;
import dao.CotisationKSTDao;
import dao.CotisationLoyerDao;
import dao.MembreDao;
import daoimpl.CotisationEvenementImpl;
import daoimpl.CotisationKSTImpl;
import daoimpl.CotisationLoyerImpl;
import daoimpl.MembreDaoImpl;
import entites.Adresse;
import entites.Dahira;
import entites.Impot;
import entites.Membre;
import entites.Utilisateur;

public class ImpotController implements Initializable{
	
	 @FXML private TextField txtEmail;
	 @FXML private PasswordField txtMotDePasse;
	 @FXML private Label lbDossier;
	 @FXML private Label lbMembres;
	 @FXML private ProgressBar progressBar;
	 @FXML private Button btnExecuter;
	 @FXML private Button btnChoisir;
	 @FXML private ComboBox cmbAnnee;
	 @FXML private DatePicker datePickerDeliv;
	  
	 private Stage stage;
	 private Utilisateur user;
	 private final String QUERY_ALL_MEMBRE = "select m from Membre m";
	 private final String COTISATION_LOYER = "select sum(l.montant) from cotisationmembre l where l.idMembre=?1 and YEAR(l.datecotisation) = ?2";
	 private final String COTISATION_KST = "select sum(k.montant) from cotisationkst k where k.idMembre=?1 and YEAR(K.datecotisation) = ?2";
	 private final String COTISATION_EVENEMENT = "select sum(e.montant) from cotisationevenement e where e.idMembre=?1 and YEAR(e.datecotisation) = ?2";
	 
	 
	 @Override
	 public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		handleButtonChoisir();
		handleButtonExecuter();
		fillComboBox();
		//TODO delete Test
		Double v = new Double(0.0);
		CotisationLoyerDao loyerDao = new CotisationLoyerImpl();
		v = loyerDao.getMontant(COTISATION_LOYER, "address@gmail.com", "2013");
		 //Double montant = v.get(0);
		System.out.println("Montant Loyer = "+v);
		
		CotisationEvenementDao evenementDao = new CotisationEvenementImpl();
		v = evenementDao.getMontant(COTISATION_KST, "address@gmail.com", "2013");
		//Double montant1 = v.get(0);
		System.out.println("Montant evenement = "+v);
		
		CotisationKSTDao kstDao = new CotisationKSTImpl();
		v = kstDao.getMontant(COTISATION_EVENEMENT, "address@gmail.com", "2013");
		//Double montant2 = v.get(0);
		System.out.println("Montant kst = "+v);
	 }
	
	 public void setStage(Stage stage) {
        this.stage = stage;
     }
	
	 private void handleButtonChoisir(){
		 btnChoisir.setOnMouseReleased(new EventHandler<Event>() {
	    		
				@Override
				public void handle(Event event) {
					System.out.println("click");
					choisirDossier();
				}
			});
	 }
	 private void handleButtonExecuter(){
		 btnExecuter.setOnMouseReleased(new EventHandler<Event>() {
	    		
				@Override
				public void handle(Event event) {
					System.out.println("click");
					getInfo();
				}
			});
	 }
	 private void fillComboBox(){
	    	ObservableList<Integer> options = 
	    		    FXCollections.observableArrayList();
	    	SimpleDateFormat format = new SimpleDateFormat("yyyy");
	    	Calendar calendar = new GregorianCalendar();
	    	int annee = calendar.get(Calendar.YEAR);
	    	for(int i = 1; i<5; i++){
	    		options.add(annee-i);
	    	}
	    	cmbAnnee.setItems(options);
	    	cmbAnnee.setValue(annee-1);
	    	
	    }
	 
	 private void choisirDossier(){
		 DirectoryChooser chooser = new DirectoryChooser();
		 chooser.setTitle("JavaFX Projects");
		 File selectedDirectory = chooser.showDialog(stage);
		 lbDossier.setText("");
		 lbDossier.setText(selectedDirectory.getPath());
         System.out.println("chemin : "+selectedDirectory.getName());
	 }
	 
	 private void loadData(int annee, Date date){
		 ArrayList<Impot> listImpot =  new ArrayList<Impot>();
		 MembreDao membreDao = new MembreDaoImpl();
		 List<Membre> listMembre = membreDao.getAll(QUERY_ALL_MEMBRE);
		 Double tmp;
		 for (Membre membre : listMembre) {
			CotisationLoyerDao loyerDao = new CotisationLoyerImpl();
			 
			tmp = loyerDao.getMontant(COTISATION_LOYER, membre.getEmail(), String.valueOf(annee));
			Double montantLoyer = 0.0 ;
			if(tmp != null)
				montantLoyer = tmp.doubleValue(); 
			
			CotisationEvenementDao evenementDao = new CotisationEvenementImpl();
			tmp = evenementDao.getMontant(COTISATION_KST, membre.getEmail(), String.valueOf(annee));
			Double montantEvenement = 0.0 ;
			if(tmp != null)
				montantEvenement = tmp.doubleValue(); 
			
			CotisationKSTDao kstDao = new CotisationKSTImpl();
			tmp = kstDao.getMontant(COTISATION_EVENEMENT, membre.getEmail(), String.valueOf(annee));
			Double montantKST = 0.0;
			if(tmp != null)
				montantKST = tmp.doubleValue(); 
			
			listImpot.add(new Impot(membre, (montantLoyer+montantEvenement+montantKST), annee, date));
		 }
		 executer(listImpot);
	 }
	 
	 private void getInfo(){
		 //TODO valider
		 String email = txtEmail.getText();
		 String mdp = txtMotDePasse.getText();
		 Integer annee = (Integer)cmbAnnee.getSelectionModel().getSelectedItem();
		 LocalDate local = datePickerDeliv.getValue();
		 Instant instant = Instant.from(local.atStartOfDay(ZoneId.systemDefault()));
		 Date date = Date.from(instant);
		 System.out.println(email+" "+mdp+" "+annee+" "+date);
		 user = new Utilisateur(email, mdp);
		 loadData(annee, date);
	 }
	 
	 private void executer(ArrayList<Impot> listImpot){
		 Double step = 0.0;
		 double i = 1;
		 for(Impot impot : listImpot){
			 envoyerEmail(impot);
			 step=i/listImpot.size();
			 progressBar.setProgress(step);
			 System.out.println("step = "+step);
			 System.out.println("listImpot.size() = "+listImpot.size());
			 System.out.println("i = "+i);
			 i++;
		 }
	 }
	 
	 private void envoyerEmail(Impot impotMembre){
		 Dahira dahira = new Dahira("Nourou Darayni", "no description", "1234567890", "5149999999", "", "", new Adresse("", "", "", "", ""));
		 
		 String nameFile = impotMembre.getMembre().getPrenom() +
				"_" + impotMembre.getMembre().getNom() + ".pdf";
		 //GenererPdf(String dateIpmot, String dateDelivrance,String montant)
		 String annee = String.valueOf(impotMembre.getAnnee());
		 String montant = String.valueOf(impotMembre.getMontantCotisation());
		 String date = new SimpleDateFormat("dd/MM/yyyy").format(impotMembre.getDateDeliv());
		 GenererPdf impot = new GenererPdf(annee, date,montant);
		 try {
			 impot.createPdf(nameFile,impotMembre.getMembre(),dahira,"",001);
		 } catch (DocumentException | IOException e) {
			 // TODO Auto-generated catch block
			 e.printStackTrace();
		 }
		
		 SendMessage mess = new SendMessage();
		 mess.setObjet("Impot");
		 mess.setMessage("Bonjour, Voici votre releve d'impot.");
		 mess.setEmailDestination(impotMembre.getMembre().getEmail());
		 mess.setPathFile(nameFile);
		 mess.sendMessage(user.getLogin(),user.getPass());
		} 

}
