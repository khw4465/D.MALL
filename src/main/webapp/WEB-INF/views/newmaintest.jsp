<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<head>
    <title>메인</title>
    <link rel="stylesheet" href="<c:url value='/css/newmaintest.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/dfc70c918b.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="slideshow-container">

    <div class="mySlides fade">
        <div class="numbertext"></div>
        <img src="/img/dgaja1.jpg" style="width:100%">
        <div class="text"></div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext"></div>
        <img src="/img/dgaja2.jpg" style="width:100%">
        <div class="text"></div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext"></div>
        <img src="/img/dgaja3.jpg" style="width:100%">
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
    <h1>추천 상품</h1><br>
    <div class="fourPictures">

        <c:forEach var="ProdAll" items="${prodDtoAll}">
            <div class="responsive ">
                <div class="gallery">
                    <a target="_blank" href="<c:url value='/prod/detail/${ProdAll.prodCd}'/>">
                        <img src='${ProdAll.prodImg}.png' alt="Cinque Terre" width="600" height="400">
                    </a>
                </div>
            </div>
        </c:forEach>

        <div class="clearfix"></div>
    </div>
    <%--    추천상품 끝 --%>

    <h1 id="cate">카테고리별 상품</h1><br>

    <div class="category">
        <button class="tag-button" id="animal-button">닭가슴살</button>
        <button class="tag-button" id="nature-button">샐러드</button>
        <button class="tag-button" id="food-button">도시락,볶음밥</button>
        <button class="tag-button" id="pro-button">음료.프로틴</button>
    </div>
    <div class="totaldiv">
        <div id="animal-images" class="image-container" style="display: none;">
            <c:forEach var="prodOne" items="${cateOne}">
                <div class="lineOne">
                    <a href="<c:url value='/prod/detail/${prodOne.prodCd}'/>">
                        <img src="${prodOne.prodImg}.png" alt="Animal Image" width="250" height="250">
                        <div>
                            <div class="top">
                                <fmt:formatDate var="newProd" value="${prodOne.mftDate}" pattern="yyyy-MM-dd"/>
                                <c:if test="${newProd == today}">
                                    <em class="imgbadge-new">
                                        <span class="blind">NEW</span>
                                    </em>
                                </c:if>
                                <div class="rating-simply">
                                    <span class="score"><c:out value="${prodOne.ascr}"/></span>
                                </div>
                            </div>
                            <div class="images-name">${prodOne.prodName}</div>
                            <div class="images-price"><fmt:formatNumber value="${prodOne.prodPrice}" type="number" pattern="#,###"/>원</div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <div id="nature-images" class="image-container" style="display: none;">
            <c:forEach var="prodTwo" items="${cateTwo}">
                <div class="lineOne">
                    <a href="<c:url value='/prod/detail/${prodTwo.prodCd}'/>">
                        <img src="${prodTwo.prodImg}.png" alt="nature Image" width="250" height="250">
                        <div>
                            <div class="top">
                                <fmt:formatDate var="newProd" value="${prodTwo.mftDate}" pattern="yyyy-MM-dd"/>
                                <c:if test="${newProd == today}">
                                    <em class="imgbadge-new">
                                        <span class="blind">NEW</span>
                                    </em>
                                </c:if>
                                <div class="rating-simply">
                                    <span class="score"><c:out value="${prodTwo.ascr}"/></span>
                                </div>
                            </div>
                            <div class="images-name">${prodTwo.prodName}</div>
                            <div class="images-price"><fmt:formatNumber value="${prodTwo.prodPrice}" type="number" pattern="#,###"/>원</div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <div id="food-images" class="image-container" style="display: none;">
            <c:forEach var="prodThree" items="${cateThree}">
                <div class="lineOne">
                    <a href="<c:url value='/prod/detail/${prodThree.prodCd}'/>">
                        <img src="${prodThree.prodImg}.png" alt="food Image" width="250" height="250">
                        <div>
                            <div class="top">
                                <fmt:formatDate var="newProd" value="${prodThree.mftDate}" pattern="yyyy-MM-dd"/>
                                <c:if test="${newProd == today}">
                                    <em class="imgbadge-new">
                                        <span class="blind">NEW</span>
                                    </em>
                                </c:if>
                                <div class="rating-simply">
                                    <span class="score"><c:out value="${prodThree.ascr}"/></span>
                                </div>
                            </div>
                            <div class="images-name">${prodThree.prodName}</div>
                            <div class="images-price"><fmt:formatNumber value="${prodThree.prodPrice}" type="number" pattern="#,###"/>원</div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <div id="pro-images" class="image-container" style="display: none;">
            <c:forEach var="prodFour" items="${cateFour}">
                <div class="lineOne">
                    <a href="<c:url value='/prod/detail/${prodFour.prodCd}'/>">
                        <img src="${prodFour.prodImg}.png" alt="pro Image" width="250" height="250">
                        <div>
                            <div class="top">
                                <fmt:formatDate var="newProd" value="${prodFour.mftDate}" pattern="yyyy-MM-dd"/>
                                <c:if test="${newProd == today}">
                                    <em class="imgbadge-new">
                                        <span class="blind">NEW</span>
                                    </em>
                                </c:if>
                                <div class="rating-simply">
                                    <span class="score"><c:out value="${prodFour.ascr}"/></span>
                                </div>
                            </div>
                            <div class="images-name">${prodFour.prodName}</div>
                            <div class="images-price"><fmt:formatNumber value="${prodFour.prodPrice}" type="number" pattern="#,###"/>원</div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="<c:url value='/js/newmaintest.js'/>"></script>
</body>
<%--자스 파일 분리함--%>

</html>
