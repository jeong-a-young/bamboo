package mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {

	// 1. 회원가입
	
	// 인증 메일 전송
	public int registerMailSend() {	
		Properties prop = System.getProperties();
        // 로그인 시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		// 이메일 발송을 처리해줄 SMTP서버
		prop.put("mail.smtp.host", "smtp.gmail.com");
		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");
		// TLS의 포트번호 = 587 (SSL을 사용할 시 465)
		prop.put("mail.smtp.port", "587");
		Authenticator auth = new SMTPAuthenticator();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);

		int n = 0;
		
		try {
			msg.setSentDate(new Date());
			// 발송자 메일, 발송자명
			msg.setFrom(new InternetAddress("a01025869419@gmail.com", "bamboo"));
            // 수신자 메일
			InternetAddress to = new InternetAddress("a01025869419@gmail.com");
            // Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정
			msg.setRecipient(Message.RecipientType.TO, to);
            // 메일 제목
			msg.setSubject("회원가입 시 인증 코드를 확인해 주세요.", "UTF-8");
			// 메일 내용
			msg.setText("bamboo에 가입하신 것을 환영합니다.\n해당 메일의 발송자명을 인증 코드 창에 적어주세요.", "UTF-8");
            // 메일을 최종적으로 보내는 클래스
			Transport.send(msg);
			n += 1;
		} catch (AddressException ae) {
			System.out.println("AddressException: " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException: " + me.getMessage());
		} catch (UnsupportedEncodingException ue) {
			System.out.println("UnsupportedEncodingException: " + ue.getMessage());
		}
		
		return n;
	}
	
	// 2. 로그인
	
	// ID 찾기
	
}