<%@page import="vo.PostVO"%>
<%@page import="dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<!-- 서버 경로: / -->
<!-- SQL 실행 방법: orcl/hr/hr -->
			
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
                	
                        <p class="text-white-75 mb-5">bamboo는 양영디지털고등학교에 재학중인 학생들과<br>교직원들만 이용할 수 있는 익명 커뮤니티 사이트입니다.<br>학교 생활, 전공 관련 질문 등 학교에서는 말할 수 없던 이야기를 나눠보세요.</p>
                        <p class="text-white-75" style="margin-bottom: 8.5px;"><b>아직 회원이 아니신가요?</b></p>
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/member/register.jsp">회원가입</a>
                    
                    <%
						} else {
                	%>
                	
                		<p class="text-white-75 mb-4"><%= loginOk.getMemberName() %>님,<br>bamboo에 오신 것을 환영합니다!</p>
                        <p class="text-white-75" style="margin-bottom: 8.5px;"><b>하고 싶은 이야기를<br>익명으로 부담없이 작성해 보세요.</b></p>
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/post/postWrite.jsp">글쓰기</a>
                    
                    <%
						}
                	%>
                	
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
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
                        <a class="btn btn-light btn-xl" href="#services">로그인</a>
                    
                    <%
						} else {
                	%>
                	
                        <h2 class="text-white mt-0">새 글을 작성해 보세요</h2>
                        <hr class="divider divider-light" />
                        <p class="text-white-75 mb-4">궁금한 질문이 있다면 <br>자유롭게 작성해 보세요.</p>
                        <a class="btn btn-light btn-xl" href="#services">글쓰기</a>
                    
                     <%
						}
                	 %>
                	
                    </div>
                </div>
            </div>
        </section>
        <!-- Services-->
        <section class="page-section" id="services">
            <h2 class="text-center mt-0">어서오세요!<br>아래에서 최근 업로드 된 게시글을 확인해 보세요.</h2>
            <hr class="divider" />
            
            <%
				// 최근에 업로드 된 게시글
				PostDAO dao = new PostDAO();
				ArrayList<PostVO> list = dao.getRecentPost();
			%>
			
            <div id="recent_post">
                <div class="postTitle">
                
                <%
					if (!list.isEmpty()) {
						for (PostVO data : list) {
				%>
				
                    <h1><%= data.getPostTitle() %></h1>
                </div>
                <div class="postInfo">
                
                <%
					if (data.getPostType().equals("a")) {
				%>	
				
                    <p>익명</p>
                    
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
                <hr class="postHr">
                <div class="postContents">
                    <p><%= data.getPostContent() %></p>
                    
                    <%
						// 사진이 첨부된 글이라면
						if (!data.getPostImage().equals("/postImage/null")) {
					%>
						
					<img src="<%=request.getContextPath()%><%= data.getPostImage() %>">
						
					<%
						} else {
					%>
			                </div>
			        </div>
             
            <%
						}
					}
				} else {
			%> 	
			
			<p>새 글을 작성해 주세요.</p>
			
			<%
				}
			%>

        </section>
        <!-- Portfolio-->
        <div id="portfolio">
            <h2 class="text-center mt-0">게시판</h2>
            <hr class="divider" />
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-name">공지게시판</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category2.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-name">자유게시판</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category3.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-name">질문게시판</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-name">정보게시판</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category2.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-name">분실물게시판</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/category3.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-name">과별게시판</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
<%@ include file="/footer.jsp"%>