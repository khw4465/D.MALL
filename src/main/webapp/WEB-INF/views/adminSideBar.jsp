<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<%@ page buffer="none" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
</head>
<body>
<div id="wrap" class="beta">
        <div id="sidebar1" class="dashboard1">
            <div class="logo">
                <h1>
                    <a href="">
                        <p>드가닭</p>
                    </a>
                </h1>
            </div>
            <div class="snbArea">
                <div id="menuList" class="eCustomScrollbar mCustomScrollbar _mCS_2 mCS-autoHide">
                    <div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
                        <div id="mCSB_2_container" class="mCSB_container" dir="ltr">
                            <ul class="menu">
                                <li class="hasChild ">
                                    <a data-gtm="LNB_1681" id="order" href="#none" class="link order" name="주문">
                                        주문
                                    </a>
                                    <ul class="submenu" style="display: none;">
                                        <li><a href="#">주문 관리</a></li>
                                        <li><a href="#">회원 배송지 관리</a></li>
                                        <li><a href="#">주문 이력</a></li>
                                        <li><a href="#">주문 통계</a></li>
                                    </ul>
                                </li>
                                <li class="hasChild ">
                                    <a data-gtm="LNB_6" id="member" href="#none" class="link member" name="회원">
                                        회원
                                    </a>
                                    <ul class="submenu" style="display: none;">
                                        <li><a href="<c:url value='/custSelectAll'/>">회원리스트</a></li>
                                        <li><a href="<c:url value='/loginHist'/>">회원로그인이력</a></li>
                                        <li><a href="<c:url value='/stats'/>">회원로그인통계</a></li>
<%--                                        <li><a href="<c:url value=''/>">회원포인트조회</a></li>--%>
<%--                                        07/29 부터 안씀 회원포인트조회는--%>
                                        <c:if test="">
                                            <li><a href="/admin">관리자홈</a></li>
                                        </c:if>
                                    </ul>
                                </li>
                                <li class="hasChild ">
                                    <a data-gtm="LNB_7" id="board" href="#none" class="link board" name="게시판">
                                        게시판
                                    </a>
                                    <ul class="submenu" style="display: none;">
                                        <li><a href="/notc/adminlist">공지사항관리</a></li>
                                        <li><a href="#">리뷰관리</a></li>
                                        <li><a href="#">하위메뉴</a></li>
                                    </ul>
                                </li>
                                <li class="hasChild ">
                                    <a data-gtm="LNB_2056" id="product" href="#none" class="link product" name="상품">
                                        상품
                                    </a>
                                    <ul class="submenu" style="display: none;">
                                        <li><a href="<c:url value='/prod/register'/>">상품등록</a></li>
                                        <li><a href="#">상품 관리</a></li>
                                        <li><a href="#">상품 수정</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<script>
    window.onload = function () {
        var menuItems = document.getElementsByClassName("hasChild");
        for (var i = 0; i < menuItems.length; i++) {
            // menuItem 변수를 각 반복에 대한 클로저(closure)로 이동시키기
            (function () {
                var menuItem = menuItems[i].getElementsByTagName("a")[0];
                var submenu = menuItem.nextElementSibling;
                menuItem.addEventListener("click", function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    if (submenu.style.display === "none") {
                        submenu.style.display = "block";
                    } else {
                        submenu.style.display = "none";
                    }
                });
            })();  // 클로저를 즉시 실행
        }
    }

    fetch('adminheader.html')
        .then(response => response.text())
        .then(html => document.getElementById('sideMultiShop').innerHTML = html);
</script>
</body>

</html>