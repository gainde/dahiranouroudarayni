package javafx;

import java.awt.EventQueue;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

public class Authentification extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField textField_1;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Authentification frame = new Authentification();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Authentification() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 332, 224);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		textField = new JTextField();
		textField.setBounds(137, 61, 158, 20);
		contentPane.add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setBounds(137, 92, 158, 20);
		contentPane.add(textField_1);
		textField_1.setColumns(10);
		
		JButton btnEntrer = new JButton("Entrer");
		btnEntrer.setBounds(221, 123, 74, 20);
		contentPane.add(btnEntrer);
		
		JLabel lblLogin = new JLabel("Login");
		lblLogin.setBounds(30, 61, 86, 14);
		contentPane.add(lblLogin);
		
		JLabel lblMotDePasse = new JLabel("Mot de passe");
		lblMotDePasse.setBounds(30, 95, 86, 14);
		contentPane.add(lblMotDePasse);
		
		JButton btnQuitter = new JButton("Quitter");
		btnQuitter.setBounds(137, 123, 74, 20);
		contentPane.add(btnQuitter);
	}
}
