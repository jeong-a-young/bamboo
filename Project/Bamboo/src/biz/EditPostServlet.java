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

@WebServlet("/editPost")
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditPostServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		PostVO vo = new PostVO();
		PostDAO dao = new PostDAO();
		int id = (int) session.getAttribute("editPostId");
		String title = request.getParameter("editPostTitle");
		String set = request.getParameter("editPostSet");
		String type = request.getParameter("editPostType");
		String content = request.getParameter("editPostContent");
		int n = 0;
		
		if (title == null || set == null || type == null || content == null) {
			out.println("<script> alert('입력하지 않은 값이 있습니다.'); history.back(); </script>");
		} else {
			vo.setPostTitle(title);
			vo.setPostSet(set);
			vo.setPostType(type);
			vo.setPostContents(content);
			n = dao.editPost(title, set, type, content, id);
			
			if (n > 0) {
				out.println("<script> alert('게시글이 정상적으로 수정 되었습니다.'); history.back(); </script>");
				session.removeAttribute("editPostId");
			} else {
				out.println("<script> alert('게시글 수정에 실패하였습니다.'); history.back(); </script>");
			}
		}
	}
}