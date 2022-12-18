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
		
		HttpSession session = request.getSession();
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		String pwd = request.getParameter("pwd");
		String pwdCk = request.getParameter("pwdCk");
		boolean overlapId = dao.overlapId(request.getParameter("id"));
		boolean overlapEmail = dao.overlapEmail(request.getParameter("email")+"@y-y.hs.kr");
		int n = 0;

		if (overlapId) {
			out.println("<script> alert('이미 존재하는 ID입니다.'); history.back(); </script>");
		} else if (!pwd.equals(pwdCk)) {
			out.println("<script> alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>");
		} else if (overlapEmail) {
			out.println("<script> alert('이미 가입된 이메일입니다.'); history.back(); </script>");
		} else if (session.getAttribute("mailAuthentication") == null) {
			out.println("<script> alert('이메일 인증에 실패했습니다.'); history.back(); </script>");
		} else {
			vo.setMemberId(request.getParameter("id"));
			vo.setMemberName(request.getParameter("name"));
			vo.setMemberPwd(request.getParameter("pwd"));
			vo.setMemberEmail(request.getParameter("email")+"@y-y.hs.kr");
			vo.setMemberType(request.getParameter("type"));
			n = dao.registerMember(vo);
			
			if (n > 0) {
				session.setAttribute("loginOK", vo);
				session.setAttribute("nowLoginId", vo.getMemberId());
				session.setAttribute("nowLoginName", vo.getMemberName());
				session.setAttribute("nowLoginPwd", vo.getMemberPwd());
				session.setAttribute("nowLoginEmail", vo.getMemberEmail());
				session.setAttribute("nowLoginType", vo.getMemberType());
				session.removeAttribute("mailAuthentication");
				out.println("<script> alert('bamboo의 회원이 되신 것을 환영합니다.'); window.location.href='./index.jsp'; </script>");
			} else {
				out.println("<script> alert('회원가입에 실패했습니다.'); history.back(); </script>");
			}
		}
	}
}