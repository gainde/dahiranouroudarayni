package javafx.membre.ajout;

import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.ResourceBundle;

import entites.Adresse;
import entites.CotisationLoyer;
import entites.Membre;
import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class AjouterMembreController implements Initializable{

	 @FXML private TextField prenomField;
	 @FXML private TextField nomField;
	 @FXML private TextField emailField;
	 @FXML private TextField telephoneField;
	 //@FXML private TextField naissanceField;
	 @FXML private TextField adresseField;
	 @FXML private TextField postalField;
	 @FXML private TextField villeField;
	 
	 @FXML private DatePicker dateNaissance;
	 
	 @FXML private ComboBox<String> cmbProvince;
	 
	 @FXML private Button btnAnnuler;
	 @FXML private Button btnEnregistrer;
	 
	 private Stage stage;
	 private Stage parentStage;
	 private Membre   membre;
	 
	String province = "Quebec";
	Date date = null;
	 
	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}
	public void setParentStage(Stage stage){
		this.parentStage = stage;
	}
	public Stage getParentStage(){
		return this.parentStage;
	}
	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		 btnAnnuler.setOnAction(new EventHandler<ActionEvent>() {
		 	    @Override public void handle(ActionEvent event) {
		 	    	System.out.println("Ok");
		 	    	parentStage.show();
		 	    	stage.close();
		 	    }
		 	});
		 
		 //action bouton enregistrer
		 btnEnregistrer.setOnAction(new EventHandler<ActionEvent>() {
		 	    @Override 
		 	    public void handle(ActionEvent event) {
		 	    	enregistrerMembre();
		 	    	parentStage.show();
		 	    	stage.close();
		 	    }
		 	});
		 handleComboBoxProvince();
	}
	
	//ajouter les informations dans la base de donnée
	public void enregistrerMembre(){
		if(dateNaissance.getValue() != null){
		LocalDate localDate = dateNaissance.getValue();
		Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
		date = Date.from(instant);
		System.out.println("date de naissance" + date.toString());
		System.out.println("Prenom" + prenomField.getText());
		System.out.println("Nom" + nomField.getText());
			membre = new Membre(prenomField.getText(),
					nomField.getText(),date,telephoneField.getText(),
					emailField.getText());
			Adresse adresse = new Adresse(adresseField.getText(),
					villeField.getText(),province,
					postalField.getText(),"Canada");
			membre.setAdresse(adresse);
			System.out.println(membre.toString());
			}
	}
	
	//action sur le combox selection de province
	public void handleComboBoxProvince(){
		
		cmbProvince.valueProperty().addListener(new ChangeListener<String>() {
		
			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				if(newValue != null ){
					province = newValue;
					System.out.println(province);
				}
			}
		});
    }
}
