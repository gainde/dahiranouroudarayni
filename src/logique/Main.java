package logique;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.codec.Base64.OutputStream;

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
