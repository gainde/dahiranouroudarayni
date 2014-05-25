package javafx.membre.ajout;
import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
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
