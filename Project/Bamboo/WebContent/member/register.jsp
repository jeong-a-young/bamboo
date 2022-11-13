<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<h1 id="register_title">회원가입</h1>
	<div class="registerInput">
		<form method="post">
			<p class="subTitle">ID</p>
	    	<input type="text" class="registerTextBox" name="id"><br>
	    	<p class="subTitle">비밀번호</p>
	    	<input type="password" class="registerTextBox" id="password" name="pwd"><br>
	    	<p class="subTitle">비밀번호 확인</p>
	    	<input type="password" class="registerTextBox" id="password_check" name="pwdCk" placeholder="비밀번호를 한 번 더 입력해 주세요."><br>
			<p id="pwdCheck"></p>
			
	    	<p class="subTitle">이름</p>
	    	<input type="text" class="registerTextBox" name="name"><br>
	    	<p class="subTitle">이메일</p>
	    	<input type="email" class="registerTextBox" name="email" placeholder="'@y-y.hr.kr'이 포함되어야 합니다." style="margin-bottom: 5px;"><br>
	    	<input type="submit" id="authenticator_code_btn" value="인증 코드 받기" formaction="/registerMail">
	    	<a href="https://support.bespinglobal.com/ko/support/solutions/articles/73000545270--gmail-pop-%EB%B0%8F-imap-%ED%99%9C%EC%84%B1%ED%99%94-%ED%95%98%EA%B8%B0" target="_black" id="email_notice">이메일이 오지 않았을 땐?</a><br>
	    	<p class="subTitle">인증 코드</p>
	    	<input type="text" class="registerTextBox" id="authenticator_code" name="code" placeholder="위 이메일로 발송된 인증 코드를 입력해 주세요.">
	    	<p class="subTitle">구분</p>
	    	<div class="inputRadio">
				<div><input type="radio" name="type" value="S"> 학생</div>
				<div><input type="radio" name="type" value="T"> 교사</div>
	    	</div>
	    	
	    	<input type="submit" id="registerBtn" value="가입" formaction="/register">
		</form>
	</div>
	
<%@ include file="/footer.jsp" %>