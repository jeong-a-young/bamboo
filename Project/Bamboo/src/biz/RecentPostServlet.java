package biz;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;
import vo.PostVO;

@WebServlet("/recentPost")
public class RecentPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RecentPostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PostDAO dao = new PostDAO();
		ArrayList<PostVO> list = dao.getRecentPost();
		
		if (list != null) {
			request.setAttribute("recentPost", list);
		}
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}