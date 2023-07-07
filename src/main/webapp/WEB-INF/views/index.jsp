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
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        #search_logo {
            display: flex;
            align-items: center;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .header {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 10px 16px;
            background-color: #eee;
        }

        .header li {
            display: inline;
            font-size: 18px;
            margin-right: 8px;
        }

        .header li a {
            color: #0275d8;
            text-decoration: none;
        }

        .header li a:hover {
            color: #01447e;
            text-decoration: underline;
        }

        #logo {
            margin-left: 25px;
            width: 80px;
            height: 80px;
            margin-right: 380px;
        }

        .person {
            margin-left : 10px;
            width: 40px;
            height: 40px;
            display: inline;
        }

        .search-form {
            margin-left: 10px;
            display: flex;
            align-items: center;
        }

        .search-input {
            margin-left : 100px;
            height: 30px;
            padding: 4px;
            /*input 요소에 ipx두께의 실선 테두리를 적용*/
            border: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 4px;
        }

        .search-button {
            background-color: #0275d8;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 4px 8px;
            cursor: pointer;
        }

        .menu {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #eee;
            padding: 10px;
        }

        .menu li {
            list-style: none;
            margin-left: 20px;
        }

        .menu a {
            text-decoration: none;
            color: inherit;
        }

        .lod {
            width: 35px;
            height: 5px;
            background-color: black;
            margin: 6px 0;
        }

        .dropdown {
            float: left;
        }

        .dropdown .lod {
            width: 35px;
            height: 5px;
            background-color: black;
            margin: 6px 0;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /*#category {*/
        /*    margin-left: auto;*/
        /*}*/

        /*여기까지 헤더(인클루드 되는부분)*/
        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }

        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Caption text */
        .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active, .dot:hover {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }

        /* On smaller screens, decrease text size */
        @media only screen and (max-width: 300px) {
            .prev, .next, .text {
                font-size: 11px
            }
        }

        /*여기서부터 본문 */

        #welcome {
            font-size: 30px;
            color: blueviolet;
            text-align: center;
            animation: glow 1s ease-in-out infinite alternate;
        }

        @-webkit-keyframes glow {
            from {
                text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
            }
            to {
                text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
            }
        }

        /* Create two unequal columns that floats next to each other */
        /* Left column */
        .leftcolumn {
            float: left;
            width: 75%;
        }

        /* Right column */
        .rightcolumn {
            float: left;
            width: 25%;
            padding-left: 20px;
        }

        /* Fake image */
        .fakeimg {
            background-color: #aaa;
            width: 100%;
            padding: 20px;
        }

        /* Add a card effect for articles */
        .card {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Footer */
        .footer {
            padding: 20px;
            text-align: center;
            background: #ddd;
            margin-top: 20px;
        }

        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 800px) {
            .leftcolumn, .rightcolumn {
                width: 100%;
                padding: 0;
            }
        }

        #main_search {
            display: inline;
            width: 800px;
        }

    </style>
</head>
<body>
<div>
    <ul class="header">
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='${addAndModify}'/>">${register}</a></li>
        <li><a href="<c:url value='/ord/list'/>">주문조회</a></li>
        <li><a href="<c:url value='/cs'/>">고객센터</a></li>
        <input type="hidden" name="toURL" value="${param.toURL}">
    </ul>
</div>
<div class="logo">
    <span id="search_logo">
            <a href="/"><img id="logo" src="/dgajalogo.png" alt="logo"></a>
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