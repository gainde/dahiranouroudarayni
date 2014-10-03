package javafx.loadview;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javafx.aide.BrowserHelp;
import javafx.cotisation.CotisationController;
import javafx.dahira.DahiraController;
import javafx.dialog.DialogController;
//import javafx.dialog.DialogController;
import javafx.evenement.EvenementController;
import javafx.fxml.FXMLLoader;
import javafx.home.Home;
import javafx.home.HomeController;
import javafx.impot.ImpotController;
import javafx.kst.KSTController;
import javafx.membre.EmailController;
import javafx.membre.MembreController;
import javafx.membre.ajout.AjouterMembreController;
import javafx.membre.edit.EditerMembreController;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.scene.paint.Color;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.utilisateur.LoginController;
import javafx.utilisateur.LoginManager;
import entites.Dahira;
import entites.Membre;
import entites.Utilisateur;

public class LoadManagerView {
	
	private static BrowserHelp browserHelp = null; 
	private static Stage primaryStageAide;
	
	
	public static void afficherHome(final LoginManager loginManager, String sessionID) {
		Stage primaryStage = new Stage();
        primaryStage.setTitle("Accueil");

        try {
            // Load the root layout from the fxml file
            FXMLLoader loader = new FXMLLoader(Home.class.getResource("Home.fxml"));
            AnchorPane rootLayout = (AnchorPane) loader.load();
            HomeController controlleur = (HomeController)loader.getController();
            Scene scene = new Scene(rootLayout);
            scene.getStylesheets().add("META-INF/css/style.css");
            primaryStage.setScene(scene);
            controlleur.setStage(primaryStage);
            primaryStage.centerOnScreen();
            primaryStage.setResizable(false);
            controlleur.initSessionID(loginManager, sessionID);
            primaryStage.show();
           
        } catch (IOException e) {
            // Exception gets thrown if the fxml file could not be loaded
            e.printStackTrace();
        }

	}
	public static void afficherLogin(final LoginManager loginManager) {
		Stage primaryStage = new Stage();
        primaryStage.setTitle("Login");

        try {
            // Load the root layout from the fxml file
            FXMLLoader loader = new FXMLLoader(LoginController.class.getResource("Login.fxml"));
            AnchorPane rootLayout = (AnchorPane) loader.load();
            LoginController controlleur = (LoginController)loader.getController();
            Scene scene = new Scene(rootLayout);
            scene.getStylesheets().add("META-INF/css/style.css");
            primaryStage.setScene(scene);
            controlleur.setStage(primaryStage);
            primaryStage.centerOnScreen();
            primaryStage.setResizable(false);
            controlleur.initManager(loginManager);
            primaryStage.show();
           
        } catch (IOException e) {
            // Exception gets thrown if the fxml file could not be loaded
        	Logger.getLogger(LoginManager.class.getName()).log(Level.SEVERE,
					null, e);
            e.printStackTrace();
        }
        

	}
	
	// afficher la fenetre de la dahira
	public static void afficherVueDahira(Dahira dahira) {
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
			scene.getStylesheets().add("META-INF/css/style.css");
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
	public static void afficherVueMembre(Stage stage, final LoginManager loginManager,String sessionID) {
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
			scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			membreController.setStage(primaryStage);
			membreController.setParentStage(stage);
			membreController.initSessionID(loginManager, sessionID);;
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}
	}

	// afficher la fenetre Membres
	public static void afficherVueEvenement(Stage stage) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Évènements");
		// primaryStage.initModality(Modality.WINDOW_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					EvenementController.class.getResource("Evenement.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			EvenementController evenementController = (EvenementController) loader
					.getController();
			Scene scene = new Scene(anc);
			scene.getStylesheets().add("META-INF/css/style.css");
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
	public static void afficherVueImpot(Stage stage) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Impôt");
		// primaryStage.initModality(Modality.WINDOW_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					ImpotController.class.getResource("Impot.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			ImpotController impotController = (ImpotController) loader
					.getController();
			Scene scene = new Scene(anc);
			scene.getStylesheets().add("META-INF/css/style.css");
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
	public static void afficherVueAjoutMembre(MembreController membreController) {
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
	public static void afficherVueEditerMembre(MembreController membreController,
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
			scene.getStylesheets().add("META-INF/css/style.css");
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
	public static void afficherVueCotisation(Membre membreActif, final LoginManager loginManager, String sessionID) {
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
			scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			// cotisation.setParentStage(primaryStage);
			cotisation.setStage(primaryStage);
			cotisation.setMembre(membreActif);
			cotisation.initSessionID(loginManager, sessionID);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}

	}

	// afficher la fenetre pour envoyer le message d impot
	public static void afficherVueEmail(Membre membreActif, Utilisateur user) {
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
			scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			emailController.setStage(primaryStage);
			emailController.setMembreEnvoyer(membreActif);
			emailController.setUtilisateur(user);
			// emailController.setMembreController(this);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}

	}

	// afficher la fenetre Keur Serigne Touba
	public static void afficherVueKST(Stage stage) {
		Stage primaryStage = new Stage();
		primaryStage.setTitle("Keur Serigne Touba");
		primaryStage.initModality(Modality.WINDOW_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					KSTController.class.getResource("KST.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();
			KSTController kstController = (KSTController) loader
					.getController();
			Scene scene = new Scene(anc);
			scene.getStylesheets().add("META-INF/css/style.css");
			primaryStage.setScene(scene);
			kstController.setStage(primaryStage);
			kstController.setParentStage(stage);
			primaryStage.setResizable(false);
			primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}

	}

	// afficher la fenetre Keur Serigne Touba
	public static DialogController afficherVueDialog(Stage stage) {
		Stage primaryStage = new Stage();
		DialogController diagController = null;
		primaryStage.setTitle("Confirmation");
		primaryStage.initModality(Modality.APPLICATION_MODAL);
		try {
			// Load the root layout from the fxml file
			FXMLLoader loader = new FXMLLoader(
					DialogController.class.getResource("DialogView.fxml"));
			AnchorPane anc = (AnchorPane) loader.load();

			diagController = (DialogController) loader.getController();
			Scene scene = new Scene(anc);
			scene.getStylesheets().add("META-INF/css/style.css");
			scene.getRoot().getStyleClass().add("dialog");
			primaryStage.setScene(scene);
			diagController.setStage(primaryStage);
			primaryStage.initOwner(stage);
			primaryStage.setResizable(false);
			// primaryStage.show();

		} catch (IOException e) {
			// Exception gets thrown if the fxml file could not be loaded
			e.printStackTrace();
		}
		return diagController;

	}

	// afficher la fenetre Aide
	public static void getBrowserAide(){
		if(browserHelp == null){
			browserHelp = new BrowserHelp();
			afficherVueAide();
		}else{
			primaryStageAide.show();
			primaryStageAide.toFront();
		}
	}
	public static void afficherVueAide() {
		 // create the scene
		primaryStageAide = new Stage();
		primaryStageAide.setTitle("Aide");
		Scene scene = new Scene(browserHelp,750,500,Color.web("#666970"));
		//scene.getStylesheets().add("webviewsample/BrowserToolbar.css");        
		//scene.getStylesheets().add("META-INF/css/style.css");
		primaryStageAide.setScene(scene);
		primaryStageAide.show();
	}
}
