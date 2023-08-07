<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : '/register/modify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<jsp:include page="header.jsp"/>
<br><br><br><br>
<div id="logindiv" class="themeB">
    <div class="logindiv-con">
        <div id="dgaja_header">
            <div class="topNav">
<%--                display: block;--%>
                <div class="backBtn"><a href="/"></a></div>
                <div class="homeBtn"><a href="/"></a></div>
            </div>
            <h1 class="mallName"><a href="/">드가닭</a></h1>
        </div>

        <div id="dgaja-section">
            <div id="memberLogin" class="contents">
                <ul class="tabMenu" style="display:block">
                    <li class="active">
                        <a href="">로그인</a>
                    </li>
                    <li class="">
                        <a href="">관리자 로그인</a>
                    </li>
                </ul>
                <div id="forminfo">
                    <form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
                        <div id="msg">
                            <c:if test="${not empty param.msg}">
                                <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
                            </c:if>
                        </div>
                        <input type="hidden" name="toURL" value="${param.toURL}">
                        <div id="memberLogin_id">
                            <div class="inputBox">
                                <input type="text" name="id" maxlength="20" class="MS_login_id" placeholder="아이디"
                                       id="member_id" value="${cookie.id.value}">

                                <div class="inputBox_passwd" style="display: block;">

                                    <input type="password" name="pwd" maxlength="20" value="" class="input-text"
                                           placeholder="비밀번호" id="member_passwd" maxlength="30">
                                </div>
                            </div>
                            <div class="loginCheckBox"></div>

<%--                            <a href="#" class="btn loginBtn">로그인</a>--%>
                            <button type="submit" class="btn loginBtn"><span>로그인</span></button>

                            <!-- 체크박스 시작 -->
                            <div class="check-sso">
                                <div class="save-ld">
                                    <br>
                                    <input type="checkbox" id="remember2" class="checkbox" name="remember2"><label
                                        for="remember2"> 아이디저장 </label>
                                </div>
                                <!-- 아이디저장 기능 종료 -->
                            </div>
                            <!-- 체크박스 종료 -->

                            <div class="find-register">
                                <ul class="info">
                                    <li><a href="/login/findId" class="login-info1">아이디 찾기</a></li>
                                    <li><a href="/login/findPwd" class="login-info2">비밀번호 찾기</a></li>
                                    <li><a href="/register/add" class="login-info3">회원가입</a></li>
                                </ul>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<%--자스 파일 분리했음--%>
<script type="text/javascript" src="<c:url value='/js/login.js'/>"></script>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>

</html>