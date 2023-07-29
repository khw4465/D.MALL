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
    <link rel="stylesheet" href="<c:url value='/css/prodsearch.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main1.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main2.css'/>">
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="content">
    <div class="wrap">
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
            <div class="proditem">
        <li id="prodinfo">
            <div><a href="<c:url value='/prod/detail/${Prod.prodCd}'/>"><img class="thmImg" src="/img/<c:out value='${Prod.prodCd}' />.png" /></div>
            <div id="prodname">${Prod.prodName}</div>
            <div id="prodprice">${Prod.prodPrice}원</div>
        </li>
            </div> <!-- proditem -->
        </c:forEach>
    </ul>
<!-- 한줄에 네개 보여지는 코드 -->
    </div> <!-- prodwrap -->
    </div> <!-- wrap -->

<div class="includeItem"><jsp:include page="footer.jsp" /></div>
</div>  <!-- content -->
</body>
</html>
