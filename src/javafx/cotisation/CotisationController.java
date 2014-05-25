package javafx.cotisation;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.ResourceBundle;
import java.util.Set;

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
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.util.Callback;
import logique.TypeCotisation;
import util.Utile;
import dao.CotisationEvenementDao;
import dao.CotisationKSTDao;
import dao.CotisationLoyerDao;
import dao.EvenementDao;
import daoimpl.CotisationEvenementImpl;
import daoimpl.CotisationKSTImpl;
import daoimpl.CotisationLoyerImpl;
import daoimpl.EvenementDaoImpl;
import entites.CotisationEvenement;
import entites.CotisationKST;
import entites.CotisationLoyer;
import entites.Evenement;
import entites.Membre;

public class CotisationController implements Initializable{
	@FXML private TabPane tabPaneCotisation;
	@FXML private TableView<CotisationLoyer> tableLoyer ;
	@FXML private TableView<CotisationKST> tableKST ;
	@FXML private TableView<CotisationEvenement> tableEvenement ;
	
    @FXML private TableColumn<CotisationLoyer, String> tableLoyerDate;
    @FXML private TableColumn<CotisationLoyer, Double> tableLoyerMontant;
    @FXML private TableColumn<CotisationKST, String> tableKSTDate;
    @FXML private TableColumn<CotisationKST, Double> tableKSTMontant;
    @FXML private TableColumn<CotisationEvenement, String> tableEvenementDate;
    @FXML private TableColumn<CotisationEvenement, Double> tableEvenementMontant;
    @FXML private TableColumn<CotisationEvenement, String> tableColumnEvenement;
    @FXML private DatePicker dateLoyer;
    @FXML private DatePicker dateKST;
    @FXML private DatePicker dateEvenement;
    
    @FXML private TextField txtMontantLoyer;
    @FXML private TextField montantKST;
    @FXML private TextField txtMontantEvenement;
    
    @FXML private Button btnAjouterLoyer;
    @FXML private Button btnAjouterKST;
    @FXML private Button btnAjouterEvenement;
    
    @FXML private ComboBox<String> cmbAnneeLoyer;
    @FXML private ComboBox<String> cmbAnneeKST;
    @FXML private ComboBox<String> cmbAnneeEvenement;
    
    @FXML private Label lbMembre;
    
    @FXML private ComboBox<String> cmbTypeCotisation;
    @FXML private ComboBox<Evenement> cmbEvenement;
    
    @FXML private Button btnQuitter;
   
    private Stage stage;
    
    ObservableList<CotisationLoyer> loyerData = FXCollections.observableArrayList();
    ObservableList<CotisationKST> KSTData = FXCollections.observableArrayList();
    ObservableList<CotisationEvenement> cotisationEvenementData = FXCollections.observableArrayList();
    ObservableList<Evenement> evenementData = FXCollections.observableArrayList();
    private final String LIST_COTISATION_LOYER = "select c from CotisationLoyer c where c.idMembre = ?1";
    private final String LIST_COTISATION_KST = "select c from CotisationKST c where c.idMembre = ?1";
    private final String LIST_COTISATION_EVENEMENT = "select c from CotisationEvenement c where c.idMembre = ?1";
    private final String LIST_EVENEMENT = "select e from Evenement e";
    
    
    final String LOYER_TAB_ID = "loyerTab";
	final String KST_TAB_ID = "KSTTab";
	final String EVENEMENT_TAB_ID = "evenementTab";
	
	final char COTISATION_KST_MENSUEL = '1';
	final char COTISATION_KST_AUTRE = '0';
	
	private Membre membre;
	
