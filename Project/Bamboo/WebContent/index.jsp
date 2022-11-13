<%@page import="dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<!-- 서버 경로: / -->

<section>
    <div class="welcome">
    	bamboo에서 <br>
    	양영디지털고등학교의 <br>
    	소식을 만나보세요	
    </div>
    
    <%
    	if (login == null) {
    %>
    
	    <div class="notice">
	    	<p>지금 로그인 하고
	    	새 글을 확인해 보세요.</p>
	    	
	    	<div class="indexBtn">
	    		<button id="index_login_btn" onclick="location.href='${pageContext.request.contextPath}/member/login.jsp'">로그인</button>
	    		<button id="index_register_btn" onclick="location.href='${pageContext.request.contextPath}/member/register.jsp'">회원가입</button>
	    	</div>
	    </div>
	    
    <%
    	} else {
    	
	%>
	
		<button id="post_write_btn" onclick="location.href='${pageContext.request.contextPath}/postWrite.jsp'">글쓰기</button>
		
	<%
	    	
	    }
    %>
</section>

<%@ include file="/footer.jsp" %>