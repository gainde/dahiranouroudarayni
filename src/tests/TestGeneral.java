/**
 * 
 */
package tests;


import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import vue.FrameTest;

/**
 * @author Moussa
 *
 */
public class TestGeneral {
	public static void main(String[] args){
		final FrameTest frame = new FrameTest();
		frame.setVisible(true);
		frame.getBtnValider().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				frame.getLabelErr().setForeground(Color.RED);
				frame.getLabelErr().setText("");
				if(frame.getValidateurTel().valider()){
					frame.getLabelErr().setForeground(Color.GREEN);
					frame.getLabelErr().setText("Valide");
				}
			}
		});
	}
}
