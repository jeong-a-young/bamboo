<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<div class="postList">
		<table class="postListTable">
			<tr>
				<th>게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<%
				PostDAO dao = new PostDAO();
				ArrayList<PostVO> list;
				
				switch (request.getParameter("postType")) {
					case "공지게시판" :
						list = dao.getPostTypeList("공지게시판");
						break;
					case "자유게시판" :
						list = dao.getPostTypeList("자유게시판");
						break;
					case "질문게시판" :
						list = dao.getPostTypeList("질문게시판");
						break;
					case "정보게시판" :
						list = dao.getPostTypeList("정보게시판");
						break;
					case "분실물게시판" :
						list = dao.getPostTypeList("분실물게시판");
						break;
					case "과별게시판" :
						list = dao.getPostTypeList("과별게시판");
						break;
					case "스마트전자과게시판" :
						list = dao.getPostTypeList("스마트전자과게시판");
						break;
					case "정보통신과게시판" :
						list = dao.getPostTypeList("정보통신과게시판");
						break;
					case "소프트웨어개발과게시판" :
						list = dao.getPostTypeList("소프트웨어개발과게시판");
						break;
					case "바이오화학과게시판" :
						list = dao.getPostTypeList("바이오화학과게시판");
						break;
					case "생명정보과게시판" :
						list = dao.getPostTypeList("생명정보과게시판");
						break;
				}
					
				 list = dao.getPostList();
				
				if (list != null) {
					for (PostVO data : list) {
			%>
			
						<tr>
							<td><%= data.getPostType() %></td>
							<td id="post_list_title"><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
				
							<%
								if (data.getPostSet().equals("A")) {
							%>
				
									<td>익명</td>
				
							<%
								} else {
							%>
				
									<td><%= data.getPostWriter() %></td>
				
							<%
								}
							%>
				
							<td><%= data.getPostTime() %></td>
						</tr>
			
						<%
								}
							}
						%>
		
						</table>
					</div>

<%@ include file="/footer.jsp" %>