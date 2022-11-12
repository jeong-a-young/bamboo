<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<h1 id="register_title">회원가입</h1>
	<div class="registerInput">
		<form action="/register" method="post">
			<p class="subTitle">ID</p>
	    	<input type="text" class="registerTextBox" name="id"><br>
	    	<p class="subTitle">비밀번호</p>
	    	<input type="password" class="registerTextBox" id="password" name="pwd"><br>
	    	<p class="subTitle">비밀번호 확인</p>
	    	<input type="password" class="registerTextBox" id="password_check" name="pwdCk" placeholder="비밀번호를 한 번 더 입력해 주세요."><br>
			<font id="chkNotice" size = "2"></font>
			
	    	<p class="subTitle">이름</p>
	    	<input type="text" class="registerTextBox" name="name"><br>
	    	<p class="subTitle">이메일</p>
	    	<input type="email" class="registerTextBox" name="email" placeholder="'@y-y.hr.kr'이 포함되어야 합니다."><br>
	    	
	    	<p class="subTitle">구분</p>
	    	<div class="inputRadio">
				<div><input type="radio" name="type" value="S"> 학생</div>
				<div><input type="radio" name="type" value="T"> 교사</div>
	    	</div>
	    	
	    	<input type="submit" id="registerBtn" value="가입">
		</form>
	</div>
	
<%@ include file="/footer.jsp" %>