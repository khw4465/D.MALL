<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%><html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<%-- 날짜를 포맷해주는 jstl문--%>
<head>
    <title>Complete</title>
    <link rel="stylesheet" href="<c:url value='/css/ordResult.css'/>">
</head>
<body>
<div>
    <h1>주문 완료!</h1>
    <p>드가자몰을 이용해주셔서 감사합니다.</p>
    <div>
        <p>주문일시 : <fmt:formatDate value="${ordInfo.ordDttm}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
        <p>주문번호 : <c:out value="${ordInfo.ordCd}"/></p>
        <p>상품명 : <c:out value="${ordInfo.prodName}"/></p>
        <p>결제금액 : <fmt:formatNumber value="${ordInfo.finPrc}" type="number" pattern="#,###"/>원</p>
        <p>결제수단 : 카카오페이머니 결제</p>
    </div>
    <div>
        <a href="/"  class="btn2 sizeM ">쇼핑 계속하기</a>
        <a href="<c:url value='/order/list'/>" class="btn1 sizeM  ">주문 상세보기</a>
        <span class=품"gRight"></span>
    </div>
</div>
</body>
</html>
