package javafx.membre.edit;

import java.net.URL;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.ResourceBundle;

import javafx.animation.Timeline;
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
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import validation.ManagerValidation;
import validation.Validateur;
import validation.ValidateurChaine;
import validation.ValidationErreur;
import validation.ValidationCodePostale;
import validation.ValidationEmail;
import validation.ValidationTelephone;
import dao.MembreDao;
import daoimpl.MembreDaoImpl;
import entites.Adresse;
import entites.Membre;

public class EditerMembreController implements Initializable{
	
	@FXML private HBox hboxErr;
	@FXML private Button btnErr;
	@FXML private ImageView closeShape;
	
	@FXML
	private Text textErrPrenom;
	@FXML
	private Text textErrNom;
	@FXML
	private Text textErrAdresse;
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
	 
	 @FXML
	 private AnchorPane anc;
	 
	 private Stage stage;
	
	 private Membre   editMembre;
	 private MembreController membreController;
	 private Timeline timeline;
	 private ManagerValidation validateurManager = new ManagerValidation();
	 
		String province = "Quebec";
		Date date = new Date();
	
	public void setAnchorPane(AnchorPane anc) {
			this.anc = anc;
	}
	

	public void setMembreActif() {
		if( editMembre != null ){
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
		}

	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
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
		
		initialiserValidation();
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
				 	    	Boolean valide = validateurManager.valider();
				 	    	System.out.println("valide :"+valide);
							if(valide){
				 	    		enregistrerMembre();
					 	    	membreController.makeDataMembre(editMembre);
					 	    	validateurManager.clearListOfValidation();
					 	    	stage.close();
								
							}else{
								btnErr.setText("Veuillez corriger les champs invalides!");
								validateurManager.animate(hboxErr, timeline);
								hboxErr.setVisible(true);
								validateurManager.clearListOfValidation();
							}
				 	    	
				 	    }
				 	});
				 handleComboBoxProvince();
	}
	
	//ajouter les informations dans la base de donnée
		public void enregistrerMembre(){
			if(dateNaissance.getValue() != null){
			LocalDate localDate = dateNaissance.getValue();
			Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
			date = Date.from(instant);}
			editMembre.setNom(nomField.getText().trim());
			editMembre.setPrenom(prenomField.getText().trim());
			editMembre.setDateNaissance(date);
			editMembre.setTelephone(telephoneField.getText().trim());
			editMembre.setEmail(emailField.getText().trim());
				Adresse adresse = new Adresse(adresseField.getText().trim(),
						villeField.getText().trim(),province,
						postalField.getText().trim(),"Canada");
				editMembre.setAdresse(adresse);
				enreisgitrerMembre(editMembre);
				//TODO
				//getIndex est static pourquoi et la tu ne l'utilise pas comme tel
				membreController.getMembreDonnee().set(membreController.getIndex().get(), editMembre);
				
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
		
		private void initialiserValidation(){
			//set l anchorpane
			Validateur.setAnc(anc);
			hboxErr.setVisible(false);
			timeline = new Timeline();
			//ManagerValidation.getInstance().hideBoxErr(hboxErr,closeShape, timeline);
			validateurManager.hideBoxErr(hboxErr, closeShape, timeline);
			// validation
			validateurManager.add(new ValidateurChaine(prenomField,
							textErrPrenom, false, ValidationErreur.CHAINE_ERR, 30));
			
			validateurManager.add(new ValidateurChaine(nomField, textErrNom,
							false, ValidationErreur.CHAINE_ERR,30));
			
			validateurManager.add(new ValidateurChaine(adresseField,
							textErrAdresse, true, ValidationErreur.CHAINE_ERR,90));
			
			validateurManager.add(new ValidateurChaine(villeField, textErrVille,
							true, ValidationErreur.CHAINE_ERR,30));

			validateurManager.add(new ValidationEmail(emailField, textErrEmail,
							false, ValidationErreur.EMAIL_ERR,30));

			validateurManager.add(new ValidationCodePostale(postalField,
							textErrCodepostal, true,ValidationErreur.CODEPOSTALE_ERR));
					
			validateurManager.add(new ValidationTelephone(telephoneField,
							textErrTelephone, true, ValidationErreur.TELEPHONE_ERR));
		}
}
