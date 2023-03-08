# 🎋 bamboo
제작 기간: 2022.10.23 ~ 2022.12.19 (총 58일) <br>
개발 언어: <img alt="Html" src ="https://img.shields.io/badge/HTML5-E34F26.svg?&style=for-the-badge&logo=HTML5&logoColor=white"/> <img alt="Css" src ="https://img.shields.io/badge/CSS3-1572B6.svg?&style=for-the-badge&logo=CSS3&logoColor=white"/> <img alt=" JavaScript" src ="https://img.shields.io/badge/ JavaScript-F7DF1E.svg?&style=for-the-badge&logo= JavaScript&logoColor=white"/> <img alt=" jquery" src ="https://img.shields.io/badge/ jquery-0769AD.svg?&style=for-the-badge&logo= jquery&logoColor=white"/> <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img alt="oracle" src ="https://img.shields.io/badge/ORACLE-F80000.svg?&style=for-the-badge&logo=ORACLE&logoColor=white"/> <br>
개발 툴: <img src="https://img.shields.io/badge/Eclipse%20IDE-2C2255.svg?&style=for-the-badge&logo=Eclipse%20IDE&logoColor=white"> <img src="https://img.shields.io/badge/Visual%20Studio%20Code-007ACC.svg?&style=for-the-badge&logo=Visual%20Studio%20Code&logoColor=white"> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75.svg?&style=for-the-badge&logo=Apache%20Tomcat&logoColor=black"> <img alt="bootstrap" src ="https://img.shields.io/badge/bootstrap-7952B3.svg?&style=for-the-badge&logo=bootstrap&logoColor=white"/> <br>
[디자인을 확인하고 싶다면?](http://www.yydhsoft.com:8080/gallery22/3177)

<hr>

#### 프로젝트 소개
> <u>대나무숲</u>이란? <br> 해당 학교 재학생의 제보를 **익명**으로 올려주는 페이지

&nbsp;양영디지털고등학교 교직원과 학생들만 이용할 수 있는 익명 커뮤니티 사이트입니다.

<hr>

#### 제작 계기
&nbsp;보통 대나무숲은 Facebook 혹은 Instagram 등 SNS를 이용해서 개설합니다. 저는 SNS에서 대나무숲을 이용하다 보니 많은 불편함 <span style="color:lightgray">(실시간 업로드 X, 검색 기능 X 등...)</span> 등이 있었고 이를 개선하기 위해 웹 사이트로 대나무숲을 제작하게 되었습니다.

<hr>

#### 주요 기능
- 게시판이 갖춰야 할 기본적인 기능 (회원 기능, 게시글 기능, 댓글 기능 등)
- 로그아웃 상태일 시 게시판을 볼 수 없도록 하여 외부인을 차단
- 회원가입 시 양영디지털고등학교 전용 도메인 (y-y.hs.kr) 을 확인하고 메일 인증을 해야만 가입할 수 있도록 하여 외부인을 차단
- 게시글, 댓글 작성 시 익명과 실명 여부를 선택할 수 있도록 개발

<hr>

#### 실행 방법
1. Project 폴더를 다운 받은 뒤 이클립스에 Import 합니다.
2. 서버는 Tomcat 8.5 버전을 사용하며 포트 번호를 8080에서 8090으로 바꿔주세요.
3. Data Source Explorer에서 Oracle을 생성해 주시고 SID에 맞게 common 패키지 안에 있는 JDBCUtil.java 파일을 수정해 주세요.
4. query.sql 파일에 있는 테이블을 모두 생성해 주시고 모든 데이터들을 삽입해 주세요.
5. index.jsp 파일을 실행하시면 됩니다.

<hr>

#### 개발 후기
&nbsp;계기를 거창하게 써놓긴 했으나 사실 이 사이트는 학교에서 수행평가에 제출하기 위해 만든 사이트입니다.&nbsp;그러나 이후 있을 면접에도 포트폴리오로 제출하게 되었고 저는 웹 디자인엔 매우 소질이 없기 때문에 부트스트랩을 이용하여 디자인을 전체적으로 갈아엎었습니다. 부트스트랩을 처음 사용해보는 것이라 제대로 된 사용 방법으로 사용하진 못했지만 이번 일을 발판 삼아 다음에 사용할 때는 제대로 이용해 보고 싶습니다.<br>
&nbsp;저는 새 프로젝트를 개발할 때마다 '전에 구현해보지 않은 기능을 하나씩은 추가하자.'라는 목표를 지킵니다. 이번 프로젝트에서는 <메일 인증하기>를 처음 구현해보았습니다. 사실 인증 코드가 아닌 session을 이용해 개발한 거라 빈틈이 있긴 합니다. 그러나 메일 전송이나 뼈대는 잡혀있는 메일 인증 기능을 개발했다는 것에 뿌듯함을 느꼈고 다음에는 빈틈을 없애기 위해 인증 코드로 개발하자는 목표를 잡았습니다. <br>
&nbsp;아쉬운 점은 이미지 기능입니다. 사실 이미지 기능은 제 이전 프로젝트에서도 많이 구현을 했었습니다. 파일을 통째로 DB에 저장하는 방법도 써봤고 이번 프로젝트처럼 파일 경로를 DB에 저장한 후 불러오는 방법도 써봤습니다. 그러나 전자는 용량 문제가 있고 후자는 모두의 컴퓨터에서 완벽하게 구동되지 않는다는 문제가 있었습니다. 다음에는 언제나 아쉬웠던 이미지 기능을 완벽하게 구현하고 싶습니다.