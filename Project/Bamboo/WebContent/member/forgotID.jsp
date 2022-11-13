<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1 id="forgotID_title">ID 찾기</h1>

    <form action="/forgotId" method="post">
		<div class="forgotIdInput">
			<input type="email" class="forgotIdBox" name="email" placeholder="가입할 때 입력하신 이메일을 입력해 주세요."><br>
			<input type="submit" id="forgotIdBtn" value="확인"><br>
			<a href="${pageContext.request.contextPath}/member/forgotPassword.jsp">비밀번호 찾기</a>
		</div>	
    </form>

<%@ include file="/footer.jsp" %>