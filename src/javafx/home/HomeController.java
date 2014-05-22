package javafx.home;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import daoimpl.DahiraDaoImpl;
import entites.Dahira;
import javafx.dahira.DahiraController;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class HomeController implements Initializable{
	@FXML private Button btnDahira;
	@FXML private Button btnEvenement;
	@FXML private Button btnMembre;
	@FXML private Button btnKeurSerigneTouba;
	@FXML private Button btnImpot;
	@FXML private Button btnParametre;
	@FXML private Button btnQuitter;
	
	private Stage stage;
	private Dahira dahira ;
	
	private final String DAHIRA = "select c from Dahira c";
	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		HandleButtonDahira();
		HandleButtonEvenement();
		HandleButtonImpot();
		HandleButtonMembre();
		HandleButtonParametre();
		HandleButtonKeurSerigneTouba();
		HandleButtonQuitter();
		//charger vue dahira
				chargerDahira();
	}
	public void setStage(Stage stage){
		this.stage = stage;
	}
	
	private void HandleButtonDahira(){
		btnDahira.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("click Dahira");
				afficherVueDahira();
			}
		});
    }
	private void HandleButtonEvenement(){
		btnEvenement.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("click Evenement");
			}
		});
    }
	private void HandleButtonImpot(){
		btnImpot.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("click Impot");
			}
		});
    }
	private void HandleButtonMembre(){
		btnMembre.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("click Membre");
			}
		});
    }
	private void HandleButtonParametre(){
		btnParametre.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("click Parametre");
			}
		});
    }
	private void HandleButtonKeurSerigneTouba(){
		btnKeurSerigneTouba.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("click Keur Serigne Touba");
			}
		});
    }
	private void HandleButtonQuitter(){
		btnQuitter.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("click Quitter");
			}
		});
    }
	
	//afficher la fenetre de la dahira
			public void afficherVueDahira(){
				 Stage primaryStage = new Stage();
			     primaryStage.setTitle("Dahira");
			     primaryStage.initModality(Modality.APPLICATION_MODAL);
			        try {
			            // Load the root layout from the fxml file
			            FXMLLoader loader = new FXMLLoader(DahiraController.class.getResource("DahiraVue.fxml"));
			            AnchorPane anc = (AnchorPane) loader.load();
			            DahiraController dahiraController = (DahiraController)loader.getController();
			            Scene scene = new Scene(anc);
			            //scene.getStylesheets().add("META-INF/css/style.css");
			            primaryStage.setScene(scene);
			            dahiraController.setStage(primaryStage);
			            dahiraController.setEditDahira(dahira);
			            primaryStage.setResizable(false);
			            primaryStage.show();
			            
			        } catch (IOException e) {
			            // Exception gets thrown if the fxml file could not be loaded
			            e.printStackTrace();
			        }
			        
			}
			
			//charger les informations de la dahira
					public void chargerDahira(){
						DahiraDaoImpl dahiraDao = new DahiraDaoImpl();
							dahira = dahiraDao.get(DAHIRA);
					}
}
