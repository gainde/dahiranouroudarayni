package javafx.evenement;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.ResourceBundle;

import javafx.beans.property.ReadOnlyObjectWrapper;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.TitledPane;
import javafx.stage.Stage;
import javafx.util.Callback;
import dao.EvenementDao;
import daoimpl.EvenementDaoImpl;
import entites.Evenement;

public class EvenementController implements Initializable{
	@FXML private TableView<Evenement> tableEvenement ;
	
    @FXML private TableColumn<Evenement, String> colonneDate;
    @FXML private TableColumn<Evenement, String> colonneNom;
    @FXML private TableColumn<Evenement, Double> colonneBudget;
    @FXML private DatePicker dateEven;
    
    @FXML private TextField txtNom;
    @FXML private TextField txtDepense;
    @FXML private TextField txtBudget;
    
    @FXML private Button btnAjouter;
    @FXML private Button btnEditer;
    @FXML private Button btnSupprimer;
    @FXML private Button btnEnregistrer;
    
    @FXML private DatePicker dateNouveauEven;
    @FXML private TextField txtNomNouveauEven;
    @FXML private TextField txtBudgetNouveauEven;
    @FXML private TitledPane titledPaneNvEven;
    
    @FXML private ComboBox<String> cmbEvenement;
    
   
    private Stage stage;
    private Evenement eventSelected;
    
    ObservableList<Evenement> evenementData = FXCollections.observableArrayList();
    
    private final String LIST_EVENEMENT = "select e from Evenement e";
    
	
    @Override
	public void initialize(URL arg0, ResourceBundle arg1) {
    	HandleButtonAjouter();
    	HandleButtonEditer();
    	HandleButtonSupprimer();
    	handleButtonEnregistrer();
    	btnEnregistrer.setDisable(true);
    	btnEditer.setDisable(true);
    	handleComboBox();
    	dateEven.setEditable(false);
    	dateNouveauEven.setEditable(false);
    	colonneNom.setCellValueFactory(new Callback<CellDataFeatures<Evenement, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<Evenement, String> p) {
		         return new ReadOnlyObjectWrapper(p.getValue().getNomEvenement());
		     }
		  });
    	colonneDate.setCellValueFactory(new Callback<CellDataFeatures<Evenement, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<Evenement, String> p) {
		         return new SimpleStringProperty(new SimpleDateFormat("dd/MM/yyyy").format(p.getValue().getDateEvenement()));
		     }
		  });
    	colonneBudget.setCellValueFactory(new Callback<CellDataFeatures<Evenement, Double>, ObservableValue<Double>>() {
		     public ObservableValue<Double> call(CellDataFeatures<Evenement, Double> p) {
		         return new ReadOnlyObjectWrapper(p.getValue().getBudget());
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
					chargerEvenement(newValue);
					btnEditer.setDisable(false);
				}
				
			}
		});
    	
    	
    	enableFieldsEdit(true);
    	chargerListEvenement();
	}
    
    public void setStage(Stage stage) {
        this.stage = stage;
    }
    
    private void HandleButtonAjouter(){
    	btnAjouter.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				System.out.println("Bouton ajouter click");
				ajouterEvenement();
			}
		});
    }
    private void HandleButtonEditer(){
    	btnEditer.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("Bouton editer click");
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
				// TODO Auto-generated method stub
				System.out.println("Bouton enregistrer click");
				//TODO Valider
				enregistrer();
				enableFieldsEdit(true);
			}
		});
    }
    private void HandleButtonSupprimer(){
    	btnSupprimer.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				System.out.println("Bouton supprimer click");	
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
		ArrayList<String> cmbData = new ArrayList<String>();
		System.out.println(evenementDao);
		
		for (Object p : evenementDao.getAll(LIST_EVENEMENT)) {
			Evenement evenement = (Evenement)p;
			evenementDatatmp.add(evenement);
			cmbData.add(new SimpleDateFormat("yyyy").format(evenement.getDateEvenement()));
		}
		evenementData = evenementDatatmp;
		tableEvenement.setItems(evenementData);
		fillComboBox(cmbEvenement, cmbData);
	}
    private void fillComboBox(ComboBox<String> cmb, ArrayList<String> data){
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
        LocalDate localDate = dateNouveauEven.getValue();
        Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
		Date date = Date.from(instant);
		Evenement even = new Evenement(nomEvenement, budget, date);
		EvenementDao evenDao = new EvenementDaoImpl();
		evenDao.create(even);
		evenementData.add(even);
		clearNewEvenement();
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
    }
    private void chargerEvenement(Evenement even){
    	txtNom.setText(even.getNomEvenement());
    	txtBudget.setText(even.getBudget().toString());
    	
    	LocalDate date = LocalDateTime.ofInstant(even.getDateEvenement().toInstant(), ZoneId.systemDefault()).toLocalDate();
    	dateEven.setValue(date);
    	String depense = even.getDepense() == null ? "" : even.getDepense().toString();
    	txtDepense.setText(depense);
    }
    private void enregistrer(){
    	String nom = txtNom.getText();
        Double budget = Double.parseDouble(txtBudget.getText());
        Double depense = txtDepense.getText() == null? null : Double.parseDouble(txtDepense.getText());
        //Double depense = Double.parseDouble(txtDepense.getText());
        LocalDate localDate = dateEven.getValue();
        Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
		Date date = Date.from(instant);
		Evenement even = new Evenement(nom,budget,depense,date);
		EvenementDao eventDao = new EvenementDaoImpl();
		eventDao.update(even);
		//btnEditer.setDisable(false);
		btnEnregistrer.setDisable(true);
    }
}
