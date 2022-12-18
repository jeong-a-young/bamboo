<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<section id="list_post_section">
    <h1 class="mb-4" style="text-align: center;">게시글 목록</h1>

    <div class="w-100">
        <table>
            <thead>
                <tr>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>		
            <tbody>
            
            <%
				PostDAO dao = new PostDAO();
	            // category가 '전체'라면
				if (request.getParameter("category").equals("전체")) {
					// 모든 게시글 목록을 불러오는 함수 호출
					ArrayList<PostVO> list = dao.getPost();
					
					for (PostVO data : list) {
			%>
			
                <tr>
                    <td><%= data.getPostCategory() %></td>
                    <td><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
                    
                    <%
						if (data.getPostType().equals("A")) {
					%>
					
                    <td>익명</td>
                    
                    <%
						} else {
					%>
					
					<td><%= data.getPostWriter() %></td>
					
					<%
						}
					%>
					
                    <td><%= data.getPostDate() %></td>
                </tr>
                
            <%
					}
				} else if (request.getParameter("category").equals("공지게시판")) {
					// category가 '공지게시판'인 게시글 목록을 불러오는 함수 호출
					ArrayList<PostVO> list = dao.getCategoryPost("공지게시판");
				
					for (PostVO data : list) {
			%>
			
				<tr>
                    <td><%= data.getPostCategory() %></td>
                    <td><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
                    
                    <%
						if (data.getPostType().equals("A")) {
					%>
					
                    <td>익명</td>
                    
                    <%
						} else {
					%>
					
					<td><%= data.getPostWriter() %></td>
					
					<%
						}
					%>
					
                    <td><%= data.getPostDate() %></td>
                </tr>
                
            <%
					}
				} else if (request.getParameter("category").equals("자유게시판")) {
					ArrayList<PostVO> list = dao.getCategoryPost("자유게시판");
				
					for (PostVO data : list) {
			%>
			
				<tr>
                    <td><%= data.getPostCategory() %></td>
                    <td><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
                    
                    <%
						if (data.getPostType().equals("A")) {
					%>
					
                    <td>익명</td>
                    
                    <%
						} else {
					%>
					
					<td><%= data.getPostWriter() %></td>
					
					<%
						}
					%>
					
                    <td><%= data.getPostDate() %></td>
                </tr>
                
            <%
					}
				} else if (request.getParameter("category").equals("질문게시판")) {
					ArrayList<PostVO> list = dao.getCategoryPost("질문게시판");
				
					for (PostVO data : list) {
			%>
			
				<tr>
                    <td><%= data.getPostCategory() %></td>
                    <td><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
                    
                    <%
						if (data.getPostType().equals("A")) {
					%>
					
                    <td>익명</td>
                    
                    <%
						} else {
					%>
					
					<td><%= data.getPostWriter() %></td>
					
					<%
						}
					%>
					
                    <td><%= data.getPostDate() %></td>
                </tr>
                
            <%
					}
				} else if (request.getParameter("category").equals("정보게시판")) {
					ArrayList<PostVO> list = dao.getCategoryPost("정보게시판");
				
					for (PostVO data : list) {
			%>
			
				<tr>
                    <td><%= data.getPostCategory() %></td>
                    <td><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
                    
                    <%
						if (data.getPostType().equals("A")) {
					%>
					
                    <td>익명</td>
                    
                    <%
						} else {
					%>
					
					<td><%= data.getPostWriter() %></td>
					
					<%
						}
					%>
					
                    <td><%= data.getPostDate() %></td>
                </tr>
                
            <%
					}
				} else if (request.getParameter("category").equals("분실물게시판")) {
					ArrayList<PostVO> list = dao.getCategoryPost("분실물게시판");
				
					for (PostVO data : list) {
			%>
			
				<tr>
                    <td><%= data.getPostCategory() %></td>
                    <td><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
                    
                    <%
						if (data.getPostType().equals("A")) {
					%>
					
                    <td>익명</td>
                    
                    <%
						} else {
					%>
					
					<td><%= data.getPostWriter() %></td>
					
					<%
						}
					%>
					
                    <td><%= data.getPostDate() %></td>
                </tr>
                
            <%
					}
				} else if (request.getParameter("category").equals("과별게시판")) {
					// category가 '스마트전자과게시판', '정보통신과게시판', '소프트웨어개발과게시판',
					// '바이오화학과게시판', '생명정보과게시판'중 하나인 게시글 목록을 불러오는 함수 호출
					ArrayList<PostVO> list = dao.getMajorPost();
				
					for (PostVO data : list) {
			%>
			
				<tr>
                    <td><%= data.getPostCategory() %></td>
                    <td><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
                    
                    <%
						if (data.getPostType().equals("A")) {
					%>
					
                    <td>익명</td>
                    
                    <%
						} else {
					%>
					
					<td><%= data.getPostWriter() %></td>
					
					<%
						}
					%>
					
                    <td><%= data.getPostDate() %></td>
                </tr>
                
            <%
					}
				}
            %>
	  
            </tbody>
        </table>
    </div>
</section>

<%@ include file="/footer.jsp"%>