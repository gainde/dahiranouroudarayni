package javafx.aide;

import java.net.URL;

import javafx.geometry.HPos;
import javafx.geometry.VPos;
import javafx.scene.Node;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

public class BrowserHelp extends Region {
	final WebView browser = new WebView();
    final WebEngine webEngine = browser.getEngine();
     
    public BrowserHelp() {
    	super();
        //apply the styles
        //getStyleClass().add("browser");
        // load the web page
    	URL urlHello = getClass().getResource("../../META-INF/aide.html");
        webEngine.load(urlHello.toExternalForm());
        //webEngine.load("/src/META-INF/aide.html");
        //add the web view to the scene
        getChildren().add(browser);
 
    }
	
}
