<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <link rel="stylesheet" href="<c:url value='/css/myPageSideBar.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/main2.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/orderList.css'/>">
</head>
<body>
<header>
    <nav>
        <jsp:include page="header.jsp"/>
        <div id="header_warp" style="height: 248px;"></div>
    </nav>
</header>
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
        <ul class="order-list-inner">
            <c:forEach var="ord" items="${list}">
                <li id="list${ord.ordCd}" class="${ord.ordCd}">
                    <div class="order-list-head">
                        <strong class="date">${ord.ordDttm}</strong>
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
                                        <div class="column img"><a href="javascript:void(0);" onclick="onClickMyPageOrderListOrderCd(this); return false;" ordercd="${ord.ordCd}"><img src="" alt="상품이미지"></a></div>
                                        <div class="column tit">
                                            <div class="prd-state-row">
                                                <strong class="prd-state-head">${ord.ordStus}</strong>
                                                <span class="prd-state-date">${ord.stusChgDttm} ${ord.ordStus}</span>
                                            </div>
                                            <!-- [Dev] 20220420 추가 : 당일/새벽배송 아이콘 추가 -->
                                            <p class="tit"><a href="javascript:void(0);" onclick="onClickMyPageOrderListOrderCd(this); return false;" ordercd="${ord.ordCd}">${ord.prodName}</a></p>
                                        </div><!--// column  -->
                                        <div class="price-item">
                                            <div class="dlv-nmr">
                                                <p class="dlv-nmr-price">
                                                    <span class="num">${ord.finPrc}</span>원
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
                            <p><i class="ico-bl-home2"></i> [01234]&nbsp;종로2가9 YMCA 517호</p>
                        </div><!--// addr-info-line -->
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
</div>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
