package javafx.dahira;

import java.net.URL;
import java.util.ResourceBundle;

import validation.Validateur;
import javafx.animation.Timeline;
import javafx.beans.binding.BooleanBinding;
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
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Background;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import validation.ManagerValidation;
import validation.ValidateurChaine;
import validation.ValidationErreur;
import validation.ValideurCodePostale;
import validation.ValideurEmail;
import validation.ValideurTelephone;
import dao.DahiraDao;
import daoimpl.DahiraDaoImpl;
import entites.Adresse;
import entites.Dahira;
import entites.ManagerEntiteDahira;

public class DahiraController implements Initializable {


	@FXML private HBox hboxErr;
	@FXML private Button btnErr;
	@FXML private ImageView closeShape;
	
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

	@FXML
	private TextArea descriptionArea;
	@FXML
	private Label textTitre;

	@FXML
	private TextField nomField;
	@FXML
	private TextField numeroNEField;
	@FXML
	private TextField emailField;
	@FXML
	private TextField telephoneField;
	@FXML
	private TextField siteWebField;
	@FXML
	private TextField adresseField;
	@FXML
	private TextField postalField;
	@FXML
	private TextField villeField;

	@FXML
	private ComboBox<String> cmbProvince;

	@FXML
	private Button btnAnnuler;
	@FXML
	private Button btnEnregistrer;
	@FXML
	private Button btnEditer;

	@FXML
	private AnchorPane anc;

	private Stage stage;

	private Dahira editDahira;
	private MembreController membreController;
	private Timeline timeline;

	String province = "Quebec";

	public void setAnchorPane(AnchorPane anc) {
		this.anc = anc;
	}

	public void setDahiraActif() {
		if (editDahira != null) {
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
		btnEnregistrer.disableProperty()
				.bind(btnEditer.disableProperty().not());
		setDisableAllFieldText(true);
		// set l anchorpane
		Validateur.setAnc(anc);
		hboxErr.setVisible(false);
		timeline = new Timeline();
		ManagerValidation.getInstance().hideBoxErr(hboxErr,closeShape, timeline);
		// validation
		ManagerValidation.getInstance().validerChaine(nomField, textErrNom,
				false, 30);
		ManagerValidation.getInstance().validerChaine(numeroNEField,
				textErrNumero, false, 30);
		ManagerValidation.getInstance().validerChaine(adresseField,
				textErrAdresse, false, 90);
		ManagerValidation.getInstance().validerChaine(siteWebField,
				textErrSiteWeb, true, 30);
		ManagerValidation.getInstance().validerChaine(descriptionArea,
				textErrDescription, true, 90);
		setNodeStopWriten(descriptionArea,90);
		
		ManagerValidation.getInstance().validerChaine(villeField, textErrVille,
				true, 30);

		ManagerValidation.getInstance().validerEmail(emailField, textErrEmail,
				false, 30);

		ManagerValidation.getInstance().validerCodePostal(postalField,
				textErrCodepostal, true);
		ManagerValidation.getInstance().validerTelephone(telephoneField,
				textErrTelephone, true);

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
				Boolean valide = ManagerValidation.getInstance()
						.toutEstValide();
				if (valide) {
					System.out.println("Tout est valide :" + valide);
					enregistrerDahira();
					stage.close();

				} else {
					btnErr.setText("Veuillez corriger les champs invalides!");
					ManagerValidation.getInstance().animate(hboxErr, timeline);
					hboxErr.setVisible(true);
				}

			}
		});
		btnEditer.setOnAction(new EventHandler<ActionEvent>() {

			@Override
			public void handle(ActionEvent event) {
				btnEditer.setDisable(true);
				setDisableAllFieldText(false);

			}
		});
		handleComboBoxProvince();
	}

	// ajouter les informations dans la base de donnée
	public void enregistrerDahira() {
		Boolean nullDahira = false;
		if (editDahira == null){
			 nullDahira = true;
			editDahira = new Dahira();
		}
		editDahira.setNomDahira(nomField.getText().trim());
		editDahira.setNumeroEnregistrement(numeroNEField.getText().trim());
		editDahira.setDescription(descriptionArea.getText().trim());
		editDahira.setSiteWeb(siteWebField.getText().trim());
		editDahira.setTelephone(telephoneField.getText().trim());
		editDahira.setEmail(emailField.getText().trim());
		Adresse adresse = new Adresse(adresseField.getText().trim(), villeField
				.getText().trim(), province, postalField.getText().trim(),
				"Canada");
		editDahira.setAdresse(adresse);
		if(nullDahira)
			ManagerEntiteDahira.getInstance().createDahira(editDahira);
		else
			ManagerEntiteDahira.getInstance().updateDahira(editDahira);
	}

	// action sur le combox selection de province
	public void handleComboBoxProvince() {
		cmbProvince.valueProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				if (newValue != null) {
					province = newValue;
					System.out.println(province);
				}
			}
		});
	}

	// set disable the field text
	public void setDisableAllFieldText(Boolean disable) {
		nomField.setDisable(disable);
		numeroNEField.setDisable(disable);
		adresseField.setDisable(disable);
		siteWebField.setDisable(disable);
		descriptionArea.setDisable(disable);
		villeField.setDisable(disable);
		postalField.setDisable(disable);
		emailField.setDisable(disable);
		telephoneField.setDisable(disable);
		cmbProvince.setDisable(disable);

	}
	
	//stop to write 
	public void setNodeStopWriten(TextArea node,int caractereMax){
		node.addEventHandler(KeyEvent.KEY_TYPED, new EventHandler<KeyEvent>() {
			public void handle(final KeyEvent keyEvent) {
				if (node.getText().length() >= caractereMax) {
					keyEvent.consume();
				}
			}
		});
	}
}
