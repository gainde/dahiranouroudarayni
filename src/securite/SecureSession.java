package securite;

import java.awt.AWTEvent;
import java.awt.Toolkit;
import java.awt.event.AWTEventListener;

public class SecureSession {
	private Session session;
	
	private void trackSystemEvents()
	{
		Toolkit.getDefaultToolkit().addAWTEventListener(new AWTEventListener(){
			public void eventDispatched(AWTEvent event)
			{
				String eventText = event.toString();
				if(eventText.indexOf("PRESSED") != -1 || eventText.indexOf("RELEASED") != -1)
				{
					Session.getInstance().setLastActionTime(System.currentTimeMillis());
				}
			} }, AWTEvent.MOUSE_EVENT_MASK + AWTEvent.KEY_EVENT_MASK);
	}

}
