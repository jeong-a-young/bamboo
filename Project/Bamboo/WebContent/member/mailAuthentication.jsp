<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bamboo</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
</head>
<body>

	<%
		session.setAttribute("mailAuthentication", 1);
		out.println("<script> alert('이메일 인증에 성공했습니다. 원래 화면으로 돌아가 진행해 주세요.'); window.close(); </script>");
	%>

</body>
</html>