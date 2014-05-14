package javafx.membre;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.cotisation.CotisationController;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.membre.ajout.AjouterMembreController;
import javafx.membre.edit.EditerMembreController;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListView;
import javafx.scene.control.SplitPane;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class MembreController  implements Initializable{
	@FXML private SplitPane splitPaneVerticale;
	 @FXML private TextField rechercherField;
	 @FXML private Button btnOk;
	 @FXML private Button btnAjouter;
	 @FXML private Button btnEditer;
	 @FXML private Button btnSupprimer;
	 @FXML private Button btnCotisation;
	 @FXML private Button btnImpot;
	 @FXML private Button btnAnnuler;
	 @FXML private Button btnQuitter;
	 @FXML private TableView tableViewMembre;
	 @FXML private ListView donneeMembre;
	 private Stage stage;
	 public static final ObservableList dataMembre = 
		        FXCollections.observableArrayList();
	 
	 
	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		dataMembre.addAll("Ousmane","Dieng","514 708 4568");
		donneeMembre.setItems(dataMembre);
		//action sur bouton ajouter
		btnAjouter.setOnAction(new EventHandler<ActionEvent>() {
	 	    @Override public void handle(ActionEvent event) {
	 	    	System.out.println("Ok");
	 	    	afficherVueAjoutMembre();
	 	    }
	 	});
		
		//action sur bouton editer
				btnEditer.setOnAction(new EventHandler<ActionEvent>() {
			 	    @Override public void handle(ActionEvent event) {
			 	    	System.out.println("Ok");
			 	    	afficherVueEditerMembre();
			 	        
			 	    	//EtatAction.getInstance().setEtat(2);
	
			 	    }
			 	});
		
		//action sur bouton editer
				btnCotisation.setOnAction(new EventHandler<ActionEvent>() {
			 	    @Override public void handle(ActionEvent event) {
			 	    	System.out.println("Ok");
			 	    	afficherVueCotisation();
			 	        
			 	    	//EtatAction.getInstance().setEtat(2);
	
			 	    }
			 	});
	}
	
	//afficher la fenetre pour ajouter des membres
	public void afficherVueAjoutMembre(){
		 Stage primaryStage = new Stage();
	     primaryStage.setTitle("Membres");

	        try {
	            // Load the root layout from the fxml file
	            FXMLLoader loader = new FXMLLoader(Membres.class.getResource("AjouterMembreVue.fxml"));
	            AnchorPane anc = (AnchorPane) loader.load();
	            AjouterMembreController addMemberController = (AjouterMembreController)loader.getController();
	            Scene scene = new Scene(anc);
	            scene.getStylesheets().add("META-INF/css/style.css");
	            primaryStage.setScene(scene);
	            addMemberController.setStage(primaryStage);
	            addMemberController.setParentStage(primaryStage);
	            primaryStage.setResizable(false);
	            primaryStage.show();
	            
	        } catch (IOException e) {
	            // Exception gets thrown if the fxml file could not be loaded
	            e.printStackTrace();
	        }
	        
	}
	
	//afficher la fenetre pour ajouter des membres
	public void afficherVueEditerMembre(){
		 Stage primaryStage = new Stage();
	     primaryStage.setTitle("Membres");

	        try {
	            // Load the root layout from the fxml file
	            FXMLLoader loader = new FXMLLoader(Membres.class.getResource("EditerMembreVue.fxml"));
	            AnchorPane anc = (AnchorPane) loader.load();
	            EditerMembreController editMemberController = (EditerMembreController)loader.getController();
	            Scene scene = new Scene(anc);
	            scene.getStylesheets().add("META-INF/css/style.css");
	            primaryStage.setScene(scene);
	            editMemberController.setParentStage(primaryStage);
	            primaryStage.setResizable(false);
	            primaryStage.show();
	            
	        } catch (IOException e) {
	            // Exception gets thrown if the fxml file could not be loaded
	            e.printStackTrace();
	        }
	        
	}
	
	//afficher la fenetre pour ajouter des membres
		public void afficherVueCotisation(){
			 Stage primaryStage = new Stage();
		     primaryStage.setTitle("Cotisation");

		        try {
		            // Load the root layout from the fxml file
		            FXMLLoader loader = new FXMLLoader(CotisationController.class.getResource("CotisationUI.fxml"));
		            AnchorPane anc = (AnchorPane) loader.load();
		            CotisationController cotisation = (CotisationController)loader.getController();
		            Scene scene = new Scene(anc);
		            scene.getStylesheets().add("META-INF/css/style.css");
		            primaryStage.setScene(scene);
		            //cotisation.setParentStage(primaryStage);
		            primaryStage.setResizable(false);
		            primaryStage.show();
		            
		        } catch (IOException e) {
		            // Exception gets thrown if the fxml file could not be loaded
		            e.printStackTrace();
		        }
		        
		}
}
