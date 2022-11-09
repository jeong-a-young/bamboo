<%@page import="dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<section>
    <div class="welcome">
    	bamboo에서 <br>
    	양영디지털고등학교의 <br>
    	소식을 만나보세요	
    </div>
    
    <%
    	if (login == null) {
    %>
    
	    <div class="notice">
	    	<p>지금 로그인 하고
	    	새 글을 확인해 보세요.</p>
	    	
	    	<div class="indexBtn">
	    		<button id="index_login_btn" onclick="location.href='${pageContext.request.contextPath}/member/login.jsp'">로그인</button>
	    		<button id="index_register_btn" onclick="location.href='${pageContext.request.contextPath}/member/register.jsp'">회원가입</button>
	    	</div>
	    </div>
	    
    <%
    	} else {
    	
	    	PostDAO dao = new PostDAO();
	    	ArrayList<String> list = dao.getPostList();
	%>
	
		<button id="post_write_btn" onclick="location.href='${pageContext.request.contextPath}/postWrite.jsp'">글쓰기</button>
		
	<%
	    	if(list.isEmpty()) {
	    		out.print("<tr><td>게시글이 없습니다.</td></tr>");
	    	} else {
	    		for (String data : list) {
    %>
   		
   		<select name="postType" id="typeSelect">
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
		
    	<div class="post">
    		<table>
    			<tr>
    				<th>게시글 ID</th>
	    			<th>제목</th>
	    			<th>작성자</th>
	    			<th>작성일</th>
    			</tr>
    			<tr>
    				<% System.out.print(list.indexOf(1)); %>
    				<td><%= list.indexOf(1) %></td>
    			</tr>
    		</table>
    	</div>
    	
    <%			}
	    	}
    	}
    %>
</section>

<%@ include file="/footer.jsp" %>