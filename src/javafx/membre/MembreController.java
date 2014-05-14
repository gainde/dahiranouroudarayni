package javafx.membre;

import java.io.IOException;
import java.net.URL;
<<<<<<< HEAD
import java.util.ArrayList;
import java.util.ResourceBundle;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.cotisation.CotisationController;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.membre.ajout.AjouterMembreController;
import javafx.membre.edit.EditerMembreController;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.SplitPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.util.Callback;
import dao.MembreDao;
import daoimpl.MembreDaoImpl;
import entites.Membre;

public class MembreController  implements Initializable{
	@FXML private SplitPane splitPaneVerticale;
	
	 @FXML private TextField rechercherField;
	 
	 @FXML private Button btnOk;
	 @FXML private Button btnAjouter;
	 @FXML private Button btnEditer;
	 @FXML private Button btnSupprimer;
	 @FXML private Button btnCotisation;
	 @FXML private Button btnImpot;
	 @FXML private Button btnAnnuler;
	 @FXML private Button btnQuitter;
	 
	 @FXML private TableView<Membre> tableViewMembre;
	 @FXML private ListView<String> donneeMembre;
	 
	 @FXML private TableColumn<Membre, String> tablePrenom;
	 @FXML private TableColumn<Membre, String> tableNom;
	 @FXML private TableColumn<Membre, String> tableTelephone;
	  
	 private Stage stage;
	 
	 public static final ObservableList<String> dataMembre = 
		        FXCollections.observableArrayList();
	 public static ObservableList<Membre> membreDonnee = 
			 FXCollections.observableArrayList();
	 
