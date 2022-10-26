<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1>로그인</h1>

    <form action="/login" method="post">
    	<input type="text" name="id" placeholder="ID를 입력해 주세요."><br>
    	<input type="password" name="pwd" placeholder="비밀번호를 입력해 주세요."><br>
    	<input type="submit" value="로그인">
    	
    	<ul>
        	<li><a href="#">회원가입</a></li>
        	<li><a href="#">ID 찾기</a></li>
        	<li><a href="#">비밀번호 찾기</a></li>
    	</ul>
    </form>

<%@ include file="/footer.jsp" %>