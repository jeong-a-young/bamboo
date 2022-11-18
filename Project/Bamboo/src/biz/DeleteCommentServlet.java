package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;

@WebServlet("/deleteComment")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteCommentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		CommentDAO dao = new CommentDAO();
		int n = dao.deleteComment(Integer.parseInt(request.getParameter("commentId")));

		if (n > 0) {
			out.println("<script> alert('댓글 삭제에 성공했습니다.'); history.back(); </script>");
		} else {
			out.println("<script> alert('댓글 삭제에 실패했습니다.'); history.back(); </script>");
		}
	}
}