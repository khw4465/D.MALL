<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-07-06
  Time: 오후 5:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>
<html>
<head>
    <title>공지사항</title>
    <link rel="stylesheet" href="<c:url value='/css/csmain.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>
<h1>드가자몰</h1>

<!-- 상품 카테고리 보여주는 홈페이지 간판 밑  bar-->
<div id="cate">
    <table id="cate_tb">
        <tr>
            <td id="cate_tb_td">카테고리</td>
            <td id="cate_tb_td">1</td>
            <td id="cate_tb_td">2</td>
            <td id="cate_tb_td">3</td>
            <td id="cate_tb_td">4</td>
            <td id="cate_tb_td">5</td>
        </tr>
    </table>
</div>
<div class="clear"></div>

<!-- 왼쪽 사이드에 붙어있는 각 페이지로 들어가게 하는 메뉴bar-->
<h2 id="CS"><a href="/cs">고객센터</a></h2>
<div id="CS_label">
    <nav>
        <ul id="label_ul">
            <li><a href="/notc/list">공지사항</a></li>
            <li><a href="/user/list">이용안내</a></li>
            <li><a href="/cs/faq">자주묻는FAQ</a></li>
            <li><a href="/cs/inqry">1:1문의</a></li>
        </ul>
    </nav>
</div>
<div class="clear"></div>

<div id="main_1">
    <h3><a href="/notc/list">공지사항</a></h3>

    <form action="" id="form">

        <input type="text" name="BBSO_NO" value=${notcDto.BBSO_NO} readonly="readonly">
        <input type="text" name="TTL" value="${notcDto.TTL}" readonly="readonly">
        <textarea name="content" id="" cols="30" rows="10" readonly="readonly" >${notcDto.CN}</textarea>
        <%--        <button type="button" id="writeBtn" class="btn">등록</button>--%>
        <%--        <button type="button" id="modifyBtn" class="btn">수정</button>--%>
        <%--        <button type="button" id="removeBtn" class="btn">삭제</button>--%>
        <button type="button" id="listBtn" class="btn">목록</button>
    </form>

</div>

<script>
    $(document).ready(function (){
        <%--$('#listBtn').on("click",function (){--%>
        <%--    location.href="<c:url value='/notc/list${notcSearchCondition.queryString}'/>";--%>
        <%--});--%>
        $('#listBtn').on("click",function (){
            location.href="<c:url value='/notc/list${notcSearchCondition.getQueryString(page)}'/>";
        });


        $('#removeBtn').on("click",function (){
            if(!confirm("삭제하시겠습니까?")) return;
            let form = $('#form');
            form.attr("action","<c:url value='/notc/remove${notcSearchCondition.queryString}'/>");
            form.attr("method","post");
            form.submit();
        });

    });
</script>
</body>
</html>
