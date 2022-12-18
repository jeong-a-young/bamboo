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
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Fonts-->
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- js -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    </head>
    <body id="page-top">
        <header class="pt-5">
            <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 navbar-shrink" id="mainNav">
                <div class="container px-4">
                    <a href="${pageContext.request.contextPath}/index.jsp"><img class="headerLogo" src="${pageContext.request.contextPath}/images/logo.png"></a>
                  
                    <div class="searchWrap">
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