	 private final String LIST_MEMBRE = "select c from Membre c";
	 
	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// c
		tablePrenom.setCellValueFactory(new Callback<CellDataFeatures<Membre, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<Membre, String> m) {
		         return new SimpleStringProperty(m.getValue().getPrenom());
		     }
		  });
		tableNom.setCellValueFactory(new Callback<CellDataFeatures<Membre, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<Membre, String> m) {
		         return new SimpleStringProperty(m.getValue().getNom());
		     }
		  });
		tableTelephone.setCellValueFactory(new Callback<CellDataFeatures<Membre, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<Membre, String> m) {
		         return new SimpleStringProperty(m.getValue().getTelephone());
		     }
		  });
		chargerMembres();
		afficherUnMembre();
		//dataMembre.addAll("Ousmane","Dieng","514 708 4568");
		//donneeMembre.setItems(dataMembre);
		
		//action sur bouton ajouter
		btnAjouter.setOnAction(new EventHandler<ActionEvent>() {
	 	    @Override public void handle(ActionEvent event) {
	 	    	System.out.println("Ok");
	 	    	afficherVueAjoutMembre();
	 	    }
	 	});
		
		//action sur bouton editer
				btnEditer.setOnAction(new EventHandler<ActionEvent>() {
			 	    @Override public void handle(ActionEvent event) {
			 	    	System.out.println("Ok");
			 	    	afficherVueEditerMembre();
			 	        
			 	    	//EtatAction.getInstance().setEtat(2);
	
			 	    }
			 	});
		
		//action sur bouton editer
				btnCotisation.setOnAction(new EventHandler<ActionEvent>() {
			 	    @Override public void handle(ActionEvent event) {
			 	    	System.out.println("Ok");
			 	    	afficherVueCotisation();
			 	    }
			 	});
				
	}
	
	//action sur bouton editer
	private void handleBoutonEditer(){
		tableViewMembre.getSelectionModel().selectedItemProperty()
        .addListener(new ChangeListener<Membre>(){

			@Override
			public void changed(
					ObservableValue<? extends Membre> observable,
					Membre oldValue, Membre newValue) {
				// TODO Auto-generated method stub
				System.out.println(newValue.getPrenom());
			}
			});
	}
	
	//afficher la fenetre pour ajouter des membres
	public void afficherVueAjoutMembre(){
		 Stage primaryStage = new Stage();
	     primaryStage.setTitle("Membre");

	        try {
	            // Load the root layout from the fxml file
	            FXMLLoader loader = new FXMLLoader(AjouterMembreController.class.getResource("AjouterMembreVue.fxml"));
	            AnchorPane anc = (AnchorPane) loader.load();
	            AjouterMembreController addMemberController = (AjouterMembreController)loader.getController();
	            Scene scene = new Scene(anc);
	            scene.getStylesheets().add("META-INF/css/style.css");
	            primaryStage.setScene(scene);
	            addMemberController.setStage(primaryStage);
	            addMemberController.setParentStage(primaryStage);
	            primaryStage.setResizable(false);
	            primaryStage.show();
	            
	        } catch (IOException e) {
	            // Exception gets thrown if the fxml file could not be loaded
	            e.printStackTrace();
	        }
	        
	}
	
	//afficher la fenetre pour ajouter des membres
	public void afficherVueEditerMembre(){
		 Stage primaryStage = new Stage();
	     primaryStage.setTitle("Membre");

	        try {
	            // Load the root layout from the fxml file
	            FXMLLoader loader = new FXMLLoader(EditerMembreController.class.getResource("EditerMembreVue.fxml"));
	            AnchorPane anc = (AnchorPane) loader.load();
	            EditerMembreController editMemberController = (EditerMembreController)loader.getController();
	            Scene scene = new Scene(anc);
	            scene.getStylesheets().add("META-INF/css/style.css");
	            primaryStage.setScene(scene);
	            editMemberController.setParentStage(primaryStage);
	            primaryStage.setResizable(false);
	            primaryStage.show();
	            
	        } catch (IOException e) {
	            // Exception gets thrown if the fxml file could not be loaded
	            e.printStackTrace();
	        }
	        
	}
	
	//afficher la fenetre pour ajouter des membres
		public void afficherVueCotisation(){
			 Stage primaryStage = new Stage();
		     primaryStage.setTitle("Cotisation");

		        try {
		            // Load the root layout from the fxml file
		            FXMLLoader loader = new FXMLLoader(CotisationController.class.getResource("CotisationUI.fxml"));
		            AnchorPane anc = (AnchorPane) loader.load();
		            CotisationController cotisation = (CotisationController)loader.getController();
		            Scene scene = new Scene(anc);
		            scene.getStylesheets().add("META-INF/css/style.css");
		            primaryStage.setScene(scene);
		            //cotisation.setParentStage(primaryStage);
		            primaryStage.setResizable(false);
		            primaryStage.show();
		            
		        } catch (IOException e) {
		            // Exception gets thrown if the fxml file could not be loaded
		            e.printStackTrace();
		        }
		        
		}
		
		//charger liste des membres
		public void chargerMembres(){
			ObservableList<Membre> memberData = FXCollections.observableArrayList();
			MembreDao memberDao = new MembreDaoImpl();
			
			for (Object p : memberDao.getAll(LIST_MEMBRE)) {
				Membre member = (Membre)p;
				memberData.add(member);
			}
			membreDonnee = memberData;
			tableViewMembre.setItems(membreDonnee);
		}
		
		//afficher information d'un membre
		public void afficherUnMembre(){
			tableViewMembre.getSelectionModel().selectedItemProperty()
	        .addListener(new ChangeListener<Membre>(){

				@Override
				public void changed(
						ObservableValue<? extends Membre> observable,
						Membre oldValue, Membre newValue) {
					if(newValue != null){
					String nomMembre = newValue.getPrenom() + " " + newValue.getNom();
					String rueMembre = newValue.getAdresse().getRue();
					String codePostalMembre = newValue.getAdresse().getCodepostale() + "," +
							newValue.getAdresse().getVille();
					String paysMembre = newValue.getAdresse().getProvince() + "," +
							newValue.getAdresse().getPays() ;
					String telMembre = newValue.getTelephone();
					String emaillMembre =newValue.getEmail();
					donneeMembre.getItems().clear();
					dataMembre.addAll(nomMembre,rueMembre,codePostalMembre,paysMembre,telMembre,emaillMembre);
					donneeMembre.setItems(dataMembre);
					}
				}
				});
		}
}
