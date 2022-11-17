package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PostDAO;
import vo.PostVO;

@WebServlet("/write")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WriteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		MultipartRequest mr = new MultipartRequest(request, request.getRealPath("/postImage"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
		PostVO vo = new PostVO();
		PostDAO dao = new PostDAO();
		String postTitle = mr.getParameter("postTitle");
		String postType = mr.getParameter("postType");
		String postSet = mr.getParameter("postSet");
		String postContent = mr.getParameter("postContent");
		String postPhoto = request.getContextPath() + "/postImage/" + mr.getFilesystemName("postPhoto");
		boolean check = dao.checkForbidden(postContent);
		int n = 0;

		if (postTitle == null || postType == null || postSet == null || postContent == null) {
			out.println("<script> alert('입력하지 않은 값이 있습니다.'); history.back(); </script>");
		} else if (check) {
			out.println("<script> alert('금칙어가 포함되어 있습니다.'); history.back(); </script>");
		} else {
			vo.setPostWriter((String) session.getAttribute("nowLoginName"));
			vo.setPostTitle(postTitle);
			vo.setPostType(postType);
			vo.setPostSet(postSet);
			vo.setPostContents(postContent);
			vo.setPostPhoto(postPhoto);
			System.out.println("이미지가 저장되는 실제 경로: " + request.getRealPath("/postImage"));
			n = dao.uploadPost(vo);
			
			if (n > 0) {
				out.println("<script> alert('게시글 업로드가 성공적으로 완료되었습니다.'); history.back(); </script>");
			} else {
				out.println("<script> alert('게시글 업로드에 실패했습니다.'); history.back(); </script>");
			}
		}
	}
}