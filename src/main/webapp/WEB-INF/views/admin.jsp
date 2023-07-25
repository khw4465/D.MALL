<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
</head>
<body>
<!-- 상단 메뉴바 -->
<div class="admin-menu">
    <ul class="menu-bar1">
        <a href="<c:url value='/login/logoClick'/>"><img id="logo" src="/logo.jpg" alt="logo" style="width:90px; height:90px;"></a>
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

<script>
    // "list"라는 클래스를 가진 요소를 모두 선택
    var acc = document.getElementsByClassName("list");
    var i;

    // 각 "list" 버튼에 대하여
    for (i = 0; i < acc.length; i++) {
        // 클릭 이벤트 리스너를 추가
        acc[i].addEventListener("click", function() {
            // 버튼이 클릭되면 "active" 클래스를 토글(추가/제거)
            // 이는 버튼이 눌렸음을 시각적으로 표시
            this.classList.toggle("active");

            // 이 버튼 바로 다음에 위치한 패널 요소를 선택
            var panel = this.nextElementSibling;

            // 패널이 이미 열려 있다면 닫고, 그렇지 않다면 열어서 표시
            if (panel.style.maxHeight){
                panel.style.maxHeight = null;  // 패널 닫기
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";  // 패널 열기
            }
        });
    }
</script>
</body>

</html>