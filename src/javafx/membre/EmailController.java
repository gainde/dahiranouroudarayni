package javafx.membre;

import java.net.URL;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.impot.ManagerImpot;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import validation.ManagerValidation;
import validation.Validateur;
import validation.ValidationErreur;
import validation.ValidationEmail;


import entites.Membre;
import entites.Utilisateur;

public class EmailController implements Initializable {

	@FXML
	private HBox hboxErr;
	@FXML
	private Button btnErr;
	@FXML
	private ImageView closeShape;


	@FXML
	private Text connexionErr;


	@FXML
	private TextField emailConexionField;
	@FXML
	private TextField passWordField;
	@FXML
	private TextField passWordField2;
	@FXML
	private TextField textObjet;
	@FXML
	private TextArea textMsg;
	@FXML
	private ComboBox<Integer> cmbAnnee;
	@FXML
	private DatePicker datePickerDeliv;
	
	@FXML
	private Button btnEnvoyer;
	@FXML
	private Button btnAnnuler;

	@FXML
	private AnchorPane anc;

	private Stage stage;
	private Membre membreActif;
	private Boolean bool = false;

	private List<Membre> listMembre = new ArrayList<Membre>();
	
	private ManagerValidation validateurManager = new ManagerValidation();
	private ManagerImpot impotManager = new ManagerImpot();
	
	private Utilisateur user = new Utilisateur();
	
	private Timeline timeline;
	//c crucial il faut trouver une meilleur solution
	Label lbDossier = new Label("/Users/ousmanedieng/Desktop");
	
	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	public Membre getMembreEnvoyer() {
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
		// set l anchorpane
		Validateur.setAnc(anc);
		// iniialiser à la date d aujourd hui
		datePickerDeliv.setValue(LocalDate.now());
		impotManager.setLbDossier(lbDossier);
		hboxErr.setVisible(false);
		timeline = new Timeline();
		validateurManager.hideBoxErr(hboxErr,closeShape, timeline);
		
		impotManager.setNodeStopWriten(textMsg, textMsg.getText(), 100);
		impotManager.setNodeStopWriten(textObjet, textObjet.getText(), 30);
		impotManager.setNodeStopWriten(passWordField, passWordField.getText(), 30);
		impotManager.setNodeStopWriten(passWordField2, passWordField2.getText(), 30);
		// Valider le mail
		validateurManager.add(new ValidationEmail(emailConexionField,
				connexionErr, false, ValidationErreur.EMAIL_ERR, 45));
		
		impotManager.fillComboBox(cmbAnnee);
		// action sur bouton envoyer
		btnEnvoyer.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				bool = validateurManager.valider();
				Boolean valideMotDePasse = impotManager.validerMotDePasse(passWordField.getText(),passWordField2.getText());
				System.out.println("click");
				if (bool && valideMotDePasse) {
					btnErr.setText("Veuillez attendre envoie en cours!");
					btnEnvoyer.setDisable(true);
					btnAnnuler.setDisable(true);
					
					setInfo();
					getInfo();
					impotManager.envoyerEmail(impotManager.getListImpot().get(0),000);
					impotManager.deletePdf();
					validateurManager.clearListOfValidation();
					
					stage.close();
				} else if(valideMotDePasse) {
					btnErr.setText("Veuillez corriger les champs invalides!");
				} else if(bool) {
					btnErr.setText("Mot de passe invalide!");
				}else{
					btnErr.setText("Veuillez corriger les champs invalides!");
				}
				validateurManager.animate(hboxErr, timeline);
				hboxErr.setVisible(true);
			}
			
		});
		// action sur bouton envoyer
		btnAnnuler.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				stage.close();
			}
		});

	}
	private void loadAllMember(){
		
		listMembre.add(membreActif);
	}
	
	
	private void getInfo() {
		// TODO valider
		String email = emailConexionField.getText();
		String mdp = passWordField.getText();
		Integer annee = (Integer) cmbAnnee.getSelectionModel()
				.getSelectedItem();
		LocalDate local = datePickerDeliv.getValue();
		Instant instant = Instant.from(local.atStartOfDay(ZoneId
				.systemDefault()));
		Date date = Date.from(instant);
		System.out.println(email + " " + mdp + " " + annee + " " + date);
		Utilisateur user = new Utilisateur(email, mdp);
		impotManager.setUser(user);
		loadAllMember();
		impotManager.setListMembre(listMembre);
		impotManager.loadData(annee, date);
	}
	
	public void setInfo(){
		impotManager.setTxtAMsg(textMsg);
		impotManager.setTxtObjet(textObjet);
		user.setLogin(emailConexionField.getText());
		user.setPass(passWordField.getText());
		impotManager.setUser(user);
	}
	
}
