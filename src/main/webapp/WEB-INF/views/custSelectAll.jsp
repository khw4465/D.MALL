<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원리스트</title>
    <link rel="stylesheet" href="<c:url value='/css/custSelectAll.css'/>">
    .
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
                    <th class="">이름</th>
                    <th class="">핸드폰번호</th>
                    <th class="">분류</th>
                    <th class="">등급</th>
                    <th class="">상태</th>
                    <th class="">생일</th>
                    <th class="">이메일</th>
                    <th class="">계좌번호</th>
                    <th class="">성별</th>
                </tr>

                <c:forEach var="custDto" items="${list}">
                    <tr>
                        <th class="">${custDto.custId}</th>
                        <th class="">${custDto.name}</th>
                        <th class="">${custDto.mpNo}</th>
                        <th class="">${custDto.custTp}</th>
                        <th class="">${custDto.grade}</th>
                        <th class="">${custDto.stus}</th>
                        <th class="">${custDto.birth}</th>
                        <th class="">${custDto.email}</th>
                        <th class="">${custDto.acno}</th>
                        <th class="">${custDto.gender}</th>
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