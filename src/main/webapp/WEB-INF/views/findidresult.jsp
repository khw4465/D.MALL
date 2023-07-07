<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>아이디확인결과</title>
    <link rel="stylesheet" href="<c:url value='/css/findidresult.css'/>">

</head>
<body>
<div class="content-container">
    <div class="id-check-section">
        <p class="id-info">회원님의 이메일로 <br>가입된 아이디가 있습니다.
        </p>
        <ul class="view-list">
            <li class="id-info-value">
                <div class="confirmation-id" id="displayedId">${findidresult}</div>
            </li>
        </ul>
    </div>

    <div class="password">
        <p >비밀번호가 기억나지 않으세요?
            <a href="<c:url value="/login/findPwd"/>" class="findpwd-link">비밀번호 찾기</a>
        </p>
        <a href="<c:url value="/login/login"/>" class="login-button">로그인</a>
    </div>
</div>
</body>
</html>
