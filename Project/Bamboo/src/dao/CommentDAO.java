package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import common.JDBCUtil;
import vo.CommentVO;
import vo.PostVO;

public class CommentDAO {

	// 댓글 업로드
	public int uploadComment(CommentVO vo, int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO post_comment (post_id, comment_id, comment_writer, comment_set, comment_contents, comment_time) VALUES (?,post_coment_seq.nextval,?,?,?,?)";
		
		int n = 0;
		
		Date date = new Date();
		long javaDate = date.getTime();
		java.sql.Date sqlDate = new java.sql.Date(javaDate);

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postId);
			pstmt.setString(2, vo.getCommentWriter());
			pstmt.setString(3, vo.getCommentSet());
			pstmt.setString(4, vo.getCommentContents());
			pstmt.setDate(5, sqlDate);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	// 댓글 가져오기
	public ArrayList<CommentVO> getComment(int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post_comment WHERE post_id=?";
			
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postId);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setPostId(postId);
				vo.setCommentWriter(rs.getString("comment_writer"));
				vo.setCommentSet(rs.getString("comment_set"));
				vo.setCommentContents(rs.getString("comment_contents"));
				vo.setCommentTime(rs.getDate("comment_time"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
}