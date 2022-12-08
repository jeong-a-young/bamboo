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
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a><img id="header_logo" src="${pageContext.request.contextPath}/images/logo.png"></a>
                
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
				} if (loginOk == null) {
                %>
                	<div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#portfolio">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">회원가입</a></li>
                    </ul>
                	</div>
                <%
				} else {
                %>
                
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#portfolio">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">회원정보</a></li>
                    </ul>
                </div>
                <%
				}
                %>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 
                align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold" style="font-weight: 600;">bamboo에서<br>양영디지털고등학교의<br>소식을 만나보세요</h1>
                        <hr class="divider" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                    <%
					if (loginOk == null) {
                	%>
                        <p class="text-white-75 mb-5" style="width: 836px;">bamboo는 양영디지털고등학교에 재학중인 학생들과 교직원들만 이용할 수 있는 익명 커뮤니티 사이트입니다.<br>학교 생활, 전공 관련 질문 등 학교에서는 말할 수 없던 이야기를 나눠보세요.</p>
                        <p class="text-white-75" style="margin-bottom: 8.5px;"><b>아직 회원이 아니신가요?</b></p>
                        <a class="btn btn-primary btn-xl" href="#about">회원가입</a>
                    <%
					} else {
                	%>
                		<p class="text-white-75 mb-5" style="width: 836px;"></p>
                        <p class="text-white-75" style="margin-bottom: 8.5px;"><b>게시글</b></p>
                        <a class="btn btn-primary btn-xl" href="#about">글쓰기</a>
                    <%
					}
                	%>
                    </div>
                </div>
            </div>
        </header>