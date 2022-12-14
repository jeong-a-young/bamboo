<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<%
	HttpSession hs = request.getSession();
	PostDAO dao = new PostDAO();
	// 클릭한 게시글의 postId를 parameter로 받아 해당 게시글을 보여줌
	ArrayList<PostVO> list = dao.getClickPost(Integer.parseInt(request.getParameter("postId")));
	
	if (list != null) {
		for (PostVO data : list) {
%>

	<div style="height: 90vh;">
		<form action="/postEdit" method="post">
			<div class="infoWrap">
				<p id="title">제목</p>
				<input type="text" name="editPostTitle" id="title_input" value="<%= data.getPostTitle() %>">

				<select name="editPostCategory" id="category_select">
				
					<%
						// 수정할 글이 작성 되어있던 게시판에 따라 선택 되어있는 값을 변경
						switch (data.getPostCategory()) {
							case "공지게시판" :
					%>
					
					<option value="공지게시판" selected="selected">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
				
					<%
								break;
							case "자유게시판" :
					%>
					
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판" selected="selected">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
						
					<%
								break;
							case "질문게시판" :
					%>
					
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판" selected="selected">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
															
					<%
								break;
							case "정보게시판" :
					%>
					
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판" selected="selected">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
																
					<%
								break;
							case "분실물게시판" :
					%>
							
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판" selected="selected">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
																			
					<%
								break;
							case "스마트전자과게시판" :
					%>
								
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판" selected="selected">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
																				
					<%
								break;
							case "정보통신과게시판" :
					%>
										
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판" selected="selected">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
																					
					<%
								break;
							case "소프트웨어개발과게시판" :
					%>
												
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판" selected="selected">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
																						
					<%
								break;
							case "바이오화학과게시판" :
					%>
														
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판" selected="selected">바이오화학과게시판</option>
					<option value="생명정보과게시판">생명정보과게시판</option>
																							
					<%
								break;
							case "생명정보과게시판" :
					%>
														
					<option value="공지게시판">공지게시판</option>
					<option value="자유게시판">자유게시판</option>
					<option value="질문게시판">질문게시판</option>
					<option value="정보게시판">정보게시판</option>
					<option value="분실물게시판">분실물게시판</option>
					<option value="스마트전자과게시판">스마트전자과게시판</option>
					<option value="정보통신과게시판">정보통신과게시판</option>
					<option value="소프트웨어개발과게시판">소프트웨어개발과게시판</option>
					<option value="바이오화학과게시판">바이오화학과게시판</option>
					<option value="생명정보과게시판" selected="selected">생명정보과게시판</option>
					
					<%
							break;
						}
					%>	
										
				</select>

				<div class="typeWrap">
				
				<%
					// 게시글 세팅을 A로 했으면 익명, R로 했으면 실명
					if (data.getPostType().equals("A")) {
				%>
					
					<input type="radio" name="editPostType" value="A" checked="checked"> 익명
					<input type="radio" name="editPostType" value="R"> 실명
						
				<%
					} else {
				%>
		
					<input type="radio" name="editPostType" value="A"> 익명
					<input type="radio" name="editPostType" value="R" checked="checked"> 실명
				
				<%
					} 
				%>
					
				</div>
			</div>
			
			<div class="textareaWrap">
				<textarea name="editPostContent" class="contetnBox"><%= data.getPostContent() %></textarea>
			</div>
			
			<%
						hs.setAttribute("editPostId", data.getPostId());	
					}
				}
			%>

			<div class="inputWrap">
				<input type="submit" class="uploadBtn" value="수정">
			</div>
		</form>
	</div>
			
<%@ include file="/footer.jsp" %>