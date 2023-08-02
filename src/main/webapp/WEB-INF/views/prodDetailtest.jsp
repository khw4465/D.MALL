<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
    <title>상품상세</title>
    <link rel="stylesheet" href="<c:url value='/css/prodDetailtest.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<div id="wrap">
    <div id="container">
        <div id="contents">
            <script type="text/javascript" src="/import/js/clipboard.js"></script>
            <div class="xans-element- xans-product xans-product-headcategory location_cont "></div>
            <div class="xans-element- xans-product xans-product-detail">
                <div class="detailArea">
                    <div class="xans-element- xans-product xans-product-image imgArea">
                        <div class="keyImg ">
                            <div class="thumbnail">
                                <a
                                        href="/product/image_zoom2.html?product_no=485&amp;cate_no=1&amp;display_group=2">
                                    <img src="//moguchonmall.com/web/product/big/202209/b1cc591e3c534f5ab8b7240e9ede42e0.jpg"
                                         alt="목우촌 주부9단 살코기햄 1kg x 2개" class="BigImage"> </a>
                            </div>
                        </div>
                    </div>

                    <div class="infoArea">
                        <div class="headingArea">
                            <h2>목우촌 주부9단 살코기햄 1kg x 2개</h2>
                            <div class="infoPrice">
                                <div class="productPrice ">
                                    <div class="price">
                                        <strong class="sale"><span id="span_product_price_text"
                                                                   class="ProductPrice ">19,900원</span><input id="product_price"
                                                                                                              name="product_price" value="19900" type="hidden"></strong><span
                                            id="span_product_price_text"></span> <span class="soldOut"></span>
                                    </div>
                                </div>
                                <div class="productCustom ">
                                    <div><strong class="sale"><span id="span_product_price_text"
                                                                    class="">25,960원</span></strong></div>
                                </div>
                                <div class="sale displaynone">
                                    <div class="price"><strong class="sale"><span id="span_product_price_text"
                                                                                  class="ProductPrice">19,900원 <span
                                            style="font-size:12px;color:#555555;"></span></span></strong></div>
                                </div>
                                <div class="discount_rate" data-custom="25,960원" data-price="19900" data-sale="">
                                    <span>23%할인</span>
                                </div>
                            </div>
                        </div>

                        <div class="xans-element- xans-product xans-product-detaildesign">
                            <table border="1" summary="">
                                <tbody>
                                <tr tit="상품명" class=" xans-record-">
                                    <th scope="row"><span style="font-size:16px;color:#555555;">상품명</span></th>
                                    <td><span style="font-size:16px;color:#555555;">목우촌 주부9단 살코기햄 1kg x
                                                    2개</span></td>
                                </tr>
                                <tr tit="소비자가" class=" xans-record-">
                                    <th scope="row"><span style="font-size:12px;color:#555555;">소비자가</span></th>
                                    <td><span style="font-size:12px;color:#555555;"><span
                                            id="span_product_price_custom"><strike>25,960원</strike></span></span>
                                    </td>
                                </tr>
                                <tr tit="판매가" class=" xans-record-">
                                    <th scope="row"><span
                                            style="font-size:12px;color:#008BCC;font-weight:bold;">판매가</span>
                                    </th>
                                    <td><span style="font-size:12px;color:#008BCC;font-weight:bold;"><strong
                                            id="span_product_price_text">19,900원 </strong><input
                                            id="product_price" name="product_price" value=""
                                            type="hidden"></span></td>
                                </tr>
                                <tr tit="배송비" class=" xans-record-">
                                    <th scope="row"><span>배송비</span></th>
                                    <td><span><span class=""><input id="" name="" value=""
                                                                    type="hidden">무료</span></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <table border="1" summary=""
                               class="xans-element- xans-product xans-product-option xans-record-">
                            <caption>&gt;상품 옵션</caption>
                            <tbody></tbody>
                            <tbody>
                            <tr class="displaynone" id="">
                                <td colspan="2" class="selectButton"><a href="#none" class="btnSubmit sizeS"
                                                                        onclick="">옵션선택</a></td>
                            </tr>
                            </tbody>
                        </table>
                        <dl
                                class="xans-element- xans-product xans-product-quantity ec-base-desc quantity xans-record-">
                            <dt>수량</dt>
                            <dd>
                                <div class="ec-base-qty">
                                    <input id="quantity" name="quantity[]" type="number"
                                           class="single-quantity-input" product-no="485" value="1" min="1">
                                    <button id="increaseQuantity" type="button"><i class="fas fa-arrow-up"></i></button>
                                    <button id="decreaseQuantity" type="button"><i class="fas fa-arrow-down"></i></button>
                                </div>
                            </dd>
                        </dl>

                        <div id="totalPrice" class="totalPrice">
                            <strong>총 합계금액</strong><span class="total"><strong><em>19,900원</em></strong> (1개)</span>
                        </div>

                        <div class="xans-element- xans-product xans-product-action">
                            <div class="button  ">
                                <a href="#none" class="btnCart">장바구니</a>
                                <a href="#none" class="btnBuy">
                                    <span id="btnBuy">바로 구매</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="xans-element- xans-product xans-product-additional">
                <div id="prdDetail" class="tab ">
                    <ul class="addTab clearfix">
                        <li class="selected"><a href="#prdDetail">상품상세정보</a></li>
                        <li><a href="#prdInfo">배송안내</a></li>
                        <li><a href="#prdInfoTwo">교환 및 반품 안내</a></li>
                    </ul>
                    <div class="imgAll">
                        <div class="slider">
                            <c:forEach var="img" items="${imgList}">
                                <div>
                                    <img class="prodImg${img.imgCd}" src="/img/${img.prodCd}_${img.imgCd}.${img.imgExtns}" alt="">
                                </div>
                            </c:forEach>
                        </div>
                        <button class="toggle">상품설명 펼쳐보기 v</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById('increaseQuantity').addEventListener('click', function () {
        var input = document.getElementById('quantity');
        input.value = parseInt(input.value) + 1;
    });

    document.getElementById('decreaseQuantity').addEventListener('click', function () {
        var input = document.getElementById('quantity');
        var currentValue = parseInt(input.value);
        if (currentValue > 1) { // 최소값 1을 유지
            input.value = currentValue - 1;
        }
    });
</script>
</body>
</html>
