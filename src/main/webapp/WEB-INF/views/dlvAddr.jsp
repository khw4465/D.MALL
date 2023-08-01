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
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/myPageSideBar.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/dlvAddr.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="content">
    <div class="left-content">
        <jsp:include page="myPageSideBar.jsp"/>
    </div>
    <div class="right-content">
        <jsp:include page="findAddr.jsp"/>
    </div>

<jsp:include page="footer.jsp"/>
</body>
</html>
