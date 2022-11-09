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
	
	public ArrayList<String> getPostList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post";
		
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("post_id"));
				list.add(rs.getString("post_writer"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 2. upload
	
	public int uploadPost(PostVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO post (post_id, post_writer, post_title, post_type, post_set, post_contents, post_time) VALUES (post_seq.nextval,?,?,?,?,?,?)";
		
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
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return n;
	}
}
