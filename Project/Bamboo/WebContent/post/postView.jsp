<%@page import="vo.ReplyVO"%>
<%@page import="dao.ReplyDAO"%>
<%@page import="dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<section style="height: 170vh;">

    <div id="view_post">
    
    <%
		HttpSession hs = request.getSession();
		PostDAO pd = new PostDAO();
		ArrayList<PostVO> postList = pd.getClickPost(Integer.parseInt(request.getParameter("postId")));
	
		if (postList != null) {
			for (PostVO pv : postList) {
	%>
	
        <div class="postTitle">
            <h1><%=pv.getPostTitle()%></h1>
        </div>

        <div class="postInfo">
        
       	<%
			if (pv.getPostType().equals("A")) {
		%>
			
            <p>익명</p><p> | </p> 
            	
        <%
			} else {
		%>
			
			<p><%=pv.getPostWriter()%></p><p> | </p> 
			
		<%
			}
		%>
		
            <p><%=pv.getPostCategory()%></p><p> | </p>
            <p><%=pv.getPostDate()%></p>
            
        <%
			// 현재 로그인 되어있는 사용자와 게시글 작성자가 동일할 때
			if (pv.getPostWriter().equals(hs.getAttribute("nowLoginName"))) {
				hs.setAttribute("deletePostId", pv.getPostId());
		%>
	
			<p>|</p>
	
			<form method="post">
				<button class="viewControlBtn"><a href="postEdit.jsp?postId=<%=pv.getPostId()%>" style="display: block">수정</a></button>
				<button class="viewControlBtn" formaction="/postDelete">삭제</button>
			</form>
	
		<%
			}
		%>
		
        </div>

        <hr id="view_post_hr">

        <div class="postContents">
            <p><%=pv.getPostContent()%></p>
            
        <%
			if (!pv.getPostImage().equals("/postImage/null")) {
		%>
	
			<img src="<%=request.getContextPath()%><%=pv.getPostImage()%>" style="width: 100%;">
	
		<%
			}
	
					hs.setAttribute("replyPostId", pv.getPostId());
				}
			}
		%>
		
        </div>
    </div>

    <div id="reply_wrap">
        <form action="/replyWrite" method="post">
        	<div><input type="radio" name="replyType" value="A"> 익명</div>
            <div><input type="radio" name="replyType" value="R"> 실명</div>
            <input type="text" name="replyContent" placeholder="댓글을 입력해 주세요.">
            <input type="submit" value="작성">
        </form>
    </div>

    <div class="w-100">
        <table>
            
            <%
				ReplyDAO rd = new ReplyDAO();
				ArrayList<ReplyVO> replyList = rd.getReply(Integer.parseInt(request.getParameter("postId")));

				// 게시글에 댓글이 없을 때
				if (replyList.toString().equals("[]")) {
			%>
			
	            <tr>
	                <td>댓글이 없습니다.</td>
	            </tr>
	            
            
            <%
				} else {
			%>
			<thead>
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>		
            <tbody>
	            <tr>
	            
	            <%
					for (ReplyVO rv : replyList) {
						if (rv.getReplyType().equals("A")) {
				%>
	
					<td>익명</td>

				<%
					} else {
				%>
	
					<td><%= rv.getReplyWriter() %></td>

				<%
					}
				%>
	
					<td id="reply<%= rv.getReplyId() %>"><%= rv.getReplyContent() %></td>

	
				<%
					// 현재 로그인 되어있는 사용자와 댓글 작성자가 동일할 때
					if (rv.getReplyWriter().equals(hs.getAttribute("nowLoginName"))) {
						System.out.println(rv.getReplyContent());
						
				%>

					<td><a href="javacsript:void(0);" id="edit_btn<%=rv.getReplyId()%>" onclick="editReply(<%= rv.getPostId() %>, <%= rv.getReplyId() %>, '<%= rv.getReplyContent() %>')">수정</a></td>
					<td><a href="/replyDelete?replyId=<%=rv.getReplyId()%>" id="delete_btn<%=rv.getReplyId()%>">삭제</a></td>

				<%
							}
				%>
				
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