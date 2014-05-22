package javafx;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import entites.Dahira;
import entites.Membre;


public class GenererPdf {
		private String dateIpmot;
		private String dateDelivrance;
		private String montant;
	   
	    
	    public GenererPdf(String dateIpmot, String dateDelivrance,
				String montant) {
			super();
			this.dateIpmot = dateIpmot;
			this.dateDelivrance = dateDelivrance;
			this.montant = montant;
		}

		/**
	     * Creates a PDF document.
	     * @param filename the path to the new PDF document
	     * @throws    DocumentException 
	     * @throws    IOException 
	     ************/
	    public void createPdf(String filename, Membre member,Dahira dahira, String signature, int numberRecu) throws DocumentException, IOException {
	    	// creation de la page
	        Document document = new Document();
	        // indiquer le fichier à ecrire
	        PdfWriter.getInstance(document, new FileOutputStream(filename));
	        
	        document.open();
	     
	        PdfPTable table = tableDAtaMember(member,dahira,signature,numberRecu);
	        PdfPTable table1 = tableDAtaMember(member,dahira,signature,numberRecu);
	        
	        table.setSpacingAfter(25);table.setSpacingBefore(25);
	        
	        document.add(table);
	        document.add(table1);
	       
	        document.close();
	    }
	 
	    //fonction permettant de representer les données du membre dans un formulaire
	    public PdfPTable tableDAtaMember(Membre member,Dahira dahira,String signature, int numberRecu) throws DocumentException, MalformedURLException, IOException{
	    	
	    	String donateur = member.getPrenom() + "  " + member.getNom();
	    	String adresse = member.getAdresse().toString();
	    	String lieuDelivrance = member.getAdresse().toString();
	    	String nomDahira = dahira.getNomDahira();
	    	String numeroNE = dahira.getNumeroEnregistrement();
	    	String adresseDahira = dahira.getAdresse().toString();
	    	
	    	Font font1 = new Font(Font.FontFamily.TIMES_ROMAN, 11);
	    	Font font2 = new Font(Font.FontFamily.TIMES_ROMAN, 9);
	    	PdfPTable generalBig = new PdfPTable(1);
	    	generalBig.getDefaultCell().setBorderWidth(1.5f);
	    	
	    	PdfPTable general = new PdfPTable(1);
	    	general.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	    	
	    	PdfPTable t00 = new PdfPTable(1);
	    	t00.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	    	t00.getDefaultCell().setPaddingLeft(75);
	    	Chunk title = new Chunk("Reçu officiel de don aux fins de l'impôt sur le revenu",font1);
	    	title.setUnderline(1f, -2f);
	    	Paragraph titre = new Paragraph(title);
	    	titre.setAlignment(Element.ALIGN_CENTER);
	    	
	    	t00.addCell(titre);
	    	general.addCell(t00);

	    	PdfPTable t0 = new PdfPTable(1);
	        t0.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	    	Paragraph recu = new Paragraph();
	    	Chunk numeroRecu = new Chunk("No de reçu : ", font1);
	    	Chunk numero = new Chunk(Integer.toString(numberRecu), font1);
	    	numero.setUnderline(1f, -2f);
	    	recu.add(numeroRecu);
	    	recu.add(numero);
	    	 PdfPCell cell01 = new PdfPCell(recu);
	    	 cell01.setBorder(Rectangle.NO_BORDER);
	    	 cell01.setPaddingBottom(10);
	    	 t0.addCell(cell01);
	    	
	    	
	    	t0.addCell(new Paragraph(nomDahira, font1));
	    	t0.addCell(new Paragraph("NE : "+numeroNE, font1));
	    	t0.addCell(new Paragraph(adresseDahira, font1));
	    	t0.setSpacingAfter(10);t0.setSpacingBefore(10);
	    	
	    	general.addCell(t0);
	    	
	        PdfPTable t1 = new PdfPTable(2);
	        float[] columnWidths1 = {3f, 5f};
	        t1.setWidths(columnWidths1);
	        
	        PdfPCell cell11 = new PdfPCell(new Paragraph("Date de réception du don :", font1));
	        PdfPCell cell12 = new PdfPCell(new Paragraph(dateIpmot, font1));
	        cell11.setPaddingBottom(5);cell12.setPaddingBottom(5);
	        cell11.setBorder(Rectangle.NO_BORDER);cell12.setBorder(Rectangle.NO_BORDER);
	        cell12.setBorderWidthBottom(1);
	     
	     
	        t1.addCell(cell11);
	        t1.addCell(cell12);
	        general.addCell(t1);
	        
	        PdfPTable t2 = new PdfPTable(2);
	        float[] columnWidths2 = {1f, 5.5f};
	        t2.setWidths(columnWidths2);
	        
	        PdfPCell cell21 = new PdfPCell(new Paragraph("Donateur	:", font1));
	        PdfPCell cell22 = new PdfPCell(new Paragraph(donateur, font1));
	        cell21.setPaddingBottom(5);cell22.setPaddingBottom(5);
	        cell21.setBorder(Rectangle.NO_BORDER);cell22.setBorder(Rectangle.NO_BORDER);
	        cell22.setBorderWidthBottom(1);
	        PdfPCell cell23 = new PdfPCell(new Paragraph("Adresse 	:", font1));
	        PdfPCell cell24 = new PdfPCell(new Paragraph(adresse, font1));
	        cell23.setPaddingBottom(5);cell24.setPaddingBottom(5);
	        cell23.setBorder(Rectangle.NO_BORDER);cell24.setBorder(Rectangle.NO_BORDER);
	        cell24.setBorderWidthBottom(1);
	        
	        
	        t2.addCell(cell21);
	        t2.addCell(cell22);
	        t2.addCell(cell23);
	        t2.addCell(cell24);
	        general.addCell(t2);
	        
	        PdfPTable t3 = new PdfPTable(2);
	        float[] columnWidths3 = {4f, 1.2f};
	        t3.setWidths(columnWidths3);
	        PdfPCell cell31 = new PdfPCell(new Paragraph("Montant admissible du don aux fins de l’impôt sur le revenu :", font1));
	        PdfPCell cell32 = new PdfPCell(new Paragraph(montant, font1));
	        cell31.setPaddingBottom(5);cell32.setPaddingBottom(5);
	        cell31.setBorder(Rectangle.NO_BORDER);cell32.setBorder(Rectangle.NO_BORDER);
	        cell32.setBorderWidthBottom(1);
	        
	        
	        t3.addCell(cell31);
	        t3.addCell(cell32);
	        general.addCell(t3);
	        
	        PdfPTable t4 = new PdfPTable(2);
	        float[] columnWidths4 = {3f, 4.5f};
	        t4.setWidths(columnWidths4);
	        PdfPCell cell41 = new PdfPCell(new Paragraph("Date de la délivrance du reçu	:", font1));
	        PdfPCell cell42 = new PdfPCell(new Paragraph(dateDelivrance, font1));
	        cell41.setPaddingBottom(5);cell42.setPaddingBottom(5);
	        cell41.setBorder(Rectangle.NO_BORDER);cell42.setBorder(Rectangle.NO_BORDER);
	        cell42.setBorderWidthBottom(1);
	        PdfPCell cell43 = new PdfPCell(new Paragraph("Lieu de la délivrance du reçu	:", font1));
	        PdfPCell cell44 = new PdfPCell(new Paragraph(lieuDelivrance, font2));
	        cell43.setPaddingBottom(5);cell44.setPaddingBottom(5);
	        cell43.setBorder(Rectangle.NO_BORDER);cell44.setBorder(Rectangle.NO_BORDER);
	        cell44.setBorderWidthBottom(1);
	        
	        
	        t4.addCell(cell41);
	        t4.addCell(cell42);
	        t4.addCell(cell43);
	        t4.addCell(cell44);
	        general.addCell(t4);
	        
	        PdfPTable t5 = new PdfPTable(2);
	        //Image image = Image.getInstance(signature);
	        //image.scalePercent(0.5f);
	        
	        PdfPCell cell51 = new PdfPCell(new Paragraph("Signature autorisée :", font1));
	        PdfPCell cell52 = new PdfPCell(new Paragraph(signature, font1));
	        cell51.setPaddingBottom(25);cell52.setPaddingBottom(25);
	        cell51.setBorder(Rectangle.NO_BORDER);cell52.setBorder(Rectangle.NO_BORDER);
	        t5.addCell(cell51);
	        t5.addCell(cell52);
	        general.addCell(t5);
	        
	        
	        generalBig.addCell(general);
	        
	        return generalBig;
	        
	    }

}
