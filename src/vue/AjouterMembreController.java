package vue;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class AjouterMembreController implements Initializable{

	 @FXML private TextField prenomField;
	 @FXML private TextField nomField;
	 @FXML private TextField emailField;
	 @FXML private TextField telephoneField;
	 @FXML private TextField naissanceField;
	 @FXML private TextField adresseField;
	 @FXML private TextField postalField;
	 @FXML private TextField villeField;
	 @FXML private ComboBox cmbProvince;
	 @FXML private Button btnAnnuler;
	 @FXML private Button btnEnregistrer;
	 private Stage stage;
	 private Stage parentStage;
	 private MembreController   membreController_;
	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}
	public void setParentStage(Stage stage){
		this.parentStage = stage;
	}
	public Stage getParentStage(){
		return this.parentStage;
	}
	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		 btnAnnuler.setOnAction(new EventHandler<ActionEvent>() {
		 	    @Override public void handle(ActionEvent event) {
		 	    	System.out.println("Ok");
		 	    	parentStage.show();
		 	    	stage.close();
		 	    }
		 	});
	}
	
}
