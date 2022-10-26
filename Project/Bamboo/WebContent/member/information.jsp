<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1>회원정보</h1>
    
    <form action="/edit" method="post">
	    <table>
			<tr>
				<th>ID</th>
				<td><%= session.getAttribute("nowLoginId") %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="editPwd" value="<%= session.getAttribute("nowLoginPwd") %>"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="editName" value="<%= session.getAttribute("nowLoginName") %>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="editEmail" value="<%= session.getAttribute("nowLoginEmail") %>"></td>
			</tr>
		</table>
	
		<input type="submit" value="수정">
	    <button>탈퇴하기</button>
    </form>

<%@ include file="/footer.jsp" %>