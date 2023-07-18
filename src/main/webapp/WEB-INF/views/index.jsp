<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>D.gaja</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
</head>
<body>
<div>
    <ul class="header">
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='${addAndModify}'/>">${register}</a></li>
        <li><a href="<c:url value='/order/list'/>">주문조회</a></li>
        <li><a href="<c:url value='/cs'/>">고객센터</a></li>
        <c:if test="${loginAdminTrue}">
            <li><a href="/admin">관리자홈</a></li>
        </c:if>
        <input type="hidden" name="toURL" value="${param.toURL}">
    </ul>
</div>
<div class="logo">
        <span id="search_logo">
            <a href=${logo}><img id="logo" src="/img/logo1.png" alt="logo"></a>
<%--            로그인되어있으면 컨트롤러로 보내고 아니면 그냥 홈으로 가야함--%>
           <form id="main_search" action="/prod/search" class="search-form" method="get">
                <select class="search-option" name="option" hidden="">
                    <option value="T" ${PageHandler.psc.option=='T' ? "selected" : ""}>제목만</option>
                </select>
                <input type="text" name="keyword" class="search-input" value="${PageHandler.psc.keyword}">
                <input type="submit" class="search-button" value="검색">
            </form>
            <a href="/"><img class="person" src="/img/coupon.png" alt="coupon"></a>
            <a href="<c:url value='/custMyPage'/>"><img class="person" src="/img/mypage.png" alt="mypage"></a>
            <a href="<c:url value='/cart/list'/>"><img class="person" src="/img/cart.png" alt="cart"></a>
        </span>

</div>
<div>
    <ul class="menu">
        <li>
            <div class="dropdown">
                <div id="lod">
                    <i class="fa fa-caret-down"></i>
                </div>
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
<!-- Slideshow container -->
<div class="slideshow-container">

    <!-- Full-width images with number and caption text -->
    <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="/img/img1.png" style="width:100%">
        <div class="text">Caption Text</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="/img/img2.png" style="width:100%">
        <div class="text">Caption Two</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="/img/img3.png" style="width:100%">
        <div class="text">Caption Three</div>
    </div>

    <!-- Next and previous buttons -->
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
</div>


<script>
    //슬라이드쇼
    let slideIndex = 1;
    showSlides(slideIndex);

    // Next/previous controls
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    // Thumbnail image controls
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