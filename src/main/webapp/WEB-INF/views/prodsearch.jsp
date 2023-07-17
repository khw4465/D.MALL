<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-07-16
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<html>
<head>
    <title>searchProdPage</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
</head>
<body>
<div>
    <ul class="header">
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='${addAndModify}'/>">${register}</a></li>
        <li><a href="<c:url value='/order/list'/>">주문조회</a></li>
        <li><a href="<c:url value='/cs'/>">고객센터</a></li>
        <li id="adminHome"> </li>
        <!--        여기 관리자로 로그인시 관리자홈이라는 a 태그 생김-->
        <input type="hidden" name="toURL" value="${param.toURL}">
    </ul>
</div>

<div class="logo">
        <span id="search_logo">
                <a href="<c:url value='/'/>"><img id="logo" src="/dgajalogo.png" alt="logo"></a>
            <!-- 이게 검색창을 나타내는 코드 -->
            <form id="main_search" action="/prod/search" class="search-form">
                    <select class="search-option" name="option">
                        <option value="T" ${pagehandler.sc.option=='T' ? 'selected' : ''}>상품명</option>
                    </select>
<%--                <input type="text" name="keyword" class="search-input" value="" placeholder="저녁 8시 이전 주문 시 내일 새벽 도착!"&ndash;%&gt;--%>
<%--                   style="width: 310px">--%>
                <input type="text" name="keyword" class="search-input" value="${pageHandler.sc.keyword}" placeholder="저녁 8시 이전 주문 시 내일 새벽 도착!" &ndash;%&gt; style="width: 310px">
                <input type="submit" class="search-button" value="검색">
            </form>
            <!-- 이게 검색창을 나타내는 코드 -->

        <a href="/"><img class="person" src="/coupon.png" alt="coupon"></a>
        <a href="<c:url value='/custMyPage'/>"><img class="person" src="/person.png" alt="mypaga"></a>
        <a href="<c:url value='/cart/list'/>"><img class="person" src="/cart.png" alt="cart"></a></span>

    <!--    여기에 문장 삽입하는 코드-->
</div>

<!-- 헤더 -->
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
<!--여기까지 헤더-->

<!-- 같은 라인-->

<div>
    <ul id="resultline">
        <h2>검색결과</h2>
        <li id="relineli">전체</li>
        <li id="relineli">기획전상품</li>
        <li id="relineli">일반상품</li>
    </ul>
</div>
<!-- 같은 라인-->

<br>

<div>
    <ul id="refsearch">
        <li id="refline"><b>연관검색어</b></li>
        <!-- 밑에는 예시로 키워드처럼 누르면 해당하는 상품들이 보여지게끔 하는 역할 -->
        <li id="refline"><a>예시 잇메이트 닭가슴살 현미 볶음밥</a></li>
        <li id="refline"><a>예시 랭커 스테이크</a></li>
        <li id="refline"><a>예시 잇메이트 닭가슴살 핫도그</a></li>
        <li id="refline"><a>예시 다이어트 떡볶이</a></li>
        <li id="refline"><a>예시 러브잇</a></li>
        <li id="refline"><a>예시 닭가슴살</a></li>
        <!-- 예시로 키워드처럼 누르면 해당하는 상품들이 보여지게끔 하는 역할 -->
    </ul>
</div>

<br>

<!-- 한줄에 네개 보여지는 코드 -->
<ul id="prodimg">
    <li id="prodinfo">
        <div><img src="imgex/dice1.png" alt="">상품이미지가 들어갈 곳</div>
        <div>상품 정보 및 가격이 들어갈 곳.</div>
    </li>

    <li id="prodinfo">
        <div><img src="imgex/dice2.png" alt="">상품이미지가 들어갈 곳</div>
        <div>상품 정보 및 가격이 들어갈 곳.</div>
    </li>

    <li id="prodinfo">
        <div><img src="imgex/dice3.png" alt="">상품이미지가 들어갈 곳</div>
        <div>상품 정보 및 가격이 들어갈 곳.</div>
    </li>

    <li id="prodinfo">
        <div><img src="imgex/dice4.png" alt="">상품이미지가 들어갈 곳</div>
        <div>상품 정보 및 가격이 들어갈 곳.</div>
    </li>
</ul>
<!-- 한줄에 네개 보여지는 코드 -->

<!-- 푸터 -->
<div class="footer">
    <h2>Footer</h2>
</div>

</body>
</html>
