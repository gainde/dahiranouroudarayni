package javafx.login;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import securite.SecurePass;
import dao.UtilisateurDao;
import daoimpl.UtilisateurDaoImpl;
import entites.Utilisateur;

public class LoginController implements Initializable{
	
	 @FXML private TextField txtIdentifiant;
	 @FXML private Button btnLogin;
	 @FXML private Label lbError;
	 @FXML private PasswordField txtMotDePasse;
	  
	 private Stage stage;
	 private Stage stageFocus;
	 private Utilisateur user;
	 
	 private final String USER_SELECT = "select u from Utilisateur u where u.login = ?1 and u.pass = ?2";
	 
	 @Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
	 	HandleButtonLogin();
	}
    
    public void setStage(Stage stage) {
        this.stage = stage;
    }
	    
	    
	    //Initialiser les evenements
	    private void HandleButtonLogin(){
	    	btnLogin.setOnMouseReleased(new EventHandler<Event>() {
	    		
				@Override
				public void handle(Event event) {
					System.out.println("click");
					user = verifierLogin();
				}
			});
	    }
	    
	    private Utilisateur verifierLogin(){
	    	String id = txtIdentifiant.getText();
	    	String pass = SecurePass.md5(txtMotDePasse.getText());
	    	UtilisateurDao userDao = new UtilisateurDaoImpl();
	    	Utilisateur user  = userDao.verifierLoginPass(USER_SELECT, id, pass);
	    	if(user == null)
	    		System.out.println("Erreur pas correct");
	    	else System.out.println("Login correct");
	    	//TODO Charger vue principale
	    	return user;
	    }
	    
	    private void creerUser(){
	    	String id = txtIdentifiant.getText();
	    	String pass = SecurePass.md5(txtMotDePasse.getText());
	    	Utilisateur user = new Utilisateur(id, pass);
	    	UtilisateurDao userDao = new UtilisateurDaoImpl();
	    	userDao.create(user);
	    }

}
