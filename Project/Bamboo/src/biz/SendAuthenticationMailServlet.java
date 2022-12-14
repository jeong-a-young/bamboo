package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MailDAO;

@WebServlet("/sendAuthenticationMail")
public class SendAuthenticationMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendAuthenticationMailServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MailDAO dao = new MailDAO();
		String email = request.getParameter("email");
		int n = dao.sendAuthenticationMail(email);
		
		if (n > 0) {
			out.println("<script> alert('메일함을 확인해 주세요.'); history.back(); </script>");
		} else {
			out.println("<script> alert('메일 전송에 실패했습니다.'); history.back(); </script>");
		}
	}
}