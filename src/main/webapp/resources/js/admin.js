window.onload = function () {
    var menuItems = document.getElementsByClassName("hasChild");
    for (var i = 0; i < menuItems.length; i++) {
        (function () {
            var menuItem = menuItems[i].getElementsByTagName("a")[0];
            var submenu = menuItem.nextElementSibling;
            menuItem.addEventListener("click", function (event) {
                event.preventDefault();
                event.stopPropagation();
                if (submenu.style.display === "" || submenu.style.display === "none") {
                    submenu.style.display = "block";
                } else {
                    submenu.style.display = "none";
                }
            });
        })();  // 클로저를 즉시 실행
    }
}

// fetch('adminheader.html')
//     .then(response => response.text())
//     .then(html => document.getElementById('sideMultiShop').innerHTML = html);
//
// // 구글차트
// google.charts.load('current', {'packages':['line']});
// google.charts.setOnLoadCallback(drawChart);
//
// function drawChart() {
//     var data = new google.visualization.DataTable();
//     data.addColumn('date', 'Day');
//     data.addColumn('number', 'Sales');
//
//     data.addRows([
//         [new Date(2023, 8, 1),  1000],
//         [new Date(2023, 8, 2),  1170],
//         [new Date(2023, 8, 3),  660],
//         [new Date(2023, 8, 4),  1030]
//     ]);
//
//     var options = {
//         chart: {
//             title: 'Sales Performance',
//             subtitle: 'Sales amount in dollars'
//         },
//         width: 450,
//         height: 300,
//         colors: ['#FF6001'],
//         legend: { position: 'bottom' },
//         hAxis: {
//             gridlines: {
//                 color: '#f3f3f3',
//                 count: 5
//             },
//             minorGridlines: {
//                 color: '#f3f3f3',
//                 count: 2
//             },
//             textStyle : {
//                 fontSize: 12
//             }
//         },
//         vAxis: {
//             gridlines: {
//                 color: 'none',
//             },
//             minorGridlines: {
//                 color: 'none',
//             },
//             textStyle : {
//                 fontSize: 12
//             }
//         },
//         backgroundColor: '#FAFAFA'
//     };
//
//     var chart = new google.charts.Line(document.getElementById('linechart_material'));
//
//     chart.draw(data, google.charts.Line.convertOptions(options));
// }