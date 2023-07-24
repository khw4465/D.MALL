<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신상품 목록</title>
    <style>
        .all {
            display: inline-block;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .itemList {
            display: flex;
            flex-wrap: wrap;
            /* justify-content: space-around; */
            /* 주석걸면 상품 붙여버림 */
        }

        .ext-li {
            list-style-type: none;
            margin: 20px 0px 0px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
            /* 200 건들면 상품 4개 못함 */
        }

        .img {
            height: 200px;
            width: 100%;
            overflow: hidden;
        }

        .img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .desc-bottom {
            padding: 15px;
        }

        .brand-name,
        .score,
        .price {
            font-weight: bold;
        }

        /* 버튼 왼쪽오른쪽 */
        .itemList {
            position: relative;
            /* 기타 속성들 */
        }

        .arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: #fff;
            padding: 10px;
            cursor: pointer;
        }

        .arrow-left {
            left: 10px;
        }

        .arrow-right {
            right: 10px;
        }

        .shiftBtnAll {
            display: flex;
            justify-content: space-between;
            width: 200px;
            /* or whatever width you want */
            margin: 0 auto;
            /* center the button group */
        }

        .shiftBtn {
            background-color: #4CAF50;
            /* Green */
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 12px;
            padding: 10px 24px;
            transition-duration: 0.4s;
            /* transition effect */
        }


        .shiftBtn:hover {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
            /* Green */
        }
    </style>
