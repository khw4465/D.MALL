<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호찾기</title>
    <link rel="stylesheet" href="<c:url value='/css/findPwd.css'/>">

</head>

<body id="password-recovery" class="password-page">
<div class="password-container">
    <h2 class="search-title">비밀번호 찾기</h2>
<%--    onsubmit="return onSubmitFindMemberPw();--%>
    <form action="<c:url value='/login/findPwd'/>" method="post">
        <ul class="ul">
            <li>
                <div class="input-section">
                    <label>아이디</label>
                    <input type="text" name="custId" placeholder="아이디">
                </div>
                <div class="input-section">
                    <label>이름</label>
                    <input type="text" name="name" placeholder="이름 2자 이상 입력" maxlength="50">
                </div>
                <div class="input-section">
                    <label>이메일</label>
                    <input type="text" name="email" placeholder="이메일 주소">
                </div>
                <div class="input-section">
                    <label>전화번호</label>
                    <input type="text" name="mpNo" placeholder="01012341234 (-빼고 입력)">
                </div>
<%--                <div class="input-section">--%>
<%--                    <label>인증번호 입력</label>--%>
<%--                    <input type="text" placeholder="인증번호 입력">--%>
<%--                </div>--%>
                <div class="button-section">
<%--                    <button type="button"><a href="<c:url value='sendMail'/>">이메일발송</a></button>--%>
<%--                    <a href="<c:url value='sendMail'/>">이메일발송</a>--%>
<%--                    비번찾기로직, 비번찾기 누르면 정보확인하고 --%>
<%--                    회원정보 조합+문자열+시간정보로 임시비번발급--%>
<%--                    이메일로보내기(이건 지금 가능) --%>
                    <button type="submit">임시 비밀번호 발급</button>
                </div>
            </li>
        </ul>
    </form>
</div>
</body>
<script>

</script>
</html>
