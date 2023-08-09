<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원리스트</title>
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
</head>
<body>
<jsp:include page="header.jsp"/>

<div id="container">
    <div id="sidebar2" class="dashboard2">
        <div class="cust-container">
            <h1>회원가입 완료!</h1>
            <table>
                <tr>
                    <th class="">회원아이디 ${custDtoInfo.custId}</th>
                    <th class="">이름 ${custDtoInfo.name}</th>
                    <th class="">핸드폰번호 ${custDtoInfo.mpNo}</th>
                    <th class="">등급 ${custDtoInfo.grade}</th>
                    <th class="">이메일 ${custDtoInfo.email}</th>
                    <th class="">가입한 시간 ${custDtoInfo.regDate}</th>
<%--                    <th class="">지역 ${loginHistoryDTOInfo.natn}</th>--%>
<%--                    <th class="">최초가입기기 ${loginHistoryDTOInfo.mhrLS}</th>--%>
<%--                    <th class="">가입축하 포인트 ${pointInfo.chgCn}</th>--%>
<%--                    <th class="">가입축하 포인트 ${pointInfo.point}</th>--%>
                </tr>
            </table>
        </div>
    </div>
</div>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>