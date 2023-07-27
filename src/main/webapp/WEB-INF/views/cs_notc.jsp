<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-07-11
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <link rel="stylesheet" href="<c:url value='/css/csmain.css'/>">
</head>

<body>

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
<%--            <a href="<c:url value='/custMyPage'/>"><img class="person" src="/img/mypage.png" alt="mypage"></a>--%>
            <a href="<c:url value='/custMyPage'/>"> </a>
            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM625 177L497 305c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L591 143c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
            <a href="<c:url value='/cart/list'/>"><img class="person" src="/img/cart.png" alt="cart"></a>
        </span>
</div>
<div>
  <ul class="headermenu">
    <li>
      <div class="dropdown">
        <div id="lod">
          <i class="fa fa-caret-down"></i>
        </div>
        <%--                <div class="dropdown-content">--%>
        <%--                    <a>특가</a>--%>
        <%--                    <a>랭킹</a>--%>
        <%--                    <a>닭컴</a>--%>
        <%--                </div>--%>
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
<div class="clear"></div>

<!-- 왼쪽 사이드에 붙어있는 각 페이지로 들어가게 하는 메뉴bar-->
<section id="contents" class="container">

  <div class="content-wrap frame-sm">
    <div class="page-title-area">
      <h2 class="title-page"><a href="/cs">고객센터</a></h2>
    </div>
    <div class="frame-wrap">
      <div class="frame-left">
        <div class="aside-menu-wrap">
          <nav class="aside-menu">
            <ul class="menu-list">
              <li><a href="/notc/list" class="menu">공지사항</a></li>
              <li><a href="/user/list" class="menu">이용안내</a></li>
              <li><a href="/faq/list" class="menu">자주묻는 FAQ</a></li>

            </ul>
          </nav><!--// aside-menu -->

          <div class="aside-guide-box">
            <dl>
              <dt>드가자몰 고객센터</dt>
              <dd class="phone-num">02-1234-1234</dd>
              <dd>평일 <span class="text-num-md">09:00 ~ 18:00</span></dd>
              <dd>주말, 공휴일 휴무</dd>
            </dl>
            <dl>
              <dt>실시간 채팅 상담</dt>
              <dd>평일 <span class="text-num-md">09:00 ~ 21:00</span></dd>
              <dd>토요일 <span class="text-num-md">09:00 ~ 15:00</span></dd>
              <dd>일요일 <span class="text-num-md">13:00 ~ 21:00</span></dd>
            </dl>
          </div><!--// aside-guide-box -->
        </div><!--// aside-menu-wrap -->
      </div><!--// frame-left -->
      <div class="frame-right">
        <div class="frame-cnt-inner">

          <div class="list-title-area">
            <h3 class="title-list-type2">공지사항</h3>
          </div>

          <div class="use-guide">
            <table>
              <tr>
                <th>번호</th>
                <th>카테고리</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회</th>
              </tr>
              <c:forEach var="NotcDto" items="${list}">
                <tr>
                  <td>${NotcDto.bbsoNo}</td>
                  <td>${NotcDto.cate}</td>
                  <td class="none-center"><a href="<c:url value='/notc/read?bbsoNo=${NotcDto.bbsoNo}&page=${page}&pageSize=${pageSize}'/>">${NotcDto.ttl}</a> </td>
                  <td class="td-weak">${NotcDto.wrtd}</td>
                  <td class="td-weak">${NotcDto.notcCnt}</td>
                </tr>
              </c:forEach>
            </table>

            <!-- 게시물 검색창 -->
            <div id="cs_search">
              <form action="<c:url value="/notc/list"/>" class="search-form" method="get">
                <select class="search-option" name="option" hidden="hidden">
                  <option value="T" ${pagehandler.sc.option=='T' ? "selected" : ""} hidden="hidden">제목만</option>
                </select>

                <input type="text" name="keyword" class="search-input" type="text" value="${pagehandler.sc.keyword}" placeholder="제목을 검색해주세요">
                <input type="submit" class="notc-button" value="검색">
              </form>
            </div>
            <!-- 게시물 검색창 -->

            <!-- 핸들러 -->
            <div id="handle">
              <c:if test="${totalCnt==null || totalCnt==0}">
                <div> 게시물이 없습니다.</div>
              </c:if>
              <c:if test="${totalCnt!=null && totalCnt!=0}">
                <c:if test="${pagehandler.showPrev}">
                  <a class="page" href="<c:url value="/notc/list${pagehandler.sc.getQueryString(pagehandler.beginPage-1)}"/> ">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${pagehandler.beginPage}" end="${pagehandler.endPage}">
                  <a class="page ${i==pagehandler.sc.page? "paging-active" : ""}" href="<c:url value="/notc/list${pagehandler.sc.getQueryString(i)}"/>">${i}</a>
                </c:forEach>
                <c:if test="${pagehandler.showNext}">
                  <a class="page" href="<c:url value="/notc/list${pagehandler.sc.getQueryString(pagehandler.endPage)}"/> ">&gt;</a>
                </c:if>
              </c:if>
            </div>
            <!-- 핸들러 -->
          </div><!--// use-guide -->

          <br>



        </div>
      </div>
    </div><!--frame-wrap-->
  </div><!--// content-wrap -->
  <div class="includeItem"><jsp:include page="footer.jsp" /></div>
</section>

</body>
</html>
