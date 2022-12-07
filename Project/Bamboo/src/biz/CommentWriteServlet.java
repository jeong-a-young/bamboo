package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyDAO;
import vo.ReplyVO;

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
		ReplyVO vo = new ReplyVO();
		ReplyDAO dao = new ReplyDAO();
		String replyType = request.getParameter("replyType");
		String replyContent = request.getParameter("replyContent");
		boolean check = dao.checkForbiddenReply(replyContent);
		int n = 0;
		
		if (replyType == null || replyContent == null) {
			out.println("<script> alert('입력하지 않은 값이 있습니다.'); history.back(); </script>");
		} else if (check) {
			out.println("<script> alert('금칙어가 포함되어 있습니다.'); history.back(); </script>");
		} else {
			vo.setReplyWriter((String) session.getAttribute("nowLoginName"));
			vo.setReplyType(replyType);
			vo.setReplyContent(replyContent);
			n = dao.writeReply(vo, (int) session.getAttribute("replyPostId"));
			
			if (n > 0) {
				out.println("<script> alert('댓글이 업로드 되었습니다.'); window.location=document.referrer; </script>");
			} else {
				out.println("<script> alert('댓글 업로드에 실패했습니다.'); history.back(); </script>");
			}
		}
	}
}