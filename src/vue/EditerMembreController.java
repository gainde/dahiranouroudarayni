package vue;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.application.Application;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class EditerMembreController implements Initializable{
	
	 @FXML private TextField prenomField;
	 @FXML private TextField nomField;
	 @FXML private TextField emailField;
	 @FXML private TextField telephoneField;
	 @FXML private TextField naissanceField;
	 @FXML private TextField adresseField;
	 @FXML private TextField postalField;
	 @FXML private TextField villeField;
	 @FXML private ComboBox provinceComboBox;
	 @FXML private Button btnAnnuler;
	 @FXML private Button btnEnregistrer;
	 private Stage stage;
	 private Stage parentStage;
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
	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		
	}
}
