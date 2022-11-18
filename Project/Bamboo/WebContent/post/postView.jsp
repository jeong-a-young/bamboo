<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="dao.CommentDAO"%>
<%@page import="vo.CommentVO"%>
<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<%
		PostDAO pd = new PostDAO();
		ArrayList<PostVO> postList = pd.getClickPost(Integer.parseInt(request.getParameter("postId")));
		HttpSession hs = request.getSession();
		
		if (postList != null) {
			for (PostVO pv : postList) {
	%>
	
				<div class="postView">
					<p id="post_view_title"><%= pv.getPostTitle() %></p>
		
					<div class="viewInfo">
						
					<%
						if (pv.getPostSet().equals("A")) {
					%>	
					
							<p>익명</p><p> | </p>
			
					<%
						} else {
					%>	
				
							<p><%= pv.getPostWriter() %></p><p> | </p>
			
					<%
						}
					%>
		
						<p><%= pv.getPostType() %></p><p> | </p>
						<p><%= pv.getPostTime() %></p>
						
						<%
							if (pv.getPostWriter().equals(hs.getAttribute("nowLoginName"))) {
								hs.setAttribute("deletePostId", pv.getPostId());
						%>
								<p> | </p>
								<form method="post">
									<button onclick="location.href='postEdit.jsp?postId=<%= pv.getPostId() %>'">수정</button>
									<button formaction="/deletePost">삭제</button>
								</form>
					
						<%
							}
						%>
						
					</div>
					
					<hr class="contourLine">
		
					<p id="post_view_contents"><%= pv.getPostContents() %></p>
		
					<%
						if (!pv.getPostPhoto().equals("/postImage/null")) {
					%>
			
							<img src="<%=request.getContextPath()%><%= pv.getPostPhoto() %>" style="padding: 0 0 25px 35px;">
			
					<%
						}
					
						hs.setAttribute("commentPostId", pv.getPostId());				
					}
				}
			%>
		
			<div class="comment">
				<form action="/comment" method="post">
					<input type="radio" name="commentSet" value="A"> 익명
					<input type="radio" name="commentSet" value="R"> 실명
					
					<input type="text" name="commentContent" placeholder="댓글을 입력해 주세요.">
					
					<input type="submit" value="작성">
				</form>
			</div>
		
			<div class="">
				<table>
					
					<%
						CommentDAO cd = new CommentDAO();
						ArrayList<CommentVO> commentList = cd.getComment(Integer.parseInt(request.getParameter("postId")));

						if (commentList.toString().equals("[]")) {
					%>
					
						<tr>
							<td>댓글이 없습니다.</td>
						</tr>
						
					<%	
						} else {
					%>
						
							<tr>
								<th>작성자</th>
								<th>내용</th>
							</tr>
							
						<%
							for (CommentVO cv : commentList) {
								
						%>
					
								<tr>
									<%
										if (cv.getCommentWriter().equals(hs.getAttribute("nowLoginName"))) {
									%>
										
										<td><a href="/deleteComment?commentId=<%= cv.getCommentId() %>">삭제</a></td>
									
									<%
										}
									
										if (cv.getCommentSet().equals("A")) {
									%>
					
										<td>익명</td>
					
									<%
										} else {
									%>
								
										<td><%= cv.getCommentWriter() %></td>
					
									<%
										}
									%>
						
										<td><%= cv.getCommentContents() %></td>
									</tr>
									
									<%
											}
										}
									%>
								</table>
							</div>
						</div>
		
<%@ include file="/footer.jsp" %>