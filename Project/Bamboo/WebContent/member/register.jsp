<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<h1 id="register_title">회원가입</h1>

	<form action="/register" method="post">
		<p>ID</p><br>
    	<input type="text" name="id"><br>
    	<p>비밀번호</p><br>
    	<input type="password" name="pwd"><br>
    	<p>비밀번호 확인</p><br>
    	<input type="password" name="pwdCk"><br>
    
    	<p>이름</p><br>
    	<input type="text" name="name"><br>
    	<p>이메일</p><br>
    	<input type="email" name="email" placeholder="'@y-y.hr.kr'이 포함되어야 합니다."><br>
    
    	<input type="submit" value="가입">
	</form>

<%@ include file="/footer.jsp" %>