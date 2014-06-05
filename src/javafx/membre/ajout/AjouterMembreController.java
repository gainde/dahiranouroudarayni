package javafx.membre.ajout;

import java.net.URL;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.ResourceBundle;

import javafx.beans.property.BooleanProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.membre.MembreController;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import validation.ManagerValidation;
import validation.Validateur;
import dao.MembreDao;
import daoimpl.MembreDaoImpl;
import entites.Adresse;
import entites.Membre;

public class AjouterMembreController implements Initializable {

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
	
	@FXML
	private TextField prenomField;
	@FXML
	private TextField nomField;
	@FXML
	private TextField emailField;
	@FXML
	private TextField telephoneField;
	// @FXML private TextField naissanceField;
	@FXML
	private TextField adresseField;
	@FXML
	private TextField postalField;
	@FXML
	private TextField villeField;

	@FXML
	private DatePicker dateNaissance;

	@FXML
	private ComboBox<String> cmbProvince;

	@FXML
	private Button btnAnnuler;
	@FXML
	private Button btnEnregistrer;

	@FXML
	private AnchorPane anc;
	
	private Stage stage;
	private Membre membre;
	private MembreController membreController;
	
	public void setAnchorPane(AnchorPane anc) {
		this.anc = anc;
	}


	String province = "Quebec";
	Date date = new Date();

	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	public MembreController getMembreController() {
		return membreController;
	}

	public void setMembreController(MembreController membreController) {
		this.membreController = membreController;
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		
		
		Validateur.setAnc(anc);
		// validation
		ManagerValidation.getInstance().validerChaine(prenomField,
				textErrPrenom, false, 30);
		ManagerValidation.getInstance().validerChaine(nomField, textErrNom,
				false, 30);
		ManagerValidation.getInstance().validerChaine(adresseField,
				textErrAdresse, true, 90);
		ManagerValidation.getInstance().validerChaine(villeField, textErrVille,
				true, 30);

		ManagerValidation.getInstance().validerEmail(emailField, textErrEmail,
				false, 30);

		ManagerValidation.getInstance().validerCodePostal(postalField,
				textErrCodepostal, true);
		
		ManagerValidation.getInstance().validerTelephone(telephoneField,
				textErrTelephone, true);
		
		
		// installEventHandler(telephoneField);
		// action sur le combo box
		handleComboBoxProvince();
		
		// action bouton annuler
				btnAnnuler.setOnAction(new EventHandler<ActionEvent>() {
					@Override
					public void handle(ActionEvent event) {
						// parentStage.show();
						stage.close();
					}
				});
				if(membreController != null)
					membreController.chargerMembres();
				// action bouton enregistrer
				btnEnregistrer.setOnAction(new EventHandler<ActionEvent>() {
					@Override
					public void handle(ActionEvent event) {
						Boolean valide = ManagerValidation.getInstance()
								.toutEstValide();
						if(valide){
							enregistrerMembre();
							ManagerValidation.getInstance().clearListOfValidation();
							stage.close();
						}else{
							textErrMessage.setText("Veuillez corriger les champs invalides!");
						}
						
					}
				});
				
	}//fin d'initialistion

	// ajouter les informations dans la base de donnée
	public void enregistrerMembre() {
		if (dateNaissance.getValue() != null) {
			LocalDate localDate = dateNaissance.getValue();
			Instant instant = Instant.from(localDate.atStartOfDay(ZoneId
					.systemDefault()));
			date = Date.from(instant);}
			membre = new Membre(nomField.getText().trim(), prenomField.getText().trim(),
					date, telephoneField.getText().trim(), emailField.getText().trim());
			Adresse adresse = new Adresse(adresseField.getText().trim(),
					villeField.getText().trim(), province, postalField.getText().trim(),
					"Canada");
			membre.setAdresse(adresse);
			System.out.println(membre.toString());
			enreisgitrerMembre(membre);
			membreController.getMembreDonnee().add(membre);
		
	}


	//ajouter membre dans la base de donnée
	public void enreisgitrerMembre(Membre member){
		MembreDao membreDao =  new MembreDaoImpl();
		membreDao.create(member);
	}

	// action sur le combox selection de province
	public void handleComboBoxProvince() {

		cmbProvince.valueProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				if (newValue != null) {
					province = newValue;
				}
			}
		});
	}

	
	public void installEventHandler(final Node keyNode) {
		// handler for enter key press / release events, other keys are
		// handled by the parent (keyboard) node handler
		final EventHandler<KeyEvent> keyEventHandler = new EventHandler<KeyEvent>() {
			public void handle(final KeyEvent keyEvent) {
				if (keyEvent.getCode() == KeyCode.DIGIT0) {
					// textErrTelephone.setText("telephone valide");
					// textErrTelephone.setVisible(true);
					keyEvent.consume();
				}// else
					// textErrTelephone.setVisible(false);
			}
		};

		keyNode.setOnKeyPressed(keyEventHandler);
		keyNode.setOnKeyReleased(keyEventHandler);
	}
}
