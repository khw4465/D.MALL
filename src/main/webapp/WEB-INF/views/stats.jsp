<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="labels" value="" scope="page"/>
<c:set var="data" value="" scope="page"/>

<c:forEach var="stat" items="${loginstats}" varStatus="status">
    <c:set var="labels" value="${labels}'${stat.time}', " scope="page"/>
    <c:set var="data" value="${data}${stat.cnt}, " scope="page"/>
</c:forEach>

<!-- Remove the trailing comma -->
<c:set var="labels" value="${fn:substring(labels, 0, fn:length(labels)-2)}" scope="page"/>
<c:set var="data" value="${fn:substring(data, 0, fn:length(data)-2)}" scope="page"/>

<html>
<head>
    <title>통계</title>
    <link rel="stylesheet" href="<c:url value='/css/stats.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>


<div id="container">
    <jsp:include page="adminSideBar.jsp"/>
    <div id="sidebar2" class="dashboard2">

        <div style="width: 900px; height: 900px;">
            <canvas id="myChart"></canvas>
        </div>

        <script type="text/javascript">
            var labels = [${labels}];
            var data = [${data}];

            var context = document
                .getElementById('myChart')
                .getContext('2d');

            var myChart = new Chart(context, {
                type: 'doughnut',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'test1',
                            data: data,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1,
                            hoverBackgroundColor: [
                                'rgba(255, 99, 132, 0.4)',
                                'rgba(54, 162, 235, 0.4)',
                                'rgba(255, 206, 86, 0.4)',
                                'rgba(75, 192, 192, 0.4)',
                                'rgba(153, 102, 255, 0.4)',
                                'rgba(255, 159, 64, 0.4)'
                            ]
                        }
                    ]
                },
                options: {
                    tooltips: {
                        callbacks: {
                            title: function (tooltipItem, data) {
                                return data['labels'][tooltipItem[0]['index']];
                            },
                            label: function (tooltipItem, data) {
                                return data['datasets'][0]['data'][tooltipItem['index']] + ' 회';
                            }
                        }
                    }
                }
            });

        </script>
    </div>
</div>
</body>
</html>