<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
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
    
    <!-- 서버 경로: / -->
    <!-- SQL 실행 방법: orcl/hr/hr -->

    <body id="page-top">
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="indexNav">
            <div class="container px-4">
                <a href="${pageContext.request.contextPath}/index.jsp"><img class="headerLogo" src="${pageContext.request.contextPath}/images/logo.png"></a>
                
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
				
                <div class="searchWrap">
                    <form action="/postSearch" method="post" class="searchForm">
                        <select name="searchType">
                            <option value="제목">제목</option>
                            <option value="내용">내용</option>
                            <option value="제목 + 내용">제목 + 내용</option>
                        </select>

                        <input type="text" name="searchKeyword" placeholder="검색어를 입력해 주세요.">

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

        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold fw-bold">bamboo에서<br>양영디지털고등학교의<br>소식을 만나보세요</h1>
                        <hr class="divider" />
                    </div>

                    <div class="col-lg-8 align-self-baseline">
                    
                    <%
                        // 로그인을 하지 않았을 시
                        if (loginOk == null) {
                    %>
                    
                        <p class="text-white-75 mb-5">bamboo는 양영디지털고등학교에 재학중인 학생들과<br>교직원들만 이용할 수 있는 익명 커뮤니티 사이트입니다.<br>학교 생활, 전공 관련 질문 등 학교에서는 말할 수 없던 이야기를 나눠보세요.</p>
                        <p class="text-white-75 mb-2"><b>아직 회원이 아니신가요?</b></p>
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/member/register.jsp">회원가입</a>
                    
                    <%
                        } else {
                    %>
                    
                        <p class="text-white-75 mb-4"><%= loginOk.getMemberName() %>님,<br>bamboo에 오신 것을 환영합니다!</p>
                        <p class="text-white-75 mb-2"><b>하고 싶은 이야기를<br>익명으로 부담없이 작성해 보세요.</b></p>
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/post/postWrite.jsp">글쓰기</a>
                    
                    <%
                        }
                    %>
                    
                    </div>
                </div>
            </div>
        </header>

        <section class="page-section bg-primary" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 text-center">
                    
                    <%
                        if (loginOk == null) {
                    %>
                    
                        <h2 class="text-white mt-0">지금 로그인하고 새 글을 확인해 보세요</h2>
                        <hr class="divider divider-light" />
                        <p class="text-white-75 mb-4">bamboo는 양영디지털고등학교 <br>로그인을 하셔야 이용하실 수 있습니다.</p>
                        <a class="btn btn-light btn-xl" href="${pageContext.request.contextPath}/member/login.jsp">로그인</a>
                    
                    <%
                        } else {
                    %>
                    
                        <h2 class="text-white mt-0">올라온 글들을 확인해 보세요</h2>
                        <hr class="divider divider-light" />
                        <p class="text-white-75 mb-4">글에 댓글을 달면서 <br>소통해 보세요.</p>
                        <a class="btn btn-light btn-xl" href="${pageContext.request.contextPath}/post/postList.jsp?category=전체">글 목록</a>
                    
                    <%
                        }
                    %>
                    
                    </div>
                </div>
            </div>
        </section>

        <%
            if (loginOk == null) {
        %>

        <!-- 로그인을 하지 않으면 게시글을 확인하거나 작성할 수 없음 -->
        <div></div>

        <%
            } else {
                // 최근에 업로드 된 게시글 불러오기
                PostDAO dao = new PostDAO();
                ArrayList<PostVO> list = dao.getRecentPost();

                if (!list.isEmpty()) {
                    for (PostVO data : list) {
        %>

        <section class="page-section" id="services">
            <h2 class="text-center mt-0">어서오세요!<br>아래에서 최근 업로드 된 게시글을 확인해 보세요.</h2>
            <hr class="divider" />

            <div id="recent_post">
                <div class="postTitle">
                    <h1><%= data.getPostTitle() %></h1>
                </div>

                <div class="postInfo">
            
                <%
                    if (data.getPostType().equals("A")) {
                %>	
            
                    <p>익명</p><p> | </p>
                
                <%
                    } else {
                %>	
                
                    <p id="recent_post_writer"><%= data.getPostWriter() %></p><p> | </p>
                    
                <%
                    }
                %>
                    
                    <p><%= data.getPostCategory() %></p><p> | </p>
                    <p><%= data.getPostDate() %></p>
                </div>

                <hr id="recent_post_hr">

                <div class="postContents">
                    <p><%= data.getPostContent() %></p>
                
                    <%
                        // 사진이 첨부된 글이라면
                        if (!data.getPostImage().equals("/postImage/null")) {
                    %>
                    
                    <img src="<%=request.getContextPath()%><%= data.getPostImage() %>" style="width: 100%;">
                    
                    <%
                        // 사진이 없을 시 빈 공간으로 놔둠
                        } else {
                    %>

                    <div></div>
                
                    <%
                        }
                    %>

                </div>
            </div>      
        </section>
            
        <%            
                }
            } else {
            // 게시글이 한 개도 없을 시
        %> 	

        <section class="page-section" id="services" style="padding-bottom: 80px;"> <!-- 수정 -->
            <h2 class="text-center mt-0">최근 작성된 게시글이 없습니다.<br>새로운 게시글을 작성해 주세요!</h2>
            <hr class="divider" />
            <div class="aWrap">
                <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/post/postWrite.jsp">글쓰기</a>
            </div>
        </section>

        <%
            }
        %>

        <div id="portfolio">
            <h2 class="text-center mt-0">게시판</h2>
            <hr class="divider" />
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category1.jpg" alt="..." />
                            <div class="portfolio-box-caption" onclick="location.href='${pageContext.request.contextPath}/post/postList.jsp?category=공지게시판';">
                                <div class="project-name">공지게시판</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category2.jpg" alt="..." />
                            <div class="portfolio-box-caption" onclick="location.href='${pageContext.request.contextPath}/post/postList.jsp?category=자유게시판';">
                                <div class="project-name">자유게시판</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category3.jpg" alt="..." />
                            <div class="portfolio-box-caption" onclick="location.href='${pageContext.request.contextPath}/post/postList.jsp?category=질문게시판';">
                                <div class="project-name">질문게시판</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category4.jpg" alt="..." />
                            <div class="portfolio-box-caption" onclick="location.href='${pageContext.request.contextPath}/post/postList.jsp?category=정보게시판';">
                                <div class="project-name">정보게시판</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category5.jpg" alt="..." />
                            <div class="portfolio-box-caption" onclick="location.href='${pageContext.request.contextPath}/post/postList.jsp?category=분실물게시판';">
                                <div class="project-name">분실물게시판</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category6.jpg" alt="..." />
                            <div class="portfolio-box-caption" onclick="location.href='${pageContext.request.contextPath}/post/postList.jsp?category=과별게시판';">
                                <div class="project-name">과별게시판</div>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
        </div>

        <%
            }
        %>
        
<%@ include file="/footer.jsp"%>