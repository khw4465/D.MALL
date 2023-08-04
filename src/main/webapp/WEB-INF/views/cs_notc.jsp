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
  <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
</head>

<body>
<jsp:include page="header.jsp"/>

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
            <table class="padding">
              <tr class="padding">
                <th class="padding">번호</th>
                <th class="padding">카테고리</th>
                <th class="padding">제목</th>
                <th class="padding">작성일</th>
                <th class="padding">조회</th>
              </tr>
              <c:forEach var="NotcDto" items="${list}">
                <tr class="padding">
                  <td class="padding">${NotcDto.bbsoNo}</td>
                  <td class="padding">${NotcDto.cate}</td>
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
