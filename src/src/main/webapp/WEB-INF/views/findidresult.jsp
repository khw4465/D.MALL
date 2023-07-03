<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>아이디확인결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f6f6f6;
        }
        .content-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            box-sizing: border-box;
        }
        .id-check-section {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .id-info {
            font-weight: bold;
            color: #333333;
        }
        .view-list {
            list-style-type: none;
            padding: 0;
        }
        .id-info-value {
            padding: 10px 0;
            color: #666666;
        }
        .password {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
        }
        .findpwd-link, .login-button {
            color: #007BFF;
            text-decoration: none;
        }
        .login-button {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #007BFF;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px;
        }
    </style>
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
