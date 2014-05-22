package javafx.impot;


import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class ImpotView extends Application {
	private Stage primaryStage;
    private AnchorPane rootLayout;
	    public static void main(String[] args) {
	        launch(args);
	    }
	    @Override
	    public void start(final Stage primaryStage) {
	    	this.primaryStage = primaryStage;
	        this.primaryStage.setTitle("Impot");

	        try {
	            // Load the root layout from the fxml file
	            FXMLLoader loader = new FXMLLoader(ImpotView.class.getResource("Impot.fxml"));
	            rootLayout = (AnchorPane) loader.load();
	            ImpotController controlleur = loader.getController();
	            Scene scene = new Scene(rootLayout);
	            primaryStage.setScene(scene);
	            controlleur.setStage(primaryStage);
	            primaryStage.show();
	        } catch (IOException e) {
	            // Exception gets thrown if the fxml file could not be loaded
	            e.printStackTrace();
	        }
	    }


}
