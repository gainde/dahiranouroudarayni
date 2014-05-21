package javafx.home;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
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
		
	}
	public void setStage(Stage stage){
		this.stage = stage;
	}
	
	private void HandleButtonDahira(){
		btnDahira.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("click Dahira");
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
}
