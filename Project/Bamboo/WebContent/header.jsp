<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bamboo</title>
<link rel="stylesheet" href="./css/style.css">
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
					<input type="text" name="search">
					<button><img src="./images/search.png" width="50px" height="50px"></button>
				</div>
				
			<%
				}
			%>
			
            <div class="menu">
                <ul>
                    <li><a href="#">공지게시판</a></li>
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">질문게시판</a></li>
                    <li><a href="#">정보게시판</a></li>
                    <li><a href="#">분실물게시판</a></li>
                    <li>
                        <a href="#">과별게시판</a>
                        <ul>
                            <li><a href="#">스마트전자과</a></li>
                            <li><a href="#">정보통신과</a></li>
                            <li><a href="#">소프트웨어개발과</a></li>
                            <li><a href="#">바이오화학과/생명정보과</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

			<%
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
                    	<li><img src="./images/user.png" width="50px" height="50px"><a href="./member/information.jsp">회원정보</a></li>
                	</ul>
            	</div>
            	
            <%
				}
			%>
        </header>