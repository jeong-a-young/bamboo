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
		// 메일에서 링크를 클릭 시 해당 페이지로 접속, session에 값을 저장해서 메일 인증을 했는지 확인
		session.setAttribute("mailAuthentication", 1);
		out.println("<script> alert('이메일 인증에 성공했습니다. 원래 화면으로 돌아가 진행해 주세요.'); window.close(); </script>");
	%>

</body>
</html>