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
        <section class="postListSection">
        	<h1 style="text-align: center;">게시글 목록</h1>
            <div class="selectWrap">
                <select name="" id="" class="postListCategory">
                    <option value="">1</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                </select>
            </div>
            <div style="width: 100%;">
                <table>
                    <thead>
                    <tr>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>James</td>
                        <td>Matman</td>
                        <td>(713) 123-8965</td>
                        <td><a href="mailto:jmatman@stewart.com">jmatman@stewart.com</a></td>
                    </tr>
                    <tr>
                        <td>Johnny</td>
                        <td>Smith</td>
                        <td>(713) 584-9614</td>
                        <td><a href="mailto:jsmith@stewart.com">jsmith@stewart.com</a></td>
                    </tr>
                    <tr>
                        <td>Susan</td>
                        <td>Johnson</td>
                        <td>(713) 847-1124</td>
                        <td><a href="mailto:sjohnson@stewart.com">sjohnson@stewart.com</a></td>
                    </tr>
                    <tr>
                        <td>Tracy</td>
                        <td>Richardson</td>
                        <td>(713) 245-4821</td>
                        <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
<%@ include file="/footer.jsp"%>