	/****
	 * Itiniatiliser les evenements et charger les donn�es de la tables de cotisationLoyer
	 */
    @Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
    	handleTabPaneCotisation();
		initialiserTabLoyer();
		initialiserTabKST();
		initialiserTabEvenement();
		handleComboBoxEvenement();
		handleBoutonQuitter();
	}
    
    public void setStage(Stage stage) {
        this.stage = stage;
    }
    public Stage getStage() {
        return this.stage;
    }
    public Membre getMembre(){
    	return this.membre;
    }
    
    public void setMembre(Membre m){
    	this.membre = m;
    	lbMembre.setText(membre.getPrenom()+" "+membre.getNom());
    	chargerCotisationLoyer();
    }
    
    private void HandleButtonAjouterLoyer(){
    	btnAjouterLoyer.setOnMouseReleased(new EventHandler<Event>() {
    		
			@Override
			public void handle(Event event) {
				ajouterCotisationLoyer();
				
			}
		});
    }
    private void HandleButtonAjouterKST(){
    	btnAjouterKST.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				ajouterCotisationKST();
				
			}
		});
    }
    private void HandleButtonAjouterEvenement(){
    	btnAjouterEvenement.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				ajouterCotisationEvenement();
				
			}
		});
    }
    
    private void handleComboBoxCotisationLoyer(){
    	cmbAnneeLoyer.valueProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				ObservableList<CotisationLoyer> filteredData = FXCollections.observableArrayList();
				if(newValue != null && !newValue.isEmpty()){
					filteredData.addAll(loyerData);
					for(CotisationLoyer c : loyerData){
						if(!newValue.equals(new SimpleDateFormat("yyyy").format(c.getDate()))){
							filteredData.remove(c);
						}
					}
					tableLoyer.setItems(filteredData);
				}else tableLoyer.setItems(loyerData);
			}
		});
    }
    private void handleComboBoxCotisationKST(){
    	cmbAnneeKST.valueProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				// TODO Auto-generated method stub
				ObservableList<CotisationKST> filteredData = FXCollections.observableArrayList();
				if(newValue != null && !newValue.isEmpty()){
					filteredData.addAll(KSTData);
					for(CotisationKST c : KSTData){
						if(!newValue.equals(new SimpleDateFormat("yyyy").format(c.getDateCotisationKST()))){
							filteredData.remove(c);
						}
					}
					tableKST.setItems(filteredData);
				}else tableKST.setItems(KSTData);
			}
		});
    }
    private void handleComboBoxCotisationEvenement(){
    	cmbAnneeEvenement.valueProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				// TODO Auto-generated method stub
				ObservableList<CotisationEvenement> filteredData = FXCollections.observableArrayList();
				if(newValue != null && !newValue.isEmpty()){
					filteredData.addAll(cotisationEvenementData);
					for(CotisationEvenement c : cotisationEvenementData){
						if(!newValue.equals(new SimpleDateFormat("yyyy").format(c.getDateCotisation()))){
							filteredData.remove(c);
						}
					}
					tableEvenement.setItems(filteredData);
				}else tableEvenement.setItems(cotisationEvenementData);
			}
		});
    }
    private void handleComboBoxEvenement(){
    	fillComboBoxEvenement();
    	cmbEvenement.getSelectionModel().selectFirst();
    	cmbEvenement.valueProperty().addListener(new ChangeListener<Evenement>() {

			@Override
			public void changed(ObservableValue<? extends Evenement> observable,
					Evenement oldValue, Evenement newValue) {
				// TODO Auto-generated method stub
				if(newValue != null){
					System.out.println("Selected Evenement: " + newValue.getNomEvenement());
				}
			}
		});
    }

	private void handleTabPaneCotisation(){
		tabPaneCotisation.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<Tab>() {

			@Override
			public void changed(ObservableValue<? extends Tab> observable,
					Tab oldValue, Tab newValue) {
				
				
				if(newValue.getId().equals(LOYER_TAB_ID)){
					chargerCotisationLoyer();
				}else if(newValue.getId().equals(KST_TAB_ID)){
					chargerCotisationKST();
				}else if(newValue.getId().equals(EVENEMENT_TAB_ID)){
					chargerCotisationEvenement();
				}
				
			}
		});
	}
	
	private void handleBoutonQuitter(){
		btnQuitter.setOnAction(new EventHandler<ActionEvent>() {
	 	    @Override public void handle(ActionEvent event) {
	 	    	stage.close();
	 	    }
	 	});
	}
	
	private void chargerCotisationLoyer(){
		ObservableList<CotisationLoyer> cotisationLoyerData = FXCollections.observableArrayList();
		CotisationLoyerDao cotisationLoyerDao = new CotisationLoyerImpl();
		Set<String> cmbData = new HashSet<String>();
		
		for (Object p : cotisationLoyerDao.getAll(LIST_COTISATION_LOYER, membre.getEmail())) {
			CotisationLoyer loyer = (CotisationLoyer)p;
			cotisationLoyerData.add(loyer);
			String annee = new SimpleDateFormat("yyyy").format(loyer.getDate());
			if(!cmbData.contains(annee)) cmbData.add(annee);
		}
		loyerData = cotisationLoyerData;
		tableLoyer.setItems(loyerData);
		fillComboBox(cmbAnneeLoyer, cmbData);
	}
	private void chargerCotisationKST(){
		ObservableList<CotisationKST> cotisationKSTData = FXCollections.observableArrayList();
		CotisationKSTDao cotisationKSTDao = new CotisationKSTImpl();
		Set<String> cmbData = new HashSet<String>();
		
		for (Object p : cotisationKSTDao.getAll(LIST_COTISATION_KST, membre.getEmail())) {
			CotisationKST kst = (CotisationKST)p;
			cotisationKSTData.add(kst);
			String annee = new SimpleDateFormat("yyyy").format(kst.getDateCotisationKST());
			if(!cmbData.contains(annee)) cmbData.add(annee);
		}
		KSTData = cotisationKSTData;
		tableKST.setItems(KSTData);
		fillComboBox(cmbAnneeKST, cmbData);
	}
	private void chargerCotisationEvenement(){
		CotisationEvenementDao cotisationEvenementDao = new CotisationEvenementImpl();
		Set<String> cmbData = new HashSet<String>();
		cotisationEvenementData.clear();
		for (Object p : cotisationEvenementDao.getAll(LIST_COTISATION_EVENEMENT, membre.getEmail())) {
			CotisationEvenement evenement = (CotisationEvenement)p;
			cotisationEvenementData.add(evenement);
			String annee = new SimpleDateFormat("yyyy").format(evenement.getDateCotisation());
			if(!cmbData.contains(annee)) cmbData.add(annee);
		}
		tableEvenement.setItems(cotisationEvenementData);
		fillComboBox(cmbAnneeEvenement, cmbData);
	}
	
	private void ajouterCotisationLoyer(){
		LocalDate localDate = dateLoyer.getValue();
		String montant = txtMontantLoyer.getText();
		Double montantLoyer;
		montantLoyer = Double.parseDouble(montant);
		Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
		Date date = Date.from(instant);
		CotisationLoyer cotisation = new CotisationLoyer(montantLoyer, date);
		cotisation.setIdMembre(membre.getEmail());
		ajouterCotisationLoyer(cotisation);
	}
	private void ajouterCotisationLoyer(CotisationLoyer cotisation){
		CotisationLoyerDao cotisationLoyerDao =  new CotisationLoyerImpl();
		cotisationLoyerDao.create(cotisation);
		tableLoyer.getItems().add(cotisation);
	}
	private void ajouterCotisationKST(){
		LocalDate localDate = dateKST.getValue();
		String montant = montantKST.getText();
		char type = TypeCotisation.valueOf(cmbTypeCotisation.getValue()).getCodeType() ;
		Double montantLoyer;
		montantLoyer = Double.parseDouble(montant);
		Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
		Date date = Date.from(instant);
		CotisationKST cotisation = new CotisationKST(montantLoyer,type,  date);
		cotisation.setIdMembre(membre.getEmail());
		//TODO set Membre
		ajouterCotisationKST(cotisation);
	}
	private void ajouterCotisationKST(CotisationKST cotisation){
		CotisationKSTDao cotisationKSTDao =  new CotisationKSTImpl();
		cotisationKSTDao.create(cotisation);
		tableKST.getItems().add(cotisation);
	}
	private void ajouterCotisationEvenement(){
		String montant = txtMontantEvenement.getText();
		Double montantLoyer;
		montantLoyer = Double.parseDouble(montant);
		Date date = Utile.getDate(dateEvenement.getValue());
		Evenement even = cmbEvenement.getValue();
		CotisationEvenement cotisation = new CotisationEvenement(montantLoyer,date,even.getNomEvenement());
		cotisation.setIdMembre(membre.getEmail());
		ajouterCotisationEvenement(cotisation);
	}
	private void ajouterCotisationEvenement(CotisationEvenement cotisation){
		CotisationEvenementDao cotisationEvenementDao =  new CotisationEvenementImpl();
		cotisationEvenementDao.create(cotisation);
		tableEvenement.getItems().add(cotisation);
	}
	
	private void fillComboBox(ComboBox<String> cmb, Set<String> data){
    	ObservableList<String> options = 
    		    FXCollections.observableArrayList();
    	options.addAll(data);
    	
    	cmb.setItems(options);
    	
    }
	
	private void fillComboBoxTypeCotisagtionKST(ComboBox<String> cmb){
    	ObservableList<String> options = 
    		    FXCollections.observableArrayList();
    	options.add(TypeCotisation.MENSUEL.name());
    	options.add(TypeCotisation.AUTRE.name());
    	
    	cmb.setItems(options);
    	cmb.setValue(TypeCotisation.MENSUEL.name());
    	
    }
	private void fillComboBoxEvenement(){
		EvenementDao evenementDao = new EvenementDaoImpl();
		evenementData.clear();
		for (Evenement e : evenementDao.getAll(LIST_EVENEMENT)) {
			Evenement evenement = e;
			evenementData.add(evenement);
		}
		cmbEvenement.setItems(evenementData);
	}
	
	private void initialiserTabLoyer(){
		HandleButtonAjouterLoyer();
		handleComboBoxCotisationLoyer();
		tableLoyer.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<CotisationLoyer>() {
			
			@Override
			public void changed(
					ObservableValue<? extends CotisationLoyer> observable,
					CotisationLoyer oldValue, CotisationLoyer newValue) {
				//TODO gerer cas null a cause du filtre change detect
				System.out.println("Click montant : "+((newValue==null)?"vide":newValue.getMontant()));
				
			}
		});
		tableLoyerDate.setCellValueFactory(new Callback<CellDataFeatures<CotisationLoyer, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<CotisationLoyer, String> obj) {
		         return new SimpleStringProperty(new SimpleDateFormat("dd/MM/yyyy").format(obj.getValue().getDate()));
		     }
		  });
		tableLoyerMontant.setCellValueFactory(new Callback<CellDataFeatures<CotisationLoyer, Double>, ObservableValue<Double>>() {
		     public ObservableValue<Double> call(CellDataFeatures<CotisationLoyer, Double> obj) {
		         return new ReadOnlyObjectWrapper<Double>(obj.getValue().getMontant());
		     }
		  });
	}
	private void initialiserTabKST(){
		HandleButtonAjouterKST();
		handleComboBoxCotisationKST();
		fillComboBoxTypeCotisagtionKST(cmbTypeCotisation);
		tableKSTDate.setCellValueFactory(new Callback<CellDataFeatures<CotisationKST, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<CotisationKST, String> o) {
		         return new SimpleStringProperty(new SimpleDateFormat("dd/MM/yyyy").format(o.getValue().getDateCotisationKST()));
		     }
		  });
		tableKSTMontant.setCellValueFactory(new Callback<CellDataFeatures<CotisationKST, Double>, ObservableValue<Double>>() {
		     public ObservableValue<Double> call(CellDataFeatures<CotisationKST, Double> p) {
		         return new ReadOnlyObjectWrapper<Double>(p.getValue().getMontant());
		     }
		  });
	}
	private void initialiserTabEvenement(){
		HandleButtonAjouterEvenement();
		handleComboBoxCotisationEvenement();
		tableEvenementDate.setCellValueFactory(new Callback<CellDataFeatures<CotisationEvenement, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<CotisationEvenement, String> o) {
		         return new SimpleStringProperty(new SimpleDateFormat("dd/MM/yyyy").format(o.getValue().getDateCotisation()));
		     }
		  });
		tableEvenementMontant.setCellValueFactory(new Callback<CellDataFeatures<CotisationEvenement, Double>, ObservableValue<Double>>() {
		     public ObservableValue<Double> call(CellDataFeatures<CotisationEvenement, Double> p) {
		         return new ReadOnlyObjectWrapper<Double>(p.getValue().getMontant());
		     }
		  });
		tableColumnEvenement.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<CotisationEvenement,String>, ObservableValue<String>>() {
			
			@Override
			public ObservableValue<String> call(
					CellDataFeatures<CotisationEvenement, String> param) {
				// TODO Auto-generated method stub
				return new SimpleStringProperty(param.getValue().getIdEven());
			}
		});
	}
	
	

}
