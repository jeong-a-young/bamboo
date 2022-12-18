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

@WebServlet("/memberEdit")
public class MemberEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberEditServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		String id = (String) session.getAttribute("nowLoginId");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String pwdCk = request.getParameter("pwdCk");
		String email = request.getParameter("email") + "@y-y.hs.kr";
		String type = request.getParameter("type");
		int n = 0;

		if (!pwd.equals(pwdCk)) {
			out.println("<script> alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>");
		} else if (id.equals("") || name.equals("") || pwd.equals("") || pwdCk.equals("") || email.equals("") || type == null) {
			out.println("<script> alert('입력되지 않은 값이 있습니다.'); history.back(); </script>");
		} else {
			vo.setMemberPwd(pwd);
			vo.setMemberName(name);
			vo.setMemberEmail(email);
			vo.setMemberType(type);
			n = dao.editMember(id, pwd, name, email, type);
				
			if (n > 0) {
				out.println("<script> alert('회원 정보가 수정되었습니다.'); history.back(); </script>");
			} else {
				out.println("<script> alert('회원 정보 수정에 실패하였습니다.'); history.back(); </script>");
			}
		}
	}
}