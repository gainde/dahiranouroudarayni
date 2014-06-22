package javafx.evenement;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashSet;
import java.util.ResourceBundle;
import java.util.Set;

import javafx.animation.Timeline;
import javafx.beans.property.IntegerProperty;
import javafx.beans.property.ReadOnlyObjectWrapper;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.dialog.FXOptionDialog;
import javafx.dialog.DialogController.Response;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.loadview.LoadManagerView;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Control;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.TitledPane;
import javafx.scene.control.Tooltip;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.Callback;
import util.Utile;
import validation.ManagerValidation;
import validation.Validateur;
import validation.ValidateurChaine;
import validation.ValidateurMontant;
import validation.ValidationErreur;
import dao.EvenementDao;
import daoimpl.EvenementDaoImpl;
import entites.Evenement;

public class EvenementController implements Initializable{
	@FXML private TableView<Evenement> tableEvenement ;
	
	@FXML private HBox hboxErr;
	
    @FXML private TableColumn<Evenement, String> colonneDate;
    @FXML private TableColumn<Evenement, String> colonneNom;
    @FXML private TableColumn<Evenement, Double> colonneBudget;
    @FXML private DatePicker dateEven;
    
   // @FXML private Text textErrMsg;
    @FXML private Text textErrNom;
    @FXML private Text textErrNom1;
    @FXML private Text textErrDepense;
    @FXML private Text textErrBudget;
    @FXML private Text textErrBudget1;
    
    @FXML private TextField txtNom;
    @FXML private TextField txtDepense;
    @FXML private TextField txtBudget;
    
    @FXML private Button btnAide;
    @FXML private Button btnHome;
    @FXML private Button btnErr;
    @FXML private Button btnAjouter;
    @FXML private Button btnEditer;
    @FXML private Button btnSupprimer;
    @FXML private Button btnEnregistrer;
    @FXML private Button btnQuitter;
    
    @FXML private DatePicker dateNouveauEven;
    @FXML private TextField txtNomNouveauEven;
    @FXML private TextField txtBudgetNouveauEven;
    @FXML private TitledPane titledPaneNvEven;
    
    @FXML private ComboBox<String> cmbEvenement;
    
    @FXML private AnchorPane anc;
   
    @FXML private ImageView closeShape;
    
    private Stage stage;
    private Evenement eventSelected;
    private Stage parent;
    private Timeline  timeline;
    private int nbChilds;
    
    ObservableList<Evenement> evenementData = FXCollections.observableArrayList();
    
    private final String LIST_EVENEMENT = "select e from Evenement e";
    
    private static IntegerProperty index = new SimpleIntegerProperty();
    
    private ManagerValidation validateurManager = new ManagerValidation();
    
    public void setParentStage(Stage parent){
    	this.parent = parent;
    }
	
    public void setAnchorPane(AnchorPane anc) {
		this.anc = anc;
	}
    
