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

@WebServlet("/deletePost")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeletePostServlet() {
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
			} else {
				out.println("<script> alert('게시글 삭제에 실패했습니다.'); history.back(); </script>");
			}
			// 알림창이 뜨지 않음
			response.sendRedirect("/index.jsp");
		}
	}