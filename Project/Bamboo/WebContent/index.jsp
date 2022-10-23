<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bamboo - 양디고 대나무숲</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <div class="wrapper">
        <header> 
            <a href="index.jsp"><img src="./images/logo.png" id="logo"></a>

            <input type="text" id="search">
            <button>검색</button>

            <%
				MemberVO login = (MemberVO)session.getAttribute("loginOK");

                if (login == null) {

			%> 

                    <a href="./member/login.jsp">로그인</a>
				
			<%
				} else {
			%>

                    <button>로그아웃</button>
                    <a href="./member/information.jsp"><img src="./images/" id="information"></a>
		
			<%
				}
			%>
        </header>

        <section>

        </section>
    </div>
</body>
</html>