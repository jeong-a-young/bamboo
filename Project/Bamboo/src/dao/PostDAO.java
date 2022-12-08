package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import common.JDBCUtil;
import vo.PostVO;

public class PostDAO {

	// 모든 게시물 불러오기
	public ArrayList<PostVO> getPost() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post ORDER BY post_id DESC";

		ArrayList<PostVO> data = new ArrayList<PostVO>();

		try {
			conn = JDBCUtil.getConnection();
			// 쿼리 실행
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 실행 결과를 내려가면서 읽는다
			while (rs.next()) {
				// 가져온 결과를 vo 객체를 이용해 set
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostCategory(rs.getString("post_category"));
				vo.setPostContent(rs.getString("post_content"));
				vo.setPostDate(rs.getDate("post_date"));
				vo.setPostImage(rs.getString("post_image"));
				// set한 내용을 data에 추가한다
				data.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}

		// 글 목록이 담긴 data를 리턴
		return data;
	}

	// 선택한 게시판의 게시글만 불러오기
	public ArrayList<PostVO> getCategoryPost(String postCategory) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post WHERE post_category=? ORDER BY post_id DESC";

		ArrayList<PostVO> data = new ArrayList<PostVO>();

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, postCategory);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostCategory(rs.getString("post_category"));
				vo.setPostContent(rs.getString("post_content"));
				vo.setPostDate(rs.getDate("post_date"));
				vo.setPostImage(rs.getString("post_image"));
				data.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}

		return data;
	}

	// 과별게시판의 게시글만 불러오기
	public ArrayList<PostVO> getMajorPost() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post WHERE post_content='스마트전자과게시판' OR post_content='정보통신과게시판' OR post_content='소프트웨어개발과게시판' OR post_content='바이오화학과게시판' OR post_content='생명정보과게시판' ORDER BY post_id DESC";

		ArrayList<PostVO> data = new ArrayList<PostVO>();

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostCategory(rs.getString("post_category"));
				vo.setPostContent(rs.getString("post_content"));
				vo.setPostDate(rs.getDate("post_date"));
				vo.setPostImage(rs.getString("post_image"));
				data.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}

		return data;
	}

	// 검색한 게시글 불러오기
	public ArrayList<PostVO> getSearchPost(String keyword, String type) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";	

		switch (type) {
		case "제목":
			sql = "SELECT * FROM post WHERE post_title LIKE (?)";
			break;
		case "내용":
			sql = "SELECT * FROM post WHERE post_content LIKE (?)";
			break;
		case "제목 + 내용":
			sql = "SELECT * FROM post WHERE post_title LIKE (?) OR post_content LIKE (?)";
			break;
		}
		
		ArrayList<PostVO> data = new ArrayList<PostVO>();
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostCategory(rs.getString("post_category"));
				vo.setPostContent(rs.getString("post_content"));
				vo.setPostDate(rs.getDate("post_date"));
				vo.setPostImage(rs.getString("post_image"));
				data.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
			
		return data;
	}

	// 최근 게시물 불러오기
	public ArrayList<PostVO> getRecentPost() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT * FROM post ORDER BY post_id DESC) WHERE ROWNUM = 1";

		ArrayList<PostVO> data = new ArrayList<PostVO>();

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostCategory(rs.getString("post_category"));
				vo.setPostContent(rs.getString("post_content"));
				vo.setPostDate(rs.getDate("post_date"));
				vo.setPostImage(rs.getString("post_image"));
				data.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}

		return data;
	}

	// 게시글 목록에서 클릭한 게시글 불러오기
	public ArrayList<PostVO> getClickPost(int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post WHERE post_id=?";

		ArrayList<PostVO> data = new ArrayList<PostVO>();

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostCategory(rs.getString("post_category"));
				vo.setPostContent(rs.getString("post_content"));
				vo.setPostDate(rs.getDate("post_date"));
				vo.setPostImage(rs.getString("post_image"));
				data.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}

		return data;
	}

	// 1. write

	// 게시글 업로드
	public int writePost(PostVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO post (post_id, post_writer, post_title, post_type, post_category, post_content, post_date, post_image) VALUES (post_seq.nextval,?,?,?,?,?,?,?)";

		int n = 0;

		// 현재 날짜를 가져와 sql에 insert 할 수 있는 형식으로 변환
		Date date = new Date();
		long javaDate = date.getTime();
		java.sql.Date sqlDate = new java.sql.Date(javaDate);

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPostWriter());
			pstmt.setString(2, vo.getPostTitle());
			pstmt.setString(3, vo.getPostType());
			pstmt.setString(4, vo.getPostCategory());
			pstmt.setString(5, vo.getPostContent());
			pstmt.setDate(6, sqlDate);
			pstmt.setString(7, vo.getPostImage());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}

		return n;
	}

	// 금칙어 확인
	public boolean checkForbiddenPost(String PostTitle, String PostContent) {
		String[] forbidden = { "개새끼", "개새기", "개소리", "꺼져", "병신", "븅신", "시발", "씨발", "좆", "지랄", "또라이", "똘아이", "닥쳐", "등신",
				"대가리" };
		boolean check = false;

		for (int i = 0; i <= forbidden.length - 1; i++) {
			if (PostTitle.indexOf(forbidden[i]) != -1 || PostContent.indexOf(forbidden[i]) != -1) {
				check = true;
			}
		}

		return check;
	}

	// 2. edit

	// 게시글 수정
	public int editPost(int postId, String postTitle, String postType, String postCategory, String postContent) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE post SET post_title=?, post_type=?, post_category=?, post_content=? WHERE post_id=?";

		int n = 0;

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, postTitle);
			pstmt.setString(2, postType);
			pstmt.setString(3, postCategory);
			pstmt.setString(4, postContent);
			pstmt.setInt(5, postId);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}

		return n;
	}

	// 3. delete

	// 게시글 삭제
	public int deletePost(int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM post WHERE post_id=?";

		int n = 0;

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postId);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}

		return n;
	}
}