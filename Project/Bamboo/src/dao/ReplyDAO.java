package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import common.JDBCUtil;
import vo.ReplyVO;

public class ReplyDAO {
	
	// 댓글 가져오기
	public ArrayList<ReplyVO> getReply(int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM reply WHERE post_id=?";
			
		ArrayList<ReplyVO> data = new ArrayList<ReplyVO>();
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			// 첫 번째 물음표에 postId 넣기
			pstmt.setInt(1, postId);
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 실행 결과를 내려가면서 읽는다
			while (rs.next()) {
				ReplyVO vo = new ReplyVO();
				vo.setPostId(postId);
				vo.setReplyId(rs.getInt("reply_id"));
				vo.setReplyWriter(rs.getString("reply_writer"));
				vo.setReplyType(rs.getString("reply_type"));
				vo.setReplyContent(rs.getString("reply_content"));
				vo.setReplyDate(rs.getDate("reply_date"));
				// 실행 결과를 data에 담는다
				data.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		// 실행 결과가 담긴 data를 돌려준다
		return data;
	}
	
	// 1. write
	
	// 댓글 업로드
	public int writeReply(ReplyVO vo, int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO reply (post_id, reply_id, reply_writer, reply_type, reply_content, reply_date) VALUES (?,reply_seq.nextval,?,?,?,?)";
		
		int n = 0;
		
		// 현재 날짜를 가져와 sql에 insert 할 수 있는 형식으로 변환
		Date date = new Date();
		long javaDate = date.getTime();
		java.sql.Date sqlDate = new java.sql.Date(javaDate);

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postId);
			pstmt.setString(2, vo.getReplyWriter());
			pstmt.setString(3, vo.getReplyType());
			pstmt.setString(4, vo.getReplyContent());
			pstmt.setDate(5, sqlDate);
			// 쿼리가 실행되면 n의 값이 증가한다
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	// 금칙어 확인
	public boolean checkForbiddenReply(String replyContent) {
		String [] forbidden = { "개새끼", "개새기", "개소리", "꺼져", "병신", "븅신", "시발", "씨발", "좆", "지랄", "또라이", "똘아이", "닥쳐", "등신", "대가리" };
		boolean check = false;
		
		for (int i = 0; i <= forbidden.length - 1; i++) {
			// replyContent 중에 forbidden 배열에 들어있는 단어와 일치하는 단어가 있을 시 true로 변경
			if (replyContent.indexOf(forbidden[i]) != -1) {
				check = true;
			}
		}
		
		return check;
	}
	
	// 2. edit
	
	// 게시글 수정
	public int editReply(int postId, int replyId, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE reply SET reply_content=? WHERE post_id=? AND reply_id=?";

		int n = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, postId);
			pstmt.setInt(3, replyId);
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
	public int deleteReply(int replyId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM reply WHERE reply_id=?";
		
		int n = 0;
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyId);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
}