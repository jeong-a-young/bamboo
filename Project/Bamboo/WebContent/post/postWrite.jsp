<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
        <header class="pt-5">
            <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 navbar-shrink" id="mainNav">
                <div class="container px-4">
                    <a href="${pageContext.request.contextPath}/index.jsp"><img id="header_logo" src="${pageContext.request.contextPath}/images/logo.png"></a>
                  
                    <div id="header_search">
                        <form class="searchForm">
                            <select>
                                <option value="제목">제목</option>
                                <option value="내용">내용</option>
                                <option value="제목 + 내용">제목 + 내용</option>
                            </select>
                            <input type="text" placeholder="검색어를 입력해 주세요.">
                            <button><img src="${pageContext.request.contextPath}/images/search.png"></button>
                        </form>
                    </div>
                   
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav my-2 my-lg-0">
                            <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/information.jsp">회원정보</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

	<div class="writeInput" style="height: 64.7%;">
		<form action="/postWrite" method="post" enctype="multipart/form-data">
			<div class="headerWrite">
				<p id="titleTitle">제목</p>
				<input type="text" name="postTitle" id="titleBox">

				<select name="postType" id="typeSelect">
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
				</select>

				<div class="setInput">
					<input type="radio" name="postSet" value="A"> 익명
					<input type="radio" name="postSet" value="R"> 실명
				</div>

				<p id="titleTitle">이미지</p>
				<input type="file" id="photoInput" name="postPhoto" accept="image/*">
			</div>
			
			<div class="bodyWrite">
				<textarea name="postContent" id="contetnBox"></textarea>
			</div>

			<div class="footerWrite">
				<input type="submit" id="upload_btn" value="업로드">
			</div>
		</form>
	</div>
	
<%@ include file="/footer.jsp" %>