package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAO;
import vo.ReplyVO;

@WebServlet("/replyEdit")
public class ReplyEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReplyEditServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		System.out.println("타긴 탐");
		ReplyVO vo = new ReplyVO();
		ReplyDAO dao = new ReplyDAO();
		String replyId = request.getParameter("replyId");
		String postId = request.getParameter("postId");
		String replyContent = request.getParameter("editContent");
		int n = 0;
		
		if (replyContent == null) {
			out.println("<script> alert('입력되지 않은 값이 있습니다.'); history.back(); </script>");
		} else {
			vo.setReplyContent(replyContent);
			n = dao.editReply(Integer.parseInt(postId), Integer.parseInt(replyId), replyContent);
			
			if (n > 0) {
				out.println("<script> alert('댓글이 수정되었습니다.'); window.location=document.referrer; </script>");
			} else {
				out.println("<script> alert('댓글 수정에 실패하였습니다.'); history.back(); </script>");
			}
		}
	}
}