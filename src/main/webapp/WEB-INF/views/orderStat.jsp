<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="resultList" value="${stat}"/> <!-- 여기에 쿼리 결과 리스트를 저장 -->

<!-- 날짜(time)와 가격(prc)를 각각 List에 저장 -->
<c:set var="dates" value="${resultList}"/>
<c:set var="prices" value="${resultList}"/>

<!-- 'yyyy-MM-dd' 형식의 날짜들을 추출하여 리스트에 저장 -->
<c:set var="dateList" value=""/>
<c:forEach items="${dates}" var="row">
    <c:set var="date" value="${row['time']}"/>
    <c:set var="formattedDate" value="${fn:substring(date, 0, 10)}"/>
    <c:set var="dateList" value="${dateList},${'\"'}${formattedDate}${'\"'}"/>
</c:forEach>

<!-- 가격(prc)들을 리스트에 저장 -->
<c:set var="priceList" value="" scope="page"/>
<c:forEach items="${prices}" var="row">
    <c:set var="price" value="${row['prc']}"/>
    <c:set var="priceList" value="${priceList},${price}"/>
</c:forEach>

<%-- 콤마(,)로 시작하는 문자열 제거 --%>
<c:set var="dateList" value="${fn:substring(dateList, 1, fn:length(dateList))}"/>
<c:set var="priceList" value="${fn:substring(priceList, 1, fn:length(priceList))}"/>

<c:set var="weekSales" value="${weekStat}" />
<c:set var="monthSales" value="${monthStat}" />

<html>
<head>
    <title>order chart</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
