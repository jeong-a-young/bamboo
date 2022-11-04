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
		String sql = "INSERT INTO post (post_id, post_writer, post_title, post_type, post_set, post_contents) VALUES (post_seq.nextval,?,?,?,?,?)";
		
		int n = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPostWriter());
			pstmt.setString(2, vo.getPostTitle());
			pstmt.setString(3, vo.getPostType());
			pstmt.setString(4, vo.getPostSet());
			pstmt.setString(5, vo.getPostContents());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return n;
	}
}
