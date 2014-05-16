package javafx.membre.edit;

import java.net.URL;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.ResourceBundle;

import dao.MembreDao;
import daoimpl.MembreDaoImpl;
import entites.Adresse;
import entites.Membre;
import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.membre.MembreController;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class EditerMembreController implements Initializable{
	
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
	 private Membre   editMembre;
	 private MembreController membreController;
		String province = "Quebec";
		Date date = null;
	
	

	public void setMembreActif() {
			this.prenomField.setText(editMembre.getPrenom());
			this.nomField.setText(editMembre.getNom());
			this.emailField.setText(editMembre.getEmail());
			this.telephoneField.setText(editMembre.getTelephone());
			this.adresseField.setText(editMembre.getAdresse().getRue());
			this.postalField.setText(editMembre.getAdresse().getCodepostale());
			this.villeField.setText(editMembre.getAdresse().getVille());
			
			Instant instant = Instant.ofEpochMilli(editMembre.getDateNaissance().getTime());
			LocalDate res = LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).toLocalDate();
			this.dateNaissance.setValue(res);
			
			this.cmbProvince.setValue(editMembre.getAdresse().getProvince());
		}

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
	
	public Membre getEditMembre() {
		return editMembre;
	}

	public void setEditMembre(Membre editMembre) {
		this.editMembre = editMembre;
		setMembreActif();
	}

	public MembreController getMembreController() {
		return membreController;
	}

	public void setMembreController(MembreController membreController) {
		this.membreController = membreController;
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		// action bouton annuler
				 btnAnnuler.setOnAction(new EventHandler<ActionEvent>() {
				 	    @Override public void handle(ActionEvent event) {
				 	    	parentStage.show();
				 	    	stage.close();
				 	    }
				 	});
				 
				 //action bouton enregistrer
				 btnEnregistrer.setOnAction(new EventHandler<ActionEvent>() {
				 	    @Override 
				 	    public void handle(ActionEvent event) {
				 	    	enregistrerMembre();
				 	    	membreController.makeDataMembre(editMembre);
				 	    	membreController.getMembreDonnee().add(editMembre);
				 	    	parentStage.show();
				 	    	
							//getMembreController().getIndex();
							//getMembreController().setMembreActif(editMembre);
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
			editMembre.setNom(nomField.getText());
			editMembre.setPrenom(prenomField.getText());
			editMembre.setDateNaissance(date);
			editMembre.setTelephone(telephoneField.getText());
			editMembre.setEmail(emailField.getText());
				Adresse adresse = new Adresse(adresseField.getText(),
						villeField.getText(),province,
						postalField.getText(),"Canada");
				editMembre.setAdresse(adresse);
				System.out.println(editMembre.toString());
				enreisgitrerMembre(editMembre);
				}
		}
		//ajouter membre dans la base de donnée
		public void enreisgitrerMembre(Membre member){
			MembreDao membreDao =  new MembreDaoImpl();
			membreDao.update(member);
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
