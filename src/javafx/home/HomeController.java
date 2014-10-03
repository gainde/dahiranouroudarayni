package javafx.home;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.dialog.DialogController.Response;
import javafx.dialog.FXOptionDialog;
import javafx.event.ActionEvent;
//import javafx.dialog.FXOptionDialog;
//import javafx.dialog.DialogController.Response;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.loadview.LoadManagerView;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;
import javafx.utilisateur.LoginManager;
import entites.Dahira;
import entites.ManagerEntiteDahira;

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
	private Button btnAide;
	@FXML
	private Button btnQuitter;
	@FXML
	private Label sessionLabel;
	@FXML
	private Button logoutButton;

	private Stage stage;
	private Dahira dahira;
	private LoginManager loginManager;

	//private MediaPlayer mediaPlayer;
	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		/*File file = new File("src/javafx/home/audioStart.mp3");
		try {
			final String mediaLocation = file.toURI().toURL().toExternalForm();
			Media media = new Media(mediaLocation);
		    mediaPlayer = new MediaPlayer(media);
		    mediaPlayer.setStopTime(new Duration(200));
		    mediaPlayer.play();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	*/


		/*playSound.setScaleX(1.5);
		
		mediaPlayer.setOnEndOfMedia(new Runnable() {
		      @Override public void run() {
		    	
		      }
		    });
		stopSound.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				playSound.setScaleX(1);
				stopSound.setScaleX(1.5);
				mediaPlayer.stop();
			}
		});
		playSound.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				stopSound.setScaleX(1);
				playSound.setScaleX(1.5);
				mediaPlayer.play();
			}
		});*/
		
		HandleButtonDahira();
		HandleButtonEvenement();
		HandleButtonImpot();
		HandleButtonMembre();
		HandleButtonAide();
		HandleButtonKeurSerigneTouba();
		HandleButtonQuitter();
		dahira = ManagerEntiteDahira.getInstance().getDahira();
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	private void HandleButtonDahira() {
		btnDahira.getStyleClass().add("buttonMenu");
		btnDahira.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				
				LoadManagerView.afficherVueDahira(dahira);
			}
		});
	}

	private void HandleButtonEvenement() {
		btnEvenement.getStyleClass().add("buttonMenu");
		btnEvenement.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				
			        	LoadManagerView.afficherVueEvenement(stage);
			        	stage.hide();
			}
		});
	}

	private void HandleButtonImpot() {
		btnImpot.getStyleClass().add("buttonMenu");
		btnImpot.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				LoadManagerView.afficherVueImpot(stage);
				stage.hide();
			}
		});
	}

	private void HandleButtonMembre() {
		btnMembre.getStyleClass().add("buttonMenu");
		btnMembre.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				LoadManagerView.afficherVueMembre(stage, loginManager, sessionLabel.getText());
				stage.hide();
			}
		});
	}

	private void HandleButtonAide() {
		btnAide.getStyleClass().add("buttonMenu");
		btnAide.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Aide");
				LoadManagerView.getBrowserAide();
			}
		});
	}

	private void HandleButtonKeurSerigneTouba() {
		btnKeurSerigneTouba.getStyleClass().add("buttonMenu");
		btnKeurSerigneTouba.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				LoadManagerView.afficherVueKST(stage);
				stage.hide();
			}
		});
	}

	private void HandleButtonQuitter() {
		btnQuitter.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				if(confirm())
				stage.close();	
			}
		});
	}	
	private boolean confirm(){
		Response response = FXOptionDialog.showConfirmDialog(stage, "Voulez vous vraiment quitter", "Confirmation");
		return response.equals(Response.OUI);
	}
	public void initSessionID(final LoginManager loginManager, String sessionID) {
		sessionLabel.setText(sessionID);
		this.loginManager = loginManager;
		btnEvenement.setDisable(!sessionID.equals("social"));
		btnKeurSerigneTouba.setDisable(sessionID.equals("social"));
		btnImpot.setDisable(!sessionID.equals("social"));
		
		logoutButton.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				stage.close();
				loginManager.logout();
			}
		});
	}
		
}
