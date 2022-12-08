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
    			// 로그인이 되어있나 확인
				MemberVO loginOk = (MemberVO)session.getAttribute("loginOK");
			
    			// 로그인을 하지 않았을 때
				if (loginOk == null) {
			%>
			
			<!-- 로그인을 하지 않았으므로 검색 기능을 지원하지 않음 -->
			<div></div>
					
			<div class="nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></li>
	                <li><a href="${pageContext.request.contextPath}/member/register.jsp">회원가입</a></li>
	            </ul>
	        </div>
	    </header>
				
		<%
			// 로그인을 했을 때
			} else {
		%>
			
		<div class="search">
			<form method="post">
				<select name="searchType">
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="제목 + 내용">제목 + 내용</option>
				</select>
				<input type="text" name="search" id="search_box">
				<button id="search_btn"  formaction="/postSearch"><img src="${pageContext.request.contextPath}/images/search.png" width="50px" height="50px"></button>
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
			<!-- postType에 '공지게시판'이라는 값을 담아서 postList.jsp로 이동 -->
			<li><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=공지게시판">공지게시판</a>
				<ul class="subMenu">
					
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
				<ul class="subMenu" id="major_type">
					<li id="major"><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=스마트전자과게시판">스마트전자과게시판</a></li>
					<li id="major"><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=정보통신과게시판">정보통신과게시판</a></li>
					<li id="major"><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=소프트웨어개발과게시판">소프트웨어개발과게시판</a></li>
					<li id="major"><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=바이오화학과게시판">바이오화학과게시판</a></li>
					<li id="major"><a href="${pageContext.request.contextPath}/post/postList.jsp?postType=생명정보과게시판">생명정보과게시판</a></li>
				</ul>
			</li>
		</ul>
	</div>
				
	<%
		}
	%>