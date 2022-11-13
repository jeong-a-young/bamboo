<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1>비밀번호 찾기</h1>

    <form action="" method="post">
		<div class="loginInput">
			<input type="text" placeholder="ID를 입력해 주세요."><br>
			<input type="email" placeholder="가입할 때 입력하신 이메일을 입력해 주세요."><br>
			<input type="submit" value="확인">
			<a href="${pageContext.request.contextPath}/member/forgotID.jsp">ID 찾기</a>
		</div>
    </form>

<%@ include file="/footer.jsp" %>