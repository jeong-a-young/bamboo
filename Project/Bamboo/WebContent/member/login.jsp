<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <h1>로그인</h1>

    <input type="text" name="id" placeholder="ID를 입력해 주세요."><br>
    <input type="password" name="pwd" placeholder="비밀번호를 입력해 주세요."><br>
    <button type="submit">로그인</button>
    
    <ul>
        <li><a href="#">회원가입</a></li>
        <li><a href="#">ID 찾기</a></li>
        <li><a href="#">비밀번호 찾기</a></li>
    </ul>

<%@ include file="/footer.jsp" %>