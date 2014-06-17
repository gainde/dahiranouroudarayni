package logique;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import javafx.application.Application;
import javafx.home.Home;
import javafx.membre.Membres;

public class Main {
	
	public static  void main(String args[]){
		StringBuffer output = new StringBuffer();
		Process p;
		try {
		p = Runtime.getRuntime().exec("/Applications/MAMP/bin/start.sh");
			p.waitFor();
			BufferedReader reader = 
                    new BufferedReader(new InputStreamReader(p.getInputStream()));

                String line = "";			
                while ((line = reader.readLine())!= null) {
                	output.append(line + "\n");
                }
                System.out.println(output);
			Application.launch(Home.class);
 
		} catch (Exception e) {
			e.printStackTrace();
		}
 
		
		
	}
	
}
