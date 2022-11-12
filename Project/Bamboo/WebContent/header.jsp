<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bamboo</title>
<link rel="stylesheet" href="../css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <header>
            <div class="logo">
                <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
            </div>
            
    		<%
				MemberVO login = (MemberVO)session.getAttribute("loginOK");
			
				if (login == null) {
			%>
			
				<div></div>
				
			<%
				} else {
			%>
			
				<div class="search">
					<input type="text" name="search" id="search_box">
					<button id="search_btn"><img src="${pageContext.request.contextPath}/images/search.png" width="50px" height="50px"></button>
				</div>
				
			<%
				}
			
				if (login == null) {
			%>
			
				<div class="nav">
                	<ul>
                    	<li><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></li>
                    	<li><a href="${pageContext.request.contextPath}/member/register.jsp">회원가입</a></li>
                	</ul>
            	</div>
            	
            <%
				} else {
			%>
			
				<div class="nav">
                	
                	<ul>
                    	<li><a href="/logout">로그아웃</a></li>
                    	<li><img src="${pageContext.request.contextPath}/images/user.png" id="user_img"><a href="${pageContext.request.contextPath}/member/information.jsp" id="member_information">회원정보</a></li>
                	</ul>
            	</div>
            	
            <%
				}
			%>
        </header>