package common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class SMTPAuthenticator extends Authenticator {
    
    PasswordAuthentication pwa;
    
    public SMTPAuthenticator() {
        String email = "a01025869419@gmail.com";
        String pwd = "tknmnhfprbfjfkru";
        
        pwa = new PasswordAuthentication(email, pwd);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pwa;
    }
    
}