package javafx;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;



public class SendMessage {
	private String objet;
	private String message;
	private String emailDestination;
	private String pathFile;
	
	public String getObjet() {
		return objet;
	}


	public String getMessage() {
		return message;
	}


	public String getEmailDestination() {
		return emailDestination;
	}


	public void setObjet(String objet) {
		this.objet = objet;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public void setEmailDestination(String emailDestination) {
		this.emailDestination = emailDestination;
	}


	public String getPathFile() {
		return pathFile;
	}


	public void setPathFile(String pathFile) {
		this.pathFile = pathFile;
	}


	//Send an Email via Gmail SMTP server using TLS connection.
	public void sendMessage(String adressEmail, String motDepasse) {
		
		File file = new File(pathFile);
        FileDataSource datasource1 = new FileDataSource(file);
        DataHandler handler1 = new DataHandler(datasource1);
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(adressEmail, motDepasse);
			}
		  });
 
		try {
			MimeMultipart mimeMultipart = new MimeMultipart();

			MimeBodyPart content = new MimeBodyPart();
            content.setContent(message, "text/plain");
            mimeMultipart.addBodyPart(content);
	        
			
	        MimeBodyPart autruche = new MimeBodyPart();
	        autruche.setDataHandler(handler1);
	        autruche.setFileName(datasource1.getName());
	        mimeMultipart.addBodyPart(autruche);
	        
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(adressEmail));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(emailDestination));
			message.setSubject(objet);

            message.setContent(mimeMultipart);
 
			Transport.send(message);
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}


