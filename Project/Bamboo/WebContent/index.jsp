<%@page import="vo.PostVO"%>
<%@page import="dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<!-- 서버 경로: / -->
<!-- SQL 실행 방법: orcl/hr/hr -->
			
<!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 
                align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold" style="font-weight: 600;">bamboo에서<br>양영디지털고등학교의<br>소식을 만나보세요</h1>
                        <hr class="divider" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                    
                    <%
						if (loginOk == null) {
                	%>
                	
                        <p class="text-white-75 mb-5">bamboo는 양영디지털고등학교에 재학중인 학생들과<br>교직원들만 이용할 수 있는 익명 커뮤니티 사이트입니다.<br>학교 생활, 전공 관련 질문 등 학교에서는 말할 수 없던 이야기를 나눠보세요.</p>
                        <p class="text-white-75" style="margin-bottom: 8.5px;"><b>아직 회원이 아니신가요?</b></p>
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/member/register.jsp">회원가입</a>
                    
                    <%
						} else {
                	%>
                	
                		<p class="text-white-75 mb-4"><%= session.getAttribute("nowLoginName") %>님,<br>bamboo에 오신 것을 환영합니다!</p>
                        <p class="text-white-75" style="margin-bottom: 8.5px;"><b>하고 싶은 이야기를<br>익명으로 부담없이 작성해 보세요.</b></p>
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/post/postWrite.jsp">글쓰기</a>
                    
                    <%
						}
                	%>
                	
                    </div>
                </div>
            </div>
        </header>

<%@ include file="/footer.jsp"%>