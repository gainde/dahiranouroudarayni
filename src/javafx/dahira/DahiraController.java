package javafx.dahira;

	import java.net.URL;
import java.util.ResourceBundle;

import validation.Validateur;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.membre.MembreController;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import validation.ValidateurChaine;
import validation.ValidationErreur;
import validation.ValideurCodePostale;
import validation.ValideurEmail;
import validation.ValideurTelephone;
import dao.DahiraDao;
import daoimpl.DahiraDaoImpl;
import entites.Adresse;
import entites.Dahira;

public class DahiraController  implements Initializable{
		
		@FXML
		private Text textErrNom;
		@FXML
		private Text textErrNumero;
		@FXML
		private Text textErrAdresse;
		@FXML
		private Text textErrSiteWeb;
		@FXML
		private Text textErrTelephone;
		@FXML
		private Text textErrEmail;
		@FXML
		private Text textErrCodepostal;
		@FXML
		private Text textErrVille;
		@FXML
		private Text textErrMessage;
		@FXML
		private Text textErrDescription;
		
		@FXML private TextArea descriptionArea;
		@FXML private Label textTitre;
		
		@FXML private TextField nomField;
		@FXML private TextField numeroNEField;
		@FXML private TextField emailField;
		@FXML private TextField telephoneField;
		@FXML private TextField siteWebField;
		@FXML private TextField adresseField;
		@FXML private TextField postalField;
		@FXML private TextField villeField;
		 
		 
		 @FXML private ComboBox<String> cmbProvince;
		 
		 @FXML private Button btnAnnuler;
		 @FXML private Button btnEnregistrer;
		 @FXML private Button btnEditer;
		 
		 @FXML
		 private AnchorPane anc;
		 
		 private Stage stage;
		
		 private Dahira   editDahira;
		 private MembreController membreController;
		 
		 String province = "Quebec";
		
		 public void setAnchorPane(AnchorPane anc) {
				this.anc = anc;
		}
		
		public void setDahiraActif() {
			if(editDahira != null){
				textTitre.setText(editDahira.getNomDahira());
				this.nomField.setText(editDahira.getNomDahira());
				this.numeroNEField.setText(editDahira.getNumeroEnregistrement());
				this.emailField.setText(editDahira.getEmail());
				this.descriptionArea.setText(editDahira.getDescription());
				this.siteWebField.setText(editDahira.getSiteWeb());
				this.telephoneField.setText(editDahira.getTelephone());
				this.adresseField.setText(editDahira.getAdresse().getRue());
				this.postalField.setText(editDahira.getAdresse().getCodepostale());
				this.villeField.setText(editDahira.getAdresse().getVille());
				
				this.cmbProvince.setValue(editDahira.getAdresse().getProvince());
			}
			}

		public Stage getStage() {
			return stage;
		}

		public void setStage(Stage stage) {
			this.stage = stage;
		}
		
		
		public Dahira getEditDahira() {
			return editDahira;
		}

		public void setEditDahira(Dahira editDahira) {
			this.editDahira = editDahira;
			setDahiraActif();
		}

		public MembreController getMembreController() {
			return membreController;
		}

		public void setMembreController(MembreController membreController) {
			this.membreController = membreController;
		}

