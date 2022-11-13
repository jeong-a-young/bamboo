package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MailDAO;

@WebServlet("/forgotId")
public class ForgotIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ForgotIdServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MailDAO dao = new MailDAO();
		String email = request.getParameter("email");
		String id = dao.emailToId(email);
		
		if (id == null) {
			out.println("<script> alert('가입되지 않은 이메일입니다.'); history.back(); </script>");
		} else {
			dao.idMailSend(id, email);
			out.println("<script> alert('메일함을 확인해 주세요.'); history.back(); </script>");
		}
	}
}