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
		String postTitle = request.getParameter("postTitle");
		String postType = request.getParameter("postType");
		String postSet = request.getParameter("postSet");
		String postContent = request.getParameter("postContent");
		int n = 0;

		if (postTitle == null || postType == null || postSet == null || postContent == null) {
			out.println("<script> alert('입력하지 않은 값이 있습니다.'); history.back(); </script>");
			System.out.println("@@2");
			System.out.println(postTitle);
			System.out.println(postType);
			System.out.println(postSet);
			System.out.println(postContent);
		} else {
			vo.setPostWriter((String) session.getAttribute("nowLoginName"));
			vo.setPostTitle(postTitle);
			vo.setPostType(postType);
			vo.setPostSet(postSet);
			vo.setPostContents(postContent);
			n = dao.uploadPost(vo);
			System.out.println("@@!");
			// 알림이 안 뜬다
			if (n > 0) {
				out.println("<script> alert('게시글 업로드가 성공적으로 완료되었습니다.'); history.back(); </script>");
			} else {
				out.println("<script> alert('게시글 업로드에 실패했습니다.'); history.back(); </script>");
			}
		}
	
		response.sendRedirect("/index.jsp");
	}
}