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

@WebServlet("/unregister")
public class UnregisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UnregisterServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		MemberVO vo = (MemberVO) session.getAttribute("loginOK");
		int n = 0;

		if (vo == null) {
			out.println("<script> alert('사용자 정보가 없어 회원탈퇴를 진행할 수 없습니다.'); history.back(); </script>");
		} else {
			MemberDAO dao = new MemberDAO();
			n = dao.unregisterMember(vo.getMemberId());

			if (n > 0) {
				session.removeAttribute("loginOK");
				session.removeAttribute("nowLoginId");
				session.removeAttribute("nowLoginPwd");
				session.removeAttribute("nowLoginName");
				session.removeAttribute("nowLoginEmail");
				session.removeAttribute("nowLoginType");
				out.println("<script> alert('회원 탈퇴가 성공적으로 진행 되었습니다.'); window.location.href='./index.jsp'; </script>");
			} else {
				out.println("<script> alert('회원 탈퇴에 실패하였습니다.'); history.back(); </script>");
			}
		}
	}
}