<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>bamboo</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Fonts-->
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4">
                <a href="${pageContext.request.contextPath}/index.jsp"><img id="header_logo" src="${pageContext.request.contextPath}/images/logo.png"></a>
                
                <%
	    			// 로그인이 되어있나 확인
					MemberVO loginOk = (MemberVO)session.getAttribute("loginOK");
				
	    			// 로그인을 하지 않았을 때
					if (loginOk == null) {
				%>
				
				<!-- 로그인을 하지 않았으므로 검색 기능을 지원하지 않음 -->
				<div></div>
				
				<%
					} else {
				%>
				
                <div id="header_search">
                    <form>
                        <select>
                            <option value="제목">제목</option>
                            <option value="내용">내용</option>
                            <option value="제목 + 내용">제목 + 내용</option>
                        </select>
                        <input type="text" placeholder="검색어를 입력해 주세요.">
                        <button><img src="${pageContext.request.contextPath}/images/search.png"></button>
                    </form>
                </div>
                
                <%
					}
	    			
	    			if (loginOk == null) {
                %>
                
                	<div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/register.jsp">회원가입</a></li>
                    </ul>
                	</div>
                	
                <%
					} else {
                %>
                
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/information.jsp">회원정보</a></li>
                    </ul>
                </div>
                
                <%
					}
                %>
                
            </div>
        </nav>