		@Override
		public void initialize(URL location, ResourceBundle resources) {
			btnEnregistrer.disableProperty().bind(btnEditer.disableProperty().not());
			//set l anchorpane
			Validateur.setAnc(anc);
			
			// Valider le champ prenom 
					ValidateurChaine validerPrenom = new ValidateurChaine(nomField,
							textErrNom, false, ValidationErreur.CHAINE_ERR,45);
					validerPrenom.validerChaine(nomField, textErrNom);
					
					// Valider le champ nom 
					ValidateurChaine validerNom = new ValidateurChaine(numeroNEField,
							textErrNumero, false, ValidationErreur.CHAINE_ERR,45);
					validerNom.validerChaine(numeroNEField, textErrNumero);
							
					// Valider le champ adresse 
					ValidateurChaine validerAdresse = new ValidateurChaine(adresseField,
									textErrAdresse, true, ValidationErreur.CHAINE_ERR,100);
					validerAdresse.validerChaine(adresseField, textErrAdresse);
					
					// Valider le champ site web 
					ValidateurChaine validerSiteWeb = new ValidateurChaine(siteWebField,
									textErrSiteWeb, true, ValidationErreur.CHAINE_ERR,45);
					validerSiteWeb.validerChaine(siteWebField, textErrSiteWeb);
					
					// Valider le champ description 
					ValidateurChaine validerDescription = new ValidateurChaine(descriptionArea,
									textErrDescription, true, ValidationErreur.CHAINE_ERR,100);
					validerDescription.validerChaine(descriptionArea, textErrDescription);
					
					// Valider le champ ville 
							ValidateurChaine validerVille = new ValidateurChaine(villeField,
											textErrVille, true, ValidationErreur.CHAINE_ERR,45);
							validerVille.validerChaine(villeField, textErrVille);
					
					//Valider le mail
					ValideurEmail validerEmail = new ValideurEmail(emailField,
							textErrEmail, false, ValidationErreur.EMAIL_ERR,45);
					validerEmail.validerEmail(emailField,textErrEmail);
				
					//Valider le mail
					ValideurCodePostale validerCodePostal = new ValideurCodePostale(postalField,
							textErrCodepostal, true, ValidationErreur.CODEPOSTALE_ERR);
					validerCodePostal.validerCodePostal(postalField,textErrCodepostal);
					
					//Valider le telephone
					ValideurTelephone validerTelephone = new ValideurTelephone(telephoneField,
									textErrTelephone, true, ValidationErreur.CODEPOSTALE_ERR);
					validerTelephone.validerTelephone(telephoneField,textErrTelephone);
					
			
			
			// action bouton annuler
					 btnAnnuler.setOnAction(new EventHandler<ActionEvent>() {
					 	    @Override public void handle(ActionEvent event) {
					 	    	//parentStage.show();
					 	    	stage.close();
					 	    }
					 	});
					 
					 //action bouton enregistrer
					 btnEnregistrer.setOnAction(new EventHandler<ActionEvent>() {
					 	    @Override 
					 	    public void handle(ActionEvent event) {
					 	    	if(validerTelephone.valider() && validerCodePostal.valider()
										&& validerEmail.valider()  &&  validerVille.valider()
												 &&  validerAdresse.valider() && validerNom.valider()
														&&  validerPrenom.valider()){
								
					 	    		enregistrerDahira();
						 	    	stage.close();
									
								}else{
									textErrMessage.setText("Veuillez corriger les champs invalides!");
								}
					 	    	
					 	    }
					 	});
					 btnEditer.setOnAction(new EventHandler<ActionEvent>() {
						
						@Override
						public void handle(ActionEvent event) {
							btnEditer.setDisable(true);
							
						}
					});
					 handleComboBoxProvince();
		}
		
		//ajouter les informations dans la base de donnée
			public void enregistrerDahira(){
				editDahira.setNomDahira(nomField.getText().trim());
				editDahira.setNumeroEnregistrement(numeroNEField.getText().trim());
				editDahira.setDescription(descriptionArea.getText().trim());
				editDahira.setSiteWeb(siteWebField.getText().trim());
				editDahira.setTelephone(telephoneField.getText().trim());
				editDahira.setEmail(emailField.getText().trim());
					Adresse adresse = new Adresse(adresseField.getText().trim(),
							villeField.getText().trim(),province,
							postalField.getText().trim(),"Canada");
					editDahira.setAdresse(adresse);
					enreisgitrerDahira(editDahira);
			}
			
			//ajouter membre dans la base de donnée
			public void enreisgitrerDahira(Dahira dahira){
				DahiraDao dahiraDao =  new DahiraDaoImpl();
				dahiraDao.update(dahira);
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
