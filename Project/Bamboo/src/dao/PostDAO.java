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
	
	// 게시글 업로드
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
	
	// 금칙어 확인
	public boolean checkForbidden (String content) {
		// 선생님... 죄송합니다 익명 게시판 특성 상 금칙어를 설정하기 위해 어쩔 수 없이 욕설을 적어놓을 수 밖에 없었어요 (T_T)
		String [] forbidden = { "개새끼", "개새기", "개소리", "꺼져", "병신", "븅신", "좆", "지랄", "또라이", "똘아이", "닥쳐", "등신", "대가리" };
		boolean check = false;
				
		for (int i = 0; i <= forbidden.length - 1; i++) {
			if (content.indexOf(forbidden[i]) != -1) {
				check = true;
			}
		}
		
		return check;
	}
}