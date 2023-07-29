<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%><html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<head>
    <title>Cancle</title>
  <link rel="stylesheet" href="<c:url value='/css/ordResult.css'/>">
</head>
<body>
<div>
  <h1>주문이 취소되었습니다.</h1>
  <div>
    <a href="/"  class="btn2 sizeM ">쇼핑 계속하기</a>
    <a href="<c:url value='/cart/list'/>" class="btn1 sizeM  ">장바구니로 이동</a>
    <span class="gRight"></span>
  </div>
</div>
</body>
</html>
