<%@page import="dao.CommentDAO"%>
<%@page import="vo.CommentVO"%>
<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

	<%
		HttpSession hs = request.getSession();
		PostDAO pd = new PostDAO();
		ArrayList<PostVO> postList = pd.getClickPost(Integer.parseInt(request.getParameter("postId")));
	
		if (postList != null) {
			for (PostVO pv : postList) {
	%>
	
	<div class="post-wrap">

	
	<div class="postView">
		<p id="post_view_title"><%=pv.getPostTitle()%></p>
	
		<div class="viewInfo">
	
			<%
				if (pv.getPostSet().equals("A")) {
			%>
	
			<p>익명</p>
			<p>|</p>
	
			<%
				} else {
			%>
	
			<p><%=pv.getPostWriter()%></p>
			<p>|</p>
	
			<%
				}
			%>
	
			<p><%=pv.getPostType()%></p>
			<p>|</p>
			<p><%=pv.getPostTime()%></p>
	
			<%
				// 현재 로그인 되어있는 사용자와 게시글 작성자가 동일할 때
				if (pv.getPostWriter().equals(hs.getAttribute("nowLoginName"))) {
							hs.setAttribute("deletePostId", pv.getPostId());
			%>
	
			<p>|</p>
	
			<form method="post">
				<button><a href="postEdit.jsp?postId=<%=pv.getPostId()%>" style="display: block">수정</a></button>
				<button formaction="/postDelete">삭제</button>
			</form>
	
			<%
				}
			%>
	
		</div>

		<hr class="contourLine">

		<p id="post_view_contents"><%=pv.getPostContents()%></p>

		<%
			if (!pv.getPostPhoto().equals("/postImage/null")) {
		%>
	
		<img src="<%=request.getContextPath()%><%=pv.getPostPhoto()%>"
			style="padding: 0 0 25px 35px;">
	
		<%
			}
	
					hs.setAttribute("commentPostId", pv.getPostId());
				}
			}
		%>

		<div class="comment" style="position: relative; top: 105px;">
			<form action="/commentWrite" method="post">
				<input type="radio" name="commentSet" value="A"> 익명 <input
					type="radio" name="commentSet" value="R"> 실명 <input
					type="text" name="commentContent" placeholder="댓글을 입력해 주세요.">
	
				<input type="submit" value="작성">
			</form>
		</div>

		<div style="display: flex; justify-content: center; position: relative; top: 124px;">
			<form method="post">
			<table>

				<%
					CommentDAO cd = new CommentDAO();
					ArrayList<CommentVO> commentList = cd.getComment(Integer.parseInt(request.getParameter("postId")));
	
					// 게시글에 댓글이 없을 때
					if (commentList.toString().equals("[]")) {
				%>

				<tr>
					<td>댓글이 없습니다.</td>
				</tr>

				<%
					} else {
				%>

				<tr>
					<th></th>
					<th>작성자</th>
					<th>내용</th>
				</tr>

				<%
					for (CommentVO cv : commentList) {
				%>

				<tr>
				
					<%
						// 현재 로그인 되어있는 사용자와 댓글 작성자가 동일할 때
						if (cv.getCommentWriter().equals(hs.getAttribute("nowLoginName"))) {
					%>
	
					<td><button id="editBtn" onclick="answerEdit(<%= cv.getCommentId() %>, '<%= cv.getCommentContents() %>');">수정</button></td>
					<td><a href="/commentDelete?commentId=<%= cv.getCommentId() %>" id="deleteBtn">삭제</a></td>

					<%
						}
						
						if (cv.getCommentSet().equals("A")) {
					%>

					<td>익명</td>

					<%
						} else {
					%>
	
					<td><%=cv.getCommentWriter()%></td>
	
					<%
						}
					%>

					<td id="<%= "comment" + cv.getCommentId() %>"><%=cv.getCommentContents()%></td>
				</tr>

				<%
						}
					}
				%>
				
			</table>
			</form>
		</div>
	</div>
	</div>
	
<%@ include file="/footer.jsp"%>