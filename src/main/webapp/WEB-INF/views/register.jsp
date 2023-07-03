<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            /* 바디 안에 있는 텍스트 글꼴 설정임 */
            /* 시스템에서 앞에꺼 찾고 없으면 뒤에껄로 감 */
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 500px;
            /* 폼 요소의 너비를 500으로 지정 */
            margin: 0 auto;
            /* form 요소의 상단과 하단의 마진을 0, 좌우마진을 자동 지정 */
            padding: 20px;
            background-color: #fff;
            /* 폼 바탕 */
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            /* 박스 그림자 */
        }
        /*  */
        .login-input {
            margin-bottom: 1px;
        }

        .login-input label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .login-input input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            /* solid는 실선 스타일의 테두리 */
            border-radius: 4px;
            font-size: 14px;
            /* 플레이스홀더에 적용될 크기조정 */
        }

        .login-button {
            /* 로그인 버튼 */
            width: 100%;
            padding: 10px;
            border: none;
            /* 모든 변의 테두리를 제거 */
            background-color: #007BFF;
            /* 백그라운드는 파랑 */
            color: #fff;
            /* 글자는 흰색 */
            border-radius: 4px;
            /* 테두리 둥글게 */
            cursor: pointer;
            /* 커서 모양 */
            font-size: 18px;
            /* "가입하기" 같은 html 크기 조정 */
        }

        .login-button:hover {
            background-color: #0056b3;
            /* 로그인 버튼에 마우스가 올라갔을때 */
        }

        .login-button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
            /* 로그인 버튼의 disabled가 적용되었을때 원형으로 대각선을 그은 */
            /* 사용불가(처럼 보이는) 아이콘이 보임 */
        }
    </style>
</head>
<body>
<%--<div id="menu">--%>
<%--    <ul>--%>
<%--        <li id="logo">dgaja</li>--%>
<%--        <li><a href="<c:url value='/'/>">Home</a></li>--%>
<%--        <li><a href="<c:url value='/board/list'/>">게시판</a></li>--%>
<%--        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
<%--        <li><a href="<c:url value='/register/add'/>">회원가입</a></li>--%>
<%--    </ul>--%>
<%--</div>--%>

<!-- 폼 시작 -->
<form id="user" action="/dgaja/register/add" method="post" onsubmit="return check(this)">
    <h1>회원가입</h1>
    <!-- 아이디 입력 시작-->
    <div class="login-input">
        <label for="loginJoinCustId" class="login_input_label">아이디 입력</label>
        <br>
        <input type="text" id="loginJoinCustId" name="custId" placeholder="영문, 숫자 5-12자리" maxlength="12" class="">

        <p class="login-Space"></p>  <!-- 공백 -->
    </div>
    <!-- 아이디 입력 종료-->

    <!-- 비밀번호 입력1 시작-->
    <div class="login-input">
        <label for="loginJoinCustPwd1" class="login_input_label">비밀번호 입력</label>
        <br>
        <input id="loginJoinCustPwd1" name="pwd" placeholder="숫자, 영문, 특수문자 조합 최소 8자리" maxlength="20" type="password" class="">

        <p class="login-Space"></p> <!-- 공백 -->
    </div>
    <!-- 비밀번호 입력1 종료-->


    <!-- 비밀번호 입력 2 시작-->
    <div class="login-input">
        <label for="loginJoinCustPwd2" class="login_input_label">비밀번호 확인(재입력)</label>
        <br>
        <input id="loginJoinCustPwd2" name="pwd2" placeholder="비밀번호 재입력" maxlength="20" type="password" class="">

        <p class="login-Space"></p> <!-- 공백 -->
    </div>
    <!-- 비밀번호 입력 2 종료-->

    <!-- 이메일 입력 시작-->
    <div class="login-input">
        <label for="loginJoinCustEmail" class="login-input_label">이메일 입력</label>
        <div class="login-input_wrap">
            <input type="email" name="email" placeholder="이메일 입력" id="loginJoinCustEmail" class="login-input_input">
            <!-- 여기 수정필요  클래스 굳이? -->
            <div>
                <p class="login-Space"></p> <!-- 공백 -->
                <ul class="login-input__layer-list"></ul>
            </div>
        </div>
    </div>
    <!-- 이메일 입력 종료-->

    <!-- 이름 입력 시작 -->
    <div class="login-input">
        <label for="loginJoinCustName" class="login_input_label">이름 입력 </label>
        <br>
        <input type="text" id="loginJoinCustName" name="name" placeholder="이름" maxlength="8" class="">
        <p class="login-Space"></p>  <!-- 공백 -->
    </div>
    <!-- 이름 입력 종료 -->

    <!-- 핸드폰번호 시작 (어떻게 처리할지) -->

    <!-- 핸드폰번호 종료-->
    <div>

    </div>

    <!-- 추천인아이디 시작 Recommend_ID-->
    <div class="login-input">
        <label for="loginJoinRecommend_Id" class="login_input_label"> 추천인 아이디</label>
        <br>
        <input type="text" id="loginJoinRecommend_Id" name="rcmdr" placeholder="추천인 아이디" maxlength="12" class="">

        <p class="login-Space"></p>  <!-- 공백 -->
    </div>
    <!-- 추천인아이디 종료-->

    <!-- 가입하기 버튼 시작 -->
    <button type="submit" class="login-button">가입하기</button>

    <!-- disabled="disabled" 를 하면 버튼의 상태가 블락처리됨(작동안함) -->
    <!-- 가입하기 버튼 종료 -->
    <input type="hidden" name="toURL" value="${param.toURL}">
    <!-- 화면에 안보이는거 -->
    <!-- 회원유형은 무조건 1로 들어가게 관리자는 따로 -->
    <!-- 회원등급코드 -->
    <!-- 회원상태 -->

</form>
<script>
    function check(form) {
        var email = form.email.value; //폼의 네임속성이 email인거의 값을 가져온다.
        var regularEx = /^[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]{2,}$/;
        //    /^ 정규식의 시작
        // 알파벳+@알파벳+.com
        //  $/ 는 정규식의 끝
        if (!(regularEx.test(email))) {
            alert("이메일 주소를 다시 입력해주세요.");
            return false; // 폼 제출 못함
        }
        return true;
        //레지스터폼에서는 이런방식으로한다.
        <%--function setMessage(msg, element){--%>
        <%--    document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> \${msg}</i>`;--%>
        <%--    document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;--%>

        <%--    if(element) {--%>
        <%--        element.select();--%>
        <%--    }--%>
        <%--}--%>
    }
</script>
</body>
</html>
