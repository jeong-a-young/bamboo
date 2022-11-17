<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1>비밀번호 찾기</h1>

    <form method="post">
		<div class="loginInput">
			<p class="subTitle">ID</p>
			<input type="text" name="id" placeholder="ID를 입력해 주세요."><br>
			
			<p class="subTitle">이메일</p>
			<input type="email" name="email" placeholder="가입할 때 입력하신 이메일을 입력해 주세요."><br>
			<input type="submit" value="인증 코드 받기" formaction="/registerMail"><br>
			<p class="subTitle">인증 코드</p>
			<input type="text" name="code" placeholder="위 이메일로 발송된 인증 코드를 입력해 주세요.">
			
			<input type="submit" value="확인" formaction="/forgotPassword">
			
			<a href="${pageContext.request.contextPath}/member/forgotID.jsp">ID 찾기</a>
		</div>
    </form>

<%@ include file="/footer.jsp" %>