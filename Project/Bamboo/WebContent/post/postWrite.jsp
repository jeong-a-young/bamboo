<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<div class="writeWrap" style="height: 85vh;">
	<form action="/postWrite" method="post" enctype="multipart/form-data">
		<div class="infoWrap">
			<p id="title">제목</p>
			<input type="text" name="postTitle" id="title_input">

			<select name="postCategory" id="category_select">
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

			<div class="typeWrap">
				<input type="radio" name="postType" value="A"> 익명
				<input type="radio" name="postType" value="R"> 실명
			</div>

			<p id="title">이미지</p>
			<input type="file" id="image_input" name="postImage" accept="image/*">
		</div>
		
		<div class="textareaWrap">
			<textarea name="postContent" class="contetnBox"></textarea>
		</div>

		<div class="inputWrap">
			<input type="submit" class="uploadBtn" value="업로드">
		</div>
	</form>
</div>
	
<%@ include file="/footer.jsp" %>