package logique;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javafx.AuthentificationDialog;

import javax.swing.JDialog;
import javax.swing.JFrame;

import dao.UtilisateurDao;

public class Authentification{
	private AuthentificationDialog dialog;
	JDialog jtest = new JDialog();
	UtilisateurDao user;

	public Authentification(final JFrame parent, boolean modal){
		dialog = new AuthentificationDialog(parent, modal);
		addListener(parent);
	}
	
	private void addListener(final JFrame parent){
		dialog.addWindowListener(new WindowAdapter() {  
            @Override
            public void windowClosing(WindowEvent e) {  
                System.exit(0);  
            }  
        });
		
		dialog.getBoutonOk().addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            	String user = dialog.getUsernameField().getText();
            	String pass = dialog.getPasswordField().getPassword().toString();
            	if(veriferMotDePasse(user, pass)){
            		parent.setVisible(true);
            		dialog.setVisible(false);
            	}
            	boolean valide = veriferMotDePasse(dialog.getUsernameField().getText(), dialog.getPasswordField().getPassword().toString());
                if (valide) {
                	//TODO afficher la fï¿½netre
                	dialog.getLabelStatus().setText("Mot de passe valide");
                } else {
                	dialog.getLabelStatus().setText("Mot de passe invalide");
                }
            }
        });
		
		dialog.getBoutonCancel().addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                setVisible(false);
                parent.dispose();
                System.exit(0);
            }
        });
	}
	
	private boolean veriferMotDePasse(String user, String pass){
		//TODO verifier dans la base de données
		//TODO appeler la classe DAO et verifier la vérification retourne true
		
		return false;
	}
	
	public void setVisible(boolean value){
		dialog.setVisible(value);
	}

}
