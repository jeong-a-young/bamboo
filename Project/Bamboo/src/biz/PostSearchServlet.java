package biz;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PostDAO;
import vo.PostVO;

@WebServlet("/postSearch")
public class PostSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostSearchServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		PostDAO dao = new PostDAO();
		String keyword = request.getParameter("searchKeyword");
		String type = request.getParameter("searchType");
		
		if (keyword == null) {
			out.println("<script> alert('검색어를 입력해 주세요.'); history.back(); </script>");
		} else {
			ArrayList<PostVO> data = dao.getSearchPost(keyword);
			session.setAttribute("searchPost", data);
			response.sendRedirect("./post/postSearch.jsp");
		}
	}
}