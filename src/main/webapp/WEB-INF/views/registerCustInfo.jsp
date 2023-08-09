<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="<c:url value='/css/registerCustInfo.css'/>">
    <script type="text/javascript">
        setTimeout(function() {
            window.location.href = "/";
        }, 5000); // 초 후
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>

<div id="container">
    <div id="sidebar2" class="dashboard2">
        <div class="cust-container">
            <div class="cust-container">
                <h1>회원가입 완료!</h1>
                <div class="form-group">
                    <label>회원아이디 <span>${custDtoInfo.custId}</span></label>
                </div>
                <div class="form-group">
                    <label>이름 <span>${custDtoInfo.name}</span> </label>
                </div>
                <div class="form-group">
                    <label>핸드폰번호 <span>${custDtoInfo.mpNo}</span> </label>
                </div>
                <div class="form-group">
                    <label>등급 <span>${custDtoInfo.grade}</span> </label>
                </div>
                <div class="form-group">
                    <label>이메일 <span>${custDtoInfo.email}</span> </label>
                </div>
                <div class="form-group">
                    <label>지역 <span>${nationInfo}</span> </label>
                </div>
                <div class="form-group">
                    <label>최초가입기기 <span>${deviceInfo}</span> </label>
                </div>
                <div class="form-group">
                    <label>가입축하 <span>${pointInfo} 포인트</span> </label>
                </div>
            </div>
            <button onclick="location.href='/'">홈으로 돌아가기</button>
        </div>
    </div>
</div>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>