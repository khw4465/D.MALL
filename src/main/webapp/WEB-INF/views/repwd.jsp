<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재확인</title>
    <link rel="stylesheet" href="<c:url value='/css/repwd.css'/>">
</head>
<body>
<div class="container">
    <h1>고객님의 개인정보를 보호하기 위해 비밀번호를 다시 한번 확인합니다</h1>
    <!-- 세션에서 현재아이디 보여주기 -->
    <h3>세션에서 아이디 가져와서 보여주기 </h3>
    <form>
        <label for="password">비밀번호</label><br>
        <input type="password" id="password" name="password"><br>
        <label for="confirm_password">비밀번호 확인</label><br>
        <input type="password" id="confirm_password" name="confirm_password"><br>
        <input type="submit" value="확인">
    </form>
</div>
</body>
</html>