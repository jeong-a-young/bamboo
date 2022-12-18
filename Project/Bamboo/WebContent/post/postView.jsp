<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<section>
    <div id="view_post">
        <div class="postTitle">
            <h1>제목</h1>
        </div>

        <div class="postInfo">
            <p>익명</p><p> | </p> 
            <p>카테고리</p><p> | </p>
            <p>2022.12.18</p>
        </div>

        <hr id="view_post_hr">

        <div class="postContents">
            <p>글내용</p>
            <img src="./다운로드.png">
        </div>
    </div>

    <div>
        <form action="/commentWrite" method="post">
            <input type="radio" name="commentSet" value="A"> 익명
            <input type="radio" name="commentSet" value="R"> 실명
            <input type="text" name="commentContent" placeholder="댓글을 입력해 주세요.">
            <input type="submit" value="작성">
        </form>
    </div>

    <div class="w-100">
        <table>
            <tbody>
            <tr>
                <td>James</td>
                <td>Matman</td>
                <td>(713) 123-8965</td>
                <td><a href="mailto:jmatman@stewart.com">jmatman@stewart.com</a></td>
            </tr>
            <tr>
                <td>Johnny</td>
                <td>Smith</td>
                <td>(713) 584-9614</td>
                <td><a href="mailto:jsmith@stewart.com">jsmith@stewart.com</a></td>
            </tr>
            <tr>
                <td>Susan</td>
                <td>Johnson</td>
                <td>(713) 847-1124</td>
                <td><a href="mailto:sjohnson@stewart.com">sjohnson@stewart.com</a></td>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
            </tr>
            </tbody>
        </table>
    </div>   
</section>

<%@ include file="/footer.jsp"%>