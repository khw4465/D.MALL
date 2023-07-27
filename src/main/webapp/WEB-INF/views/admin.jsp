<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <link rel="stylesheet" href="/css/admin.css">
</head>
<body>
<!-- 상단 메뉴바 -->
<div class="admin-menu">
    <ul class="menu-bar1">
        <a href="<c:url value='/login/logoClick'/>"><img id="logo" src="/img/logo1.png" alt="logo" style="width:90px; height:90px;"></a>
    </ul>
    <ul class="menu-bar2">
        <li><a href="<c:url value='/prod/Manage'/>">상품관리</a></li>
        <li><a href="<c:url value='/ord/Manage'/>">주문관리</a></li>
        <li><a href="<c:url value='/cust/Manage'/>">회원관리</a></li>
        <li><a href="<c:url value='/board/manager'/>">게시판관리</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <input type="hidden" name="toURL" value="${param.toURL}">
    </ul>
</div>

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
            <li><a href="<c:url value='/loginHist'/>">회원로그인이력</a></li>
            <li><a href="<c:url value='/stats'/>">회원로그인통계</a></li>
        </div>
        <button class="list">게시판관리</button>
        <div class="panel">
            <li>hello</li>
        </div>
    </div>
    <div class="right-list">
        <div class="panel1">

        </div>
    </div>
</div>

<!-- 왼쪽 메뉴바 -->
<div class="left-list">
    <h2>관리자 매뉴</h2>
    <button class="list">상품관리</button>
    <div class="panel">
        <li class="panel-text"><a href="/prod/register">상품등록</a></li>
        <li></li>

    </div>

    <button class="list">주문관리</button>
    <div class="panel">
        <li class="panel-text"><a>hello</a></li>
    </div>
    <button class="list">회원관리</button>
    <div class="panel">
        <li class="panel-text"><a href="<c:url value='/custselect'/>">회원리스트</a></li>
    </div>
    <button class="list">게시판관리</button>
    <div class="panel">
        <li class="panel-text"><a href="<c:url value='/notc/adminlist'/>"> 공지사항 관리 </a></li>
    </div>
</div>


<div class="center-content">

    <table>
        <tr>
            <td>1</td>
            <td>2</td>
        </tr>
    </table>
</div>

<script>
    var list = document.getElementsByClassName("list");

    for (var i = 0; i < list.length; i++) {
        list[i].addEventListener("click", function () {
            this.classList.toggle("active");
        });
    }


</script>

</body>

</html>