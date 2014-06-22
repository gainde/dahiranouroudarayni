package javafx.impot;

import java.io.File;
import java.net.URL;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import javafx.animation.Timeline;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.concurrent.Task;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.loadview.LoadManagerView;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Control;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.Tooltip;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.stage.DirectoryChooser;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import validation.ManagerValidation;
import validation.Validateur;
import validation.ValidationErreur;
import validation.ValidationEmail;
import dao.CotisationEvenementDao;
import dao.CotisationKSTDao;
import dao.CotisationLoyerDao;
import dao.MembreDao;
import daoimpl.CotisationEvenementImpl;
import daoimpl.CotisationKSTImpl;
import daoimpl.CotisationLoyerImpl;
import daoimpl.MembreDaoImpl;
import entites.Impot;
import entites.Membre;
import entites.Utilisateur;

public class ImpotController implements Initializable {

	@FXML private HBox hboxErr;
	@FXML private Button btnErr;
	@FXML private ImageView closeShape;
	
	@FXML
	private Text textErr;
	@FXML
	private Text textErrEmail;
	
	@FXML
	private TextField txtEmail;
	
	@FXML
	private PasswordField txtMotDePasse;
	@FXML
	private PasswordField txtMotDePasseC;
	
	@FXML
	private Label lbDossier;
	@FXML
	private Label lbMembres;
	@FXML
	private Text lbMembre;
	
	@FXML
	private ProgressBar progressBar;
	
	@FXML
	private Button btnExecuter;
	@FXML
	private Button btnChoisir;
	@FXML
	private Button btnHome;
	@FXML
	private Button btnAide;
	
	@FXML
	private Button btnQuitter;
	
	@FXML
	private ComboBox<Integer> cmbAnnee;
	@FXML
	private DatePicker datePickerDeliv;
	@FXML
	private TextField txtObjet;
	@FXML
	private TextArea txtAMsg;

	@FXML
	private AnchorPane anc;
	
	private int nbChilds;
	private Timeline timeline;
	
	public void setAnchorPane(AnchorPane anc) {
		this.anc = anc;
	}

	private Stage stage;
	private Stage parentStage;
	
	private List<Membre> listMembre;
	
	private final String QUERY_ALL_MEMBRE = "select m from Membre m";
	private final String COTISATION_LOYER = "select sum(l.montant) from cotisationmembre l where l.idMembre=?1 and YEAR(l.datecotisation) = ?2";
	private final String COTISATION_KST = "select sum(k.montant) from cotisationkst k where k.idMembre=?1 and YEAR(K.datecotisation) = ?2";
	private final String COTISATION_EVENEMENT = "select sum(e.montant) from cotisationevenement e where e.idMembre=?1 and YEAR(e.datecotisation) = ?2";

	
	private ManagerValidation validateurManager = new ManagerValidation();
	private ManagerImpot impotManager = new ManagerImpot();
	
	public void setParentStage(Stage parentStage) {
		this.parentStage = parentStage;
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		nbChilds = anc.getChildren().size();
		hboxErr.setVisible(false);
		timeline = new Timeline();
		validateurManager.hideBoxErr(hboxErr,closeShape, timeline);
		// iniialiser à la date d aujourd hui
		datePickerDeliv.setValue(LocalDate.now());
		// set anchorPane
		Validateur.setAnc(anc);
		
		toolTipButton(btnHome, "Home");
		toolTipButton(btnAide, "Aide");
		//validation
		impotManager.setNodeStopWriten(txtAMsg, txtAMsg.getText(), 100);
		impotManager.setNodeStopWriten(txtObjet, txtObjet.getText(), 30);
		impotManager.setNodeStopWriten(txtMotDePasse, txtMotDePasse.getText(), 30);
		impotManager.setNodeStopWriten(txtMotDePasseC, txtMotDePasseC.getText(), 30);
		
		btnExecuter.disableProperty().bind(lbDossier.textProperty().isEmpty());
		// validation email
		validateurManager.add(new ValidationEmail(txtEmail, textErrEmail,
				false, ValidationErreur.EMAIL_ERR,30));

		handleButtonChoisir();
		impotManager.fillComboBox(cmbAnnee);
		
		handleButtonHome();
		HandleButtonAide();
		// TODO delete Test
		Double v = new Double(0.0);
		CotisationLoyerDao loyerDao = new CotisationLoyerImpl();
		v = loyerDao.getMontant(COTISATION_LOYER, "address@gmail.com", "2013");

		CotisationEvenementDao evenementDao = new CotisationEvenementImpl();
		v = evenementDao
				.getMontant(COTISATION_KST, "address@gmail.com", "2013");

		CotisationKSTDao kstDao = new CotisationKSTImpl();
		v = kstDao
				.getMontant(COTISATION_EVENEMENT, "address@gmail.com", "2013");
	
    	handleButtonExecuter();
    	handleButtonQuitter();
	}
	
	public void setStage(Stage stage) {
		this.stage = stage;
		stage.setOnCloseRequest(new EventHandler<WindowEvent>() {
			
			@Override
			public void handle(WindowEvent event) {
				parentStage.show();
			}
		});
	}

