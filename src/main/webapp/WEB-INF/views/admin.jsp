<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <style>
        li {
            list-style-type: none;
        }
        /* li의 모든 점들을 없앤다. */

        /* 메뉴바 */
        .admin-menu {
            background-color: white;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
        }

        .admin-menu ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .admin-menu li {
            padding: 14px 16px;
        }

        .admin-menu li.logo {
            font-size: 24px;
            font-weight: bold;
            color: #000;
            /* 로고 색상이 흰색으로 되어 있어서 가시성을 위해 검정색으로 변경하였습니다. */
        }

        .admin-menu li a {
            display: block;
            color: black;
            text-align: center;
            text-decoration: none;
        }

        /* 컨텐트 */
        .content {
            display: flex;
        }

        /* 왼쪽 사이드바 시작 */
        .left-list {
            flex: 1;
        }

        /* 오른쪽 사이드바 시작 */
        .right-list {
            flex: 4;
        }

        .panel {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
        }

        .active+.panel {
            max-height: 50px;
            /* 필요에 따라 변경 */
        }
    </style>
</head>
<body>
<div class="admin-menu">
    <ul class="menu-bar1">
        <li class="logo"> <a href="<c:url value='/'/>">로고</a> </li>
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

<div class="content">
    <div class="left-list">
        <h2>관리자 매뉴얼</h2>
        <button class="list">상품관리</button>
        <div class="panel">
            <li><a href="/prod/index">상품등록 |</a></li>
            <li>상품조회</li>

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
            <li>hello</li>
        </div>
    </div>

    <div class="right-list">
        <div class="panel1">
            <jsp:include page="test1.jsp" flush="false"/>
<%--            수정필요--%>
        </div>
    </div>
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