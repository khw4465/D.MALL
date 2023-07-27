<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Notc</title>
    <link rel="stylesheet" href="<c:url value='/css/adminnotc.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div class="admin-menu">
    <ul class="menu-bar1">
        <a href="<c:url value='/login/logoClick'/>"><img id="logo" src="/img/logo1.png" alt="logo" style="width:90px; height:90px;"></a>
    </ul>
    <ul class="menu-bar2">
        <li><a href="<c:url value='/prod/Manage'/>">상품관리</a></li>
        <li><a href="<c:url value='/ord/Manage'/>">주문관리</a></li>
        <li><a href="<c:url value='/cust/Manage'/>">회원관리</a></li>
        <li><a href="<c:url value='/board/Manage'/>">게시판관리</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <input type="hidden" name="toURL" value="${param.toURL}">
    </ul>
</div>
<div class="clear"></div>

<!-- 왼쪽 사이드에 붙어있는 각 페이지로 들어가게 하는 메뉴bar-->
<div class="content">
    <div class="left-list">
        <h2>관리자 매뉴얼</h2>
        <button class="list">상품관리</button>
        <div class="panel">
            <li><a href="/prod/register">상품등록 |</a></li>
            <li></li>
        </div>

        <button class="list">주문관리</button>
        <div class="panel">
            <li>hello</li>
        </div>
        <button class="list">회원관리</button>
        <div class="panel">
            <li><a href="<c:url value='/custselect'/>">회원리스트</a></li>
        </div>
        <button class="list">게시판관리</button>
        <div class="panel">
            <li><a href="<c:url value="/notc/adminlist"/>"> 공지사항 관리 </a></li>
        </div>
    </div> <!-- left-list -->

<script>
    let msg="${msg}";
    if(msg=="WRT_ERR") alert("공지사항 등록에 실패했습니다");
    if(msg=="MOD_READY") alert("수정하실 수 있습니다.")
</script>
    <div class="right-list">
        <h3>공지사항${mode=="new" ? "쓰기" : ""}</h3>
        <div class="use-guide">
            <form action="" id="form">
                <input type="hidden" name="bbsoNo" value="${NotcDto.bbsoNo}" readonly="readonly">
                <input type="text" name="cate" value="${NotcDto.cate}" ${mode=="new" ? '' : 'readonly="readonly"'}>
                <h3>제목</h3>
                <input type="text" name="ttl" value="${NotcDto.ttl}" placeholder="제목을 입력하세요."${mode=="new" ? '' : 'readonly="readonly"'}>
                <h3>내용</h3>
                <textarea name="cn" cols="30" rows="10" placeholder="내용을 입력하세요." ${mode=="new" ? '' : 'readonly="readonly"'} >${NotcDto.cn}</textarea>
<%--        <button type="button" id="writeBtn" class="btn">등록</button>--%>
<%--        --%>
<%--        --%>
    <br>
                <div class="btnlist">
                    <button type="button" id="modifyBtn" class="btn">수정</button>
                    <button type="button" id="removeBtn" class="btn">삭제</button>
                    <button type="button" id="listBtn" class="btn">목록</button>
                </div>
            </form> <%--    <form action="" id="form">--%>
        </div> <!-- use-guide -->
    </div> <!-- right-list -->
</div> <!-- content -->

<script>
    $(document).ready(function (){
        $('#listBtn').on("click",function (){
            location.href="<c:url value='/notc/adminlist${notcSearchCondition.queryString}'/>";
        });


        $('#removeBtn').on("click",function (){
            if(!confirm("삭제하시겠습니까?")) return;
            let form = $('#form');
            form.attr("action","<c:url value='/notc/adminremove${notcSearchCondition.queryString}'/>");
            form.attr("method","post");
            form.submit();
        });

        $('#writeBtn').on("click",function (){
            let form = $('#form');
            form.attr("action","<c:url value='/notc/adminwrite'/>");
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
            form.attr("action","<c:url value="/notc/adminmodify"/>");
            form.attr("method","post");
            form.submit();

        });
    });

</script>
</body>
</html>
