/**
 * http://howtodoinjava.com
 *
 */
package securite;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class SecurePass {
	public static void main(String args[]){
		String stringmd5 = "fqdc0740";
		System.out.println(md5(stringmd5));
	}
	public static String md5(String pass){
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(pass.getBytes());
            //Get the hash's bytes 
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
            MessageDigest md2 = MessageDigest.getInstance("MD5");
        } 
        catch (NoSuchAlgorithmException e) 
        {
            e.printStackTrace();
        }
        return generatedPassword;
		
	}
}