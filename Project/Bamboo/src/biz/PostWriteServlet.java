package biz;

import java.io.File;
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

@WebServlet("/postWrite")
public class PostWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PostWriteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 서버에 이미지를 담은 폴더가 없을 시 폴더 생성
		File Folder = new File(request.getRealPath("/postImage"));
		if (!Folder.exists()) {
			try {
				Folder.mkdir();
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
		MultipartRequest mr = new MultipartRequest(request, request.getRealPath("/postImage"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
		HttpSession session = request.getSession();
		PostVO vo = new PostVO();
		PostDAO dao = new PostDAO();
		String postTitle = mr.getParameter("postTitle");
		String postType = mr.getParameter("postType");
		String postCategory = mr.getParameter("postCategory");
		String postContent = mr.getParameter("postContent");
		String postImage = request.getContextPath() + "/postImage/" + mr.getFilesystemName("postImage");
		boolean check = dao.checkForbiddenPost(postTitle, postContent);
		int n = 0;

		if (postTitle == null || postType == null || postCategory == null || postContent == null) {
			out.println("<script> alert('입력되지 않은 값이 있습니다.'); history.back(); </script>");
		} else if (check) {
			out.println("<script> alert('금칙어가 포함되어 있습니다.'); history.back(); </script>");
		} else {	
			vo.setPostWriter((String) session.getAttribute("nowLoginName"));
			vo.setPostTitle(postTitle);
			vo.setPostType(postType);
			vo.setPostCategory(postCategory);
			vo.setPostContent(postContent);
			vo.setPostImage(postImage);
			System.out.println("이미지가 저장되는 실제 경로: " + request.getRealPath("/postImage"));
			n = dao.writePost(vo);

			if (n > 0) {
				out.println("<script> alert('게시글이 업로드 되었습니다.'); window.location.href='./index.jsp'; </script>'");
			} else {
				out.println("<script> alert('게시글 업로드에 실패했습니다.'); history.back(); </script>");
			}
		}
	}
}