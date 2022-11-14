<%@page import="vo.PostVO"%>
<%@page import="dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<!-- 서버 경로: / -->

<section>
	<div class="welcome">
		bamboo에서 <br> 양영디지털고등학교의 <br> 소식을 만나보세요
	</div>

	<%
		if (login == null) {
	%>

	<div class="notice">
		<p>지금 로그인 하고 새 글을 확인해 보세요.</p>

		<div class="indexBtn">
			<button id="index_login_btn"
				onclick="location.href='${pageContext.request.contextPath}/member/login.jsp'">로그인</button>
			<button id="index_register_btn"
				onclick="location.href='${pageContext.request.contextPath}/member/register.jsp'">회원가입</button>
		</div>
	</div>

	<%
		} else {
	%>

	<button id="post_write_btn"
		onclick="location.href='${pageContext.request.contextPath}/post/postWrite.jsp'">글쓰기</button>

	<%
		ArrayList<PostVO> list = (ArrayList<PostVO>) request.getAttribute("recentPost");
	%>

	<table>
		<tr>
			<th>게시글 ID</th>
			<th>작성자</th>
			<th>제목</th>
			<th>익명 / 실명</th>
			<th>게시판</th>
			<th>내용</th>
			<th>게시일</th>
			<th>이미지</th>
		</tr>

		<%
		System.out.print(list);
			if (list != null) {
					for (PostVO data : list) {
						System.out.print(data.getPostId());
		%>
		<tr>
			<td><%=data.getPostId()%></td>
			<td><%=data.getPostTitle()%></td>
			<td><%=data.getPostSet()%></td>
			<td><%=data.getPostType()%></td>
			<td><%=data.getPostContents()%></td>
			<td><%=data.getPostTime()%></td>
			<td><%=data.getPostPhoto()%></td>
		</tr>
	</table>
	<%
		}
			}
		}
	%>
</section>

<%@ include file="/footer.jsp"%>