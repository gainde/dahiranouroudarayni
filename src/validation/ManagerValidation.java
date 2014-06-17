package validation;

import java.util.ArrayList;
import java.util.List;

import javafx.animation.KeyFrame;
import javafx.animation.KeyValue;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.scene.Cursor;
import javafx.scene.Node;
import javafx.scene.layout.AnchorPane;
import javafx.util.Duration;

public class ManagerValidation{
	private ArrayList<Validateur> valideList = new ArrayList<Validateur>();
	
	public ManagerValidation() {
		
	}
	
	
	public ArrayList<Validateur> getValideList() {
		return valideList;
	}

	public void setValideList(ArrayList<Validateur> valideList) {
		this.valideList = valideList;
	}

	public Validateur add(Validateur val) {
		valideList.add(val);
		return val;
	}

	public Boolean valider() {
		boolean valide = true;
		for (Validateur p : valideList) {
			valide &=p.valider();
		}
		return valide;
	}
	public Boolean valider(Validateur p) {
		return p.valider();
	}
	
	public void setVisibleImageValidate(){
		
	}
	
	// effacer la liste de validation
	public void clearListOfValidation(){
		if(!valideList.isEmpty())
			valideList.clear();
	}
	
	// mettre a jour la table de view
	 public void updateAnchorePane(int nbChilds, AnchorPane anc) {
	 		List<Node> listChilds = anc.getChildren();
	 		for(Node p :listChilds.subList(nbChilds, listChilds.size())){
	 				p.setVisible(false);
	 		}
	 		
	 	}
	 
	//cacher le message de confirmation si le temps est fini
	  	public void hideBoxErr(Node node, Node closeShape, Timeline timeline){
	      	timeline.setOnFinished(new EventHandler<ActionEvent>() {
	  			@Override
	  			public void handle(ActionEvent event) {
	  				// TODO Auto-generated method stub
	  				node.setVisible(false);
	  			}
	  		    });
	      	closeShape.setCursor(Cursor.CLOSED_HAND);
	      	closeShape.setOnMousePressed(new EventHandler<Event>() {
	  			@Override
	  			public void handle(Event event) {
	  				System.out.println("Dans Croix");
	  				node.setVisible(false);
	  			}
	  		});
	  	}
	    
	    //animation message d erreur
	    public void animate(Node node, Timeline timeline){
	        	//timeline = new Timeline();
	    		timeline.getKeyFrames().addAll(
	    		    new KeyFrame(Duration.ZERO, new KeyValue(node.scaleXProperty(), 0)),
	    		    new KeyFrame(new Duration(1000), new KeyValue(node.scaleXProperty(), 1)),
	    		    new KeyFrame(new Duration(60000), new KeyValue(node.scaleXProperty(), 1))
	    		);
	    		//timeline.setCycleCount(10);
	    		//timeline.setAutoReverse(false);
	    		timeline.play();
	    }
	      		
}
