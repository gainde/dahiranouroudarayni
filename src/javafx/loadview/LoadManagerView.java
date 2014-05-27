package javafx.loadview;

import java.io.IOException;

import javafx.cotisation.CotisationController;
import javafx.dahira.DahiraController;
import javafx.evenement.EvenementController;
import javafx.fxml.FXMLLoader;
import javafx.impot.ImpotController;
import javafx.membre.EmailController;
import javafx.membre.MembreController;
import javafx.membre.ajout.AjouterMembreController;
import javafx.membre.edit.EditerMembreController;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import entites.Dahira;
import entites.Membre;

public class LoadManagerView {
	/** Constructeur privé */
	private LoadManagerView() {
	}

	/** Instance unique non préinitialisée */
	private static LoadManagerView INSTANCE = null;

	/** Point d'accès pour l'instance unique du singleton */
	public static synchronized LoadManagerView getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new LoadManagerView();
		}
		return INSTANCE;
	}

	// afficher la fenetre de la dahira
	public void afficherVueDahira(Dahira dahira) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Dahira");
		primaryStage.initModality(Modality.APPLICATION_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					DahiraController.class.getResource("DahiraVue.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			DahiraController dahiraController = (DahiraController) loader
					.getController();
			Scene scene = new Scene(anc);
			// scene.getStylesheets().add("META-INF/css/style.css");
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

	// afficher la fenetre Membres
	public void afficherVueMembre(Stage stage) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Membres");
		primaryStage.initModality(Modality.WINDOW_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					MembreController.class.getResource("MembreVue.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			MembreController membreController = (MembreController) loader
					.getController();
			Scene scene = new Scene(anc);
			// scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			membreController.setStage(primaryStage);
			membreController.setParentStage(stage);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}
	}

	// afficher la fenetre Membres
	public void afficherVueEvenement(Stage stage) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Évènements");
		primaryStage.initModality(Modality.WINDOW_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					EvenementController.class.getResource("Evenement.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			EvenementController evenementController = (EvenementController) loader
					.getController();
			Scene scene = new Scene(anc);
			//scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			evenementController.setStage(primaryStage);
			evenementController.setParentStage(stage);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}

	}

	// afficher la fenetre Membres
	public void afficherVueImpot(Stage stage) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Impôt");
		primaryStage.initModality(Modality.WINDOW_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					ImpotController.class.getResource("Impot.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			ImpotController impotController = (ImpotController) loader
					.getController();
			Scene scene = new Scene(anc);
			// scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			impotController.setStage(primaryStage);
			impotController.setParentStage(stage);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}
	}

	// afficher la fenetre pour ajouter des membres
	public void afficherVueAjoutMembre(MembreController membreController) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Membre");
		primaryStage.initModality(Modality.APPLICATION_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					AjouterMembreController.class
							.getResource("AjouterMembreVue.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			AjouterMembreController addMemberController = (AjouterMembreController) loader
					.getController();
			Scene scene = new Scene(anc);
			scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			addMemberController.setStage(primaryStage);
			addMemberController.setMembreController(membreController);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}

	}

	// afficher la fenetre pour ajouter des membres
	public void afficherVueEditerMembre(MembreController membreController,
			Membre membreActif) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Membre");
		primaryStage.initModality(Modality.APPLICATION_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					EditerMembreController.class
							.getResource("EditerMembreVue.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			EditerMembreController editMemberController = (EditerMembreController) loader
					.getController();
			Scene scene = new Scene(anc);
			// scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			editMemberController.setStage(primaryStage);
			editMemberController.setEditMembre(membreActif);
			editMemberController.setMembreController(membreController);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}

	}

	// afficher la fenetre pour ajouter des membres
	public void afficherVueCotisation(Membre membreActif) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Cotisation");
		primaryStage.initModality(Modality.APPLICATION_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					CotisationController.class.getResource("CotisationUI.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			CotisationController cotisation = (CotisationController) loader
					.getController();
			Scene scene = new Scene(anc);
			// scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			// cotisation.setParentStage(primaryStage);
			cotisation.setStage(primaryStage);
			cotisation.setMembre(membreActif);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}

	}

	// afficher la fenetre pour envoyer le message d impot
	public void afficherVueEmail(Membre membreActif) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Connexion");
		primaryStage.initModality(Modality.APPLICATION_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					EmailController.class.getResource("EmailVue.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			EmailController emailController = (EmailController) loader
					.getController();
			Scene scene = new Scene(anc);
			// scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			emailController.setStage(primaryStage);
			emailController.setMembreEnvoyer(membreActif);
			// emailController.setMembreController(this);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}

	}
}
