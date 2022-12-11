<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bamboo</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <img class="wave" src="${pageContext.request.contextPath}/images/wave.png">
    <div class="container">
        <div class="img">
            <img src="${pageContext.request.contextPath}/images/bg.png">
        </div>
        <div class="login-content">
            <form action="/login" method="post">
                <a href="${pageContext.request.contextPath}/index.jsp" style="position: relative; left: -10%;"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
                <h2 class="title">로그인</h2>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5>ID</h5>
                            <input type="text" class="input" name="id">
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i">
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>비밀번호</h5>
                            <input type="password" class="input" name="pwd">
                        </div>
                    </div>
                    <div class="a">
                        <a href="${pageContext.request.contextPath}/member/forgotId.jsp">ID 찾기</a>
                        <a href="${pageContext.request.contextPath}/member/forgotPassword.jsp">비밀번호 찾기</a>
                    </div>
                    <input type="submit" class="btn" value="로그인">
            </form>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>