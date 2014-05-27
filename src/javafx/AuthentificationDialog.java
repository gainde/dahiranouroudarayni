package javafx;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

public class AuthentificationDialog extends JDialog {

    private final JLabel jlblUsername = new JLabel("Username");
    private final JLabel jlblPassword = new JLabel("Password");

    private final JTextField jtfUsername = new JTextField(15);
    private final JPasswordField jpfPassword = new JPasswordField();

    private final JButton jbtOk = new JButton("Login");
    private final JButton jbtCancel = new JButton("Cancel");

    private final JLabel jlblStatus = new JLabel(" ");

    public AuthentificationDialog() {
        this(null, true);
    }

    public AuthentificationDialog(final JFrame parent, boolean modal) {
        super(parent, modal);

        JPanel p3 = new JPanel(new GridLayout(2, 1));
        p3.add(jlblUsername);
        p3.add(jlblPassword);

        JPanel p4 = new JPanel(new GridLayout(2, 1));
        p4.add(jtfUsername);
        p4.add(jpfPassword);

        JPanel p1 = new JPanel();
        p1.add(p3);
        p1.add(p4);

        JPanel p2 = new JPanel();
        p2.add(jbtOk);
        p2.add(jbtCancel);

        JPanel p5 = new JPanel(new BorderLayout());
        p5.add(p2, BorderLayout.CENTER);
        p5.add(jlblStatus, BorderLayout.NORTH);
        jlblStatus.setForeground(Color.RED);
        jlblStatus.setHorizontalAlignment(SwingConstants.CENTER);

        setLayout(new BorderLayout());
        add(p1, BorderLayout.CENTER);
        add(p5, BorderLayout.SOUTH);
        pack();
        setLocationRelativeTo(null);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
    
    }

	public JLabel getLabelUsername() {
		return jlblUsername;
	}

	public JLabel getLabelPassword() {
		return jlblPassword;
	}

	public JTextField getUsernameField() {
		return jtfUsername;
	}

	public JPasswordField getPasswordField() {
		return jpfPassword;
	}

	public JButton getBoutonOk() {
		return jbtOk;
	}

	public JButton getBoutonCancel() {
		return jbtCancel;
	}

	public JLabel getLabelStatus() {
		return jlblStatus;
	}
    
    
    
}
