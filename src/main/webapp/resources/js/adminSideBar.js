window.onload = function () {
    var menuItems = document.getElementsByClassName("hasChild");
    for (var i = 0; i < menuItems.length; i++) {
        // menuItem 변수를 각 반복에 대한 클로저(closure)로 이동시키기
        (function () {
            var menuItem = menuItems[i].getElementsByTagName("a")[0];
            var submenu = menuItem.nextElementSibling;
            menuItem.addEventListener("click", function (event) {
                event.preventDefault();
                event.stopPropagation();
                if (submenu.style.display === "none") {
                    submenu.style.display = "block";
                } else {
                    submenu.style.display = "none";
                }
            });
        })();  // 클로저를 즉시 실행
    }
}

fetch('adminheader.html')
    .then(response => response.text())
    .then(html => document.getElementById('sideMultiShop').innerHTML = html);