package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mail.MailSend;

@WebServlet("/mail")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MailServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String mail = request.getParameter("email");
		MailSend ms = new MailSend();
		int n = ms.registerMailSend(mail);
		
		if (n > 0) {
			out.println("<script> alert('메일함을 확인해 주세요.'); history.back(); </script>");
		} else {
			out.println("<script> alert('메일 전송에 실패했습니다. 이메일을 다시 한 번 확인해 주세요.'); history.back(); </script>");
		}
	}
}