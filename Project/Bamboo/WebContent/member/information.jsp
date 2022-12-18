<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>bamboo</title>
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css">
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>    
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
            <h2 class="title" style="margin: 5px 0 40px 0;">회원정보</h2>

            <div class="input-div one focus">
               <div class="i">
                  <i class="fas fa-user"></i>
               </div>
               <div class="div">
                  <h5>ID</h5>
                  <input type="text" class="input" name="id" value="<%= session.getAttribute("nowLoginId") %>" readonly>
               </div>
            </div>

            <div class="input-div one focus">
               <div class="i">
                  <i class="fas fa-user"></i>
               </div>
               <div class="div">
                  <h5>이름</h5>
                  <input type="text" class="input" name="name" value="<%= session.getAttribute("nowLoginName") %>">
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

            <div class="input-div pass focus" style="margin-top: 15px;">
               <div class="i"> 
                  <i class="fa fa-envelope"></i>
               </div>
               <div class="div">
                  <h5>이메일</h5>
                  
                  <%
                  	String nowLoginEmail = (String) session.getAttribute("nowLoginEmail");
                  	String [] email = nowLoginEmail.split("@");
                  %>
                  
                  <input type="text" class="input" name="email" value="<%= email[0] %>" style="width: 50%;" readonly>
                  <p class="informationEmailP">@y-y.hs.kr</p>
               </div>
            </div>

            <div class="informationTypeWrap">
               <div class="i"> 
                  <i class="fa fa-address-card"></i>
               </div>
               <div class="registerTypeDiv">
                     
               <%
                  // 회원가입 할 때 타입을 S로 설정했으면 학생, T로 설정했으면 교사
                  if (session.getAttribute("nowLoginType").equals("S")) {
               %>
               
                  <input type="radio" name="type" value="S" checked="checked"><p>학생</p>
                  <input type="radio" name="type" value="T"><p>교직원</p>
                  
               <%
                  } else {
               %>
                  
                  <input type="radio" name="type" value="S"><p>학생</p>
                  <input type="radio" name="type" value="T" checked="checked"><p>교직원</p>
               
               <%
                  }
               %>
                  
               </div>
            </div>

            <button id="edit_btn" formaction="/memberEdit">수정</button>
            <button id="unregister_btn" formaction="/unregister">탈퇴하기</button>
         </form>
      </div>
   </div>
   
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>