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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <link rel="stylesheet" href="<c:url value='/css/myPageSideBar.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
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
            <h3 class="title-menu">주문내역</h3>
        </div><!--// menu-title-area -->
        <div class="search-box">
            <div class="search-detail">
                <fieldset>
                    <legend>상세 검색</legend>
                    <div class="search-detail-top">
                        <div class="search-detail-date-wrapper">
                            <input type="text" readonly="" id="searchDateFrom" class="input-text hasDatepicker" value="<fmt:formatDate value="${oneMonthAgo}" pattern="yyyy-MM-dd" />">
                            ~
                            <input type="text" readonly="" id="searchDateTo" class="input-text hasDatepicker" value="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />">
                        </div>
                    </div>
                    <div class="search-detail-filter">
                        <div class="search-detail-filter-btn-group">
                            <button type="button" class="detail-filter-btn active" value="1">1개월</button>
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
        <ul class="order-list-inner">
            <c:forEach var="ord" items="${list1}">
                <li id="list${ord.ordCd}" class="${ord.ordCd}">
                    <div class="order-list-head">
                        <strong class="date"> <fmt:formatDate value="${ord.ordDttm}" pattern="yyyy.MM.dd"/></strong>
                        <div class="right">
                            <span class="order-item-id">${ord.ordCd}</span>
                            <a href="" class="btn-link-txt5" style="text-decoration: none; color:lightgray"><span>주문상세</span> &nbsp <strong> > </strong> </a>
                        </div>
                    </div><!--// list-head -->
                    <div class="order-content-box">
                        <ul class="order-div-list">
                            <li class="order-div-item">
                                <div class="prd-info-area">
                                    <div class="inner">
                                        <div class="column img"><a href="javascript:void(0);" ordercd="${ord.ordCd}"><img src="/img/${ord.mainProdCd}.png" alt="상품이미지" style="width: 50px; height: 50px"></a></div>
                                        <div class="column tit">
                                            <div class="prd-state-row">
                                                <strong class="prd-state-head">${ord.ordStus}</strong>
                                                <span class="prd-state-date"><fmt:formatDate value="${ord.stusChgDttm}" pattern="MM월 dd일"/> ${ord.ordStus}</span>
                                            </div>
                                            <!-- [Dev] 20220420 추가 : 당일/새벽배송 아이콘 추가 -->
                                            <p class="tit"><a href="javascript:void(0);" ordercd="${ord.ordCd}">${ord.prodName}</a></p>
                                        </div><!--// column  -->
                                        <div class="price-item">
                                            <div class="dlv-nmr">
                                                <p class="dlv-nmr-price">
                                                    <span class="num"><fmt:formatNumber value="${ord.finPrc}" type="number" pattern="#,###"/></span>원
                                                </p>
                                                <p class="dlv-nmr-cnt">
                                                    <span class="num">${ord.totProdCnt}</span>개
                                                </p>
                                            </div>
                                        </div>
                                        <div class="column col-btn-group">
                                            <div class="col-btn-group-inn">
                                                <a href="javascript:void(0);" onclick="fnDlvPop('RK2304080003570251','RK230408000357025100','N','N');" class="prd-control-btn"><span>배송조회</span></a>
                                                <a href="#" class="prd-control-btn"><span>주문취소</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--// prd-info-area -->
                            </li><!--// order-div-item || 상품별 list 1 -->
                        </ul><!--// order-div-list -->
                        <div class="addr-info-line">
                            <c:set var="dlv" value="${dlv}"/>
                                <p><i class="ico-bl-home2"></i> [${dlv.zpcd}]&nbsp;${dlv.dlvAddr}&nbsp;${dlv.dtlAddr}</p>
                        </div><!--// addr-info-line -->
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="handle_usg">
        <c:if test="${totalCnt==null || totalCnt==0}">
            <div> 게시물이 없습니다.</div>
        </c:if>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
            <c:if test="${pagehandler.showPrev}">
                <a class="page" href="<c:url value="/order/list?page=${pagehandler.beginPage-1}"/> ">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${pagehandler.beginPage}" end="${pagehandler.endPage}">
                <a class="page ${i==pagehandler.page? "paging-active" : ""}" href="<c:url value="/order/list?page=${i}"/>">${i}</a>
            </c:forEach>
            <c:if test="${pagehandler.showNext}">
                <a class="page" href="<c:url value="/order/list?page=${pagehandler.endPage+1}"/> ">&gt</a>
            </c:if>
        </c:if>
    </div><!-- 핸들러 -->
</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
