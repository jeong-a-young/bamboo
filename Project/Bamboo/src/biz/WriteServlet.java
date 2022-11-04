package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PostDAO;
import vo.PostVO;

@WebServlet("/write")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WriteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		PostDAO dao = new PostDAO();
		PostVO vo = new PostVO();
		int n = 0;

		vo.setPostWriter((String) session.getAttribute("nowLoginName"));
		vo.setPostTitle(request.getParameter("postTitle"));
		vo.setPostType(request.getParameter("postType"));
		vo.setPostSet(request.getParameter("postSet"));
		vo.setPostContents(request.getParameter("postContent"));
		n = dao.uploadPost(vo);

		// 알림이 안 뜬다
		if (n > 0) {
			out.println("<script> alert('게시글 업로드가 성공적으로 완료되었습니다.'); history.back(); </script>");
		} else {
			out.println("<script> alert('게시글 업로드에 실패했습니다.'); history.back(); </script>");
		}

		response.sendRedirect("/index.jsp");
	}
}