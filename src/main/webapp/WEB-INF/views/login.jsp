<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">

</head>
<body>
<!-- 로그인창 코드 시작 -->
<%--<div id="menu">--%>
<%--    <ul>--%>
<%--        <li id="logo">dgaja</li>--%>
<%--        <li><a href="<c:url value='/'/>">Home</a></li>--%>
<%--        <li><a href="<c:url value='/board/list'/>">게시판</a></li>--%>
<%--        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
<%--        <li><a href="<c:url value='/register/add'/>">회원가입</a></li>--%>
<%--    </ul>--%>
<%--</div>--%>


<div class="login-container"> <!-- 큰틀임  -->

    <div class="login-container"> <!-- 큰틀임  -->

        <div class="login-area"> <!-- 하나의 모듈처럼 취급-->
            <!-- 입장시 바로 보이는 안내문구 시작 -->
            <div class="login-container">
                <h1 class="text">안녕하세요 </h1>
                <h3 class="message">드가닭입니다</h3>
            </div>
            <!-- 입장시 바로 보이는 안내문구 종료 -->

            <!-- 로그인폼 시작 -->
            <%--        onsubmit="return logincheck();--%>
            <form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
                <!-- 시작 -->
<%--                <h3 id="title">Login</h3>--%>
                <div id="msg">
                    <c:if test="${not empty param.msg}">
                        <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
                    </c:if>
                </div>
                <%--  여기부터 완성해야함--%>
<%--                <fieldset>--%>
<%--                    <legend>아이디/비밀번호 입력</legend>--%>

                    <!-- 아이디 입력칸 시작 -->
                    <div class="input-id">
                        <label for="id" class="id-info">아이디</label>
                        <input type="text" id="id" name="id" value="${cookie.id.value}" class="input-text"
                               placeholder="아이디" maxlength="20">
                    </div>
                    <!-- 아이디 입력칸 종료 -->

                    <!-- 비번 입력칸 시작 -->
                    <div class="input-pwd">
                        <label for="pw" class="id-info">비밀번호</label>
                        <input type="password" id="pw" name="pwd" class="input-text" placeholder="비밀번호" maxlength="30">
                    </div>
                    <!-- 비번 입력칸 종료 -->
                    <input type="hidden" name="toURL" value="${param.toURL}">
                    <button type="submit" class="login-submit"><span>로그인</span></button>
                    <%--  여기부터 완성해야함--%>


                    <!-- 체크박스 시작 -->
                    <div class="check-sso">
                        <!-- 자동로그인 기능 시작 -->
                        <!-- <div class="auto-login"> -->
                        <!--    <input type="checkbox" id="remember1" class="checkbox" name="remember1" -->
                        <!--        ><label for="remember1"> 자동로그인 </label> -->
                        <!--</div> -->
                        <!-- 자동로그인 기능 종료 -->
                        <!-- 아이디저장 기능 시작 -->
                        <div class="save-ld">
                            <input type="checkbox" id="remember2" class="checkbox" name="remember2"
                            ><label for="remember2"> 아이디저장 </label>
                        </div>
                        <!-- 아이디저장 기능 종료 -->
                    </div>
                    <!-- 체크박스 종료 -->

<%--                </fieldset>--%>
                <!-- 종료 -->

                <!-- 아이디비번 찾기 코드 시작 -->
                <div class="find-register">
                    <ul class="info">
                        <li><a href="/login/findId" class="login-info1">아이디 찾기</a></li>
                        <li><a href="/login/findPwd" class="login-info2">비밀번호 찾기</a></li>
                        <li><a href="/register/add" class="login-info3">회원가입</a></li>
                    </ul>
                </div>
                <!-- 아이디비번 찾기 코드 종료 -->

            </form>
            <!-- 로그인폼 종료 -->
        </div>

    </div>
    <!-- 로그인창 코드 종료 -->
</body>
</html>
