package javafx.impot;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.ResourceBundle;

import javafx.GenererPdf;
import javafx.SendMessage;
import javafx.animation.Timeline;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.concurrent.Task;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
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
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.stage.DirectoryChooser;
import javafx.stage.Stage;
import validation.ManagerValidation;
import validation.Validateur;
import validation.ValidationErreur;
import validation.ValideurEmail;

import com.itextpdf.text.DocumentException;

import dao.CotisationEvenementDao;
import dao.CotisationKSTDao;
import dao.CotisationLoyerDao;
import dao.MembreDao;
import daoimpl.CotisationEvenementImpl;
import daoimpl.CotisationKSTImpl;
import daoimpl.CotisationLoyerImpl;
import daoimpl.MembreDaoImpl;
import entites.Dahira;
import entites.Impot;
import entites.ManagerEntiteDahira;
import entites.Membre;
import entites.Utilisateur;

public class ImpotController implements Initializable {
	@FXML
	private ImageView imageViewHome;
	
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

	private Utilisateur user;
	private final String QUERY_ALL_MEMBRE = "select m from Membre m";
	private final String COTISATION_LOYER = "select sum(l.montant) from cotisationmembre l where l.idMembre=?1 and YEAR(l.datecotisation) = ?2";
	private final String COTISATION_KST = "select sum(k.montant) from cotisationkst k where k.idMembre=?1 and YEAR(K.datecotisation) = ?2";
	private final String COTISATION_EVENEMENT = "select sum(e.montant) from cotisationevenement e where e.idMembre=?1 and YEAR(e.datecotisation) = ?2";

	ArrayList<Impot> listImpot;
	
	private ManagerValidation validateurManager = new ManagerValidation();

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
		setNodeStopWriten(txtAMsg, txtAMsg.getText(), 100);
		setNodeStopWriten(txtObjet, txtObjet.getText(), 30);
		setNodeStopWriten(txtMotDePasse, txtMotDePasse.getText(), 30);
		setNodeStopWriten(txtMotDePasseC, txtMotDePasseC.getText(), 30);
		btnExecuter.disableProperty().bind(lbDossier.textProperty().isEmpty());
		// validation email
		validateurManager.add(new ValideurEmail(txtEmail, textErrEmail,
				false, ValidationErreur.EMAIL_ERR,30));

		handleButtonChoisir();

		fillComboBox();
		handleButtonHome();
		// TODO delete Test
		Double v = new Double(0.0);
		CotisationLoyerDao loyerDao = new CotisationLoyerImpl();
		v = loyerDao.getMontant(COTISATION_LOYER, "address@gmail.com", "2013");
		// Double montant = v.get(0);
		System.out.println("Montant Loyer = " + v);

		CotisationEvenementDao evenementDao = new CotisationEvenementImpl();
		v = evenementDao
				.getMontant(COTISATION_KST, "address@gmail.com", "2013");
		// Double montant1 = v.get(0);
		System.out.println("Montant evenement = " + v);

		CotisationKSTDao kstDao = new CotisationKSTImpl();
		v = kstDao
				.getMontant(COTISATION_EVENEMENT, "address@gmail.com", "2013");
		// Double montant2 = v.get(0);
		System.out.println("Montant kst = " + v);
	
