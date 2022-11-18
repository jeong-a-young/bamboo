package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDAO;
import vo.CommentVO;

@WebServlet("/commentWrite")
public class CommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommentWriteServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		CommentVO vo = new CommentVO();
		CommentDAO dao = new CommentDAO();
		String commentSet = request.getParameter("commentSet");
		String commentContent = request.getParameter("commentContent");
		boolean check = dao.checkForbiddenComment(commentContent);
		int n = 0;
		
		if (commentSet == null || commentContent == null) {
			out.println("<script> alert('입력하지 않은 값이 있습니다.'); history.back(); </script>");
		} else if (check) {
			out.println("<script> alert('금칙어가 포함되어 있습니다.'); history.back(); </script>");
		} else {
			vo.setCommentWriter((String) session.getAttribute("nowLoginName"));
			vo.setCommentSet(commentSet);
			vo.setCommentContents(commentContent);
			n = dao.uploadComment(vo, (int) session.getAttribute("commentPostId"));
			
			if (n > 0) {
				out.println("<script> alert('댓글 업로드가 성공적으로 완료되었습니다.'); history.back(); </script>");
			} else {
				out.println("<script> alert('댓글 업로드에 실패했습니다.'); history.back(); </script>");
			}
		}

		out.println("<script>history.go(-1);</script>");
	}
}