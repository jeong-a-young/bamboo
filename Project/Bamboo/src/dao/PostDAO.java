package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCUtil;
import vo.PostVO;

public class PostDAO {

	// 1. upload
	
	public int uploadPost(PostVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO post (post_id, post_writer, post_title, post_type, post_contents) VALUES (?,?,?,?,?)";
		
		int n = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPostId());
			pstmt.setString(2, vo.getPostWriter());
			pstmt.setString(3, vo.getPostTitle());
			pstmt.setString(4, vo.getPostType());
			pstmt.setString(5, vo.getPostContents());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return n;
	}
}
