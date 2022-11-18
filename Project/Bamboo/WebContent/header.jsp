<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bamboo</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
				MemberVO loginOk = (MemberVO)session.getAttribute("loginOK");
			
				if (loginOk == null) {
			%>
			
					<div></div>
					
					<div class="nav">
	                	<ul>
	                    	<li><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></li>
	                    	<li><a href="${pageContext.request.contextPath}/member/register.jsp">회원가입</a></li>
	                	</ul>
	            	</div>
	            </header>
				
			<%
				} else {
			%>
			
					<div class="search">
						<form method="post" action="${pageContext.request.contextPath}/post/postSearch.jsp">
							<input type="text" name="search" id="search_box">
							<button id="search_btn"><img src="${pageContext.request.contextPath}/images/search.png" width="50px" height="50px"></button>
						</form>
					</div>
				
					<div class="nav">	
	                	<ul>
	                    	<li><a href="/logout">로그아웃</a></li>
	                    	<li><img src="${pageContext.request.contextPath}/images/user.png" id="user_img"><a href="${pageContext.request.contextPath}/member/information.jsp" id="member_information">회원정보</a></li>
	                	</ul>
	            	</div>			
        		</header>
        		
        		<div class="menu">
					<ul class="mainMenu">
						<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=공지게시판">공지게시판</a>
							<ul class="subMenu">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=자유게시판">자유게시판</a>
							<ul class="subMenu">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=질문게시판">질문게시판</a>
							<ul class="subMenu">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=정보게시판">정보게시판</a>
							<ul class="subMenu">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=분실물게시판">분실물게시판</a>
							<ul class="subMenu">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=과별게시판">과별게시판</a>
							<ul class="subMenu">
								<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=스마트전자과게시판">스마트전자과게시판</a></li>
								<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=정보통신과게시판">정보통신과게시판</a></li>
								<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=소프트웨어개발과게시판">소프트웨어개발과게시판</a></li>
								<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=바이오화학과게시판">바이오화학과게시판</a></li>
								<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=생명정보과게시판">생명정보과게시판</a></li>
							</ul>
						</li>
					</ul>
				</div>
				
				<%
					}
				%>