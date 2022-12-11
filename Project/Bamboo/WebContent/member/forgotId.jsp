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
      <form action="/forgotId" method="post">
        <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" class="logo"></a>
        <h2 class="title">ID 찾기</h2>
            <div class="input-div pass">
               <div class="i"> 
                  <i class="fa fa-envelope"></i>
               </div>
               <div class="div">
                  <h5>이메일</h5>
                  <input type="text" class="input" name="email" style="width: 50%;">
                  <p class="registerEmailP">@y-y.hs.kr</p>
                  <button><input type="submit" value="인증" style="border: none;"></button>
               </div>
            </div>
              <div class="a">
                <a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a>
                <a href="${pageContext.request.contextPath}/member/forgotPassword.jsp">비밀번호 찾기</a>
              </div>
            </form>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>