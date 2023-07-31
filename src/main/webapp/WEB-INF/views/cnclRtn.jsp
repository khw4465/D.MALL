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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order</title>
  <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/myPageSideBar.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/orderList.css'/>">
</head>
<body>

<jsp:include page="header.jsp"/>


<div class="content">
  <div class="left-content">
    <jsp:include page="myPageSideBar.jsp"/>
  </div>
  <div class="right-content">
    <form id="myPageOrderList" name="myPageOrderList" action="/mypage/orderlist?srchFlag=Y&amp;nowPageNo=&amp;mypage-order-search-radio=PERIOD&amp;periodOption=PERIOD&amp;dStartDtm=2023-01-26&amp;dEndDtm=2023-07-26&amp;srchProductNm=&amp;dlvTypeAll=Y&amp;dlvNrm=Y&amp;dlvRtn=Y" method="get">
      <div class="menu-title-area">
        <h3 class="title-menu">취소/반품 내역</h3>
      </div><!--// menu-title-area -->
      <div class="search-box">
        <div class="search-detail">
          <fieldset>
            <legend>상세 검색</legend>
            <div class="search-detail-top">
              <div class="search-detail-date-wrapper">
                <input type="text" readonly="" id="searchDateFrom" class="input-text hasDatepicker" value="2023-01-26">
                ~
                <input type="text" readonly="" id="searchDateTo" class="input-text hasDatepicker" value="2023-07-26">
              </div>
            </div>
            <div class="search-detail-filter">
              <div class="search-detail-filter-btn-group">
                <button type="button" class="detail-filter-btn" value="1">1개월</button>
                <button type="button" class="detail-filter-btn" value="3">3개월</button>
                <button type="button" class="detail-filter-btn" value="6">6개월</button>
                <button type="button" class="detail-filter-btn" value="12">12개월</button>
              </div>
              <div class="search-detail-filter-end">
                <a href="javascript:;" onclick="onSubmitMyPageOrderSearch();" class="btn-form btn-black"><span>조회하기</span></a>
              </div>
            </div>
          </fieldset>
        </div><!--// search-detail-->
      </div><!--// search-box -->
    </form>


    <div class="order-list-area">
        <h2>취소/반품 내역이 없습니다.</h2>
    </div>

<jsp:include page="footer.jsp"/>

</body>
</html>
