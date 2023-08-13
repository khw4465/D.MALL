<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>비밀번호 찾기</title>
    <script type="text/javascript">
        // setTimeout(function() {
        //     window.location.href = "/";
        // }, 3000); // 초 후
    </script>
    <link rel="stylesheet" href="<c:url value='/css/findPwdresult.css'/>">
</head>
<body>
<div class="container">
    <h2>임시 비밀번호가 이메일로 전송되었습니다.</h2>
    <p>이메일을 확인하시고 로그인 후 비밀번호를 변경해 주세요.</p>
    <!-- 홈으로 돌아가기 버튼 추가 -->
    <button onclick="location.href='/'">홈으로 돌아가기</button>
</div>
</body>
</html>