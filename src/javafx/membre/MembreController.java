package javafx.membre;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ListChangeListener;
import javafx.collections.ObservableList;
import javafx.dialog.FXOptionDialog;
import javafx.dialog.DialogController.Response;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.loadview.LoadManagerView;
import javafx.scene.control.Button;
import javafx.scene.control.Control;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.SplitPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.Tooltip;
import javafx.scene.image.ImageView;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.Callback;
import javafx.utilisateur.LoginManager;
import dao.MembreDao;
import daoimpl.MembreDaoImpl;
import entites.Membre;

public class MembreController implements Initializable {


	@FXML
	private SplitPane splitPaneVerticale;

	@FXML
	private TextField rechercherField;

	@FXML
	private Button btnOk;
	@FXML
	private Button btnAjouter;
	@FXML
	private Button btnEditer;
	@FXML
	private Button btnSupprimer;
	@FXML
	private Button btnCotisation;
	@FXML
	private Button btnImpot;
	@FXML
	private Button btnAnnuler;
	@FXML
	private Button btnQuitter;
	@FXML
	private Button btnHome;
	@FXML
	private Button btnAide;



	@FXML
	private TableView<Membre> tableViewMembre;
	@FXML
	private ListView<String> listViewMembre;

	@FXML
	private TableColumn<Membre, String> tablePrenom;
	@FXML
	private TableColumn<Membre, String> tableNom;
	@FXML
	private TableColumn<Membre, String> tableTelephone;
	
	@FXML
	private Label sessionLabel;
	@FXML
	private Button logoutButton;

	private Stage stage;
	private Stage parent;
	private Membre membreActif;
	private LoginManager loginManager;
	

	private static IntegerProperty index = new SimpleIntegerProperty();

	public static final ObservableList<String> dataMembre = FXCollections
			.observableArrayList();
	public static ObservableList<Membre> membreDonnee = FXCollections
			.observableArrayList();

	// 1. Wrap the ObservableList in a FilteredList (initially display all
	// data).
	public static ObservableList<Membre> filteredData = FXCollections
			.observableArrayList();

	private final String LIST_MEMBRE = "select c from Membre c";

	boolean etatEdit = false;// dans etat editer membre çà donne true
	
	
	
