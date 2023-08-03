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
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">
    <jsp:include page="adminSideBar.jsp"/>
    
    <div id="sidebar2" class="dashboard2">
        <p>hello</p>
<%--        <jsp:include page="stats.jsp"/>--%>
    </div>
</div>

<script>

    window.onload = function () {
        var menuItems = document.getElementsByClassName("hasChild");
        for (var i = 0; i < menuItems.length; i++) {
            (function () {
                var menuItem = menuItems[i].getElementsByTagName("a")[0];
                var submenu = menuItem.nextElementSibling;
                menuItem.addEventListener("click", function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    if (submenu.style.display === "" || submenu.style.display === "none") {
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