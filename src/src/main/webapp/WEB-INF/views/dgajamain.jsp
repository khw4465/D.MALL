<%--
  Created by IntelliJ IDEA.
  User: sanghoon
  Date: 2023/05/02
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%--여기가 메인 시작페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session != null && session.getAttribute("id") != null) {
        pageContext.setAttribute("login_check", "true");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>index</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
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

        .logo {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #eee;
            padding: 10px;
        }

        .logo img {
            margin-left: 25px;
            width: 40px;
            height: 40px;
        }

        .search-form {
            margin-left: 10px;
            display: flex;
            align-items: center;
        }

        .search-input {
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
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
            background-color: rgba(0,0,0,0.8);
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
            from {opacity: .4}
            to {opacity: 1}
        }

        /* On smaller screens, decrease text size */
        @media only screen and (max-width: 300px) {
            .prev, .next,.text {font-size: 11px}
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
    </style>
</head>
<body>
<div>
    <ul class="header">
        <li id="login"><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li id="register"><a href="<c:url value='/register/add'/>">회원가입 |</a></li>
        <li><a href="/uploadForm/index">업로드 |</a></li>
        <li><a href="/downloadForm/index">다운로드 |</a></li>
        <li><a href="/prod/reg">상품등록 |</a></li>
    </ul>
</div>
<div class="logo">
    <a id="logo" href="/"><img src="/끝말잇기.png" alt="logo"></a>
    <%--    여기에 문장 삽입하는 코드--%>
    <p id = "welcome">Welcome to Sanghoon World!</p>
    <form action="/board/list" class="search-form" method="get">
        <input type="text" name="keyword" class="search-input" value="" placeholder="가나다라">
        <input type="submit" class="search-button" value="검색">
    </form>
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
                    <a href="/literature/star">별헤는밤</a>
                    <a href="/literature/self">자화상</a>
                    <a href="/literature/coin">동전인생</a>
                </div>
            </div>
        </li>
        <li><a href="/">홈</a></li>
        <li><a href="/literature/index">문학</a></li>
        <li><a href="/card/index">카드게임</a></li>
        <li><a href="/board/list">자유게시판</a></li>
        <li><a href="/literature/index">문학</a></li>
        <li><a href="/card/index">카드게임</a></li>
        <li><a href="/board/list">자유게시판</a></li>
    </ul>
</div>
<%--여기까지 헤더--%>
<div class="slideshow-container">
    <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="/back1.jpeg" style="width:100%; height:300px">
    </div>
    <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="/back2.jpeg" style="width:100%; height:300px">
    </div>
    <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="/back3.jpeg" style="width:100%; height:300px">
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
<div class="row">
    <div class="leftcolumn">
        <div class="card">
            <h2>JAVA</h2>
            <h5>자바의정석, 스프링</h5>
            <div class="fakeimg" style="height:200px;">Image</div>
            <p>Some text..</p>
            <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
        </div>
        <div class="card">
            <h2>TITLE HEADING</h2>
            <h5>Title description, Sep 2, 2017</h5>
            <div class="fakeimg" style="height:200px;">Image</div>
            <p>Some text..</p>
            <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
        </div>
    </div>
    <div class="rightcolumn">
        <div class="card">
            <h2>About Me</h2>
            <div class="fakeimg" style="height:100px;">Image</div>
            <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
        </div>
        <div class="card">
            <h3>Popular Post</h3>
            <div class="fakeimg">Image</div><br>
            <div class="fakeimg">Image</div><br>
            <div class="fakeimg">Image</div>
        </div>
        <div class="card">
            <h3>Follow Me</h3>
            <p>Some text..</p>
        </div>
    </div>
</div>

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
        if (n > slides.length) {slideIndex = 1}
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
    }
</script>
</body>
</html>