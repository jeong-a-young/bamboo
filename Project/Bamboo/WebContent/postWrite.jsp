<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

	<div class="writeInput">
		<form action="/write" method="post">
			<div class="headerWrite">
				<p id="titleTitle">제목</p>
				<input type="text" name="postTitle" id="titleBox">

				<select name="postType" id="typeSelect">
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

				<div class="setInput">
					<input type="radio" name="postSet" value="a"> 익명
					<input type="radio" name="postSet" value="r"> 실명
				</div>

				<p id="titleTitle">이미지</p>
				<input type="file" id="photoInput" name="postPhoto" accept="image/*" multiple>
			</div>
			
			<div class="bodyWrite">
				<textarea name="postContent" id="contetnBox"></textarea>
			</div>

			<div class="footerWrite">
				<input type="submit" id="upload_btn" value="업로드">
			</div>
			
			
		</form>
	</div>
	
<%@ include file="/footer.jsp" %>