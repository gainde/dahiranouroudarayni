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
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.TitledPane;
import javafx.stage.Stage;
import util.Utile;
import entites.Evenement;

public class KSTController implements Initializable{

    @FXML private TextField txtNom;
    @FXML private TextField txtBudget;
    
    @FXML private Button btnEditer;
    @FXML private Button btnEnregistrer;
    
    @FXML private DatePicker dateDebut;
    @FXML private DatePicker dateFin;
    @FXML private TextArea txtAreaDescription;
    @FXML private TitledPane titledPaneInfo;
    
   
    private Stage stage;
    private Stage parent;
    
    public void setParentStage(Stage parent){
    	this.parent = parent;
    }
	
    @Override
	public void initialize(URL arg0, ResourceBundle arg1) {
    	HandleButtonEditer();
    	handleButtonEnregistrer();
    	enableFieldsEdit(true);
    	titledPaneInfo.setExpanded(false);
    	dateDebut.setEditable(false);
    	dateFin.setEditable(false);
    	
	}
    
    public void setStage(Stage stage) {
        this.stage = stage;
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
		btnEnregistrer.setDisable(true);
    }

}
