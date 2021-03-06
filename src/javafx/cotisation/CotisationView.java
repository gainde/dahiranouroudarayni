package javafx.cotisation;

import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class CotisationView extends Application {
	
	private Stage primaryStage;
    private AnchorPane rootLayout;

    @Override
    public void start(Stage primaryStage) {
        this.primaryStage = primaryStage;
        this.primaryStage.setTitle("Cotisation");

        try {
            // Load the root layout from the fxml file
            FXMLLoader loader = new FXMLLoader(CotisationView.class.getResource("CotisationUI.fxml"));
            rootLayout = (AnchorPane) loader.load();
            CotisationController controlleur = loader.getController();
            Scene scene = new Scene(rootLayout);
            primaryStage.setScene(scene);
            controlleur.setStage(primaryStage);
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

    
    public static void main(String[] args) {
        launch(args);
    }

}
