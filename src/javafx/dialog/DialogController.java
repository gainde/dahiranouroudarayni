package javafx.dialog;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class DialogController implements Initializable {
	@FXML
	private Button btnOui;
	@FXML
	private Button btnNon;
	@FXML
	private Text txtMessage;

	private Stage stage;
	
	
	public enum Response { OUI, NON };
	private  static Response buttonSelected = Response.OUI;
	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		btnOui.setOnAction( new EventHandler<ActionEvent>() {
		        @Override public void handle( ActionEvent e ) {
		            stage.close();
		            buttonSelected = Response.OUI;
		        }
		    } );
		
	    btnNon.setOnAction( new EventHandler<ActionEvent>() {
	        @Override public void handle( ActionEvent e ) {
	            stage.close();
	            buttonSelected = Response.NON;
	        }
	    } );
	}
	
	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}
	
	public Response showConfirmDialog(String message, String title ) {
		this.txtMessage.setText(message);
		this.stage.setTitle(title);
		stage.sizeToScene();
        stage.centerOnScreen();
		showDialog();
	    return buttonSelected;
	}
	 public void showDialog() {
	        stage.showAndWait();
	  }
}
