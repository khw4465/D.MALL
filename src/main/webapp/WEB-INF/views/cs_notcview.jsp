<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-07-06
  Time: 오후 5:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
    <title>공지사항</title>
    <link rel="stylesheet" href="<c:url value='/css/csmain.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h1><a href="/">드가자몰</a></h1>

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
            <li><a href="/faq/list">자주묻는FAQ</a></li>
            <li><a href="/cs/inqry">1:1문의</a></li>
        </ul>
    </nav>
</div>
<div class="clear"></div>
<script>
    let msg="${msg}";
    if(msg=="WRT_ERR") alert("공지사항 등록에 실패했습니다");
</script>
<div id="main_1">
    <h3>공지사항${mode=="new" ? "쓰기" : ""}</h3>

    <form action="" id="form">

        <input type="hidden" name="bbsoNo" value="${NotcDto.bbsoNo}" readonly="readonly">
        <input type="text" name="ttl" value="${NotcDto.ttl}" placeholder="제목을 입력하세요."${mode=="new" ? '' : 'readonly="readonly"'}>
        <textarea name="cn" cols="30" rows="10" placeholder="내용을 입력하세요." ${mode=="new" ? '' : 'readonly="readonly"'} >${NotcDto.cn}</textarea>
<%--        <button type="button" id="writeBtn" class="btn">등록</button>--%>
<%--        --%>
<%--        --%>

<%--        <button type="button" id="modifyBtn" class="btn">수정</button>--%>
<%--        <button type="button" id="removeBtn" class="btn">삭제</button>--%>
<%--        <button type="button" id="listBtn" class="btn">목록</button>--%>
    </form>

<%--    <form action="" id="form">--%>

<%--        <input type="text" name="bbsoNo" value="${NotcDto.bbsoNo}" readonly="readonly">--%>
<%--        <input type="text" name="ttl" value="${NotcDto.ttl}" readonly="readonly">--%>
<%--        <textarea name="content" id="" cols="30" rows="10" readonly="readonly" >${NotcDto.cn}</textarea>--%>
<%--        <button type="button" id="writeBtn" class="btn">등록</button>--%>
<%--        <button type="button" id="modifyBtn" class="btn">수정</button>--%>
<%--        <button type="button" id="removeBtn" class="btn">삭제</button>--%>
<%--        <button type="button" id="listBtn" class="btn">목록</button>--%>
<%--    </form>--%>

</div>

<script>
    $(document).ready(function (){
        $('#listBtn').on("click",function (){
            location.href="<c:url value='/notc/list${notcSearchCondition.queryString}'/>";
        });


        $('#removeBtn').on("click",function (){
            if(!confirm("삭제하시겠습니까?")) return;
            let form = $('#form');
            form.attr("action","<c:url value='/notc/remove${notcSearchCondition.queryString}'/>");
            form.attr("method","post");
            form.submit();
        });

        $('#writeBtn').on("click",function (){
            let form = $('#form');
            form.attr("action","<c:url value='/notc/write'/>");
            form.attr("method","post");
            form.submit();
        });

        $('#modifyBtn').on("click",function (){
        //  1. 읽기 상태이면 수정 상태로 변경
            let form = $('#form');
            let isReadonly = form.find("input[name='ttl']").attr("readonly");

            if (isReadonly=='readonly'){
                $("input[name=ttl]").attr("readonly",false);
                $("textarea").attr("readonly",false);
                $("modifyBtn").html("등록");
                $("h3").html("공지사항 수정");
                return;
            }
        //  2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action","<c:url value="/notc/modify"/>");
            form.attr("method","post");
            form.submit();

        });


    });
</script>
</body>
</html>
