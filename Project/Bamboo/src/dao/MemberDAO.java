package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCUtil;
import vo.MemberVO;

public class MemberDAO {

	// 회원 정보 가져오기
	public MemberVO getMember(String id) {
		MemberVO vo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE id=?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			// 첫 번째 물음표에 id 넣기
			pstmt.setString(1, id);
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 만약 실행 결과가 있을 시
			if (rs.next()) {
				vo = new MemberVO();
				vo.setMemberId(rs.getString("id"));
				vo.setMemberPwd(rs.getString("pwd"));
				vo.setMemberName(rs.getString("name"));
				vo.setMemberEmail(rs.getString("email"));
				vo.setMemberType(rs.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		// 회원 정보가 담긴 vo 객체 리턴
		return vo;
	}
	
	// 1. register
	
	// 회원가입
	public int registerMember(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member (id, pwd, name, email, type) VALUES (?,?,?,?,?)";
		
		int n = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberId());
			pstmt.setString(2, vo.getMemberPwd());
			pstmt.setString(3, vo.getMemberName());
			pstmt.setString(4, vo.getMemberEmail());
			pstmt.setString(5, vo.getMemberType());
			// 쿼리가 실행되면 n의 값이 증가한다
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		// n의 값으로 쿼리 실행 여부 확인
		return n;
	}
	
	// ID 중복 확인
	public boolean overlapId(String id) {	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE id=?";
		
		boolean result = false;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// email 중복 확인
	public boolean overlapEmail(String email) {	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE email=?";
		
		boolean result = false;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 2. information
	
	// 회원 정보 수정
	public int editMember(String id, String pwd, String name, String email, String type) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET pwd=?, name=?, email=?, type=? WHERE id=?";

		int n = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, type);
			pstmt.setString(5, id);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	// 회원 탈퇴
	public int unregisterMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM member WHERE id=?";
	
		int n = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return n;
	}
}