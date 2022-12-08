<%@page import="vo.PostVO"%>
<%@page import="dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<!-- 서버 경로: / -->
<!-- SQL 실행 방법: orcl/hr/hr -->
			
<section>
	<div class="welcome">
		bamboo에서<br>양영디지털고등학교의<br>소식을 만나보세요
	</div>

	<%
		if (loginOk == null) {
	%>

	<div class="notice">
		<p>지금 로그인 하고 새 글을 확인해 보세요.</p>
		
		<div class="indexBtn">
			<button id="index_login_btn" onclick="location.href='${pageContext.request.contextPath}/member/login.jsp'">로그인</button>
			<button id="index_register_btn" onclick="location.href='${pageContext.request.contextPath}/member/register.jsp'">회원가입</button>
		</div>
	</div>

	<%
		} else {

		// 최근에 업로드 된 게시글
		PostDAO dao = new PostDAO();
		ArrayList<PostVO> list = dao.getRecentPost();
	%>

	<div class="recentPost">
			
	<%
		if (!list.isEmpty()) {
	%>
	
	<p id="recent_notice">어서오세요!<br>아래에서 최근 업로드 된 게시글을 확인해 보세요.</p>
	<button class="greenBtn" id="post_write_btn" onclick="location.href='${pageContext.request.contextPath}/post/postWrite.jsp'">글쓰기</button>
	<button id="post_list_btn" onclick="location.href='${pageContext.request.contextPath}/post/postList.jsp?postType=전체'">게시글 목록</button>

	<%
			for (PostVO data : list) {
	%>
		
		<p id="recent_post_title"><%= data.getPostTitle() %></p>
						
		<div class="recentInfo">
						
		<%
			if (data.getPostSet().equals("a")) {
		%>	
					
			<p id="recent_post_writer">익명</p>
				
			<%
				} else {
			%>	
				
			<p id="recent_post_writer"><%= data.getPostWriter() %></p><p> | </p>
					
			<%
				}
			%>
						
			<p><%= data.getPostType() %></p><p> | </p>
			<p><%= data.getPostTime() %></p>
		</div>
			
		<hr class="contourLine">
					
		<p id="recent_post_contents"><%= data.getPostContents() %></p>
			
		<%
			// 사진이 첨부된 글이라면
			if (!data.getPostPhoto().equals("/postImage/null")) {
		%>
			
		<img src="<%=request.getContextPath()%><%= data.getPostPhoto() %>" id="recent_post_image">
			
		<%
			}
		%>
					
	</div>
					
		<%
					} 
				} else if (list.isEmpty()) {
					System.out.print('d');
		%>
			<p id="recent_notice">어서오세요!<br>bamboo의 첫 게시글을 작성해 보세요.</p>
			<button class="greenBtn" id="post_write_btn" onclick="location.href='${pageContext.request.contextPath}/post/postWrite.jsp'">글쓰기</button>
			<button id="post_list_btn" onclick="location.href='${pageContext.request.contextPath}/post/postList.jsp?postType=전체'">게시글 목록</button>
		<%
				} 
			}
		%>
					
</section>

<%@ include file="/footer.jsp"%>