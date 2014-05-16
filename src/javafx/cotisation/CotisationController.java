package javafx.cotisation;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
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
import dao.CotisationEvenementDao;
import dao.CotisationKSTDao;
import dao.CotisationLoyerDao;
import daoimpl.CotisationEvenementImpl;
import daoimpl.CotisationKSTImpl;
import daoimpl.CotisationLoyerImpl;
import entites.CotisationEvenement;
import entites.CotisationKST;
import entites.CotisationLoyer;
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
    
   
    private Stage stage;
    ObservableList<CotisationLoyer> loyerData = FXCollections.observableArrayList();
    ObservableList<CotisationKST> KSTData = FXCollections.observableArrayList();
    ObservableList<CotisationEvenement> EvenementData = FXCollections.observableArrayList();
    private final String LIST_COTISATION_LOYER = "select c from CotisationLoyer c";
    private final String LIST_COTISATION_KST = "select c from CotisationKST c";
    private final String LIST_COTISATION_EVENEMENT = "select c from CotisationEvenement c";
    
    final String LOYER_TAB_ID = "loyerTab";
	final String KST_TAB_ID = "KSTTab";
	final String EVENEMENT_TAB_ID = "evenementTab";
	
	final char COTISATION_KST_MENSUEL = '1';
	final char COTISATION_KST_AUTRE = '0';
	
	private Membre membre;
	
    @Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
    	handleTabPaneCotisation();
		initialiserTabLoyer();
		initialiserTabKST();
		initialiserTabEvenement();
		chargerCotisationLoyer();
	}
    
    public void setStage(Stage stage) {
        this.stage = stage;
    }
    public Membre getMembre(){
    	return this.membre;
    }
    
    public void setMembre(Membre m){
    	this.membre = m;
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
    
    private void handleComboBoxLoyer(){
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
    private void handleComboBoxKST(){
    	cmbAnneeKST.valueProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				// TODO Auto-generated method stub
				
			}
		});
    }
    private void handleComboBoxEvenement(){
    	cmbAnneeEvenement.valueProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				// TODO Auto-generated method stub
				
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
	
	private void chargerCotisationLoyer(){
		ObservableList<CotisationLoyer> cotisationLoyerData = FXCollections.observableArrayList();
		CotisationLoyerDao cotisationLoyerDao = new CotisationLoyerImpl();
		ArrayList<String> cmbData = new ArrayList<String>();
		
		for (Object p : cotisationLoyerDao.getAll(LIST_COTISATION_LOYER)) {
			CotisationLoyer loyer = (CotisationLoyer)p;
			cotisationLoyerData.add(loyer);
			cmbData.add(new SimpleDateFormat("yyyy").format(loyer.getDate()));
		}
		loyerData = cotisationLoyerData;
		tableLoyer.setItems(loyerData);
		fillComboBox(cmbAnneeLoyer, cmbData);
	}
	private void chargerCotisationKST(){
		ObservableList<CotisationKST> cotisationKSTData = FXCollections.observableArrayList();
		CotisationKSTDao cotisationKSTDao = new CotisationKSTImpl();
		ArrayList<String> cmbData = new ArrayList<String>();
		
		for (Object p : cotisationKSTDao.getAll(LIST_COTISATION_KST)) {
			CotisationKST kst = (CotisationKST)p;
			cotisationKSTData.add(kst);
			cmbData.add(new SimpleDateFormat("yyyy").format(kst.getDateCotisationKST()));
		}
		KSTData = cotisationKSTData;
		tableKST.setItems(KSTData);
		fillComboBox(cmbAnneeKST, cmbData);
	}
	private void chargerCotisationEvenement(){
		ObservableList<CotisationEvenement> cotisationEvenementData = FXCollections.observableArrayList();
		CotisationEvenementDao cotisationEvenementDao = new CotisationEvenementImpl();
		ArrayList<String> cmbData = new ArrayList<String>();
		
		for (Object p : cotisationEvenementDao.getAll(LIST_COTISATION_EVENEMENT)) {
			CotisationEvenement evenement = (CotisationEvenement)p;
			cotisationEvenementData.add(evenement);
			cmbData.add(new SimpleDateFormat("yyyy").format(evenement.getDateCotisation()));
		}
		EvenementData = cotisationEvenementData;
		tableEvenement.setItems(EvenementData);
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
		//TODO set Membre
		ajouterCotisationKST(cotisation);
	}
	private void ajouterCotisationKST(CotisationKST cotisation){
		CotisationKSTDao cotisationKSTDao =  new CotisationKSTImpl();
		cotisationKSTDao.create(cotisation);
		tableKST.getItems().add(cotisation);
	}
	private void ajouterCotisationEvenement(){
		LocalDate localDate = dateEvenement.getValue();
		String montant = txtMontantEvenement.getText();
		Double montantLoyer;
		montantLoyer = Double.parseDouble(montant);
		Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
		Date date = Date.from(instant);
		CotisationEvenement cotisation = new CotisationEvenement(montantLoyer,date);
		ajouterCotisationEvenement(cotisation);
	}
	private void ajouterCotisationEvenement(CotisationEvenement cotisation){
		CotisationEvenementDao cotisationEvenementDao =  new CotisationEvenementImpl();
		cotisationEvenementDao.create(cotisation);
		tableEvenement.getItems().add(cotisation);
	}
	
	private void fillComboBox(ComboBox<String> cmb, ArrayList data){
    	ObservableList<String> options = 
    		    FXCollections.observableArrayList();
    	SimpleDateFormat format = new SimpleDateFormat("yyyy");
    	options.addAll(data);
    	
    	cmb.setItems(options);
    	
    }
	
	private void fillComboBoxTypeCotisagtionKST(ComboBox<String> cmb){
    	ObservableList<String> options = 
    		    FXCollections.observableArrayList();
    	SimpleDateFormat format = new SimpleDateFormat("yyyy");
    	options.add(TypeCotisation.MENSUEL.name());
    	options.add(TypeCotisation.AUTRE.name());
    	
    	cmb.setItems(options);
    	cmb.setValue(TypeCotisation.MENSUEL.name());
    	
    }
	
	private void initialiserTabLoyer(){
		HandleButtonAjouterLoyer();
		handleComboBoxLoyer();
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
		     public ObservableValue<String> call(CellDataFeatures<CotisationLoyer, String> p) {
		         return new SimpleStringProperty(new SimpleDateFormat("dd/MM/yyyy").format(p.getValue().getDate()));
		     }
		  });
		tableLoyerMontant.setCellValueFactory(new Callback<CellDataFeatures<CotisationLoyer, Double>, ObservableValue<Double>>() {
		     public ObservableValue<Double> call(CellDataFeatures<CotisationLoyer, Double> p) {
		         return new ReadOnlyObjectWrapper(p.getValue().getMontant());
		     }
		  });
	}
	private void initialiserTabKST(){
		HandleButtonAjouterKST();
		handleComboBoxKST();
		fillComboBoxTypeCotisagtionKST(cmbTypeCotisation);
		tableKSTDate.setCellValueFactory(new Callback<CellDataFeatures<CotisationKST, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<CotisationKST, String> o) {
		         return new SimpleStringProperty(new SimpleDateFormat("dd/MM/yyyy").format(o.getValue().getDateCotisationKST()));
		     }
		  });
		tableKSTMontant.setCellValueFactory(new Callback<CellDataFeatures<CotisationKST, Double>, ObservableValue<Double>>() {
		     public ObservableValue<Double> call(CellDataFeatures<CotisationKST, Double> p) {
		         return new ReadOnlyObjectWrapper(p.getValue().getMontant());
		     }
		  });
	}
	private void initialiserTabEvenement(){
		HandleButtonAjouterEvenement();
		handleComboBoxEvenement();
		tableEvenementDate.setCellValueFactory(new Callback<CellDataFeatures<CotisationEvenement, String>, ObservableValue<String>>() {
		     public ObservableValue<String> call(CellDataFeatures<CotisationEvenement, String> o) {
		         return new SimpleStringProperty(new SimpleDateFormat("dd/MM/yyyy").format(o.getValue().getDateCotisation()));
		     }
		  });
		tableEvenementMontant.setCellValueFactory(new Callback<CellDataFeatures<CotisationEvenement, Double>, ObservableValue<Double>>() {
		     public ObservableValue<Double> call(CellDataFeatures<CotisationEvenement, Double> p) {
		         return new ReadOnlyObjectWrapper(p.getValue().getMontant());
		     }
		  });
	}

}
