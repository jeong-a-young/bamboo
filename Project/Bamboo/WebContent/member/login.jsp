<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bamboo</title>
    <link rel="stylesheet" href="../css/loginStyle.css">
    <script src="../js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <div id="container" class="container">
        <!-- FORM SECTION -->
        <div class="row">
          <!-- SIGN UP -->
          <div class="col align-items-center flex-col sign-up">
            <div class="form-wrapper align-items-center">
              <div class="form sign-up">
                <div class="input-group">
                  <i class='bx bxs-user'></i>
                  <input type="text" placeholder="ID">
                </div>
                <div class="input-group">
                  <i class='bx bxs-lock-alt'></i>
                  <input id="password" type="password" placeholder="비밀번호">
                </div>
                <div class="input-group">
                  <i class='bx bxs-lock-alt'></i>
                  <input id="password_check_input" type="password" placeholder="비밀번호 확인">
                  <p id="password_check_p"></p>
                </div>
                <div class="input-group">
                  <i class='bx bx-mail-send'></i>
                  <div id="email_div">
                    <input type="email" placeholder="이메일" style="width: 70%;">
                    <p id="email_domain_p">@y-y.hs.kr</p>
                    <button id="email_authentication_button">인증하기</button>
                  </div>
                </div>
                <div class="input-group">
                  <i class='bx bx-user-type'></i>
                  <input type="radio" name="registerType" value="S"> 학생
                  <input type="radio" name="registerType" value="T"> 교직원
                </div>
                <button>
                	회원가입
                </button>
                <p>
                  <span>
                    	이미 bamboo에 가입하셨나요?
                  </span>
                  <b onclick="toggle()" class="pointer">
                    	로그인
                  </b>
                </p>
              </div>
            </div>
          
          </div>
          <!-- END SIGN UP -->
          <!-- SIGN IN -->
          <div class="col align-items-center flex-col sign-in">
            <div class="form-wrapper align-items-center">
              <div class="form sign-in">
                <div class="input-group">
                  <i class='bx bxs-user'></i>
                  <input type="text" placeholder="ID">
                </div>
                <div class="input-group">
                  <i class='bx bxs-lock-alt'></i>
                  <input type="password" placeholder="비밀번호">
                </div>
                <button>
                  로그인
                </button>
                <p>
                  <b>
                    <a href="../member/forgotID.jsp">ID 찾기</a>
                  </b>
                  <b>
                    <a href="../member/forgotPassword.jsp">비밀번호 찾기</a>
                  </b>
                </p>
                <p>
                  <span>
                    계정이 없으신가요?
                  </span>
                  <b onclick="toggle()" class="pointer">
                    회원가입
                  </b>
                </p>
              </div>
            </div>
            <div class="form-wrapper">
        
            </div>
          </div>
          <!-- END SIGN IN -->
        </div>
        <!-- END FORM SECTION -->
        <!-- CONTENT SECTION -->
        <div class="row content-row">
          <!-- SIGN IN CONTENT -->
          <div class="col align-items-center flex-col">
            <div class="text sign-in">
              <h2>
                로그인
              </h2>
      
            </div>
            <div class="img sign-in">
        
            </div>
          </div>
          <!-- END SIGN IN CONTENT -->
          <!-- SIGN UP CONTENT -->
          <div class="col align-items-center flex-col">
            <div class="img sign-up">
            
            </div>
            <div class="text sign-up">
              <h2>
                회원가입
              </h2>
      
            </div>
          </div>
          <!-- END SIGN UP CONTENT -->
        </div>
        <!-- END CONTENT SECTION -->
      </div>
</body>
</html>

<%@ include file="/footer.jsp" %>