    	handleButtonExecuter();
	}
	
	public void setStage(Stage stage) {
		this.stage = stage;
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

	private void handleButtonHome() {
		btnHome.setOnAction(new EventHandler<ActionEvent>() {

			@Override
			public void handle(ActionEvent event) {
				System.out.println("click");
				parentStage.show();
				stage.close();
			}
		});
	}

	private void handleButtonExecuter() {
		btnExecuter.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				Boolean valideMotDePasse = validerMotDePasse();
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

	private void fillComboBox() {
		ObservableList<Integer> options = FXCollections.observableArrayList();
		Calendar calendar = new GregorianCalendar();
		int annee = calendar.get(Calendar.YEAR);
		for (int i = 1; i < 5; i++) {
			options.add(annee - i);
		}
		cmbAnnee.setItems(options);
		cmbAnnee.setValue(annee - 1);

	}

	private void choisirDossier() {
		DirectoryChooser chooser = new DirectoryChooser();
		chooser.setTitle("JavaFX Projects");
		File selectedDirectory = chooser.showDialog(stage);
		// lbDossier.setText("");
		if (selectedDirectory != null) {
			lbDossier.setText(selectedDirectory.getPath());
		}
	}

	private void loadData(int annee, Date date) {
		listImpot = new ArrayList<Impot>();
		MembreDao membreDao = new MembreDaoImpl();
		List<Membre> listMembre = membreDao.getAll(QUERY_ALL_MEMBRE);
		Double tmp;
		for (Membre membre : listMembre) {
			CotisationLoyerDao loyerDao = new CotisationLoyerImpl();

			tmp = loyerDao.getMontant(COTISATION_LOYER, membre.getEmail(),
					String.valueOf(annee));
			Double montantLoyer = 0.0;
			if (tmp != null)
				montantLoyer = tmp.doubleValue();

			CotisationEvenementDao evenementDao = new CotisationEvenementImpl();
			tmp = evenementDao.getMontant(COTISATION_KST, membre.getEmail(),
					String.valueOf(annee));
			Double montantEvenement = 0.0;
			if (tmp != null)
				montantEvenement = tmp.doubleValue();

			CotisationKSTDao kstDao = new CotisationKSTImpl();
			tmp = kstDao.getMontant(COTISATION_EVENEMENT, membre.getEmail(),
					String.valueOf(annee));
			Double montantKST = 0.0;
			if (tmp != null)
				montantKST = tmp.doubleValue();

			listImpot
					.add(new Impot(membre,
							(montantLoyer + montantEvenement + montantKST),
							annee, date));
		}
		executer(listImpot);
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
		user = new Utilisateur(email, mdp);
		loadData(annee, date);
	}

	private void executer(ArrayList<Impot> listImpot) {

		progressBar();
		
		/* double step = 0.0; double i = 1; int numero = 1;for(Impot impot : listImpot){
		 envoyerEmail(impot,numero); step=i/listImpot.size();
		 progressBar.setProgress(numero); System.out.println("step = "+step);
		 System.out.println("listImpot.size() = "+listImpot.size());
		 System.out.println("i = "+i); i++; numero++;}*/
		 
	}

	private void envoyerEmail(Impot impotMembre,int numero) {
		Dahira dahira = ManagerEntiteDahira.getInstance().loadDahira();

		String nameFile = lbDossier.getText() + "/"
				+ impotMembre.getMembre().getPrenom() + "_"
				+ impotMembre.getMembre().getNom() + ".pdf";
		System.out.println("chemin : "+nameFile);
		// GenererPdf(String dateIpmot, String dateDelivrance,String montant)
		String annee = String.valueOf(impotMembre.getAnnee());
		String montant = String.valueOf(impotMembre.getMontantCotisation());
		String date = new SimpleDateFormat("dd/MM/yyyy").format(impotMembre
				.getDateDeliv());
		GenererPdf impot = new GenererPdf(annee, date, montant);
		try {
			impot.createPdf(nameFile, impotMembre.getMembre(), dahira, "", numero);
		} catch (DocumentException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		SendMessage mess = new SendMessage();
		mess.setObjet(txtObjet.getText());
		mess.setMessage(txtAMsg.getText());
		mess.setEmailDestination(impotMembre.getMembre().getEmail());
		mess.setPathFile(nameFile);
		mess.sendMessage(user.getLogin(), user.getPass());

	}

	public void progressBar() {
		progressBar.setProgress(0);
		Task copyWorker = createWorker();
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

	public Task createWorker() {
		return new Task() {
			protected Object call() throws Exception {
				double i = 1;
				int numero = 1;
				for (Impot impot : listImpot) {
					envoyerEmail(impot,numero);
					String ch = impot.getMembre().getPrenom() + " "
							+ impot.getMembre().getNom() + " - Email : "
							+ impot.getMembre().getEmail();
					updateMessage(ch);
					updateProgress(i, listImpot.size());
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

	// stop to write
	public void setNodeStopWriten(Node node, String text, int caractereMax) {
		node.addEventHandler(KeyEvent.KEY_TYPED, new EventHandler<KeyEvent>() {
			public void handle(final KeyEvent keyEvent) {
				if (text.length() >= caractereMax) {
					keyEvent.consume();
				}
			}
		});
	}
	
	//vérifier la validité du mot de passe
	public Boolean validerMotDePasse(){
		if(!txtMotDePasse.getText().isEmpty() && !txtMotDePasseC.getText().isEmpty())
			if(txtMotDePasse.getText().compareTo(txtMotDePasseC.getText()) == 0)
				return true;
			else
				return false;
		else
			return false;
	}
}