	public  IntegerProperty getIndex() {
		return index;
	}

	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
		stage.setOnCloseRequest(new EventHandler<WindowEvent>() {
			@Override
			public void handle(WindowEvent event) {
				parent.show();
			}
		});
	}

	public void setParentStage(Stage parent) {
		this.parent = parent;
	}

	public ObservableList<Membre> getMembreDonnee() {
		return membreDonnee;
	}

	public Membre getMembreActif() {
		return membreActif;
	}
	
	public void initSessionID(final LoginManager loginManager, String sessionID) {
		sessionLabel.setText(sessionID);
		this.loginManager = loginManager;
		logoutButton.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				stage.close();
				loginManager.logout();
			}
		});
	}
	public void setMembreActif(Membre membreActif) {
		this.membreActif = membreActif;
	}

	public ListView<String> getListViewMembre() {
		return listViewMembre;
	}

	public void setListViewMembre(ListView<String> listViewMembre) {
		this.listViewMembre = listViewMembre;
	}

	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {

		// set bouton non actif
		tableViewMembre.getSelectionModel().setSelectionMode(
				SelectionMode.SINGLE);
		
		btnEditer.disableProperty().bind(tableViewMembre.getSelectionModel().selectedItemProperty().isNull());
		btnSupprimer.disableProperty().bind(tableViewMembre.getSelectionModel().selectedItemProperty().isNull());
		btnCotisation.disableProperty().bind(tableViewMembre.getSelectionModel().selectedItemProperty().isNull());
		btnImpot.disableProperty().bind(tableViewMembre.getSelectionModel().selectedItemProperty().isNull());
		// c
		tablePrenom
				.setCellValueFactory(new Callback<CellDataFeatures<Membre, String>, ObservableValue<String>>() {
					public ObservableValue<String> call(
							CellDataFeatures<Membre, String> m) {
						return new SimpleStringProperty(m.getValue()
								.getPrenom());
					}
				});
		tableNom.setCellValueFactory(new Callback<CellDataFeatures<Membre, String>, ObservableValue<String>>() {
			public ObservableValue<String> call(
					CellDataFeatures<Membre, String> m) {
				return new SimpleStringProperty(m.getValue().getNom());
			}
		});
		tableTelephone
				.setCellValueFactory(new Callback<CellDataFeatures<Membre, String>, ObservableValue<String>>() {
					public ObservableValue<String> call(
							CellDataFeatures<Membre, String> m) {
						return new SimpleStringProperty(m.getValue()
								.getTelephone());
					}
				});

		// charger la liste des membres
		chargerMembres();
		// afficher un membre
		afficherUnMembre();
		// action filtrer membre
		filterMembre();
		
		toolTipButton(btnHome, "Home");
		toolTipButton(btnAide, "Aide");

		// handle button
		handleBtnQuitter(btnHome);
		handleBtnQuitter(btnQuitter);
		handleBtnAjouter();
		handleBtnEditer();
		handleBtnSupprimer();
		handleBtnCotisation();
		handleBtnImpot();
		HandleButtonAide();
		// filtrer les membres
		membreDonnee.addListener(new ListChangeListener<Membre>() {
			@Override
			public void onChanged(
					ListChangeListener.Change<? extends Membre> change) {
				
				updateFilteredData();
			}
		});

			
	}// fin de la fonction initialiser
	

	// action pour quitter
	public void handleBtnQuitter(Button t) {
		if(t.equals(btnHome))// add style
			btnHome.getStyleClass().add("buttonMenu");
		// action sur bouton quitter
		t.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {

				parent.show();
				stage.close();
			}
		});
	}

	// action pour Ajouter
	public void handleBtnAjouter() {
		// action sur bouton ajouter
		btnAjouter.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				afficherVueAjoutMembre();
			}
		});
	}

	// action pour Editer
	public void handleBtnEditer() {
		// action sur bouton editer
		btnEditer.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				// System.out.println("Ok");
				etatEdit = true;
				afficherVueEditerMembre();
			}
		});
	}

	// action pour Supprimer
	public void handleBtnSupprimer() {
		// action sur bouton supprimmer
		btnSupprimer.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				if(confirm()){
					clearUnMembre();
					tableViewMembre.getSelectionModel().clearSelection();
					listViewMembre.getItems().clear();
				}
			}
		});
	}

	// action pour Cotisation
	public void handleBtnCotisation() {
		// action sur bouton cotisation
		btnCotisation.getStyleClass().add("buttonMenu");
		btnCotisation.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				LoadManagerView.afficherVueCotisation(membreActif, loginManager, sessionLabel.getText());
			}
		});
	}

	// action pour Impot
	public void handleBtnImpot() {
		// action sur bouton impot
		btnImpot.getStyleClass().add("buttonMenu");
		btnImpot.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				LoadManagerView.afficherVueEmail(membreActif, loginManager.getUser());
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
	
	// afficher la fenetre pour ajouter des membres
	public void afficherVueAjoutMembre() {
		LoadManagerView.afficherVueAjoutMembre(this);
	}

	// afficher la fenetre pour éditer des membres
	public void afficherVueEditerMembre() {
		LoadManagerView.afficherVueEditerMembre(this, membreActif);
	}

	// charger liste des membres
	public void chargerMembres() {
		ObservableList<Membre> memberData = FXCollections.observableArrayList();
		MembreDao memberDao = new MembreDaoImpl();

		for (Object p : memberDao.getAll(LIST_MEMBRE)) {
			Membre member = (Membre) p;
			memberData.add(member);
		}
		membreDonnee = memberData;
		// filteredData.addAll(membreDonnee);
		tableViewMembre.getItems().clear();
		tableViewMembre.setItems(membreDonnee);
	}

	// afficher information d'un membre
	public void afficherUnMembre() {
		tableViewMembre.getSelectionModel().selectedItemProperty()
				.addListener(new ChangeListener<Membre>() {

					@Override
					public void changed(
							ObservableValue<? extends Membre> observable,
							Membre oldValue, Membre newValue) {
						index.set(membreDonnee.indexOf(newValue));
						membreActif = newValue;
						makeDataMembre(newValue);
					}
				});
	}


	// preparer les donnees d un membre pour l'affcihage
	public void makeDataMembre(Membre membre) {
		listViewMembre.getItems().clear();
		if (membre != null) {
			String nomMembre = membre.getPrenom() + " " + membre.getNom();
			add(nomMembre);
			String rueMembre = membre.getAdresse().getRue();
			add(rueMembre);
			
			String codePostalMembre = membre.getAdresse().getCodepostale()
					+ " " + membre.getAdresse().getVille();
			add(codePostalMembre);
			
			String paysMembre = membre.getAdresse().getProvince() + " "
					+ membre.getAdresse().getPays();
			add(paysMembre);
			
			String telMembre = membre.getTelephone();
			add(telMembre);
			
			String emaillMembre = membre.getEmail();
			add(emaillMembre);
			
			listViewMembre.setCellFactory(new Callback<ListView<String>, ListCell<String>>() {
				
				@Override
				public ListCell<String> call(ListView<String> param) {
						ListCell<String> cell = new ListCell<String>() {
		                    @Override
		                    protected void updateItem(String t, boolean bln) {
		                        super.updateItem(t, bln);
		                        setText(t);
		                        	if(getIndex() == 0){
		                        		getStyleClass().add("firstItem");
		                        	}
		                    }
						
		                };
		                return cell;
				}
			});
			listViewMembre.setItems(dataMembre);
		}
		

	}
	void add(String chaine){
		if(chaine!= null && !chaine.trim().isEmpty()){
			dataMembre.add(chaine);
		}
	}

	// effacer l'affichage des données d un membre
	public void clearUnMembre() {
		MembreDao membreDao = new MembreDaoImpl();
		membreDao.delete(membreActif);
		listViewMembre.getItems().clear();
		membreDonnee.remove(index.get());

	}

	// fonction pour rechercher un membre en filtrant les membres
	public void filterMembre() {
		filteredData.addAll(membreDonnee);
		// Add filtered data to the table
		tableViewMembre.setItems(filteredData);
		rechercherField.textProperty().addListener(
				new ChangeListener<String>() {
					@Override
					public void changed(
							ObservableValue<? extends String> observable,
							String oldValue, String newValue) {
						updateFilteredData();
						listViewMembre.getItems().clear();
					}
				});
	}

	/**
	 * Updates the filteredData to contain all data from the masterData that
	 * matches the current filter.
	 */
	private void updateFilteredData() {
		filteredData.clear();

		for (Membre p : membreDonnee) {
			if (matchesFilter(p)) {
				filteredData.add(p);
			}
		}

		// Must re-sort table after items changed
		reapplyTableSortOrder();
	}

	/**
	 * Returns true if the person matches the current filter. Lower/Upper case
	 * is ignored.
	 * 
	 * @param person
	 * @return
	 */
	private boolean matchesFilter(Membre membre) {
		String filterString = rechercherField.getText();
		if (filterString == null || filterString.isEmpty()) {
			// No filter --> Add all.
			return true;
		}

		String lowerCaseFilterString = filterString.toLowerCase();

		if (membre.getPrenom().toLowerCase().indexOf(lowerCaseFilterString) != -1) {
			return true;
		} else if (membre.getNom().toLowerCase().indexOf(lowerCaseFilterString) != -1) {
			return true;
		}else if ((membre.getPrenom() +" "+ membre.getNom()).toLowerCase().indexOf(lowerCaseFilterString) != -1)
			return true;
		return false; // Does not match
	}

	private void reapplyTableSortOrder() {
		ArrayList<TableColumn<Membre, ?>> sortOrder = new ArrayList<>(
				tableViewMembre.getSortOrder());
		tableViewMembre.getSortOrder().clear();
		tableViewMembre.getSortOrder().addAll(sortOrder);
	}

	public void toolTipButton(Control node, String text) {
		Tooltip tooltip = new Tooltip();
		tooltip.setHeight(14);tooltip.setWidth(10);
		tooltip.setText(text);
		node.setTooltip(tooltip);
	}
	private boolean confirm(){
		Response response = FXOptionDialog.showConfirmDialog(stage, "Voulez vous vraiment supprimer le membre", "Confirmation");
		return response.equals(Response.OUI);
	}
}
