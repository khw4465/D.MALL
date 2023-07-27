<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인이력</title>
    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">

</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">
        <jsp:include page="adminSideBar.jsp"/>
    <div id="sidebar2" class="dashboard2">
        <div class="cust-container">
            <table>
                <tr>
                    <th class="">회원아이디</th>
                    <th class="">로그인일자</th>
                    <th class="">로그인성공여부</th>
                    <th class="">로그인IP</th>
                    <th class="">로그인실패원인</th>
                    <th class="">로그인국가</th>
                    <th class="">로그인기기</th>
                    <th class="">실패횟수</th>

                </tr>

                <c:forEach var="LoginHistoryDTO" items="${loginlist}">
                    <tr>
                        <th class="">${LoginHistoryDTO.custId}</th>
                        <th class="">${LoginHistoryDTO.dttm}</th>
                        <th class="">${LoginHistoryDTO.scssYn}</th>
                        <th class="">${LoginHistoryDTO.ip}</th>
                        <th class="">${LoginHistoryDTO.failCaus}</th>
                        <th class="">${LoginHistoryDTO.natn}</th>
                        <th class="">${LoginHistoryDTO.mhrLS}</th>
                        <th class="">${LoginHistoryDTO.failCnt}</th>
                    </tr>
                </c:forEach>

            </table>
            <br>
            <div class="paging-container">
                <div class="paging">
                    <!-- add/remove these links manually -->
                    <a class="page" href="/board/list?page=1">&lt;</a>
                    <a class="page" href="/board/list?page=2">2</a>
                    <a class="page" href="/board/list?page=3">3</a>
                    <!-- ... more links ... -->
                    <a class="page" href="/board/list?page=4">&gt;</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>