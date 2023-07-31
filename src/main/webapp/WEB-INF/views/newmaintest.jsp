<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>메인</title>
    <link rel="stylesheet" href="<c:url value='/css/newmaintest.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="slideshow-container">

    <div class="mySlides fade">
        <div class="numbertext"></div>
        <img src="https://www.w3schools.com/howto/img_nature_wide.jpg" style="width:100%">
        <div class="text"></div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext"></div>
        <img src="https://www.w3schools.com/howto/img_snow_wide.jpg" style="width:100%">
        <div class="text"></div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext"></div>
        <img src="https://www.w3schools.com/howto/img_lights_wide.jpg" style="width:100%">
        <div class="text"></div>
    </div>

</div>
<%-- 슬라이드쇼 끝 --%>
<br>

<div class="dotbtn">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
    <br>
    <br>
    <h1>추천 식단</h1><br>
    <div class="fourPictures">

        <%--        <div class="mySlides fade">--%>
        <%--            <div class="numbertext"></div>--%>
        <%--            <img src="https://www.w3schools.com/howto/img_nature_wide.jpg" style="width:100%">--%>
        <%--            <div class="text"></div>--%>
        <%--        </div>--%>

        <div class="responsive 1">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="img/P010203.png" alt="Cinque Terre" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>


        <div class="responsive 2">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="img/P020203.png" alt="Forest" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>

        <div class="responsive 3">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="img/P030301.png" alt="Northern Lights" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>

        <div class="responsive 4">
            <div class="gallery">
                <a target="_blank" href="img_mountains.jpg">
                    <img src="img/P030402.png" alt="Mountains" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>
        <%--        1세트--%>
        <br>
        <div class="responsive 5">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="img/P040302.png" alt="Cinque Terre" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>


        <div class="responsive 6">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="img/P040303.png" alt="Forest" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>

        <div class="responsive 7">
            <div class="gallery">
                <a target="_blank" href="">
                    <img src="img/P040401.png" alt="Northern Lights" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>

        <div class="responsive 8">
            <div class="gallery">
                <a target="_blank" href="img_mountains.jpg">
                    <img src="img/P040402.png" alt="Mountains" width="600" height="400">
                </a>
                <%--    <div class="desc">Add a description of the image here</div>--%>
            </div>
        </div>
        <%--        2세트 --%>

        <div class="clearfix"></div>
    </div>

    <h1> 추천 패키지</h1><br>

    <div class="category">
        <h3 id="animal">닭가슴살</h3>
        <h3 id="nature">도시락.볶음밥</h3>
        <h3 id="food">샐러드.과일</h3>
        <h3 id="pro">음료.프로틴</h3>
        <h3 id="pack">식단.패키지</h3>
    </div>

    <div id="animal-images" class="image-container" style="display: none;">
        <img src="img/P010203.png" alt="Animal Image" width="250" height="250">
        <img src="img/P010203.png" alt="Animal Image" width="250" height="250">
        <img src="img/P010203.png" alt="Animal Image" width="250" height="250">
        <img src="img/P010203.png" alt="Animal Image" width="250" height="250">
    </div>
    <div id="nature-images" class="image-container" style="display: none;">
        <img src="img/P010302.png" alt="nature Image" width="250" height="250">
        <img src="img/P010302.png" alt="nature Image" width="250" height="250">
        <img src="img/P010302.png" alt="nature Image" width="250" height="250">
        <img src="img/P010302.png" alt="nature Image" width="250" height="250">
    </div>
    <div id="food-images" class="image-container" style="display: none;">
        <img src="img/P010501.png" alt="food Image" width="250" height="250">
        <img src="img/P010501.png" alt="food Image" width="250" height="250">
        <img src="img/P010501.png" alt="food Image" width="250" height="250">
        <img src="img/P010501.png" alt="food Image" width="250" height="250">
    </div>
    <div id="pro-images" class="image-container" style="display: none;">
        <img src="img/P040102.png" alt="pro Image" width="250" height="250">
        <img src="img/P040102.png" alt="pro Image" width="250" height="250">
        <img src="img/P040102.png" alt="pro Image" width="250" height="250">
        <img src="img/P040102.png" alt="pro Image" width="250" height="250">
    </div>
    <div id="pack-images" class="image-container" style="display: none;">
        <img src="img/P040103.png" alt="pack Image" width="250" height="250">
        <img src="img/P040103.png" alt="pack Image" width="250" height="250">
        <img src="img/P040103.png" alt="pack Image" width="250" height="250">
        <img src="img/P040103.png" alt="pack Image" width="250" height="250">
    </div>

</div>
<jsp:include page="footer.jsp"/>

</body>
<script>
    let slideIndex = 0;
    let slideIndexItem = 0;
    showSlides();
    showItemList();

    // 4개씩 나오는 슬라이드
    function showItemList() {
        let j;
        let slidesAll = document.getElementsByClassName("responsive");
        for (j = 0; j < slidesAll.length; j++) {
            slidesAll[j].style.display = "none";
        }
        // slideIndexItem++;
        // if (slideIndexItem > slidesAll.length) {
        //     slideIndexItem = 1
        // }
        //
        // slidesAll[slideIndexItem - 1].style.display = "block";
        // setTimeout(showItemList, 2000);
        // Show 4 slides at a time
        for (let i = 0; i < 4; i++) {
            // If slideIndexItem is beyond the last index, reset it to 0
            if (slideIndexItem >= slidesAll.length) {
                slideIndexItem = 0;
            }

            // Display the slide
            slidesAll[slideIndexItem].style.display = "block";
            slideIndexItem++;
        }

        setTimeout(showItemList, 2000);
    }
    // 메인 슬라이드
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

    // dot 누르면 작동하는 코드
    function currentSlide(n) {
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        let slideIndex;

        if (n > slides.length) {
            slideIndex = 1
        } else if (n < 1) {
            slideIndex = slides.length
        } else {
            slideIndex = n;
        }

        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (let i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }

        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
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

    // 처음 로드 될 때 모든 이미지를 숨깁니다.
    for (var imgKey in images) {
        images[imgKey].style.display = 'none';
    }
    // 처음 로드 될 때 'animal'에 해당하는 이미지만 보여줍니다.
    images['animal'].style.display = 'grid';

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
