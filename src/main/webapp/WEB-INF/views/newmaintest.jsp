<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>메인</title>
    <link rel="stylesheet" href="<c:url value='/css/newmaintest.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="slideshow-container">

    <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="https://www.w3schools.com/howto/img_nature_wide.jpg" style="width:100%">
        <div class="text">Caption Text</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="https://www.w3schools.com/howto/img_snow_wide.jpg" style="width:100%">
        <div class="text">Caption Two</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="https://www.w3schools.com/howto/img_lights_wide.jpg" style="width:100%">
        <div class="text">Caption Three</div>
    </div>

</div>
<%-- 슬라이드쇼 끝 --%>
<br>

<div class="dotbtn">
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <br>
    <br>
    <div class="fourPictures">
        <div class="responsive">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="https://www.w3schools.com/css/img_5terre.jpg" alt="Cinque Terre" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>


        <div class="responsive">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="https://www.w3schools.com/css/img_forest.jpg" alt="Forest" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>

        <div class="responsive">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="https://www.w3schools.com/css/img_lights.jpg" alt="Northern Lights" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>

        <div class="responsive">
            <div class="gallery">
                <a target="_blank" href="img_mountains.jpg">
                    <img src="https://www.w3schools.com/css/img_mountains.jpg" alt="Mountains" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="category">
        <h3 id="animal">닭가슴살</h3>
        <h3 id="nature">도시락.볶음밥</h3>
        <h3 id="food">샐러드.과일</h3>
        <h3 id="pro">음료.프로틴</h3>
        <h3 id="pack">식단.패키지</h3>
    </div>

    <div id="animal-images" class="image-container" style="display: none;">
        <img src="https://www.w3schools.com/css/img_mountains.jpg" alt="Animal Image">
    </div>
    <div id="nature-images" class="image-container" style="display: none;">
        <img src="https://www.w3schools.com/css/img_mountains.jpg" alt="nature Image">
    </div>
    <div id="food-images" class="image-container" style="display: none;">
        <img src="https://www.w3schools.com/css/img_forest.jpg" alt="food Image">
    </div>
    <div id="pro-images" class="image-container" style="display: none;">
        <img src="https://www.w3schools.com/css/img_mountains.jpg" alt="pro Image">
    </div>
    <div id="pack-images" class="image-container" style="display: none;">
        <img src="https://www.w3schools.com/css/img_forest.jpg" alt="pack Image">
    </div>

</div>
<jsp:include page="footer.jsp"/>

</body>
<script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        setTimeout(showSlides, 4000); // Change image every 2 seconds
    }

    var headers = {
        animal: document.getElementById('animal'),
        nature: document.getElementById('nature'),
        food: document.getElementById('food'),
        pro: document.getElementById('pro'),
        pack: document.getElementById('pack')
    };

    var images = {
        animal: document.getElementById('animal-images'),
        nature: document.getElementById('nature-images'),
        food: document.getElementById('food-images'),
        pro: document.getElementById('pro-images'),
        pack: document.getElementById('pack-images')
    };

    for (var key in headers) {
        (function (key) {
            headers[key].addEventListener('click', function () {
                // 모든 이미지 컨테이너를 먼저 숨깁니다.
                for (var imgKey in images) {
                    images[imgKey].style.display = 'none';
                }
                // 클릭한 요소에 해당하는 이미지 컨테이너만 보여줍니다.
                var imageContainer = document.getElementById(key + '-images');
                imageContainer.style.display = 'grid';
            });
        })(key);
    }
</script>
</html>
