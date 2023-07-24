<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인기상품</title>
    <style>
        .main-tab-tab {
            list-style-type: none;
            /* 리스트 표시 제거 */
            margin: 0;
            padding: 0;
            overflow: hidden;
            /* 리스트 아이템이 넘칠 경우 감춤 */
            display: flex;
            /* 리스트 아이템들을 가로로 배열 */
            justify-content: space-around;
            /* 아이템들 사이에 균등한 간격 배치 */
        }

        /* li의 스타일 설정 */
        .main-tab-tab .article-tab {
            border: 1px solid #ccc;
            /* 테두리 설정 */
            border-radius: 15px;
            /* 동그란 모양으로 만들기 위해 높이의 1/2 값인 15px로 설정 */
            width: 120px;
            /* 버튼의 너비 설정 */
            height: 30px;
            /* 버튼의 높이 설정 */
            text-align: center;
            /* 텍스트를 중앙 정렬 */
            line-height: 30px;
            /* 텍스트를 수직 중앙 정렬 */
            margin: 5px;
            /* 아이템들 사이에 간격 주기 */
            background-color: #f2f2f2;
            /* 배경색 설정 */
            transition: background-color 0.3s ease;
            /* 배경색 변화에 애니메이션 효과 적용 */
        }

        /* 마우스를 올렸을 때의 스타일 */
        .main-tab-tab .article-tab:hover {
            background-color: #ddd;
            /* 배경색 변경 */
        }

        /* a태그의 스타일 설정 */
        .main-tab-tab .article-tab a {
            display: block;
            /* a 태그를 블록 요소로 만들어 크기 조절 가능하게 함 */
            width: 100%;
            /* a 태그의 너비를 100%로 설정 */
            height: 100%;
            /* a 태그의 높이를 100%로 설정 */
            color: black;
            /* 글자색 설정 */
            text-decoration: none;
            /* 밑줄 제거 */
        }

        .itemList {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .ext2-li {
            list-style-type: none;
            margin: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 250px;
            /* 여기 수정하면 상품개수조절 */
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

        .all{
            display: inline-block;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="all">
    <div class="inner-flex article-title-area">
        <h3 class="main-article-tit">인기 카테고리 상품✨</h3>
    </div>
    <div>
        <ul class="main-tab-tab">
            <li class="article-tab" data-type="R019"><a href="">닭가슴살</a></li>
            <li class="article-tab" data-type="R021"><a href="">도시락·볶음밥</a></li>
            <li class="article-tab" data-type="R023"><a href="">샐러드·과일</a></li>
            <li class="article-tab" data-type="R024"><a href="">음료·차·프로틴</a></li>
            <li class="article-tab" data-type="R031"><a href="">식단·패키지</a></li>
        </ul>
    </div>

    <div class="itemList">
        <li class="ext2-li colum">
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
        <li class="ext2-li colum">
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
        <li class="ext2-li colum">
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
        <li class="ext2-li colum">
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
        <li class="ext2-li colum">
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
        <li class="ext2-li colum">
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
        <li class="ext2-li colum">
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
        <li class="ext2-li colum">
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
</div>
<script>
    // 모든 'li' 태그를 선택합니다.
    var listItems = Array.from(document.querySelectorAll('li.ext2-li.colum'));
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
