package mail;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mail.CommandProcess;

public class SendMailAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		Properties p = new Properties(); // 정보를 담을 객체
		p.put("mail.smtp.host","smtp.google.com"); // 네이버 SMTP
		
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "587");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP 서버에 접속하기 위한 정보들
		
		//사용자가 관리자에게 문의를 하는 구조 - 결국 나에게 내가 이메일을 보낸다
		try{
		    Authenticator auth = new SMTPAuthenticator();
		    Session ses = Session.getInstance(p, auth);
		    
		    ses.setDebug(true);
		    
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    msg.setSubject(subject); // 제목
		    
		    Address fromAddr = new InternetAddress(email);
		    msg.setFrom(fromAddr); // 보내는 사람
		    
		    Address toAddr = new InternetAddress("a01025869419@gmail.com");
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		    
		    msg.setContent(email+"님께서 "+message, "text/html;charset=UTF-8"); // 내용과 인코딩
		    
		    Transport.send(msg); // 전송
		} catch(Exception e){
		    e.printStackTrace();
		    // 오류 발생시 뒤로 돌아가도록
		    System.out.println("error");
		}

		return "${pageContext.request.contextPath}/index.jsp";
	}

}