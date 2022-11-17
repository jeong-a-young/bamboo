<%@page import="dao.CommentDAO"%>
<%@page import="vo.CommentVO"%>
<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<%
		PostDAO dao = new PostDAO();
		ArrayList<PostVO> list = dao.getClickPost(Integer.parseInt(request.getParameter("postId")));

		HttpSession s = request.getSession();
		if (list != null) {
			for (PostVO data : list) {
	%>
	
	<div class="postView">
		<p id="post_view_title"><%= data.getPostTitle() %></p>
		
		<div class="viewInfo">
		<%
			if (data.getPostWriter().equals(s.getAttribute("nowLoginName"))) {
		%>
		
			<button>수정</button>
			<button>삭제</button>
		<%
			}
		
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
		
		<%
				if (!data.getPostPhoto().equals("/postImage/null")) {
			%>
			
				<img src="<%=request.getContextPath()%><%= data.getPostPhoto() %>" style="padding: 0 0 25px 35px;">
			
			<% } %>

		<%			
					s.setAttribute("commentPostId", data.getPostId());
				}
			}
			
		%>
		
		<div class="comment">
			<form action="/comment" method="post">
				<input type="radio" name="commentSet" value="a"> 익명
				<input type="radio" name="commentSet" value="r"> 실명
				<input type="text" name="commentContent" placeholder="댓글을 입력해 주세요.">
				<input type="submit" value="작성">
			</form>
		</div>
		
		<div>
			<table>
				<tr>
					<th>작성자</th>
					<th>내용</th>
				</tr>
				
				<%
				CommentDAO cd = new CommentDAO();
				ArrayList<CommentVO> clist = cd.getComment(Integer.parseInt(request.getParameter("postId")));
				
				if (list != null) {
					for (CommentVO cdata : clist) {
				
				%>
				
				<tr>
					<%
						if (cdata.getCommentSet().equals("a")) {
					%>
				
					<td>익명</td>
				
					<%
						} else {
					%>
				
					<td><%= cdata.getCommentWriter() %></td>
				
					<%
						}
					%>
					
					<td><%= cdata.getCommentContents() %></td>
				</tr>
				<%
						}
					}
				%>
			</table>
		</div>
	</div>
		
<%@ include file="/footer.jsp" %>