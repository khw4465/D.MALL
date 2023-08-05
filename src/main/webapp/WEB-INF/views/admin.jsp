<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">
    <jsp:include page="adminSideBar.jsp"/>

    <div id="sidebar2" class="dashboard2">
        <div id="linechart_material" style="width: 900px; height: 500px">
            <jsp:include page="orderStat.jsp"/>
        </div>

        <div id="linechart_stats" class="linechart_stats" style="width: 900px; height: 500px">
            <jsp:include page="stats.jsp"/>
        </div>

    </div>
</div>

<%--<script>--%>

<%--    window.onload = function () {--%>
<%--        var menuItems = document.getElementsByClassName("hasChild");--%>
<%--        for (var i = 0; i < menuItems.length; i++) {--%>
<%--            (function () {--%>
<%--                var menuItem = menuItems[i].getElementsByTagName("a")[0];--%>
<%--                var submenu = menuItem.nextElementSibling;--%>
<%--                menuItem.addEventListener("click", function (event) {--%>
<%--                    event.preventDefault();--%>
<%--                    event.stopPropagation();--%>
<%--                    if (submenu.style.display === "" || submenu.style.display === "none") {--%>
<%--                        submenu.style.display = "block";--%>
<%--                    } else {--%>
<%--                        submenu.style.display = "none";--%>
<%--                    }--%>
<%--                });--%>
<%--            })();  // 클로저를 즉시 실행--%>
<%--        }--%>
<%--    }--%>

<%--</script>--%>
</body>

</html>