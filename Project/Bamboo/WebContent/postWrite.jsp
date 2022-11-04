<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

	<form action="/write" method="post">
	    <input type="text" name="postTitle">
	    <select name="postType">
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
	    <input type="radio" name="postSet" value="a"> 익명
	    <input type="radio" name="postSet" value="r"> 실명
	    <textarea name="postContent"></textarea>
	    <input type="submit" value="업로드">
	</form>
    
<%@ include file="/footer.jsp" %>