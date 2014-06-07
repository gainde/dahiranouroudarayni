package javafx.home;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.loadview.LoadManagerView;
import javafx.scene.control.Button;
import javafx.stage.Stage;
import daoimpl.DahiraDaoImpl;
import entites.Dahira;

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
				LoadManagerView.getInstance().afficherVueDahira(dahira);
			}
		});
	}

	private void HandleButtonEvenement() {
		btnEvenement.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				LoadManagerView.getInstance().afficherVueEvenement(stage);
				stage.hide();
			}
		});
	}

	private void HandleButtonImpot() {
		btnImpot.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
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
				LoadManagerView.getInstance().afficherVueKST(stage);
				stage.hide();
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
