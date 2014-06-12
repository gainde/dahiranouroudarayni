package javafx.home;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.application.Platform;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.loadview.LoadManagerView;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.image.ImageView;
import javafx.scene.media.AudioClip;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.Duration;
import daoimpl.DahiraDaoImpl;
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

	private Stage stage;
	private Dahira dahira;

	private MediaPlayer mediaPlayer;
	
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
		HandleButtonParametre();
		HandleButtonKeurSerigneTouba();
		HandleButtonQuitter();
		dahira = ManagerEntiteDahira.getInstance().loadDahira();
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
		btnAide.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("click Aide");
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
				stage.close();	
			}
		});
	}	
}
