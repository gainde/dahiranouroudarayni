package entites;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="utilisateur")
public class Utilisateur implements Serializable{
	@Id
	@Column(length = 30, nullable = false, unique = true)
	private String login;
	
	@Column(length = 30, nullable=false)
	private String pass;
	
	public Utilisateur(){}

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

	public void setLogin(String login) {
		this.login = login;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