    @Override
	public void initialize(URL arg0, ResourceBundle arg1) {
    	nbChilds = anc.getChildren().size();
    	// set l anchorpane
    	Validateur.setAnc(anc);
    	// iniialiser à la date d aujourd hui
    	dateNouveauEven.setValue(LocalDate.now());
    	
    	toolTipButton(btnHome,"Home");
    	toolTipButton(btnAide,"Aide");
    	
    	hboxErr.setVisible(false);
    	timeline = new Timeline();
    	validateurManager.hideBoxErr(hboxErr,closeShape, timeline);
    
    	// validation
    	initValidation(txtNom);
    	initValidation(txtBudget);
    	initValidation(txtDepense);
    	
    	initValidation1(txtNomNouveauEven);
    	initValidation1(txtBudgetNouveauEven);
   
   
    	HandleButtonAjouter();
    	HandleButtonEditer();
    	HandleButtonSupprimer();
    	handleButtonEnregistrer();
    	handleButtonQuitter();
    	btnSupprimer.setDisable(true);
    	btnEnregistrer.setDisable(true);
    	btnEditer.setDisable(true);
    	handleComboBox();
    	dateEven.setEditable(false);
    	dateNouveauEven.setEditable(false);
    	colonneNom.setCellValueFactory(new Callback<CellDataFeatures<Evenement, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<Evenement, String> p) {
		         return new SimpleStringProperty(p.getValue().getNomEvenement());
		     }
		  });
    	colonneDate.setCellValueFactory(new Callback<CellDataFeatures<Evenement, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<Evenement, String> p) {
		         return new SimpleStringProperty(new SimpleDateFormat("dd/MM/yyyy").format(p.getValue().getDateEvenement()));
		     }
		  });
    	colonneBudget.setCellValueFactory(new Callback<CellDataFeatures<Evenement, Double>, ObservableValue<Double>>() {
		     public ObservableValue<Double> call(CellDataFeatures<Evenement, Double> p) {
		         return new ReadOnlyObjectWrapper<Double>(p.getValue().getBudget());
		     }
		  });
    	tableEvenement.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<Evenement>() {

			@Override
			public void changed(
					ObservableValue<? extends Evenement> observable,
					Evenement oldValue, Evenement newValue) {
				// TODO Auto-generated method stub
				if(newValue != null){
					eventSelected = newValue;
					index.set(evenementData.indexOf(newValue));
					chargerEvenement(newValue);
					btnEditer.setDisable(false);
					btnSupprimer.setDisable(false);
					btnEnregistrer.setDisable(true);
					enableFieldsEdit(true);
				}
				
			}
		});
    	
    	HandleButtonHome();
    	HandleButtonAide();
    	enableFieldsEdit(true);
    	chargerListEvenement();
    	titledPaneNvEven.setExpanded(false);
    	
	}
    //action sur le bouton Aide
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
	
    //initialiser la validation des champs d edition d evenement
    public void initValidation(Node node){
    	node.focusedProperty().addListener(new ChangeListener<Boolean>() {
			@Override
			public void changed(ObservableValue<? extends Boolean> observable,
					Boolean oldValue, Boolean newValue) {
				if (newValue) {
					validateurManager.clearListOfValidation();
					validateurManager.add(new ValidateurChaine(txtNom,
	    					textErrNom, false, ValidationErreur.CHAINE_ERR, 30));
					validateurManager.add(new ValidateurMontant(txtBudget,
					textErrBudget, false, ValidationErreur.MONTANT_ERR));
					validateurManager.add(new ValidateurMontant(txtDepense,
					textErrDepense, true, ValidationErreur.MONTANT_ERR));
					
				}
				
			}
		});
    }
    //initialiser la validation des champs d ajout d evenement
    public void initValidation1(Node node){
    	node.focusedProperty().addListener(new ChangeListener<Boolean>() {
			@Override
			public void changed(ObservableValue<? extends Boolean> observable,
					Boolean oldValue, Boolean newValue) {
				if (newValue) {
					validateurManager.clearListOfValidation();
					validateurManager.add(new ValidateurChaine(txtNomNouveauEven,
	    					textErrNom1, false, ValidationErreur.CHAINE_ERR,30));
					validateurManager.add(new ValidateurMontant(txtBudgetNouveauEven,
					textErrBudget1, false, ValidationErreur.MONTANT_ERR));
				}
				
			}
		});
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
    
    private void HandleButtonHome(){
		btnHome.getStyleClass().add("buttonMenu");
    	btnHome.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				parent.show();
				stage.close();
			}
		});
    }
    private void HandleButtonAjouter(){
    	btnAjouter.setOnMouseReleased(new EventHandler<Event>() {
			
			@Override
			public void handle(Event event) {
				Boolean valide = validateurManager.valider();
				if(valide){
					ajouterEvenement();
					btnErr.setText("Évènement ajouté avec succés!");
					titledPaneNvEven.setExpanded(false);
				}else{
					btnErr.setText("Veuillez corriger les champs invalides!");
					//textErrMsg.setText("Veuillez corriger les champs invalides!");
				}
				validateurManager.animate(hboxErr, timeline);
				hboxErr.setVisible(true);
			}
		});
    }
    private void HandleButtonEditer(){
    	btnEditer.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				enableFieldsEdit(false);
				btnEditer.setDisable(true);
				btnEnregistrer.setDisable(false);
				
			}
		});
    }
    private void handleButtonEnregistrer(){
    	
    	btnEnregistrer.setOnAction(new EventHandler<ActionEvent>() {
			
			@Override
			public void handle(ActionEvent event) {
				Boolean valide = validateurManager.valider();
				if(valide){
					
					enregistrer();
					btnErr.setText("Modification enregistrée avec succés!");
					clearEditEvenement();
			    	btnEditer.setDisable(true);
			    	btnSupprimer.setDisable(true);
					enableFieldsEdit(true);
				}else{
					btnErr.setText("Veuillez corriger les champs invalides!");
					//textErrMsg.setText("Veuillez corriger les champs invalides!");
				}
				validateurManager.animate(hboxErr, timeline);;
				hboxErr.setVisible(true);
				}
		});
    }
    private void HandleButtonSupprimer(){
    	btnSupprimer.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				if(confirm())
					supprimerEvenement(eventSelected);
			}
		});
    }
    
    private void handleComboBox(){
    	cmbEvenement.valueProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				ObservableList<Evenement> filteredData = FXCollections.observableArrayList();
				if(newValue != null && !newValue.isEmpty()){
					filteredData.addAll(evenementData);
					for(Evenement e : evenementData){
						if(!newValue.equals(new SimpleDateFormat("yyyy").format(e.getDateEvenement()))){
							filteredData.remove(e);
						}
					}
					tableEvenement.setItems(filteredData);
				}else tableEvenement.setItems(evenementData);
			}
		});
    }
    
    private void chargerListEvenement(){
		ObservableList<Evenement> evenementDatatmp = FXCollections.observableArrayList();
		EvenementDao evenementDao = new EvenementDaoImpl();
		Set<String> cmbData = new HashSet<String>();
		
		for (Object p : evenementDao.getAll(LIST_EVENEMENT)) {
			Evenement evenement = (Evenement)p;
			evenementDatatmp.add(evenement);
			cmbData.add(new SimpleDateFormat("yyyy").format(evenement.getDateEvenement()));
		}
		evenementData = evenementDatatmp;
		tableEvenement.setItems(evenementData);
		fillComboBox(cmbEvenement, cmbData);
	}
    private void fillComboBox(ComboBox<String> cmb, Set<String> data){
    	ObservableList<String> options = 
    		    FXCollections.observableArrayList();
    	options.addAll(data);
    	
    	cmb.setItems(options);
    	
    }
    
    private void clearNewEvenement(){
        txtNomNouveauEven.setText("");
        txtBudgetNouveauEven.setText("");
        dateNouveauEven.getEditor().setText("");
    }
    private void clearEditEvenement(){
        txtNom.setText("");
        txtBudget.setText("");
        dateEven.getEditor().setText("");
        txtDepense.setText("");
    }
    
    private void ajouterEvenement(){
    	String nomEvenement = txtNomNouveauEven.getText();
        Double budget = Double.valueOf(txtBudgetNouveauEven.getText());
		Date date = Utile.getDate(dateNouveauEven.getValue());
		Evenement even = new Evenement(nomEvenement, budget, date);
		EvenementDao evenDao = new EvenementDaoImpl();
		evenDao.create(even);
		evenementData.add(even);
		clearNewEvenement();
		validateurManager.updateAnchorePane(nbChilds, anc);
		tableEvenement.getSelectionModel().clearSelection();
		clearEditEvenement();
		btnEditer.setDisable(true);
    	btnSupprimer.setDisable(true);
    }
    private void enableFieldsEdit(boolean value){
    	txtNom.setDisable(value);
    	txtBudget.setDisable(value);
    	dateEven.setDisable(value);
    	txtDepense.setDisable(value);
    }
    private void supprimerEvenement(Evenement even){
    	EvenementDao evenDao = new EvenementDaoImpl();
    	evenementData.remove(even);
    	evenDao.delete(even);
    	clearEditEvenement();
    	btnEditer.setDisable(true);
    	btnSupprimer.setDisable(true);
    }
    private void chargerEvenement(Evenement even){
    	txtNom.setText(even.getNomEvenement());
    	txtBudget.setText(even.getBudget().toString());
    	
    	dateEven.setValue(Utile.getLocalDate(even.getDateEvenement()));
    	String depense = even.getDepense() == null ? "" : even.getDepense().toString();
    	txtDepense.setText(depense);
    }
    private void enregistrer(){
    	String nom = txtNom.getText();
        Double budget = Double.parseDouble(txtBudget.getText());
        Double depense = txtDepense.getText().length() == 0? null : Double.parseDouble(txtDepense.getText());
        //Double depense = Double.parseDouble(txtDepense.getText());
		Date date = Utile.getDate(dateEven.getValue());
		Evenement even = new Evenement(nom,budget,depense,date);
		EvenementDao eventDao = new EvenementDaoImpl();
		eventDao.update(even);
		evenementData.set(index.get(), even);
		//btnEditer.setDisable(false);
		btnEnregistrer.setDisable(true);
		validateurManager.updateAnchorePane(nbChilds, anc);
		tableEvenement.getSelectionModel().clearSelection();
    }
    
  //caption pour indique le bouton home
    public void toolTipButton(Control node, String text) {
		Tooltip tooltip = new Tooltip();
		tooltip.setHeight(14);tooltip.setWidth(10);
		tooltip.setText(text);
		node.setTooltip(tooltip);
	}
    
    private boolean confirm(){
		Response response = FXOptionDialog.showConfirmDialog(stage, "Voulez vous vraiment supprimer l'évènement", "Confirmation");
		return response.equals(Response.OUI);
	}
    
    private void handleButtonQuitter() {
		btnQuitter.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				parent.show();
				stage.close();	
			}
		});
	}
   
}
