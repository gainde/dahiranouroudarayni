package javafx.kst;

import java.net.URL;
import java.util.Date;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.Slider;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.TitledPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import util.Utile;
import dao.CotisationKSTDao;
import dao.ProjetDao;
import daoimpl.CotisationKSTImpl;
import daoimpl.ProjetDaoImpl;
import entites.ProjetKST;

public class KSTController implements Initializable{

    @FXML private TextField txtNom;
    @FXML private TextField txtBudget;
    
    @FXML private Button btnEditer;
    @FXML private Button btnEnregistrer;
    @FXML private Button btnQuitter;
    
    @FXML private DatePicker dateDebut;
    @FXML private DatePicker dateFin;
    @FXML private TextArea txtAreaDescription;
    @FXML private TitledPane titledPaneInfo;
    
    @FXML private Label lbBudget;
    @FXML private Label lbCotisations;
    
    @FXML private ProgressBar montantProgress;
    @FXML private Slider montantjs;
    
    private Stage stage;
    private Stage parent;
    
    private final String MONTANT_COTISATION_KST_QUERY = "select sum(k.montant) from cotisationkst k";
	private final String PROJET_QUERY = "select p from ProjetKST p";
	
	ProjetKST projetKSTExistant = null;
	
    public void setParentStage(Stage parent){
    	this.parent = parent;
    }
	
    @Override
	public void initialize(URL arg0, ResourceBundle arg1) {
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
				btnEnregistrer.setDisable(false);
				
			}
		});
    }
    private void handleButtonEnregistrer(){
    	
    	btnEnregistrer.setOnAction(new EventHandler<ActionEvent>() {
			
			@Override
			public void handle(ActionEvent event) {
				// TODO Auto-generated method stub
				//TODO Valider
				enregistrer();
				enableFieldsEdit(true);
			}
		});
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
		btnEnregistrer.setDisable(true);
    }
    
    private void loadValue(){
    	loadProjet();		
    }
    private void loadCotisations(){
    	CotisationKSTDao kstDao = new CotisationKSTImpl();
		Double montant = kstDao.getMontant(MONTANT_COTISATION_KST_QUERY);
		lbCotisations.setText(montant.toString());
		montantProgress.setProgress(montant/Double.parseDouble(txtBudget.getText()));
		montantjs.setMax(Double.parseDouble(txtBudget.getText()));
		montantjs.setValue(montant);
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
