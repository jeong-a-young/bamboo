<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bamboo</title>
<link rel="stylesheet" href="./css/style.css">
<script src="./js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <header>
            <div class="logo">
                <img src="./images/logo.png">
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
					<button><img src="./images/search.png" width="50px" height="50px"></button>
				</div>
				
			<%
				}
			
				if (login == null) {
			%>
			
				<div class="nav">
                	<ul>
                    	<li><a href="./member/login.jsp">로그인</a></li>
                    	<li><a href="./member/register.jsp">회원가입</a></li>
                	</ul>
            	</div>
            	
            <%
				} else {
			%>
			
				<div class="nav">
                	
                	<ul>
                    	<li><a href="/logout">로그아웃</a></li>
                    	<li><img src="./images/user.png" width="50px" height="50px"><a href="./member/information.jsp" id="member_information">회원정보</a></li>
                	</ul>
            	</div>
            	
            <%
				}
			%>
        </header>