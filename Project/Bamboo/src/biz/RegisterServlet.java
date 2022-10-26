package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		boolean overlap = dao.overlapID(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		String pwdCk = request.getParameter("pwdCk");
		String email = request.getParameter("email");
		int n = 0;
		
		// 이메일이 중복이여도 가입이 됨
		if (overlap) {
			out.println("<script> alert('이미 존재하는 ID입니다.'); history.back(); </script>");
		} else if (!pwd.equals(pwdCk)) {
			out.println("<script> alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>");
		} else if (!email.contains("@y-y.hs.kr")) {
			out.println("<script> alert('이메일 형식이 옳지 않습니다. '@y-y.hs.kr'이 들어가야 합니다.'); history.back(); </script>");
		} else {
			vo.setMemberId(request.getParameter("id"));
			vo.setMemberPwd(request.getParameter("pwd"));
			vo.setMemberName(request.getParameter("name"));
			vo.setMemberEmail(request.getParameter("email"));
			n = dao.registerMember(vo);
			
			if (n > 0) {
				HttpSession session = request.getSession();
				out.println("<script> alert('bamboo의 회원이 되신 것을 환영합니다.'); history.back(); </script>");
				session.setAttribute("loginOK", vo);
			} else {
				out.println("<script> alert('회원가입에 실패했습니다.'); history.back(); </script>");
			}
			
			response.sendRedirect("/index.jsp");
		}
	}
}