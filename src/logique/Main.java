package logique;

import javafx.application.Application;
import javafx.home.Home;
import javafx.membre.Membres;

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
		Application.launch(Home.class);
		/*
		try {
            FileOutputStream file = new FileOutputStream(new File("Test.pdf"));
            Document document = new Document();
            PdfWriter.getInstance(document, file);
            document.open();
            document.add(new Paragraph("Hello World, iText"));
            document.add(new Paragraph(new Date().toString()));
            document.close();
            file.close();
        } catch (Exception e) {
            e.printStackTrace();
        }*/
		
	}
	
}
