<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <%
		PostDAO dao = new PostDAO();
		ArrayList<PostVO> list = dao.getPostList();

	%>
	
	<select id="post_list_type">
		<option value="전체">전체</option>
		<option value="공지게시판">공지게시판</option>
		<option value="자유게시판">자유게시판</option>
		<option value="질문게시판">질문게시판</option>
		<option value="정보게시판">정보게시판</option>
		<option value="분실물게시판">분실물게시판</option>
		<option value="스마트전자과게시판">스마트전자과게시판</option>
		<option value="정보통신과게시판">정보통신과게시판</option>
		<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
		<option value="바이오화학과게시판">바이오화학과게시판</option>
		<option value="생명정보과게시판">생명정보과게시판</option>
	</select>
	
	<div class="postList">
		<table class="postListTable">
			<tr>
				<th>게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<%
			
			if (list != null) {
				for (PostVO data : list) {
			
			%>
			
			<tr>
				<td><%= data.getPostType() %></td>
				<td id="post_list_title"><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
				
				<%
					if (data.getPostSet().equals("a")) {
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