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

@WebServlet("/edit")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditServlet() {
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
		String pwd = request.getParameter("editPwd");
		String name = request.getParameter("editName");
		String email = request.getParameter("editEmail");
		String type = request.getParameter("editType");
		int n = 0;
		
		if (!email.contains("@y-y.hs.kr")) {
			out.println("<script> alert('이메일 형식이 옳지 않습니다. @y-y.hs.kr이 들어가야 합니다.'); history.back(); </script>");
		} else {
			vo.setMemberPwd(pwd);
			vo.setMemberName(name);
			vo.setMemberEmail(email);
			vo.setMemberType(type);
			n = dao.editMember(id, pwd, name, email, type);
			
			if (n > 0) {
				out.println("<script> alert('회원 정보가 정상적으로 수정 되었습니다.'); history.back(); </script>");
			} else {
				out.println("<script> alert('회원 정보 수정에 실패하였습니다.'); history.back(); </script>");
			}
		}
	}
}