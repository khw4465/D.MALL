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
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>D.gaja</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <style>
        #refsearch{
            padding: 0;
            margin: auto;
        }

        #refline{
            display: inline-block;
            margin: auto;
        }

        #prodimg{
            padding: 0;
        }

        #prodinfo {
            display: inline-block;
            width: 260px;
            height: 150px;
        }

        #prodwrap{
            width: 1120px;
            height: 4570px;
            margin: auto;
        }

        #prodname{
            width: 260px;
            height: 44px;
        }

        #resultline{
            margin : auto;
        }



    </style>
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
<%--            검색창--%>
             <form id="main_search" action="/prod/search" class="search-form" method="get">
                <select class="search-option" name="option" hidden="">
                    <option value="T" ${PageHandler.psc.option=='T'} hidden="hidden">제목만</option>
                </select>
                <input type="text" name="keyword" class="search-input" value="${PageHandler.psc.keyword}">
                <input type="submit" class="search-button" value="검색">
            </form>
            <a href="/"><img class="person" src="/img/coupon.png" alt="coupon"></a>
            <a href="<c:url value='/custMyPage'/>"><img class="person" src="/img/mypage.png" alt="mypage"></a>
            <a href="<c:url value='/cart/list'/>"><img class="person" src="/img/cart.png" alt="cart"></a>
        </span>

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
    </ul>
</div>
<!-- 같은 라인-->

<br>

<div>
    <ul id="refsearch">
        <li id="refline"><b>추천검색어</b></li>
        <!-- 밑에는 예시로 키워드처럼 누르면 해당하는 상품들이 보여지게끔 하는 역할 -->
        <li id="refline" ><a href="<c:url value="/prod/search?option=T&keyword=닭가슴살"/>" >닭가슴살</a></li>
        <li id="refline" ><a href="<c:url value="/prod/search?option=T&keyword=샐러드"/>" >샐러드</a></li>
        <li id="refline" ><a href="<c:url value="/prod/search?option=T&keyword=도시락"/>" >도시락</a></li>
        <li id="refline" ><a href="<c:url value="/prod/search?option=T&keyword=제로"/>" >제로</a></li>
        <li id="refline" ><a href="<c:url value="/prod/search?option=T&keyword=쉐이크"/>" >쉐이크</a></li>
        <li id="refline" ><a href="<c:url value="/prod/search?option=T&keyword=단백질"/>" >단백질</a></li>
        <!-- 예시로 키워드처럼 누르면 해당하는 상품들이 보여지게끔 하는 역할 -->
    </ul>
</div>

<br>

<!-- 한줄에 네개 보여지는 코드 -->
<div id="prodwrap">
<ul id="prodimg">
    <c:forEach var="Prod" items="${list}">
    <li id="prodinfo">
        <div><img class="thmImg" src="/img/<c:out value='${Prod.prodCd}' />.png" /></div>
        <div id="prodname"><a href="<c:url value='/prod/detail/${Prod.prodCd}'/>">${Prod.prodName}</div>
        <div id="prodprice">${Prod.prodPrice}</div>
    </li>
        </c:forEach>

<%--    <li id="prodinfo">--%>
<%--        <div><img src="imgex/dice2.png" alt="">상품이미지가 들어갈 곳</div>--%>
<%--        <div>상품 정보 및 가격이 들어갈 곳.</div>--%>
<%--    </li>--%>

<%--    <li id="prodinfo">--%>
<%--        <div><img src="imgex/dice3.png" alt="">상품이미지가 들어갈 곳</div>--%>
<%--        <div>상품 정보 및 가격이 들어갈 곳.</div>--%>
<%--    </li>--%>

<%--    <li id="prodinfo">--%>
<%--        <div><img src="imgex/dice4.png" alt="">상품이미지가 들어갈 곳</div>--%>
<%--        <div>상품 정보 및 가격이 들어갈 곳.</div>--%>
<%--    </li>--%>
</ul>
<!-- 한줄에 네개 보여지는 코드 -->
</div>
<!-- 푸터 -->
<div class="footer">
    <h2>Footer</h2>
</div>

</body>
</html>
