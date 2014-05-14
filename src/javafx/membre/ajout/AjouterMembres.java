package javafx.membre.ajout;
import java.io.IOException;

import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class AjouterMembres extends Application {
	
	private Stage primaryStage;
    private AjouterMembreController addMemberController;
    private AnchorPane anc;
    
    @Override
    public void start(Stage primaryStage) throws Exception{
        this.primaryStage = primaryStage;
        this.primaryStage.setTitle("Formulaire Membre");

        try {
            // Load the root layout from the fxml file
            FXMLLoader loader = new FXMLLoader(AjouterMembres.class.getResource("AjouterMembreVue.fxml"));
            anc = (AnchorPane) loader.load();
            addMemberController = (AjouterMembreController)loader.getController();
            Scene scene = new Scene(anc);
            scene.getStylesheets().add("META-INF/css/style.css");
            primaryStage.setScene(scene);
            addMemberController.setStage(primaryStage);
            primaryStage.setResizable(false);
            primaryStage.show();
            
        } catch (IOException e) {
            // Exception gets thrown if the fxml file could not be loaded
            e.printStackTrace();
        }
        
    }

    /**
     * Returns the main stage.
     * @return
     */
    public Stage getPrimaryStage() {
        return primaryStage;
    }

}
