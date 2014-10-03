package entites;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity
@Table(name="utilisateur")
public class Utilisateur implements Serializable{
	@Id
	@Column(length = 30, nullable = false, unique = true)
	private String login;
	
	@Column(length = 30, nullable=false)
	private String pass;
	
	@Column(length = 30, nullable = false, unique = true)
	private String groupe;
	
	@Column(length = 30, nullable = false, unique = true)
	private String email;
	
	@Transient
	private String IdSession;
	@Transient
	private String loginEmailServeur;
	@Transient
	private String motDePasseEmailServeur;
	
	public Utilisateur(){}

	public Utilisateur(String login, String pass, String groupe, String email) {
		super();
		this.login = login;
		this.pass = pass;
		this.groupe = groupe;
		this.email = email;
	}
	public Utilisateur(String login, String pass) {
		super();
		this.login = login;
		this.pass = pass;
	}

	public String getLogin() {
		return login;
	}

	public String getPass() {
		return pass;
	}

	public String getGroupe() {
		return groupe;
	}


	public String getEmail() {
		return email;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public void setGroupe(String groupe) {
		this.groupe = groupe;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIdSession() {
		return IdSession;
	}

	public void setIdSession(String idSession) {
		IdSession = idSession;
	}

	public String getLoginEmailServeur() {
		return loginEmailServeur;
	}

	public void setLoginEmailServeur(String loginEmailServeur) {
		this.loginEmailServeur = loginEmailServeur;
	}

	public String getMotDePasseEmailServeur() {
		return motDePasseEmailServeur;
	}

	public void setMotDePasseEmailServeur(String motDePasseEmailServeur) {
		this.motDePasseEmailServeur = motDePasseEmailServeur;
	}	
}
