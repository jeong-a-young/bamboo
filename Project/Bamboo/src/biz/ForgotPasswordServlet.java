package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MailDAO;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ForgotPasswordServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MailDAO dao = new MailDAO();
		String id = request.getParameter("id");
		String email = request.getParameter("email") + "@y-y.hs.kr";
		String pwd = dao.idEmailToPwd(id, email);
		
		if (pwd == null) {
			out.println("<script> alert('ID 또는 이메일이 존재하지 않습니다.'); history.back(); </script>");
		} else {
			dao.sendForgotPasswordMail(id, pwd, email);
			out.println("<script> alert('메일함을 확인해 주세요.'); history.back(); </script>");
		}
	}
}