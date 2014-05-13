package vue;

import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class Membres extends Application {

	private Stage primaryStage;
    private AnchorPane anc;
    private MembreController membreController;
    public void setPrimaryStage(Stage primaryStage) {
		this.primaryStage = primaryStage;
	}

	@Override
    public void start(Stage primaryStage) throws Exception{
        this.primaryStage = primaryStage;
        this.primaryStage.setTitle("Membres");

        try {
            // Load the root layout from the fxml file
            FXMLLoader loader = new FXMLLoader(EditerMembres.class.getResource("MembreVue.fxml"));
            anc = (AnchorPane) loader.load();
            membreController = (MembreController)loader.getController();
            Scene scene = new Scene(anc);
            scene.getStylesheets().add("META-INF/css/style.css");
            primaryStage.setScene(scene);
            membreController.setStage(primaryStage);
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
