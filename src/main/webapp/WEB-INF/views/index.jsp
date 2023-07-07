<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>dgaja</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
</head>
<body>
<div>
    <ul class="header">
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='${addAndModify}'/>">${register}</a></li>
        <li><a href="<c:url value='/ord/list'/>">주문조회</a></li>
        <li><a href="<c:url value='/cs'/>">고객센터</a></li>
        <li id="adminHome"> </li>
<%--        여기 관리자로 로그인시 관리자홈이라는 a 태그 생김--%>
        <input type="hidden" name="toURL" value="${param.toURL}">
    </ul>
</div>
<div class="logo">
    <span id="search_logo">
            <a href="<c:url value='/'/>"><img id="logo" src="/dgajalogo.png" alt="logo"></a>
            <form id="main_search" action="/board/list" class="search-form" method="get">
            <input type="text" name="keyword" class="search-input" value="" placeholder="저녁 8시 이전 주문 시 내일 새벽 도착!"
                   style="width: 310px">
        <input type="submit" class="search-button" value="검색">
    </form>
    <a href="/"><img class="person" src="/coupon.png" alt="coupon"></a>
    <a href="<c:url value='/custMyPage'/>"><img class="person" src="/person.png" alt="mypaga"></a>
    <a href="<c:url value='/cart/list'/>"><img class="person" src="/cart.png" alt="cart"></a></span>

    <%--    여기에 문장 삽입하는 코드--%>
</div>
<div>
    <ul class="menu">
        <li>
            <div class="dropdown">
                <div id="lod">
                    <div class="lod"></div>
                    <div class="lod"></div>
                    <div class="lod"></div>
                    <i class="fa fa-caret-down"></i>
                </div>
                <%--                <span id ="category">&nbsp;카테고리</span>--%>
                <div class="dropdown-content">
                    <a>특가</a>
                    <a>랭킹</a>
                    <a>닭컴</a>
                </div>
            </div>
        </li>
        <li><a href="/">랭킹</a></li>
        <li><a>이달의 특가</a></li>
        <li><a>혜택정리</a></li>
        <li><a>1팩 담기</a></li>
        <li><a>브랜드관</a></li>
        <li><a>이벤트</a></li>
        <li><a>특급배송</a></li>
    </ul>
</div>
<%--여기까지 헤더--%>
<div class="slideshow-container">
    <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="/back4.jpeg" style="width:100%; height:300px">
    </div>
    <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="/back5.jpeg" style="width:100%; height:300px">
    </div>
    <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="/back6.jpeg" style="width:100%; height:300px">
    </div>
    <a class="prev" onclick="plusSlides(-1)">❮</a>
    <a class="next" onclick="plusSlides(1)">❯</a>
</div>
<br>

<div style="text-align:center">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
</div>
<%--여기까지 슬라이드이미지--%>
<div class="footer">
    <h2>Footer</h2>
</div>

<script>
    const login = document.getElementById("login");
    const register = document.getElementById("register");

    let admincondition =( ${loginAdminTrue} );
    if (admincondition) {
        // 조건을 만족할 경우, a태그를 추가합니다.
        let adminHome = document.getElementById("adminHome");
        let link = document.createElement("a");
        link.href = "/admin";
        link.textContent = "관리자 홈";
        adminHome.appendChild(link);
    }
    <%--let admincondition1 = ( ${loginAdminTrue1} );--%>
    <%--if (admincondition1) {--%>
    <%--    // 조건을 만족할 경우, a태그를 추가합니다.--%>
    <%--    let adminHome = document.getElementById("adminHome");--%>
    <%--    let link = document.createElement("a");--%>
    <%--    link.href = "/admin";--%>
    <%--    link.textContent = "관리자 홈";--%>
    <%--    adminHome.appendChild(link);--%>
    <%--}--%>


    if (`${login_check}` === "true") { //'/check_password'
        //로그인 상태면 logout서블릿으로 보내는 링크
        login.innerHTML = "<a href='/login/logout' target = 'get'>로그아웃 |</a> ";
        register.innerHTML = "<a href='/check_password' target = 'get'>정보수정 |</a> ";

    } else {
        //로그아웃 상태면 로그인, login.jsp로 보내는 링크
        login.innerHTML = " <a href='/login/login' target = 'get'>로그인 |</a> ";
    }

    let slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
</script>
</body>


</html>