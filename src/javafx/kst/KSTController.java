package javafx.kst;

import java.net.URL;
import java.util.Date;
import java.util.ResourceBundle;

import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.TitledPane;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import util.Utile;
import validation.ManagerValidation;
import validation.Validateur;
import validation.ValidateurChaine;
import validation.ValidateurMontant;
import validation.ValidationErreur;
import dao.CotisationKSTDao;
import dao.ProjetDao;
import daoimpl.CotisationKSTImpl;
import daoimpl.ProjetDaoImpl;
import entites.ProjetKST;

public class KSTController implements Initializable{
	
	@FXML private HBox hboxErr;
	@FXML private Button btnErr;
	@FXML private ImageView closeShape;
	
	@FXML
	private Text textErrNom;
	@FXML
	private Text textErrBudget;
	
    @FXML private TextField txtNom;
    @FXML private TextField txtBudget;
    
    @FXML private Button btnEditer;
    @FXML private Button btnEnregistrer;
    @FXML private Button btnQuitter;
    @FXML private Button Annuler;
    
    @FXML private DatePicker dateDebut;
    @FXML private DatePicker dateFin;
    @FXML private TextArea txtAreaDescription;
    @FXML private TitledPane titledPaneInfo;
    
    @FXML private Label lbBudget;
    @FXML private Label lbCotisations;
    @FXML
   	private AnchorPane anc;	
    
    private Stage stage;
    private Stage parent;
    
    private final String MONTANT_COTISATION_KST_QUERY = "select sum(k.montant) from cotisationkst k";
	private final String PROJET_QUERY = "select p from ProjetKST p";
	
	private Timeline timeline;
	private ManagerValidation validateurManager = new ManagerValidation();
	private int nbChilds = 0;
	ProjetKST projetKSTExistant = null;
	
    public void setParentStage(Stage parent){
    	this.parent = parent;
    }
    
    public void setAnchorPane(AnchorPane anc) {
		this.anc = anc;
	}
	
    @Override
	public void initialize(URL arg0, ResourceBundle arg1) {
    	nbChilds = anc.getChildren().size();
    	// set l anchorpane
    	Validateur.setAnc(anc);
    	hboxErr.setVisible(false);
		timeline = new Timeline();
		validateurManager.hideBoxErr(hboxErr,closeShape, timeline);
		validateurManager.clearListOfValidation();
		validateurManager.add(new ValidateurChaine(txtNom,
				textErrNom, false, ValidationErreur.CHAINE_ERR, 30));
		validateurManager.add(new ValidateurMontant(txtBudget,
		textErrBudget, false, ValidationErreur.MONTANT_ERR));
		
		btnEnregistrer.disableProperty().bind(btnEditer.disableProperty().not());
		
    	HandleButtonEditer();
    	handleButtonEnregistrer();
    	handleButtonQuitter();
    	enableFieldsEdit(true);
    	titledPaneInfo.setExpanded(false);
    	dateDebut.setEditable(false);
    	dateFin.setEditable(false);
    	loadValue();
    	
	}
    
    public void setStage(Stage stage) {
        this.stage = stage;
        stage.setOnCloseRequest(new EventHandler<WindowEvent>() {
			@Override
			public void handle(WindowEvent event) {
				parent.show();
			}
		});
    }
    
   
    private void HandleButtonEditer(){
    	btnEditer.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				enableFieldsEdit(false);
				btnEditer.setDisable(true);
				
			}
		});
    }
    private void handleButtonEnregistrer(){
    	
    	btnEnregistrer.setOnAction(new EventHandler<ActionEvent>() {
			
			@Override
			public void handle(ActionEvent event) {
				// TODO Auto-generated method stub
				//TODO Valider
				Boolean valide1 = valideDate();
				Boolean valide = validateurManager.valider();
				if(valide && valide1){
					enregistrer();
					btnErr.setText("Évènement ajouté avec succés!");
					titledPaneInfo.setExpanded(false);
				}else if(valide1){
					btnErr.setText("Veuillez corriger les champs invalides!");
					//textErrMsg.setText("Veuillez corriger les champs invalides!");
				}else if(valide){
					btnErr.setText("Dates invalides!");
				}else
					btnErr.setText("Veuillez corriger les champs invalides!");
				validateurManager.animate(hboxErr, timeline);
				hboxErr.setVisible(true);
			}
		});
    }
    public Boolean valideDate(){
    	if(validateurManager.dateValidate(dateDebut) &&
    			validateurManager.dateValidate(dateFin) &&
    			validateurManager.dateValidate(dateDebut,dateFin))
    		return true;
    	else
    		return false;
    }
 	public void handleButtonQuitter() {
 		btnQuitter.setOnAction(new EventHandler<ActionEvent>() {
 			@Override
 			public void handle(ActionEvent event) {
 				parent.show();
 				stage.close();
 			}
 		});
 	}
    
    private void enableFieldsEdit(boolean value){
    	txtNom.setDisable(value);
    	txtBudget.setDisable(value);
    	dateDebut.setDisable(value);
    	dateFin.setDisable(value);
    	txtAreaDescription.setDisable(value);
    }
    private void enregistrer(){
    	String nom = txtNom.getText();
    	String description = txtAreaDescription.getText();
        Double budget = Double.parseDouble(txtBudget.getText());
		Date debut = Utile.getDate(dateDebut.getValue());
		Date fin = Utile.getDate(dateFin.getValue());
		ProjetKST kst = new ProjetKST(nom, description, debut, fin, budget);
		ProjetDao projetDao = new ProjetDaoImpl();
		if(projetKSTExistant != null){
			projetDao.update(kst);
		}
		else {
			projetDao.create(kst);
		}
		setBudget(kst.getBudget());
		validateurManager.updateAnchorePane(nbChilds, anc);
    }
    
    private void loadValue(){
    	loadProjet();		
    }
    private void loadCotisations(){
    	CotisationKSTDao kstDao = new CotisationKSTImpl();
		Double montant = kstDao.getMontant(MONTANT_COTISATION_KST_QUERY);
		lbCotisations.setText(montant.toString());
    }
    
    private void loadProjet(){
    	ProjetDao projetDao = new ProjetDaoImpl();
    	projetKSTExistant = projetDao.get(PROJET_QUERY);
    	if(projetKSTExistant != null){
    		setValue(projetKSTExistant);
    		loadCotisations();
    	}
    }
    
    private void setValue(ProjetKST kst){
    	txtNom.setText(kst.getNom());
    	txtBudget.setText(Double.toString(kst.getBudget()));
    	dateDebut.setValue(Utile.getLocalDate(kst.getDateDebut()));
    	dateFin.setValue(Utile.getLocalDate(kst.getDateFin()));
    	txtAreaDescription.setText(kst.getDescription());
    	setBudget(kst.getBudget());
    }
    private void setBudget(double budget){
    	lbBudget.setText(Double.toString(budget));
    }
}
