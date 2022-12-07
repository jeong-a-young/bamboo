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
				ArrayList<PostVO> list = (ArrayList) session.getAttribute("searchPost");

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