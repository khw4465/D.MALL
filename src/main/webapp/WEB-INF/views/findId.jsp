<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>아이디찾기</title>
    <link rel="stylesheet" href="<c:url value='/css/findId.css'/>">

</head>
<body>
<div class="find-id-container">
    <h2 class="title">아이디찾기</h2>
    <form action="<c:url value="/login/findid"/>" method="post" onsubmit="return onSubmitFindMemberId();">

        <ul>
            <!-- 이메일로 찾기 -->
            <li>
                <div class="input-section-radio">
                    <!-- div 라디오버튼 css 적용 안되어있음 -->
                    <input type="radio" value="email">
                    <label>이메일로 찾기</label>
                </div>

                <div class="input-section">
                    <label>이름 입력</label>
                    <input type="text" name="name" class="input-section" placeholder="이름 2자 이상 입력" maxlength="50">
                </div><!--// input-group -->

                <div class="input-section">
                    <label>이메일 주소</label>
                    <input type="text" name="email" class="input-section" placeholder="이메일 주소">
                </div><!--// input-group -->

                <div class="input-section">
                    <button type="submit" class="submit-button"><span>확인</span></button>
                </div><!--// btn-bottom-area -->
            </li><!--// 이메일로 찾기 -->
        </ul>
    </form>
</div>
</body>
</html>