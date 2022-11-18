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

	// 1. view
	
	// 모든 게시물 불러오기
	public ArrayList<PostVO> getPostList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post ORDER BY post_id DESC";
			
		ArrayList<PostVO> list = new ArrayList<PostVO>();
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostSet(rs.getString("post_set"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostContents(rs.getString("post_contents"));
				vo.setPostTime(rs.getDate("post_time"));
				vo.setPostPhoto(rs.getString("post_photo"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
			
		return list;
	}
	
	// 검색한 게시글 불러오기
	public ArrayList<PostVO> getPostSearchList(String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post WHERE post_title LIKE (?)";
			
		ArrayList<PostVO> list = new ArrayList<PostVO>();
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostSet(rs.getString("post_set"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostContents(rs.getString("post_contents"));
				vo.setPostTime(rs.getDate("post_time"));
				vo.setPostPhoto(rs.getString("post_photo"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
			
		return list;
	}
	
	// 선택한 타입 게시글만 불러오기
	public ArrayList<PostVO> getPostTypeList(String postType) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post WHERE post_type=? ORDER BY post_id DESC";
			
		ArrayList<PostVO> list = new ArrayList<PostVO>();
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, postType);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostSet(rs.getString("post_set"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostContents(rs.getString("post_contents"));
				vo.setPostTime(rs.getDate("post_time"));
				vo.setPostPhoto(rs.getString("post_photo"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
			
		return list;
	}
	
	// 선택한 타입 게시글만 불러오기
	public ArrayList<PostVO> getPostMajorList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post WHERE post_type='스마트전자과게시판' OR post_type='정보통신과게시판' OR post_type='소프트웨어개발과게시판' OR post_type='바이오화학과게시판' OR post_type='생명정보과게시판' ORDER BY post_id DESC";
				
		ArrayList<PostVO> list = new ArrayList<PostVO>();
				
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostSet(rs.getString("post_set"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostContents(rs.getString("post_contents"));
				vo.setPostTime(rs.getDate("post_time"));
				vo.setPostPhoto(rs.getString("post_photo"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
				
		return list;
	}
	
	// 게시글 목록에서 클릭한 게시글 불러오기
	public ArrayList<PostVO> getClickPost(int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post WHERE post_id=?";
			
		ArrayList<PostVO> list = new ArrayList<PostVO>();
			
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
				vo.setPostSet(rs.getString("post_set"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostContents(rs.getString("post_contents"));
				vo.setPostTime(rs.getDate("post_time"));
				vo.setPostPhoto(rs.getString("post_photo"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 최근 게시물 불러오기
	public ArrayList<PostVO> getRecentPost () {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT * FROM post ORDER BY post_id DESC) WHERE ROWNUM = 1";
			
		ArrayList<PostVO> list = new ArrayList<PostVO>();
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				PostVO vo = new PostVO();
				vo.setPostId(rs.getInt("post_id"));
				vo.setPostWriter(rs.getString("post_writer"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostSet(rs.getString("post_set"));
				vo.setPostType(rs.getString("post_type"));
				vo.setPostContents(rs.getString("post_contents"));
				vo.setPostTime(rs.getDate("post_time"));
				vo.setPostPhoto(rs.getString("post_photo"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
		
	// 2. upload
	
	// 게시글 업로드
	public int uploadPost(PostVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO post (post_id, post_writer, post_title, post_type, post_set, post_contents, post_time, post_photo) VALUES (post_seq.nextval,?,?,?,?,?,?,?)";
		
		int n = 0;
		
		Date date = new Date();
		long javaDate = date.getTime();
		java.sql.Date sqlDate = new java.sql.Date(javaDate);

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPostWriter());
			pstmt.setString(2, vo.getPostTitle());
			pstmt.setString(3, vo.getPostType());
			pstmt.setString(4, vo.getPostSet());
			pstmt.setString(5, vo.getPostContents());
			pstmt.setDate(6, sqlDate);
			pstmt.setString(7, vo.getPostPhoto());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	// 금칙어 확인
	public boolean checkForbidden (String content) {
		// 선생님... 죄송합니다 익명 게시판 특성 상 금칙어를 설정하기 위해 어쩔 수 없이 욕설을 적어놓을 수 밖에 없었어요 (T_T)
		String [] forbidden = { "개새끼", "개새기", "개소리", "꺼져", "병신", "븅신", "시발", "씨발", "좆", "지랄", "또라이", "똘아이", "닥쳐", "등신", "대가리" };
		boolean check = false;
				
		for (int i = 0; i <= forbidden.length - 1; i++) {
			if (content.indexOf(forbidden[i]) != -1) {
				check = true;
			}
		}
		
		return check;
	}
	
	// 게시글 수정
	public int editPost(String title, String set, String type, String content, int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE post SET post_title=?, post_set=?, post_type=?, post_contents=? WHERE post_id=?";

		int n = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, set);
			pstmt.setString(3, type);
			pstmt.setString(4, content);
			pstmt.setInt(5, id);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	// 게시글 삭제
	public int deletePost (int postId) {
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
		}
		
		return n;
	}
}