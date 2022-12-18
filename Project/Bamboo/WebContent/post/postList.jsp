<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<section class="list_post_section">
    <h1 style="text-align: center;">게시글 목록</h1>

    <div class="selectWrap">
        <select name="" id="" class="list_post_category">
            <option value="">1</option>
            <option value="">2</option>
            <option value="">3</option>
            <option value="">4</option>
        </select>
    </div>

    <div class="w-100">
        <table>
            <thead>
                <tr>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
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