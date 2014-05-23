package javafx.home;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import daoimpl.DahiraDaoImpl;
import entites.Dahira;
import javafx.dahira.DahiraController;
import javafx.evenement.EvenementController;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.impot.ImpotController;
import javafx.loadview.LoadManagerView;
import javafx.membre.MembreController;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class HomeController implements Initializable {
	@FXML
	private Button btnDahira;
	@FXML
	private Button btnEvenement;
	@FXML
	private Button btnMembre;
	@FXML
	private Button btnKeurSerigneTouba;
	@FXML
	private Button btnImpot;
	@FXML
	private Button btnParametre;
	@FXML
	private Button btnQuitter;

	private Stage stage;
	private Dahira dahira;

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
		// charger les vues
		chargerDahira();

	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	private void HandleButtonDahira() {
		btnDahira.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Dahira");
				LoadManagerView.getInstance().afficherVueDahira(dahira);
			}
		});
	}

	private void HandleButtonEvenement() {
		btnEvenement.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Evenement");
				LoadManagerView.getInstance().afficherVueEvenement(stage);
				stage.hide();
			}
		});
	}

	private void HandleButtonImpot() {
		btnImpot.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Impot");
				LoadManagerView.getInstance().afficherVueImpot(stage);
				stage.hide();
			}
		});
	}

	private void HandleButtonMembre() {
		btnMembre.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Membre");
				LoadManagerView.getInstance().afficherVueMembre(stage);
				stage.hide();
			}
		});
	}

	private void HandleButtonParametre() {
		btnParametre.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Parametre");
			}
		});
	}

	private void HandleButtonKeurSerigneTouba() {
		btnKeurSerigneTouba.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Keur Serigne Touba");
			}
		});
	}

	private void HandleButtonQuitter() {
		btnQuitter.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Quitter");
			}
		});
	}

	// charger les informations de la dahira
	public void chargerDahira() {
		DahiraDaoImpl dahiraDao = new DahiraDaoImpl();
		dahira = dahiraDao.get(DAHIRA);
	}

}
