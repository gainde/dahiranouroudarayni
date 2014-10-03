package logique;

import java.io.IOException;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.utilisateur.LoginManager;

public class Main extends Application {
	public static void main(String[] args) {
		launch(args);
	}

	@Override
	public void start(Stage stage) throws IOException {
		Scene scene = new Scene(new StackPane());
		LoginManager loginManager = new LoginManager(scene);
		loginManager.showLoginScreen();

		/*stage.setScene(scene);
		stage.show();*/
	}

}
