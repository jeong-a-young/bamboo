<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1>ID 찾기</h1>

    <form action="/forgotId" method="post">
		<div>
			<input type="email" name="email" placeholder="가입할 때 입력하신 이메일을 입력해 주세요."><br>
			<input type="submit" value="확인">
		</div>	
    </form>

<%@ include file="/footer.jsp" %>