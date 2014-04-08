package vue;

import java.awt.Color;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import validation.ValidationErreur;
import validation.ValideurTelephone;


public class FrameTest extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JLabel labelErr;
	private JLabel lblNewLabel ;
	private JButton btnValider;
	private ValideurTelephone validateurTel;

	/**
	 * Create the frame.
	 */
	public FrameTest() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		lblNewLabel = new JLabel("Telephone");
		lblNewLabel.setBounds(31, 23, 105, 25);
		contentPane.add(lblNewLabel);
		
		textField = new JTextField();
		textField.setBounds(150, 25, 124, 20);
		contentPane.add(textField);
		textField.setColumns(10);
		
		labelErr = new JLabel("");
		labelErr.setBounds(316, 28, 300, 14);
		labelErr.setForeground(Color.RED);
		contentPane.add(labelErr);
		
		btnValider = new JButton("Valider");
		btnValider.setBounds(150, 100, 89, 23);
		contentPane.add(btnValider);
		validateurTel = new ValideurTelephone(textField, labelErr, false, ValidationErreur.TELEPHONE_ERR);
	}

	public JTextField getTextField() {
		return textField;
	}

	public JLabel getLabelErr() {
		return labelErr;
	}

	public JLabel getLblNewLabel() {
		return lblNewLabel;
	}

	public JButton getBtnValider() {
		return btnValider;
	}

	public void setTextField(JTextField textField) {
		this.textField = textField;
	}

	public void setLabelErr(JLabel labelErr) {
		this.labelErr = labelErr;
	}

	public void setLblNewLabel(JLabel lblNewLabel) {
		this.lblNewLabel = lblNewLabel;
	}

	public void setBtnValider(JButton btnValider) {
		this.btnValider = btnValider;
	}

	public ValideurTelephone getValidateurTel() {
		return validateurTel;
	}

	public void setValidateurTel(ValideurTelephone validateurTel) {
		this.validateurTel = validateurTel;
	}
	
	
	
}
