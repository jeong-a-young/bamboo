<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1 id="information_title">회원정보</h1>
    
    <form action="/edit" method="post">
	    <div class="information">
	    	<table>
				<tr>
					<th class="subTitle">ID</th>
					<td id="id_value"><%= session.getAttribute("nowLoginId") %></td>
				</tr>
				<tr>
					<th class="subTitle">비밀번호</th>
					<td><input type="text" class="textBox" name="editPwd" value="<%= session.getAttribute("nowLoginPwd") %>"></td>
				</tr>
				<tr>
					<th class="subTitle">이름</th>
					<td><input type="text" class="textBox" name="editName" value="<%= session.getAttribute("nowLoginName") %>"></td>
				</tr>
				<tr>
					<th class="subTitle">이메일</th>
					<td><input type="text" class="textBox" name="editEmail" value="<%= session.getAttribute("nowLoginEmail") %>"></td>
				</tr>
			</table>
	    </div>
	
		<div class="btn">
			<input type="submit" id="edit_btn" value="수정">
	    	<button id="unregister_btn">탈퇴하기</button>
		</div>
    </form>

<%@ include file="/footer.jsp" %>