</head>
<body>
<div class="all">
    <div class="inner-flex article-title-area">
        <h3 class="main-article-tit">금주의 BEST 신상품✨</h3>
    </div>
    <div class="itemList">
        <li class="ext-li colum">
            <div class="prd-item type-sm">
                <div class="img w200">
                    <a href="/product/view?productCd=10781">
                        <img class="lozad"
                             data-src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             alt="잇메이트 슬라이스 소스 닭가슴살 혼합 150g"
                             src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             data-loaded="true">
                    </a>
                </div>
                <!-- 이미지 태그  -->
                <div class="desc-bottom">
                    <div class="brand-name"><a href="/display/brand/view?brandCd=1046">잇메이트</a></div>
                    <!-- 잇메이트 링크 -->
                    <div class="top">
                        <em class="imgbadge-dlv-exp">
                            <span class="blind">특급배송</span>
                        </em>
                        <div class="rating-simply">
                            <span class="score">4.9</span>
                            <span class="total-num">(999+)</span>
                        </div>
                    </div>
                    <!-- 특급배송과 별점,후기 -->
                    <p class="tit"><a href="/product/view?productCd=10781" class="text-elps2">잇메이트 슬라이스 소스 닭가슴살 혼합
                        150g</a>
                    </p>
                    <span class="price"><em class="num">25,900</em>원</span>
                    <p class="text-guide-sm">1팩당 : 2,290원~2,590원</p>
                    <!-- 가격과 한팩당가격 -->
                </div><!--// desc-bottom -->
            </div>
        </li>
        <!-- 한개 -->
        <li class="ext-li colum">
            <div class="prd-item type-sm">
                <div class="img w200">
                    <a href="/product/view?productCd=10781">
                        <img class="lozad"
                             data-src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             alt="잇메이트 슬라이스 소스 닭가슴살 혼합 150g"
                             src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             data-loaded="true">
                    </a>
                </div>
                <!-- 이미지 태그  -->
                <div class="desc-bottom">
                    <div class="brand-name"><a href="/display/brand/view?brandCd=1046">잇메이트</a></div>
                    <!-- 잇메이트 링크 -->
                    <div class="top">
                        <em class="imgbadge-dlv-exp">
                            <span class="blind">특급배송</span>
                        </em>
                        <div class="rating-simply">
                            <span class="score">4.9</span>
                            <span class="total-num">(999+)</span>
                        </div>
                    </div>
                    <!-- 특급배송과 별점,후기 -->
                    <p class="tit"><a href="/product/view?productCd=10781" class="text-elps2">잇메이트 슬라이스 소스 닭가슴살 혼합
                        150g</a>
                    </p>
                    <span class="price"><em class="num">25,900</em>원</span>
                    <p class="text-guide-sm">1팩당 : 2,290원~2,590원</p>
                    <!-- 가격과 한팩당가격 -->
                </div><!--// desc-bottom -->
            </div>
        </li>
        <!-- 한개 -->
        <li class="ext-li colum">
            <div class="prd-item type-sm">
                <div class="img w200">
                    <a href="/product/view?productCd=10781">
                        <img class="lozad"
                             data-src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             alt="잇메이트 슬라이스 소스 닭가슴살 혼합 150g"
                             src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             data-loaded="true">
                    </a>
                </div>
                <!-- 이미지 태그  -->
                <div class="desc-bottom">
                    <div class="brand-name"><a href="/display/brand/view?brandCd=1046">잇메이트</a></div>
                    <!-- 잇메이트 링크 -->
                    <div class="top">
                        <em class="imgbadge-dlv-exp">
                            <span class="blind">특급배송</span>
                        </em>
                        <div class="rating-simply">
                            <span class="score">4.9</span>
                            <span class="total-num">(999+)</span>
                        </div>
                    </div>
                    <!-- 특급배송과 별점,후기 -->
                    <p class="tit"><a href="/product/view?productCd=10781" class="text-elps2">잇메이트 슬라이스 소스 닭가슴살 혼합
                        150g</a>
                    </p>
                    <span class="price"><em class="num">25,900</em>원</span>
                    <p class="text-guide-sm">1팩당 : 2,290원~2,590원</p>
                    <!-- 가격과 한팩당가격 -->
                </div><!--// desc-bottom -->
            </div>
        </li>
        <!-- 한개 -->
        <li class="ext-li colum">
            <div class="prd-item type-sm">
                <div class="img w200">
                    <a href="/product/view?productCd=10781">
                        <img class="lozad"
                             data-src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             alt="잇메이트 슬라이스 소스 닭가슴살 혼합 150g"
                             src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             data-loaded="true">
                    </a>
                </div>
                <!-- 이미지 태그  -->
                <div class="desc-bottom">
                    <div class="brand-name"><a href="/display/brand/view?brandCd=1046">잇메이트</a></div>
                    <!-- 잇메이트 링크 -->
                    <div class="top">
                        <em class="imgbadge-dlv-exp">
                            <span class="blind">특급배송</span>
                        </em>
                        <div class="rating-simply">
                            <span class="score">4.9</span>
                            <span class="total-num">(999+)</span>
                        </div>
                    </div>
                    <!-- 특급배송과 별점,후기 -->
                    <p class="tit"><a href="/product/view?productCd=10781" class="text-elps2">잇메이트 슬라이스 소스 닭가슴살 혼합
                        150g</a>
                    </p>

                    <span class="price"><em class="num">25,900</em>원</span>
                    <p class="text-guide-sm">1팩당 : 2,290원~2,590원</p>
                    <!-- 가격과 한팩당가격 -->
                </div><!--// desc-bottom -->
            </div>
        </li>
        <!-- 한개 -->
        <!-- 한개 -->
        <li class="ext-li colum">
            <div class="prd-item type-sm">
                <div class="img w200">
                    <a href="/product/view?productCd=10781">
                        <img class="lozad"
                             data-src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             alt="잇메이트 슬라이스 소스 닭가슴살 혼합 150g"
                             src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230524/IMG1684yxt912086633_330_330.jpg"
                             data-loaded="true">
                    </a>
                </div>
                <!-- 이미지 태그  -->
                <div class="desc-bottom">
                    <div class="brand-name"><a href="/display/brand/view?brandCd=1046">잇메이트</a></div>
                    <!-- 잇메이트 링크 -->
                    <div class="top">
                        <em class="imgbadge-dlv-exp">
                            <span class="blind">특급배송</span>
                        </em>
                        <div class="rating-simply">
                            <span class="score">4.9</span>
                            <span class="total-num">(999+)</span>
                        </div>
                    </div>
                    <!-- 특급배송과 별점,후기 -->
                    <p class="tit"><a href="/product/view?productCd=10781" class="text-elps2">잇메이트 슬라이스 소스 닭가슴살 혼합
                        150g</a>
                    </p>

                    <span class="price"><em class="num">25,900</em>원</span>
                    <p class="text-guide-sm">1팩당 : 2,290원~2,590원</p>
                    <!-- 가격과 한팩당가격 -->
                </div><!--// desc-bottom -->
            </div>
        </li>
        <!-- 한개 -->
    </div>

    <div class="shiftBtnAll">
        <button id="prevBtn" class="shiftBtn">이전</button>
        <button id="nextBtn" class="shiftBtn">다음</button>
    </div>
</div><!-- all -->
<script>
    // 상품 목록 배열
    var productList = Array.from(document.querySelectorAll('.ext-li'));
    // 현재 보여주는 첫 번째 상품의 인덱스
    var currentIndex = 0;
    // 한 번에 보여줄 상품의 개수
    var itemsToShow = 4;
    function showProducts() {
        // 모든 상품 숨기기
        productList.forEach(function (item) {
            item.style.display = 'none';
        });
        // 필요한 상품만 보여주기
        for (var i = currentIndex; i < currentIndex + itemsToShow; i++) {
            if (productList[i]) {
                productList[i].style.display = 'flex';
            }
        }
    }
    // 초기에는 처음 4개의 상품만 보여줌
    showProducts();
    document.getElementById('prevBtn').addEventListener('click', function () {
        if (currentIndex > 0) {
            currentIndex -= itemsToShow;
            showProducts();
        }
    });
    document.getElementById('nextBtn').addEventListener('click', function () {
        if (currentIndex + itemsToShow < productList.length) {
            currentIndex += itemsToShow;
            showProducts();
        }
    });
</script>
</body>
</html>