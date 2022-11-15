<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<%
		PostDAO dao = new PostDAO();
		ArrayList<PostVO> list = dao.getClickPost(Integer.parseInt(request.getParameter("postId")));

		if (list != null) {
			for (PostVO data : list) {
	%>
	
	<div class="postView">
		<p id="post_view_title"><%= data.getPostTitle() %></p>
		
		<div class="viewInfo">
		<%
			if (data.getPostSet().equals("a")) {
		%>	
					
			<p>익명</p>
			<p> | </p>
				
		<%
			} else {
		%>	
				
			<p><%= data.getPostWriter() %></p>
			<p> | </p>
			
		<%
			}
		%>
		
			<p><%= data.getPostType() %></p>
			<p> | </p>
			<p><%= data.getPostTime() %></p>
		</div>
		
		<hr class="contourLine">
		
		<p id="post_view_contents"><%= data.getPostContents() %></p>
		<img src="<%=request.getContextPath()%><%= data.getPostPhoto() %>" style="padding: 0 0 25px 35px;">
		
		<%
				}
			}
		%>
	</div>
		
<%@ include file="/footer.jsp" %>