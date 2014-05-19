package javafx.membre;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import validation.ValidationErreur;
import validation.ValideurEmail;

import com.itextpdf.text.DocumentException;

import entites.Membre;
import javafx.GenererPdf;
import javafx.SendMessage;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class EmailController implements Initializable{

		@FXML private Text connexionErr;
		
		@FXML private TextField emailConexionField;
		@FXML private TextField passWordField;
		@FXML private Button btnEnvoyer;
		
		private Stage stage;
		private Membre membreActif;
		
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

		@Override
		public void initialize(URL location, ResourceBundle resources) {
			// TODO Auto-generated method stub
			//Valider le mail
			ValideurEmail validerEmail = new ValideurEmail(emailConexionField,
					connexionErr, false, ValidationErreur.EMAIL_ERR);
			validerEmail.validerEmail(emailConexionField,connexionErr);
			//action sur bouton envoyer
			btnEnvoyer.setOnAction(new EventHandler<ActionEvent>() {
		 	    @Override public void handle(ActionEvent event) {
		 	    	if(validerEmail.valider()){
		 	    	String nameFile = membreActif.getPrenom() +
		 	    			"_" + membreActif.getNom() + ".pdf";
		 	    	GenererPdf impot = new GenererPdf();
		 	    	try {
		 	   		impot.createPdf(nameFile,membreActif,"",001);
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
		 	    } }
		 	});
		}
			
		
}
