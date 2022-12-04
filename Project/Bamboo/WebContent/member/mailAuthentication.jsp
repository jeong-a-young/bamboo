<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
인증 되었습니다. 회원가입 창으로 돌아가주세요.
<%
	session.setAttribute("mailCheckNum", 1);
%>
</body>
</html>