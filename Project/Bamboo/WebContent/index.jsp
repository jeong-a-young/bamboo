<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<section>
    <div class="welcome">
    	bamboo에서 <br>
    	양영디지털고등학교의 <br>
    	소식을 만나보세요	
    </div>
    
    <div class="notice">
    	<p>지금 로그인 하고
    	새 글을 확인해 보세요.</p>
    	
    	<div class="indexBtn">
    		<button id="index_login_btn"><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></button>
    		<button id="index_register_btn"><a href="${pageContext.request.contextPath}/member/register.jsp">회원가입</a></button>
    	</div>
    </div>
    	
    <div class="post"></div>
</section>

<%@ include file="/footer.jsp" %>