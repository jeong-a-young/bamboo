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

@WebServlet("/postDelete")
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PostDeleteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		PostDAO dao = new PostDAO();
		int n = dao.deletePost((int) session.getAttribute("deletePostId"));

			if (n > 0) {
				session.removeAttribute("deletePostId");
				out.println("<script> alert('게시글이 삭제되었습니다.'); window.location.href='./index.jsp'; </script>'");
			} else {
				out.println("<script> alert('게시글 삭제에 실패했습니다.'); history.back(); </script>");
			}
		}
	}