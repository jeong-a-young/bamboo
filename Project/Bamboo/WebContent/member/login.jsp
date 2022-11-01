<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1 id="login_title">로그인</h1>

    <form action="/login" method="post">
		<div class="loginInput">
			<input type="text" id="id_box" name="id" placeholder="ID를 입력해 주세요."><br>
			<input type="password" id="pwd_box" name="pwd" placeholder="비밀번호를 입력해 주세요."><br>
			<input type="submit" id="login_login_btn" value="로그인">
		</div>
    	
    	<ul class="find">
	        <li><a href="#">ID 찾기</a></li>
	        <li><a href="#">비밀번호 찾기</a></li>
    	</ul>
    </form>

<%@ include file="/footer.jsp" %>