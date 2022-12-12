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
      <form method="post">
        <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" class="logo"></a>
        <h2 class="title">회원가입</h2>
              <div class="input-div one">
                 <div class="i">
                    <i class="fas fa-user"></i>
                 </div>
                 <div class="div">
                    <h5>ID</h5>
                    <input type="text" class="input" name="id">
                 </div>
              </div>
              <div class="input-div one">
               <div class="i">
                  <i class="fas fa-user"></i>
               </div>
               <div class="div">
                  <h5>이름</h5>
                  <input type="text" class="input" name="name">
               </div>
            </div>
              <div class="input-div pass">
                 <div class="i"> 
                    <i class="fas fa-lock"></i>
                 </div>
                 <div class="div">
                    <h5>비밀번호</h5>
                    <input type="password" class="input" id="password_input" name="pwd">
                 </div>
              </div>
              <div class="input-div pass">
               <div class="i"> 
                  <i class="fas fa-lock"></i>
               </div>
               <div class="div">
                  <h5>비밀번호 확인</h5>
                  <input type="password" class="input" id="password_check_input" name="pwdCk">
               </div>
            </div>
            <div>
               <p id="password_check_p"></p>
            </div>
            <div class="input-div pass">
               <div class="i"> 
                  <i class="fa fa-envelope"></i>
               </div>
               <div class="div">
                  <h5>이메일</h5>
                  <input type="text" class="input" name="email" style="width: 50%;">
                  <p class="registerEmailP">@y-y.hs.kr</p>
                  <button><input type="submit" value="인증" formaction="/sendAuthenticationMail" style="border: none;"></button>
               </div>
            </div>
            <a href="https://support.bespinglobal.com/ko/support/solutions/articles/73000545270--gmail-pop-%EB%B0%8F-imap-%ED%99%9C%EC%84%B1%ED%99%94-%ED%95%98%EA%B8%B0" target="_black">이메일이 오지 않았을 땐?</a>
            <div class="registerTypeWrap">
               <div class="i"> 
                  <i class="fa fa-address-card"></i>
               </div>
               <div class="registerTypeDiv">
                  <input type="radio" name="type" value="S"><p>학생</p>
                  <input type="radio" name="type" value="T"><p>교직원</p>
               </div>
            </div>
              <a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a>
              <input type="submit" class="btn" value="회원가입" formaction="/register">
            </form>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>