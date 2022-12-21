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
            	// session에 저장된 검색 결과를 가져옴
				ArrayList<PostVO> list = (ArrayList) session.getAttribute("searchPost");
	
				if (list != null) {
					for (PostVO data : list) {
			%>
			
                <tr>
                    <td><%= data.getPostCategory() %></td>
                    <td><a href="postView.jsp?postId=<%= data.getPostId() %>"><%= data.getPostTitle() %></a></td>
                    
                    <%
                 		// 게시글 세팅을 A로 했으면 익명, R로 했으면 실명
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