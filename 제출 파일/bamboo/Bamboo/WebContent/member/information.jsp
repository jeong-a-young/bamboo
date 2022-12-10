<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1 id="information_title">회원정보</h1>
    
    <form method="post">
	    <div class="information">
	    	<table>
				<tr>
					<th class="boxTitle">ID</th>
					<!-- session을 이용해 'nowLoginId'라는 이름으로 저장 되어있는 값을 가져온다 -->
					<td class="fixValue"><%= session.getAttribute("nowLoginId") %></td>
				</tr>
				<tr>
					<th class="boxTitle">비밀번호</th>
					<td><input type="text" class="informationTextBox" name="editPwd" value="<%= session.getAttribute("nowLoginPwd") %>"></td>
				</tr>
				<tr>
					<th class="boxTitle">이름</th>
					<td><input type="text" class="informationTextBox" name="editName" value="<%= session.getAttribute("nowLoginName") %>"></td>
				</tr>
				<tr>
					<th class="boxTitle">이메일</th>
					<td><input type="text" class="informationTextBox" name="editEmail" value="<%= session.getAttribute("nowLoginEmail") %>"></td>
				</tr>
				<tr>
					<th class="boxTitle">구분</th>
					<td class="fixValue">
					
						<%
							// 회원가입 할 때 타입을 S로 설정했으면 학생, T로 설정했으면 교사
							if (session.getAttribute("nowLoginType").equals("S")) {
						%>
						
						<input type="radio" name="editType" value="S" checked="checked"> 학생	
						<input type="radio" name="editType" value="T"> 교사
						
						<%
							} else {
						%>	
						
						<input type="radio" name="editType" value="S"> 학생
						<input type="radio" name="editType" value="T" checked="checked"> 교사
							
						<%
							}
						%>
						
					</td>
				</tr>
			</table>
	    </div>
	
		<div class="informationBtn">
			<button id="edit_btn" formaction="/memberEdit">수정</button>
			<button id="unregister_btn" formaction="/unregister">탈퇴하기</button>
		</div>
    </form>
	
<%@ include file="/footer.jsp" %>