package dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

import common.JDBCUtil;
import common.SMTPAuthenticator;

public class MailDAO {

	// 0.
	
	// 이메일로 사용자 ID 불러오기
	public String emailToId(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id FROM member WHERE email=?";
		
		String id = null;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	// ID랑 이메일로 비밀번호 불러오기
	public String idEmailToPwd(String id, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT pwd FROM member WHERE id=? AND email=?";
		
		String pwd = null;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pwd = rs.getString("pwd");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pwd;
	}
	
	// 1. 회원가입
	
	// 인증 메일 전송
	public int registerMailSend(String email) {	
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
			InternetAddress to = new InternetAddress(email);
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
	public String idMailSend(String id, String email) {	
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		Authenticator auth = new SMTPAuthenticator();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("a01025869419@gmail.com", "bamboo"));
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(email + "님의 ID입니다.", "UTF-8");
			msg.setText(email + "님의 ID는 " + id + "입니다.", "UTF-8");
			Transport.send(msg);
		} catch (AddressException ae) {
			System.out.println("AddressException: " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException: " + me.getMessage());
		} catch (UnsupportedEncodingException ue) {
			System.out.println("UnsupportedEncodingException: " + ue.getMessage());
		}
		
		return id;
	}
	
	// 비밀번호 찾기
	public String pwdMailSend(String id, String pwd, String email) {	
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		Authenticator auth = new SMTPAuthenticator();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("a01025869419@gmail.com", "bamboo"));
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(id + "님의 비밀번호입니다.", "UTF-8");
			msg.setText(id + "님의 비밀번호는 " + pwd + "입니다.", "UTF-8");
			Transport.send(msg);
		} catch (AddressException ae) {
			System.out.println("AddressException: " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException: " + me.getMessage());
		} catch (UnsupportedEncodingException ue) {
			System.out.println("UnsupportedEncodingException: " + ue.getMessage());
		}
		
		return pwd;
	}
}