package javafx.membre;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.GenererPdf;
import javafx.SendMessage;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import validation.Validateur;
import validation.ValidationErreur;
import validation.ValideurEmail;

import com.itextpdf.text.DocumentException;

import daoimpl.DahiraDaoImpl;
import entites.Dahira;
import entites.Membre;

public class EmailController implements Initializable{

		@FXML private Text connexionErr;
		
		@FXML private TextField emailConexionField;
		@FXML private TextField passWordField;
		
		@FXML private Button btnEnvoyer;
		@FXML private Button btnAnnuler;

		@FXML
		private AnchorPane anc;
		
		private Stage stage;
		private Membre membreActif;
		private Dahira dahira;
		private Boolean bool = false;
		
		private final String DAHIRA = "select c from Dahira c";
		
		public Stage getStage() {
			return stage;
		}

		public void setStage(Stage stage) {
			this.stage = stage;
		}
		
		public Membre setMembreEnvoyer() {
			return membreActif;
		}

		public void setMembreEnvoyer(Membre membreActif) {
			this.membreActif = membreActif;
		}

		public void setAnchorPane(AnchorPane anc) {
			this.anc = anc;
		}

		
		@Override
		public void initialize(URL location, ResourceBundle resources) {
			//set l anchorpane
			Validateur.setAnc(anc);
			
			//charger dahira
			chargerDahira();
			
			//Valider le mail
			ValideurEmail validerEmail = new ValideurEmail(emailConexionField,
					connexionErr, false, ValidationErreur.EMAIL_ERR,45);
			validerEmail.validerEmail(emailConexionField,connexionErr);
			//action sur bouton envoyer
			btnEnvoyer.setOnAction(new EventHandler<ActionEvent>() {
		 	    @Override public void handle(ActionEvent event) {
		 	    	bool = validerEmail.valider();
		 	    	envoieMess();
		 	    	}
		 	});
			//action sur bouton envoyer
			btnAnnuler.setOnAction(new EventHandler<ActionEvent>() {
		 	    @Override public void handle(ActionEvent event) {
		 	    	stage.close();
		 	    	}
		 	});
				   
		}
			
		public void envoieMess(){
			if(bool){
	 	    	String nameFile = membreActif.getPrenom() +
	 	    			"_" + membreActif.getNom() + ".pdf";
	 	    	//GenererPdf(String dateIpmot, String dateDelivrance,String montant)
	 	    	GenererPdf impot = new GenererPdf("2014", "10/12/2012",
	 					"2000$");
	 	    	try {
	 	   		impot.createPdf(nameFile,membreActif, dahira,"",001);
	 	    	} catch (DocumentException | IOException e) {
	 	   		// TODO Auto-generated catch block
	 	   		e.printStackTrace();
	 	    	}
	 	    	
	 	    	SendMessage mess = new SendMessage();
	 	    	mess.setObjet("Impôt");
	 	    	mess.setMessage("Bonjour, Voici votre relevé d'impôt.");
	 	    	mess.setEmailDestination("oussou.dieng@gmail.com");
	 	    	mess.setPathFile(nameFile);
	 	    	mess.sendMessage(emailConexionField.getText(),passWordField.getText());
	 	    	stage.close();
			}
		} 
		
		//charger les informations de la dahira
		public void chargerDahira(){
			DahiraDaoImpl dahiraDao = new DahiraDaoImpl();
				dahira = dahiraDao.get(DAHIRA);
		}
}
