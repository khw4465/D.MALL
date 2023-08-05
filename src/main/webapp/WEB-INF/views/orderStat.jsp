<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

<html>
<head>
    <title>order chart</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
</head>
<body>

        <div style="width: 900px; height: 900px;">
            <p>${dateList}</p>
            <p>${priceList}</p>
            <canvas id="salesChart"></canvas>
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
                        callback: function(value, index, values) {
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