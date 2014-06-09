package javafx.home;

import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class Home extends Application {
	
	private Stage primaryStage;
    private AnchorPane rootLayout;

    @Override
    public void start(Stage primaryStage) {
        this.primaryStage = primaryStage;
        this.primaryStage.setTitle("Accueil");

        try {
            // Load the root layout from the fxml file
            FXMLLoader loader = new FXMLLoader(Home.class.getResource("Home.fxml"));
            rootLayout = (AnchorPane) loader.load();
            HomeController controlleur = (HomeController)loader.getController();
            Scene scene = new Scene(rootLayout);
            scene.getStylesheets().add("META-INF/css/style.css");
            primaryStage.setScene(scene);
            controlleur.setStage(primaryStage);
            primaryStage.centerOnScreen();
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