</head>
<body>
<div class="dashboardArea">
    <div class="mDashboard">
        <div class="mDashboard gTabMerge eTabs ui-tabs ui-widget ui-widget-content ui-corner-all">
            <div class="title">
                <h2>쇼핑몰 현황
                    <div class="cTip" code="MA.30" data-gtm="DATA_status_tip">
                        <div class="mTooltip ">
                            <button type="button" class="icon eTip" data-gtm="DATA_status_tip">도움말</button>
                            <div class="tooltip" style="z-index : 1; width: 630px">
                                <div class="content"></div>
                                <button type="button" class="close eClose">닫기</button>
                                <span class="edge"></span>
                            </div>
                        </div>
                    </div>
                </h2>
                <span class="advertise">
                    <span id="admngDebug"></span>
                    <span id="admngSide_2"></span>
                    <script id="admng" type="text/javascript" src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=malladmin&amp;userID=khw4465&amp;groupIdx=73" charset="utf-8"></script>
                </span>
                <span class="gRight">
                    <a href="#layerBoardSet" class="btnNormal eLayerClick" data-gtm="DATA_post_status_setting">
                        <span>게시물 현황 설정</span>
                    </a>
                </span>
            </div>

            <div class="chart-board">
                <div class="mTab typeNav mallStauts">
                    <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                        <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active">
                            <a href="#tabMallStatus1" id="tabMallStatus1Button" data-gtm="DATA_daily_sales_status">일별 매출 현황</a>
                        </li>
                        <li class="ui-state-default ui-corner-top">
                            <a href="#tabMallStatus2" data-gtm="DATA_order_processing_status">주문처리 현황</a>
                        </li>
                        <li class="ui-state-default ui-corner-top">
                            <a href="#tabMallStatus3" data-gtm="DATA_membership_point_status">회원/적립금 현황</a>
                        </li>
                        <li class="ui-state-default ui-corner-top">
                            <a href="#tabMallStatus4" data-gtm="DATA_deposit_status">예치금 현황</a>
                        </li>
                        <li class="ui-state-default ui-corner-top">
                            <a href="#tabMallStatus5" data-gtm="DATA_post_status">게시물 현황</a>
                        </li>
                    </ul>
                </div>

                <div id="tabMallStatus1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
                    <div class="mallArea">
                        <div class="gFlow graph">
                            <canvas id="salesChart" style="width: 465px"></canvas>
                            <div class="gSingleSide">
                                <ul class="mList">
                                    <li>최종 업데이트일시 : <span id="eMainSalesDailyChartRefleshTime"><fmt:formatDate value="${today}" pattern="MM월 dd일 HH:mm:ss"/></span>
                                    </li>
                                </ul>
                            </div>
                        </div><div class="gReverse">
                        <div class="mBoard">
                            <table border="1" summary="">
                                <caption>일별 매출 현황</caption>
                                <colgroup>
                                    <col style="width:auto;">
                                    <col style="width:26%;">
                                    <col style="width:26%;">
                                    <col style="width:25%;">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">날짜</th>
                                    <th scope="col">주문</th>
                                    <th scope="col">결제</th>
                                    <th scope="col">환불(취소/반품)</th>
                                </tr>
                                </thead>
                                <tbody class="right">
                                <tr class="">
                                    <th scope="row" id="dailyCountTitle1">08월 08일</th>
                                    <td id="dailyCountOrderPrice1">0<br>(0건)</td>
                                    <td id="dailyCountPayedPrice1">0 원<br>(0건)</td>
                                    <td id="dailyCountRefundPrice1">0 원<br>(0건)</td>
                                </tr>
                                <tr class="">
                                    <th scope="row" id="dailyCountTitle2">08월 09일</th>
                                    <td id="dailyCountOrderPrice2">0 원<br>(0건)</td>
                                    <td id="dailyCountPayedPrice2">0 원<br>(0건)</td>
                                    <td id="dailyCountRefundPrice2">0 원<br>(0건)</td>
                                </tr>
                                <tr class="">
                                    <th scope="row" id="dailyCountTitle3">08월 10일</th>
                                    <td id="dailyCountOrderPrice3">0 원<br>(0건)</td>
                                    <td id="dailyCountPayedPrice3">0 원<br>(0건)</td>
                                    <td id="dailyCountRefundPrice3">0 원<br>(0건)</td>
                                </tr>
                                <tr class="em">
                                    <th scope="row" id="dailyCountTitleToday">08월 11일 (오늘)</th>
                                    <td id="dailyCountOrderPriceToday">0 원<br>(0건)</td>
                                    <td id="dailyCountPayedPriceToday">0 원<br>(0건)</td>
                                    <td id="dailyCountRefundPriceToday">0 원<br>(0건)</td>
                                </tr>
                                <tr class="total">
                                    <th scope="row" id="weeklyCountOrderAvgTitle">최근 7일 평균</th>
                                    <td id="weeklyCountOrderPriceAvg"><fmt:formatNumber value="${weekSales['average_sales']}" type="number" pattern="#,###" /> 원<br>(<c:out value="${weekSales['average_payment_count']}"/>건)</td>
                                    <td id="weeklyCountPayedPriceAvg"><fmt:formatNumber value="${weekSales['average_sales']}" type="number" pattern="#,###" /> 원<br>(<c:out value="${weekSales['average_payment_count']}"/>건)</td>
                                    <td id="weeklyCountRefundPriceAvg">0 원<br>(0건)</td>
                                </tr>
                                <tr>
                                    <th scope="row" id="weeklyCountOrderTotalTitle">최근 7일 합계</th>
                                    <td id="weeklyCountOrderPriceTotal"><fmt:formatNumber value="${weekSales['total_sales']}" type="number" pattern="#,###" /> 원<br>(<c:out value="${weekSales['payment_count']}"/>건)</td>
                                    <td id="weeklyCountPayedPriceTotal"><fmt:formatNumber value="${weekSales['total_sales']}" type="number" pattern="#,###" /> 원<br>(<c:out value="${weekSales['payment_count']}"/>건)</td>
                                    <td id="weeklyCountRefundPriceTotal">0 원<br>(0건)</td>
                                </tr>
                                <tr>
                                    <th scope="row" id="monthlyCountOrderAvgTitle">최근 30일 평균</th>
                                    <td id="monthlyCountOrderPriceAvg"><fmt:formatNumber value="${monthSales['average_sales']}" type="number" pattern="#,###" /> 원<br>(<c:out value="${monthSales['average_payment_count']}"/>건)</td>
                                    <td id="monthlyCountPayedPriceAvg"><fmt:formatNumber value="${monthSales['average_sales']}" type="number" pattern="#,###" /> 원<br>(<c:out value="${monthSales['average_payment_count']}"/>건)</td>
                                    <td id="monthlyCountRefundPriceAvg">0 원<br>(0건)</td>
                                </tr>
                                <tr class="total">
                                    <th scope="row" id="monthlyCountOrderTotalTitle">최근 30일 합계</th>
                                    <td id="monthlyCountOrderPriceTotal"><fmt:formatNumber value="${monthSales['total_sales']}" type="number" pattern="#,###" /> 원<br>(<c:out value="${monthSales['payment_count']}"/>건)</td>
                                    <td id="monthlyCountPayedPriceTotal"><fmt:formatNumber value="${monthSales['total_sales']}" type="number" pattern="#,###" /> 원<br>(<c:out value="${monthSales['payment_count']}"/>건)</td>
                                    <td id="monthlyCountRefundPriceTotal">0 원<br>(0건)</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let ctx = document.getElementById('salesChart').getContext('2d');
    let chart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: [${dateList}],
            datasets: [{
                label: '일별 매출',
                data: [${priceList}],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        callback: function (value, index, values) {
                            return value / 10000 + 'k';
                        }
                    },
                    scaleLabel: {
                        display: true,
                        labelString: '매출 (만 원)'
                    }
                }],
                xAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: '날짜'
                    }
                }]
            },
            responsive: true
        }
    });
</script>
</body>
</html>