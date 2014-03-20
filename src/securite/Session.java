package securite;

public class Session {
	private static Session session;
	private long actionTime;
	   private Session(){ }
	   
	   public static Session getInstance( ) {
		   if(session == null)
			   session = new Session( ); 
	      return session;
	   }
	   
	   public void setLastActionTime(Long time){
		   actionTime = time;
	   }

}
