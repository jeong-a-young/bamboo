package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import common.JDBCUtil;
import vo.CommentVO;

public class CommentDAO {
	
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
			// 첫 번째 물음표에 postId 넣기
			pstmt.setInt(1, postId);
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 실행 결과를 내려가면서 읽는다
			while (rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setPostId(postId);
				vo.setCommentId(rs.getInt("comment_id"));
				vo.setCommentWriter(rs.getString("comment_writer"));
				vo.setCommentSet(rs.getString("comment_set"));
				vo.setCommentContents(rs.getString("comment_contents"));
				vo.setCommentTime(rs.getDate("comment_time"));
				// 실행 결과를 list에 담는다
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		// 실행 결과가 담긴 list를 돌려준다
		return list;
	}
	
	// 댓글 업로드
	public int uploadComment(CommentVO vo, int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO post_comment (post_id, comment_id, comment_writer, comment_set, comment_contents, comment_time) VALUES (?,post_comment_seq.nextval,?,?,?,?)";
		
		int n = 0;
		
		// 현재 날짜를 가져와 sql에 insert 할 수 있는 형식으로 변환
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
	public boolean checkForbiddenComment (String content) {
		// 선생님... 죄송합니다 익명 게시판 특성 상 금칙어를 설정하기 위해 어쩔 수 없이 욕설을 적어놓을 수 밖에 없었어요 (T_T)
		String [] forbidden = { "개새끼", "개새기", "개소리", "꺼져", "병신", "븅신", "시발", "씨발", "좆", "지랄", "또라이", "똘아이", "닥쳐", "등신", "대가리" };
		boolean check = false;
		
		for (int i = 0; i <= forbidden.length - 1; i++) {
			// content 중에 forbidden 배열에 들어있는 단어와 일치하는 단어가 있을 시 true로 변경
			if (content.indexOf(forbidden[i]) != -1) {
				check = true;
			}
		}
		
		return check;
	}
	
	// 게시글 삭제
	public int deleteComment (int commentId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM post_comment WHERE comment_id=?";
		
		int n = 0;
			
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentId);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	// 게시글 수정
	public int editComment(String content, int postId, int commentId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE post_comment SET comment_contents=? WHERE post_id=? AND comment_id=?";

		int n = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, postId);
			pstmt.setInt(3, commentId);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
}