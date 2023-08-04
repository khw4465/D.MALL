<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<html>
<head>
    <title>통계</title>
    <link rel="stylesheet" href="<c:url value='/css/stats.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
</head>
<body>

<div style="width: 900px; height: 900px;">
    <p>time = ${times}</p>
    <p>prc = ${prcs}</p>
    <canvas id="salesChart"></canvas>
</div>

<script type="text/javascript">
    var ctx = document.getElementById('salesChart').getContext('2d');

    var data = {
        labels: ['2023-07-28', '2023-07-29', '2023-07-31', '2023-08-01', '2023-08-02', '2023-08-03', '2023-08-04'],
        datasets: [{
            label: '일별 매출',
            data: [8100000, 4500000, 450000, 3968000, 5196000, 478778, 147997],
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    var options = {
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
    };

    var chart = new Chart(ctx, {
        type: 'line',
        data: data,
        options: options
    });
</script>
</body>
</html>