	private void handleButtonChoisir() {
		btnChoisir.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click");
				choisirDossier();
			}
		});
	}
	//action sur le bouton Aide
    private void HandleButtonAide() {
		btnAide.getStyleClass().add("buttonMenu");
		btnAide.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Aide");
				LoadManagerView.getBrowserAide();
			}
		});
	}
	
	private void handleButtonHome() {
		// add style
		btnHome.getStyleClass().add("buttonMenu");
		btnHome.setOnAction(new EventHandler<ActionEvent>() {

			@Override
			public void handle(ActionEvent event) {
				parentStage.show();
				stage.close();
			}
		});
	}

	private void handleButtonExecuter() {
		btnExecuter.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				Boolean valideMotDePasse = impotManager.validerMotDePasse(txtMotDePasse.getText(),txtMotDePasseC.getText());
				Boolean valide = validateurManager.valider();
				System.out.println("click");
				if (valide && valideMotDePasse) {
					getInfo();
					validateurManager.clearListOfValidation();
					validateurManager.updateAnchorePane(nbChilds, anc);
					btnErr.setText("Veuillez attendre envoie en cours!");
				} else if(valideMotDePasse) {
					btnErr.setText("Veuillez corriger les champs invalides!");
				} else if(valide) {
					btnErr.setText("Mot de passe invalide!");
				}else{
					btnErr.setText("Veuillez corriger les champs invalides!");
				}
				validateurManager.animate(hboxErr, timeline);
				hboxErr.setVisible(true);
			}
		});
	}

	private void choisirDossier() {
		DirectoryChooser chooser = new DirectoryChooser();
		chooser.setTitle("JavaFX Projects");
		File selectedDirectory = chooser.showDialog(stage);
		// lbDossier.setText("");
		if (selectedDirectory != null) {
			lbDossier.setText(selectedDirectory.getPath());
		}
		impotManager.setLbDossier(lbDossier);
	}
	
	public void setInfo(){
		impotManager.setTxtAMsg(txtAMsg);
		impotManager.setTxtObjet(txtObjet);
	}
	
	private void loadAllMember(){
		MembreDao membreDao = new MembreDaoImpl();
		listMembre = membreDao.getAll(QUERY_ALL_MEMBRE);
	}
	
	private void getInfo() {
		// TODO valider
		String email = txtEmail.getText();
		String mdp = txtMotDePasse.getText();
		Integer annee = (Integer) cmbAnnee.getSelectionModel()
				.getSelectedItem();
		LocalDate local = datePickerDeliv.getValue();
		Instant instant = Instant.from(local.atStartOfDay(ZoneId
				.systemDefault()));
		Date date = Date.from(instant);
		System.out.println(email + " " + mdp + " " + annee + " " + date);
		Utilisateur user = new Utilisateur(email, mdp);
		setInfo();
		impotManager.setUser(user);
		loadAllMember();
		impotManager.setListMembre(listMembre);
		impotManager.loadData(annee, date);
		executer(impotManager.getListImpot());
	}

	private void executer(ArrayList<Impot> listImpot) {

		progressBar();
		
		/* double step = 0.0; double i = 1; int numero = 1;for(Impot impot : listImpot){
		 envoyerEmail(impot,numero); step=i/listImpot.size();
		 progressBar.setProgress(numero); System.out.println("step = "+step);
		 System.out.println("listImpot.size() = "+listImpot.size());
		 System.out.println("i = "+i); i++; numero++;}*/
		 
	}

	public void progressBar() {
		progressBar.setProgress(0);
		Task<?> copyWorker = createWorker();
		progressBar.progressProperty().unbind();
		progressBar.progressProperty().bind(copyWorker.progressProperty());
		lbMembres.textProperty().bind(copyWorker.messageProperty());

		copyWorker.messageProperty().addListener(new ChangeListener<String>() {
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				System.out.println(newValue);
			}
		});
		new Thread(copyWorker).start();
	}

	public Task<?> createWorker() {
		return new Task<Object>() {
			protected Object call() throws Exception {
				double i = 1;
				int numero = 1;
				for (Impot impot : impotManager.getListImpot()) {
					impotManager.envoyerEmail(impot,numero);
					String ch = impot.getMembre().getPrenom() + " "
							+ impot.getMembre().getNom() + " - Email : "
							+ impot.getMembre().getEmail();
					updateMessage(ch);
					updateProgress(i, impotManager.getListImpot().size());
					i++;
					numero++;
				}
				updateMessage("Envoie Terminee!");
				return true;
			}
		};
	}

	// caption pour indique le bouton home
	public void toolTipButton(Control node, String text) {
		Tooltip tooltip = new Tooltip();
		tooltip.setHeight(14);
		tooltip.setWidth(10);
		tooltip.setText(text);
		node.setTooltip(tooltip);
	}
	private void handleButtonQuitter() {
		btnQuitter.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				parentStage.show();
				stage.close();	
			}
		});
	}

}
