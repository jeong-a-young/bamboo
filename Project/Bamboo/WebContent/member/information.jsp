<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1>회원정보</h1>
    
    <table width="800px" border="1" align="center">
	<tr>
		<th>ID</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>이메일</th>
	</tr>
	<tr>
		<td><%= data.getBookNo() %></td>
		<td><%= data.getTitle() %></td>
		<td><%= data.getAuthor() %></td>
		<td><%= data.getCompany() %></td>
		<td><%= data.getPrice() %></td>	
		<td><a href="/rentalBook?bookNo=<%= data.getBookNo() %>">대여하기</a></td>
	</tr>
</table>

    <ul>
        <li><a href="#">수정</a></li>
        <li><a href="#">회원 탈퇴</a></li>
    </ul>

<%@ include file="/footer.jsp" %>