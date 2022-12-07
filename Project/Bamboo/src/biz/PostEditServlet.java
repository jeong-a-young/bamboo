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

@WebServlet("/postEdit")
public class PostEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PostEditServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		PostVO vo = new PostVO();
		PostDAO dao = new PostDAO();
		int postId = (int) session.getAttribute("editPostId");
		String postTitle = request.getParameter("editPostTitle");
		String postType = request.getParameter("editPostType");
		String postCategory = request.getParameter("editPostCategory");
		String postContent = request.getParameter("editPostContent");
		int n = 0;
		
		if (postTitle == null || postType == null || postCategory == null || postContent == null) {
			out.println("<script> alert('입력하지 않은 값이 있습니다.'); history.back(); </script>");
		} else {
			vo.setPostTitle(postTitle);
			vo.setPostType(postType);
			vo.setPostCategory(postCategory);
			vo.setPostContent(postContent);
			n = dao.editPost(postId, postTitle, postType, postCategory, postContent);
			
			if (n > 0) {
				out.println("<script> alert('게시글이 수정되었습니다.'); window.location.href='./postView.jsp?postId=" + postId + "' </script>");
				session.removeAttribute("editPostId");
			} else {
				out.println("<script> alert('게시글 수정에 실패하였습니다.'); history.back(); </script>");
			}
		}
	}
}