<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : '/register/modify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/main2.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<div id="logindiv" class="themeB">
    <div class="logindiv-con">
        <div id="dgaja_header">
            <div class="topNav">
                <div class="backBtn"><a href="/"></a></div>
<%--                나중에 이전경로로 고쳐야함--%>
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

<script>
    // 페이지가 로드되면 실행
    window.onload = function () {
        // URL의 쿼리 매개변수를 읽어옴
        var urlParams = new URLSearchParams(window.location.search);

        // 'msg' 매개변수가 있는지 확인
        if (urlParams.has('msg')) {
            var msg = urlParams.get('msg');// 'msg' 매개변수의 값을 읽어옴
            msg = decodeURIComponent(msg);// 메시지를 디코딩
            alert(msg);// 알림을 표시
        }
        if (urlParams.has('histmsg')) {
            var msg = urlParams.get('histmsg');  // 'msg' 매개변수의 값을 읽어옴
            msg = decodeURIComponent(msg); // 메시지를 디코딩
            alert(msg);  // 알림을 표시
        }
    };

    //관리자로그인 active
    $(document).ready(function(){
        $('.tabMenu > li > a').click(function(event) {
            event.preventDefault(); // Prevent the default action
            $('.tabMenu > li').removeClass('active'); // remove active class from all li elements
            $(this).parent().addClass('active'); // add active class to the clicked li element's parent
        });
    });

    //로그인버튼


</script>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>

</html>