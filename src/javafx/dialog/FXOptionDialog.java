package javafx.dialog;

import javafx.dialog.DialogController.Response;
import javafx.loadview.LoadManagerView;
import javafx.stage.Stage;


public class FXOptionDialog {
	
	private static Response buttonSelected = Response.NON;
	
	
	public static Response showConfirmDialog( Stage owner, String message, String title ) {
		DialogController diag = LoadManagerView.afficherVueDialog(owner);
		buttonSelected = diag.showConfirmDialog(message, title);
		
	    return buttonSelected;
	}
	
}