package validation;


import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javafx.geometry.Bounds;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Background;
import javafx.scene.text.Text;
import logique.Main;


public abstract  class Validateur {
	protected TextField texte;
	protected Text labelErr;
	protected boolean nullable;
	protected ValidationErreur validationErr;
	protected String plus;
	private static AnchorPane anc;
	protected ImageView iv1;
	
	public  ImageView getIv1() {
		return iv1;
	}
	public static void setAnc(AnchorPane anc) {
		Validateur.anc = anc;
	}
	
	public Validateur() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Validateur(TextField texte, Text labelErr, boolean nullable,
			ValidationErreur validationErr) {
		super();
		this.texte = texte;
		this.labelErr = labelErr;
		this.nullable = nullable;
		this.validationErr = validationErr;
	}
	public Validateur(Text labelErr, boolean nullable,
			ValidationErreur validationErr) {
		super();
		this.labelErr = labelErr;
		this.nullable = nullable;
		this.validationErr = validationErr;
	}
	
	public abstract boolean valider();

	public String getTexte() {
		return texte.getText();
	}

	public Text getLabelErr() {
		return labelErr;
	}

	public boolean isNullable() {
		return nullable;
	}

	public ValidationErreur getValidationErr() {
		return validationErr;
	}

	public void setTexte(String texte) {
		this.texte.setText(texte);
	}

	public void setLabelErr(Text labelErr) {
		this.labelErr = labelErr;
	}

	public void setNullable(boolean nullable) {
		this.nullable = nullable;
	}

	public void setValidationErr(ValidationErreur validationErr) {
		this.validationErr = validationErr;
	}
	
	//validateur super classe
	public  boolean valider(String textPatern){
		AfficherImageValider();
		boolean valide = false;
		String email = texte.getText();
		if(email == null || email.isEmpty()){
			if(!nullable){
				
				texte.getStyleClass().add("error");
				labelErr.setText(validationErr.getMessageErr());
				labelErr.setVisible(true);
				
				
			}
			valide = nullable;
		}
		else{
			//TODO check if pattern match
			Matcher matcher = Pattern.compile(textPatern).matcher(email);
			valide = matcher.matches();
			if(!valide){
				texte.getStyleClass().add("error");
				labelErr.setText(validationErr.getMessageErr2());
				labelErr.setVisible(true);
				
			}
			if(valide){
				texte.getStyleClass().remove("error");
				labelErr.setVisible(false);
				
			}
			texte.getStyleClass().remove("error");
		}
		iv1.setVisible(valide);
		return valide;
	}
	
	public void AfficherImageValider(){
		
		if(iv1 != null)
			return;
		
		Image image = new Image("META-INF/images/Valider.png");
	    //simple displays ImageView the image as is
        iv1 = new ImageView();
        iv1.setFitWidth(10);iv1.setFitHeight(10);
        Bounds b = texte.localToScene(texte.getBoundsInLocal());
        iv1.setX(b.getMaxX());iv1.setY(b.getMinY());
        iv1.setImage(image);
        anc.getChildren().add(iv1);
	}
	
	public void setTransparentTextField(TextField textField){
		textField.setBackground(Background.EMPTY);
	}
}
