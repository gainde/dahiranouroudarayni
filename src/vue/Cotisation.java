package vue;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.ResourceBundle;

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
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import tests.sample;

import com.sun.glass.ui.Application;

import entites.CotisationLoyer;

public class Cotisation implements Initializable{
	@FXML private TableView<CotisationLoyer> tableLoyer ;
	@FXML private TableView tableKST ;
	@FXML private TableView tableEvenement ;
	
    @FXML private TableColumn tableLoyerDate;
    @FXML private TableColumn tableLoyerMontant;
    @FXML private TableColumn tableKSTDate;
    @FXML private TableColumn tableKSTMontant;
    @FXML private TableColumn tableEvementDate;
    @FXML private TableColumn tableEvenementMontant;
    @FXML private DatePicker dateLoyer;
    @FXML private DatePicker dateKST;
    @FXML private DatePicker dateEvenement;
    
    @FXML private TextField txtMontantLoyer;
    @FXML private TextField txtMontantKST;
    @FXML private TextField txtMontantEvenement;
    
    @FXML private Button btnAjouterLoyer;
    @FXML private Button btnAjouterKST;
    @FXML private Button btnAjouterEvenement;
    
    @FXML private ComboBox<String> cmbAnneeLoyer;
    @FXML private ComboBox cmbAnneeKST;
    @FXML private ComboBox cmbAnneeEvenement;
    
    @FXML private Label lbMembre;
    
    
    private Stage stage;


    public void setStage(Stage stage) {
        this.stage = stage;
    }
    
    private void HandleButtonAjouter(){
    	System.out.println("COrrect!!!");
    	btnAjouterLoyer.setOnMouseReleased(new EventHandler<Event>() {

			@Override
			public void handle(Event event) {
				// TODO Auto-generated method stub
				System.out.println("Mouse release!!!");
				ajouterCotisationLoyer();
				
			}
		});
    }
    private void fillComboBox(){
    	ObservableList<String> options = 
    		    FXCollections.observableArrayList();
    	SimpleDateFormat format = new SimpleDateFormat("yyyy");
    	
    	//récupérer un EntityManagerFactory à  partir de l'unité de persistance
    			EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
    			// récupérer un EntityManager à  partir de l'EntityManagerFactory
    			EntityManager em = emf.createEntityManager();
    			// début transaction
    			EntityTransaction tx = em.getTransaction();
    			tx.begin();
    			
    			System.out.println("[Cotisation]");
    			for (Object p : em.createQuery("select c from CotisationLoyer c order by c.datecotisation asc").getResultList()) {
    				CotisationLoyer cotisation = (CotisationLoyer)p;
    				options.add(format.format(cotisation.getDate()));
    				System.out.println(cotisation);
    			}
    			
    			// fin transaction
    			tx.commit();
    			// fin EntityManager
    			em.close();
    			// fin EntityManagerFactory
    			emf.close();
    			// log
    			System.out.println("terminé ...");
    			
    	
    	options.add("2010");
    	options.add("2011");
    	options.add("2012");
    	options.add("2013");
    	cmbAnneeLoyer.setItems(options);
    	cmbAnneeLoyer.valueProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable,
					String oldValue, String newValue) {
				// TODO Auto-generated method stub
				System.out.println(" valeur choisi = "+newValue);
				
			}
		});
    }

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		HandleButtonAjouter();
		fillComboBox();
	}
	
	public void ajouterCotisationLoyer(){
		LocalDate localDate = dateLoyer.getValue();
		String montant = txtMontantLoyer.getText();
		float montantLoyer;
		montantLoyer = Float.parseFloat(montant);
		Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
		Date date = Date.from(instant);
		System.out.println(localDate + "\n" + instant + "\n" + date);
		CotisationLoyer cotisation = new CotisationLoyer(montantLoyer, date);
		ajouterCotisationLoyer(cotisation);
	}
	
	public void ajouterCotisationLoyer(CotisationLoyer cotisation){
		//ObservableList<CotisationLoyer> data = FXCollections.<CotisationLoyer>sequence(cotisation);

		//tableLoyer.setItems(data);
		//récupérer un EntityManagerFactory à  partir de l'unité de persistance
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
		// récupérer un EntityManager à  partir de l'EntityManagerFactory
		EntityManager em = emf.createEntityManager();
		// début transaction
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		
		em.persist(cotisation);
		
		System.out.println("[Cotisation]");
		for (Object p : em.createQuery("select c from CotisationLoyer c order by c.datecotisation asc").getResultList()) {
			System.out.println(p);
		}
		
		// fin transaction
		tx.commit();
		// fin EntityManager
		em.close();
		// fin EntityManagerFactory
		emf.close();
		// log
		System.out.println("terminé ...");
	}

}
