package javafx.membre.ajout;

import java.net.URL;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import validation.ValidateurChaine;
import validation.ValidationErreur;
import validation.ValideurCodePostale;
import validation.ValideurEmail;
import validation.ValideurTelephone;
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

	private Stage stage;
	private Membre membre;
	private MembreController membreController;

	String province = "Quebec";
	Date date = null;

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
		
		// Valider le champ prenom 
		ValidateurChaine validerPrenom = new ValidateurChaine(prenomField,
				textErrPrenom, false, ValidationErreur.CHAINE_ERR,10);
		validerPrenom.validerChaine(prenomField, textErrPrenom);
		
		// Valider le champ nom 
		ValidateurChaine validerNom = new ValidateurChaine(nomField,
				textErrNom, false, ValidationErreur.CHAINE_ERR,10);
		validerNom.validerChaine(nomField, textErrNom);
				
		// Valider le champ adresse 
		ValidateurChaine validerAdresse = new ValidateurChaine(adresseField,
						textErrAdresse, true, ValidationErreur.CHAINE_ERR,10);
		validerAdresse.validerChaine(adresseField, textErrAdresse);
		
		// Valider le champ ville 
				ValidateurChaine validerVille = new ValidateurChaine(villeField,
								textErrVille, true, ValidationErreur.CHAINE_ERR,10);
				validerVille.validerChaine(villeField, textErrVille);
		
		//Valider le mail
		ValideurEmail validerEmail = new ValideurEmail(emailField,
				textErrEmail, false, ValidationErreur.EMAIL_ERR);
		validerEmail.validerEmail(emailField,textErrEmail);
	
		//Valider le mail
		ValideurCodePostale validerCodePostal = new ValideurCodePostale(postalField,
				textErrCodepostal, true, ValidationErreur.CODEPOSTALE_ERR);
		validerCodePostal.validerCodePostal(postalField,textErrCodepostal);
		
		//Valider le telephone
		ValideurTelephone validerTelephone = new ValideurTelephone(telephoneField,
						textErrTelephone, true, ValidationErreur.CODEPOSTALE_ERR);
		validerTelephone.validerTelephone(telephoneField,textErrTelephone);
		
		
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

				// action bouton enregistrer
				btnEnregistrer.setOnAction(new EventHandler<ActionEvent>() {
					@Override
					public void handle(ActionEvent event) {
						if(validerTelephone.valider() && validerCodePostal.valider()
								&& validerEmail.valider()  &&  validerVille.valider()
										 &&  validerAdresse.valider() && validerNom.valider()
												&&  validerPrenom.valider()){
							enregistrerMembre();
							// parentStage.show();
							stage.close();
							
						}else{
							textErrMessage.setText("Veuillez corriger les champs invalides!");
						}
						
					}
				});
	}

	// ajouter les informations dans la base de donnée
	public void enregistrerMembre() {
		if (dateNaissance.getValue() != null) {
			LocalDate localDate = dateNaissance.getValue();
			Instant instant = Instant.from(localDate.atStartOfDay(ZoneId
					.systemDefault()));
			date = Date.from(instant);
			membre = new Membre(nomField.getText(), prenomField.getText(),
					date, telephoneField.getText(), emailField.getText());
			Adresse adresse = new Adresse(adresseField.getText(),
					villeField.getText(), province, postalField.getText(),
					"Canada");
			membre.setAdresse(adresse);
			System.out.println(membre.toString());
			enreisgitrerMembre(membre);
			membreController.getTableViewMembre().getItems().add(membre);
		}
	}

	// ajouter membre dans la base de donnée
	public void enreisgitrerMembre(Membre member) {
		MembreDao membreDao = new MembreDaoImpl();
		membreDao.demarerTransaction();
		membreDao.create(member);
		membreDao.commitTransaction();
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

	/*// validation champ
	public void validerChaine(TextField textField, Text labelErr, Boolean nullable) {
		labelErr.setVisible(false);
		textField.focusedProperty().addListener(new ChangeListener<Boolean>() {
			@Override
			public void changed(ObservableValue<? extends Boolean> observable,
					Boolean oldValue, Boolean newValue) {
				boolean err = false;//pour fixer le texte erreur tant que c est pas corrigé
				if (!newValue) {
					ValidateurChaine valider = new ValidateurChaine(textField,
							labelErr, nullable, ValidationErreur.CHAINE_ERR, 10);
					if (!valider.valider()) {
						err = true;
						valider.getLabelErr().setVisible(true);
					} else {
						valider.getLabelErr().setVisible(false);
						textField.setEditable(true);
						err = false;
					}
				} else {
					textField.getStyleClass().remove("error");
					if (!oldValue && err)
						labelErr.setVisible(true);
					else
						labelErr.setVisible(false);
				}
			}
		});
	}*/

	/*// validation champ
	public void validerTelephone() {
		textErrTelephone.setVisible(false);
		telephoneField.focusedProperty().addListener(
				new ChangeListener<Boolean>() {
					@Override
					public void changed(
							ObservableValue<? extends Boolean> observable,
							Boolean oldValue, Boolean newValue) {
						boolean err = false;//pour fixer le texte erreur tant que c est pas corrigé
						if (!newValue) {
							ValideurTelephone valider = new ValideurTelephone(
									telephoneField, textErrTelephone, false,
									ValidationErreur.TELEPHONE_ERR);
							if (!valider.valider()) {
								err = true;
								valider.getLabelErr().setVisible(true);
							} else {
								valider.getLabelErr().setVisible(false);
								err = false;
							}
						} else {
							telephoneField.getStyleClass().remove("error");
							if (!oldValue && err)
								textErrTelephone.setVisible(true);
							else
								textErrTelephone.setVisible(false);
						}

					}
				});
	}
*/
	// validation champ email
	/*public void validerEmail() {
		textErrEmail.setVisible(false);
		emailField.focusedProperty().addListener(new ChangeListener<Boolean>() {
			@Override
			public void changed(ObservableValue<? extends Boolean> observable,
					Boolean oldValue, Boolean newValue) {
				boolean err = false;//pour fixer le texte erreur tant que c est pas corrigé
				if (!newValue) {
					ValideurEmail valider = new ValideurEmail(emailField,
							textErrEmail, false, ValidationErreur.EMAIL_ERR);
					if (!valider.valider()) {
						err = true;
						valider.getLabelErr().setVisible(true);
					} else {
						err = false;
						valider.getLabelErr().setVisible(false);
					}
				}else{
					emailField.getStyleClass().remove("error");
					if (!oldValue && err) {
						textErrEmail.setVisible(true);
					} else {
						textErrEmail.setVisible(false);
					}
				}
			}
		});
	}*/

	/*// validation champ
	public void validerCodePostal() {

		textErrCodepostal.setVisible(false);
		postalField.focusedProperty().addListener(
				new ChangeListener<Boolean>() {
					@Override
					public void changed(
							ObservableValue<? extends Boolean> observable,
							Boolean oldValue, Boolean newValue) {
						boolean err = false;//pour fixer le texte erreur tant que c est pas corrigé
						if (!newValue) {
							ValideurEmail valider = new ValideurEmail(
									postalField, textErrCodepostal, true,
									ValidationErreur.CODEPOSTALE_ERR);
							if (!valider.valider()) {
								err = true;
								valider.getLabelErr().setVisible(true);
							} else {
								valider.getLabelErr().setVisible(false);
								err = false;
							}
						} else {
							emailField.getStyleClass().remove("error");
							if (!oldValue && err)
								textErrEmail.setVisible(true);
							else
								textErrEmail.setVisible(false);
						}
					}
				});
	}*/

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
