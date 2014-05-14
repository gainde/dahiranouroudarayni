package logique;

import javafx.application.Application;
import javafx.membre.Membres;
import javafx.membre.ajout.AjouterMembres;
import javafx.membre.edit.EditerMembres;
import javafx.stage.Stage;
import javafx.application.Application;
import javafx.stage.Stage;

public class Main {
	
	public static  void main(String args[]){
		int etat = 0;
		//Test
		/*Authentification auth = new Authentification(null, true);
		auth.setVisible(true);*/
		//sample s = new sample();
		//Application.launch(sample.class);
		
		//Authentification auth = new Authentification(null, true);
		//.setVisible(true);
		Application.launch(Membres.class);
		
	}
	
}
