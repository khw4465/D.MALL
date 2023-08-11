<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<c:set var="ord" value="${ord}"/>
<c:set var="prodCnt" value="${cartList.size()}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/cart.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="https://kit.fontawesome.com/dfc70c918b.js" crossorigin="anonymous"></script>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="cart-section-block">
    <div>
        <div class="body-frame">
            <div class="cartTitle">
                <h1>장바구니</h1>
                <ul style="float: right">
                    <li class="this" title="현재페이지"><strong>01</strong> 장바구니</li>
                    <li><strong> > </strong></li>
                    <li><strong>02</strong> 주문서작성/결제</li>
                    <li><strong> > </strong></li>
                    <li class="end"><strong>03</strong> 주문완료</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="xans-element- xans-order xans-order-basketpackage" style="margin-top: 30px">
        <div class="xans-element- xans-order xans-order-tabinfo ec-base-tab typeLight  ">
            <ul class="menu">
                <li class="selected "><a href="/order/basket.html">담긴상품 (${prodCnt})</a></li>
            </ul>
            <p class="right displaynone">장바구니에 담긴 상품은 7일 동안 보관됩니다.</p>
        </div>
        <div style="display: ${prodCnt == 0 ? "none" : "block"}">
            <div class="xans-element- xans-order xans-order-selectorder ec-base-button">
                <span class="gLeft"><button id="removeCheck" class="btn-option btn-default">선택삭제</button></span>
                <span class="gRight"><button id="removeAll" class="btn-option btn-default">장바구니비우기</button></span>
            </div>
            <div class="orderListArea ec-base-table typeList gBorder ecBase">
                <table border="" summary="" id="cart"
                       class="xans-element- xans-order xans-order-normindividual xans-record-">
                    <caption>개별배송</caption>
                    <colgroup>
                        <col style="width:27px">
                        <col style="width:92px">
                        <col style="width:auto">
                        <col style="width:auto">
                        <col style="width:98px">
                        <col style="width:105px">
                        <col style="width:88px">
                        <col style="width:85px">
                        <col style="width:98px">
                        <col style="width:110px">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">
                            <div class="custom-checkbox"><input type="checkbox" id="checkAll"
                                                                class="checkbox checkboxGroup"
                                                                checked=""></div>
                        </th>
                        <th scope="col">이미지</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">옵션정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품구매금액</th>
                        <th scope="col">할인금액</th>
                        <th scope="col">배송구분</th>
                        <th scope="col">배송비</th>
                        <th scope="col">선택</th>
                    </tr>
                    </thead>
                    <c:forEach var="cart" items="${cartList}">
                        <tbody id="${cart.prodCd}" class="xans-element- xans-order xans-order-list  center  cartlist">
                        <c:set var="optCount" value="${optLists.get(cartList.indexOf(cart)).size()}"/>
                        <c:forEach var="opt" items="${optLists.get(cartList.indexOf(cart))}" varStatus="i">
                            <tr id="${opt.optCd}" class="xans-record-">
                                <c:if test="${i.index == 0}">
                                    <td rowspan="${optCount}"><input type="checkbox" class="CBox${cart.prodCd}"
                                                                     name="eachcheck" checked=""></td>
                                    <td rowspan="${optCount}" class="thumb gClearLine"><a
                                            href="<c:url value="/prod/detail/${cart.prodCd}"/>"><img
                                            src="/img/${cart.prodCd}.png" style="width: 100px; height: 100px;"></a></td>
                                    <td rowspan="${optCount}" class="left gClearLine"><strong class="name"><a
                                            href="<c:url value="/prod/${cart.prodCd}"/>"
                                            class="prod${cart.prodCd}">${cart.prodName}</a></strong>
                                    </td>
                                </c:if>
                                <td><strong class="name"><a href="<c:url value="/prod/${cart.prodCd}"/>"
                                                            class="prod${opt.prodCd}_${opt.optCd}">${opt.optName}</a></strong>
                                </td>
                                <td>
                                    <div class="qtyTag" style="display: flex;">
                                        <button type="button" title="-" id="minus${opt.prodCd}_${opt.optCd}">
                                            <i class="fa-solid fa-minus"></i><input type="hidden" value=-1>
                                        </button>
                                        <input type="text" class="${opt.prodCd}_${opt.optCd}_qty" name="prod-qty"
                                               value="${opt.optQty}" style="border: none" readonly="readonly">
                                        <button type="button" title="+" id="plus${opt.prodCd}_${opt.optCd}">
                                            <i class="fa-solid fa-plus"></i><input type="hidden" value=1>
                                        </button>
                                    </div>
                                </td>
                                <td><span><strong><input class="${opt.prodCd}_${opt.optCd}_totPrice"
                                                         value="<fmt:formatNumber value="${opt.totOptPrice}" type="number" pattern="#,###"/>"
                                                         style="width: 70px; text-align: right; border: none">원</strong></span>
                                </td>
                                <td rowspan="1" class="">
                                    <span>-</span>
                                    <div id="" class="displaynone"><strong>-<span
                                            id="product_discount_price_front0">0</span>원</strong>
                                        <p class="displaynone"></p></div>
                                </td>
                                <td class="right">
                                    <div class="txtInfo">기본배송<br></div>
                                </td>
                                <td rowspan="1" class=""><p class="displaynone">0원<span
                                        class="displaynone"><br></span><br>
                                </p>-
                                </td>
                                <td class="button">
                                    <button type="button" title="x" id="delete${opt.prodCd}_${opt.optCd}"
                                            class="deleteOne"
                                            style="text-align: right">
                                        <i class="fa-solid fa-xmark"></i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr class="right">
                            <td colspan="10" style="background-color: #F0F0F0">
                                <div style="text-align: center">총 상품 금액 : <em
                                        class="totPrc${cart.prodCd}"><fmt:formatNumber
                                        value="${cart.totProdPrice}" type="number" pattern="#,###"/></em>원
                                </div>
                                <div style="text-align: center">적립 포인트 : <em
                                        class="totPnt${cart.prodCd}">${Math.round(cart.totProdPrice/100)}</em>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div id="showEmpty" style="margin: 50px; display: ${prodCnt == 0 ? "block" : "none"}">
            <h3 style="text-align: center">장바구니가 비어있습니다.</h3>
        </div>
    </div>


    <div id="Info" class="xans-element- xans-order xans-order-basketpriceinfoguide  "
         style="display: ${prodCnt == 0 ? "none" : "block"}; margin: 30px 0; ">
        <p class="info ">할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</p>
        <p class="info displaynone">주문서 작성 시 배송비를 확인할 수 있습니다.</p>
        <p class="info displaynone">추가증정 이벤트 상품의 옵션 및 수량 변경은 상품상세에서 가능합니다.</p>
        <p class="info displaynone">세금이 포함된 결제 금액은 주문서작성에서 확인 가능합니다.</p>
    </div>

    <!-- 총 주문금액 : 국내배송상품 -->
    <div id="prcData"
         class="xans-element- xans-order xans-order-totalsummary ec-base-table typeList gBorder ecBase total"
         style="display: ${prodCnt == 0 ? "none" : "block"}">
        <table border="1" summary="">
            <caption>총 주문금액</caption>
            <colgroup>
                <col style="width:17%;">
                <col style="width:17%;" class="displaynone">
                <col style="width:19%;">
                <col style="width:17%;" class="displaynone">
                <col style="width:auto;">
                <col style="width:17%;" class="total_mileage_price_area ">
            </colgroup>
            <thead>
            <tr>
                <th scope="col"><strong>총 상품금액</strong></th>
                <th scope="col" class="displaynone"><strong>총 부가세</strong></th>
                <th scope="col"><strong>총 배송비</strong></th>
                <th scope="col" id="total_benefit_price_title_area" class="displaynone">
                    <strong>총 할인금액</strong> <a href="#none" class="btnNormal">내역보기</a>
                </th>
                <th scope="col"><strong>결제예정금액</strong></th>
                <th scope="col" class="total_mileage_price_area ">
                    <strong>적립예정포인트</strong>
                </th>
            </tr>
            </thead>
            <tbody class="center">
            <tr>
                <td>
                    <div class="box txt16"><strong><span class="txt23"><span id="totPrc"
                                                                             class="total_product_price_display_front"><fmt:formatNumber
                            value="${ord.totPrc}"
                            type="number"
                            pattern="#,###"/></span></span>원</strong>
                        <span class="txt14 displaynone"><span class="total_product_price_display_back"></span></span>
                    </div>
                </td>
<%--                <td class="displaynone">--%>
<%--                    <div class="box txt16"><strong><span class="txt23"><span id="totDcPrc"--%>
<%--                                                                             class="total_product_vat_price_front">0</span></span>원</strong>--%>
<%--                        <span--%>
<%--                                class="txt14 displaynone"><span class="total_product_vat_price_back"></span></span>--%>
<%--                    </div>--%>
<%--                </td>--%>
                <td>
                    <div class="box shipping txt16">
                        <strong class="txt23">+ </strong>
                        <strong><span id="total_delv_price_front" class="txt23"><span id="dlvPrc"
                                                                                      class="total_delv_price_front"><fmt:formatNumber
                                value="${ord.dlvPrc}" type="number"
                                pattern="#,###"/></span></span>원</strong>
                        <span class="txt14 displaynone"><span class="total_delv_price_back"></span></span>
                    </div>
                </td>
                <td id="total_benefit_price_area" class="displaynone">
                    <div class="box txt16">
                        <strong class="txt23">- </strong><strong><span id="totDcPrc"
                                                                       class="txt23"><fmt:formatNumber
                            value="${ord.totDcPrc}" type="number" pattern="#,###"/></span>원</strong> <span
                            class="txt14 displaynone"><span id="total_product_discount_price_back"></span></span>
                    </div>
                </td>
                <td>
                    <div class="box txtEm txt16">
                        <strong class="txt23">= </strong><strong><span id="finPrc"
                                                                       class="txt23"><fmt:formatNumber
                            value="${ord.finPrc}" type="number" pattern="#,###"/></span>원</strong> <span
                            class="txt14 displaynone"><span id="total_order_price_back"></span></span>
                    </div>
                </td>
                <td class="total_mileage_price_area ">
                    <div class="box txt16">
                        <strong><span id="point" class="txt23"><c:out
                                value="${Math.round(ord.finPrc/100)}"/></span>P</strong>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="xans-element- xans-order xans-order-totalorder ec-base-button justify">
        <a href="/" class="btn2 sizeM ">쇼핑계속하기</a>
        <a href="#" id="orderLink" class="btn1 sizeM" onclick="checkProdCount(${prodCnt})">상품주문하기</a>
        <span class="gRight"></span>
        <!--상품상세페이지에 추가되는 앱 관련 결제버튼 div-->
        <div id="appPaymentButtonBox"></div>
    </div>

    <div class="xans-element- xans-order xans-order-basketguide ec-base-help"><h3>이용안내</h3>
        <div class="inner">
            <h4>장바구니 이용안내</h4>
            <ol>
                <li class="item1">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
                <li class="item2">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
                <li class="item3">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
                <li class="item4">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
                <li class="item5  ">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
                <li class="item6  ">해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
            </ol>
            <h4>무이자할부 이용안내</h4>
            <ol>
                <li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
                <li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
                <li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
                <li class="item4  ">무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.<br>실제 배송비는 함께 주문하는
                    상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.
                </li>
                <li class="item4 displaynone">무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시됩니다.</li>
            </ol>
        </div>
    </div>

    <form action="/order/order">
        <div class="btn-bottom-area">
            <input type="hidden" class="totPrc" name="totPrc" value="<c:out value="${ord.totPrc}" />">
            <input type="hidden" class="totDcPrc" name="totDcPrc" value="<c:out value="${ord.totDcPrc}" />">
            <input type="hidden" class="dlvPrc" name="dlvPrc" value="<c:out value="${ord.dlvPrc}" />">
            <input type="hidden" class="finPrc" name="finPrc" value="<c:out value="${ord.finPrc}" />">
        </div>
    </form>
</div>

<jsp:include page="footer.jsp"/>

<script>
    const allCBox = document.getElementById('checkAll');    // 전체 체크박스
    const eachCBox = Array.from(document.getElementsByName('eachcheck'));   // 상품별 체크박스

    // 전체 체크박스가 (true/false)면 개별 체크박스도 (true/false) && (전체해제/전체선택)

    allCBox.addEventListener("change", () => {
        const allChecked = allCBox.checked;
        eachCBox.forEach(tag => tag.checked = allChecked);
    });

    // 개별 체크박스가 다 true면 전체 체크박스도 true,  하나라도 false면 전체 체크박스도 false && (전체해제/전체선택)

    eachCBox.forEach(function (tag) {
        tag.addEventListener('change', () => {
            const allChecked = eachCBox.every(tag => tag.checked);
            allCBox.checked = allChecked;
        });
    });

    // 장바구니가 비었는지 확인하는 함수
    let isCartEmpty = function () {
        const cart = document.getElementById("cart");
        const items = cart.querySelectorAll("tbody tr");
        return items.length === 0;
    }

    // 장바구니가 비었을 때 나타내는 메시지
    function emptyCartMsg() {
        if (isCartEmpty()) {
            cart.innerHTML = "<h1 style='text-align:center'>장바구니가 비어있습니다.</h1>";
            $('#cart').hide()
            $('#Info').hide();
            $('#prcData').hide();
            $('#showEmpty').show();
        }
    }

    // 주문버튼을 누를 때 호출되는 메서드
    function checkProdCount(prodCnt) {
        if (prodCnt > 0) {
            window.location.href = '<c:url value="/order/order"/>';
        } else {
            alert('먼저 장바구니에 상품을 담아주세요.')
        }
    }

    // 수량체크할 때 사용할 스로틀 함수
    const throttle = (callback, delay) => {
        let timerId;
        return (...args) => {
            if (timerId) return;
            timerId = setTimeout(() => {
                callback(...args);
                timerId = null;
            }, delay);
        };
    };

    // AJAX
    $(document).ready(function () {

        let totPrc = parseInt($('#totPrc').text().replace(/,/g, ''));       // 모든 상품의 가격을 합한 금액
        let totDcPrc = parseInt($('#totDcPrc').text().replace(/,/g, ''));      // 각각의 할인 금액을 모두 더한 금액
        let dlvPrc = parseInt($('#dlvPrc').text().replace(/,/g, ''));         // 배송비
        let finPrc = parseInt($('#finPrc').text().replace(/,/g, ''));   // 위의 3개의 가격을 계산한 최종 금액
        let point = parseInt($('#point').text())

        // 전체 delete
        $("#removeAll").click(function () {
            if (confirm('전체 상품을 삭제하시겠습니까?')) {
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/cart/removeAll',  // 요청 URI
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    dataType: 'text', // 전송받을 데이터의 타입
                    success: function (result) {  // 서버로부터 응답이 도착하면 호출될 함수
                        $('#cart > tbody').remove()
                        emptyCartMsg();
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }
        });

        // 선택 delete
        $("#removeCheck").click(function () {
            if(confirm('선택한 상품을 장바구니에서 삭제하시겠습니까?')) {
                const selectedProdCds = [];
                let selectedProdPrc = 0;

                const checkboxes = document.querySelectorAll('[type="checkbox"][class^="CBox"]:checked')    // 체크된 체크박스 선택
                checkboxes.forEach(function (checkbox) {                                                    // 하나씩 뽑아서 상품코드 추출
                    const prodCd = checkbox.classList[0].substring(4);
                    selectedProdCds.push(prodCd);

                    const optPrices = document.querySelectorAll('.totPrc' + prodCd);
                    optPrices.forEach(function (optPriceElem) {
                        selectedProdPrc += parseInt(optPriceElem.innerHTML.replace(/,/g, ''));
                    });
                });
                totPrc -= selectedProdPrc
                dlvPrc = totPrc > 30000 ? 0 : 3000;
                finPrc = totPrc - totDcPrc + dlvPrc;
                point = Math.round(finPrc / 100);
                const jsonData = JSON.stringify({prodCds: selectedProdCds});
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/cart/removeChecks',  // 요청 URI
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    dataType: 'json', // 전송받을 데이터의 타입
                    data: jsonData,  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {  // 서버로부터 응답이 도착하면 호출될 함수
                        for (let i = 0; i < selectedProdCds.length; i++) {
                            $("#" + selectedProdCds[i]).remove();
                        }

                        $('#totPrc').html(totPrc.toLocaleString());              // 총 상품금액 업데이트
                        $('#totDcPrc').html(totDcPrc.toLocaleString());          // 총 할인금액 업데이트
                        $('#dlvPrc').html(dlvPrc.toLocaleString());              // 배송비 업데이트
                        $('#finPrc').html(finPrc.toLocaleString());              // 최종금액 업데이트
                        $('#point').html(point);
                        emptyCartMsg();

                    },
                    error: function () {
                        alert("error");
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }
        });


        let prodlist = Array.from(document.querySelectorAll(".cartlist"));        // 장바구니 목록의 자식(개별상품 목록)을 배열화

        prodlist.forEach(function (cartList) {                                    // 장바구니에서 상품을 하나씩 뽑아냄
            let prodCd = cartList.id;
            let optionlist = cartList.querySelectorAll("tr[id]");

            optionlist.forEach(function (row) {                                   // 각 상품에서 옵션을 하나씩 뽑아냄
                const optCd = row.id;                                             // 상품 옵션코드


                //  modify --1
                $("#minus" + prodCd + '_' + optCd).click(function () {

                    let optVal = document.querySelector('.' + prodCd + '_' + optCd + '_qty');                               // 옵션 수량
                    let optQty = parseInt(optVal.value);                                                                    // 옵션 수량
                    let totalOptionPrice = parseInt(document.querySelector('.' + prodCd + '_' + optCd + '_totPrice').value.replace(/,/g, ''));     // 옵션별 총 금액
                    let totalProdPrc = parseInt(document.getElementsByClassName('totPrc' + prodCd)[0].innerText.replace(/,/g, ''));             // 상품 별 금액
                    let optPrice = totalOptionPrice / optQty;                                                                    // 옵션 개당 금액

                    if (optQty > 1) {      // 수량이 1 아래로 떨어지지 않게
                        --optQty;
                        totalOptionPrice -= optPrice;
                        totalProdPrc -= optPrice;
                        totPrc -= optPrice

                        let cartOptDto = {prodCd: prodCd, optCd: optCd, optQty: optQty, totOptPrice: totalOptionPrice};
                        let cartOptDto2 = {};
                        $.ajax({
                            type: 'PATCH',       // 요청 메서드
                            url: '/cart/modify',  // 요청 URI
                            headers: {"content-type": "application/json"}, // 요청 헤더
                            dataType: 'text', // 전송받을 데이터의 타입
                            data: JSON.stringify(cartOptDto),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                            success: function (result) {  // 서버로부터 응답이 도착하면 호출될 함수
                                cartOptDto2 = JSON.parse(result);
                                let qty = cartOptDto2.optQty;
                                let prc = cartOptDto2.totOptPrice;
                                // $('.totPrc' + prodCd)[0].html(totProdPrc);
                                // // 가격 업데이트
                                // $("#price" + prodCd).html(totProdPrice);
                                // // 포인트 업데이트
                                // $("#point" + prodCd).html(point);
                                // // 할인 금액 업데이트
                                // $("#dcprc" + prodCd).html(expctDcPrc);

                                let point = Math.round(totalProdPrc / 100);
                                dlvPrc = totPrc > 30000 ? 0 : 3000;
                                finPrc = totPrc - totDcPrc + dlvPrc;
                                let finPnt = finPrc / 100;

                                optVal.value = qty;
                                $('.' + prodCd + '_' + optCd + '_totPrice')[0].value = prc.toLocaleString();
                                $('.totPrc' + prodCd).html(totalProdPrc.toLocaleString());   // 상품별 총 금액 업데이트
                                $('.totPnt' + prodCd).html(point)       // 상품별 총 포인트
                                $('#totPrc').html(totPrc.toLocaleString());              // 총 상품금액 업데이트
                                $('#totDcPrc').html(totDcPrc.toLocaleString());          // 총 할인금액 업데이트
                                $('#dlvPrc').html(dlvPrc.toLocaleString());              // 배송비 업데이트
                                $('#finPrc').html(finPrc.toLocaleString());              // 최종금액 업데이트
                                $('#point').html(finPnt)                                 // 최종 포인트
                            },
                            error: function () {
                                alert("error")
                            } // 에러가 발생했을 때, 호출될 함수
                        });
                    }
                });


                // modify ++1
                $("#plus" + prodCd + '_' + optCd).click(function () {

                    let optVal = document.querySelector('.' + prodCd + '_' + optCd + '_qty');                               // 옵션 수량
                    let optQty = parseInt(optVal.value);                                                                    // 옵션 수량
                    let totalOptionPrice = parseInt(document.querySelector('.' + prodCd + '_' + optCd + '_totPrice').value.replace(/,/g, ''));     // 옵션별 총 금액
                    let totalProdPrc = parseInt(document.getElementsByClassName('totPrc' + prodCd)[0].innerText.replace(/,/g, ''));             // 상품 별 금액
                    let optPrice = totalOptionPrice / optQty;                                                                    // 옵션 개당 금액

                    ++optQty;  // 개수 + 1
                    totalOptionPrice += optPrice;
                    totalProdPrc += optPrice;
                    totPrc += optPrice

                    let cartOptDto = {prodCd: prodCd, optCd: optCd, optQty: optQty, totOptPrice: totalOptionPrice};
                    let cartOptDto2 = {};
                    $.ajax({
                        type: 'PATCH',       // 요청 메서드
                        url: '/cart/modify',  // 요청 URI
                        headers: {"content-type": "application/json"}, // 요청 헤더
                        dataType: 'text', // 전송받을 데이터의 타입
                        data: JSON.stringify(cartOptDto),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success: function (result) {   // 서버로부터 응답이 도착하면 호출될 함수
                            cartOptDto2 = JSON.parse(result);
                            let qty = cartOptDto2.optQty;
                            let prc = cartOptDto2.totOptPrice;
                            // // 가격 업데이트
                            // $("#price" + prodCd).html(totProdPrice);
                            // // 포인트 업데이트
                            // $("#point" + prodCd).html(point);
                            // // 할인 금액 업데이트
                            // $("#dcprc" + prodCd).text(expctDcPrc);

                            let point = Math.round(totalProdPrc / 100);
                            dlvPrc = totPrc > 30000 ? 0 : 3000;
                            finPrc = totPrc - totDcPrc + dlvPrc;
                            let finPnt = finPrc / 100;

                            optVal.value = qty;
                            $('.' + prodCd + '_' + optCd + '_totPrice')[0].value = prc.toLocaleString();
                            $('.totPrc' + prodCd).html(totalProdPrc.toLocaleString());   // 상품별 총 금액 업데이트
                            $('.totPnt' + prodCd).html(point)       // 상품별 총 포인트
                            $('#totPrc').html(totPrc.toLocaleString());              // 총 상품금액 업데이트
                            $('#totDcPrc').html(totDcPrc.toLocaleString());          // 총 할인금액 업데이트
                            $('#dlvPrc').html(dlvPrc.toLocaleString());              // 배송비 업데이트
                            $('#finPrc').html(finPrc.toLocaleString());              // 최종금액 업데이트
                            $('#point').html(finPnt)                                 // 최종 포인트
                        },
                        error: function () {
                            alert("error")
                        } // 에러가 발생했을 때, 호출될 함수
                    });
                });

                $("#delete" + prodCd + '_' + optCd).click(function () {
                    let optVal = document.querySelector('.' + prodCd + '_' + optCd + '_qty');                               // 옵션 수량
                    let optQty = parseInt(optVal.value);                                                                    // 옵션 수량
                    let totalOptionPrice = parseInt(document.querySelector('.' + prodCd + '_' + optCd + '_totPrice').value.replace(/,/g, ''));     // 옵션별 총 금액
                    let totalProdPrc = parseInt(document.getElementsByClassName('totPrc' + prodCd)[0].innerText.replace(/,/g, ''));             // 상품 별 금액
                    let optPrice = totalOptionPrice / optQty;                                                                    // 옵션 개당 금액

                    let cartOptDto = {
                        prodCd: prodCd,
                        optCd: optCd,
                        optQty: optQty,
                        optPrice: optPrice,
                        totOptPrice: totalOptionPrice
                    };   // 상품코드 객체에 담기
                    let ordDto = {totPrc: '', totDcPrc: '', dlvPrc: '', finPrc: ''};
                    $.ajax({
                        type: 'DELETE',       // 요청 메서드
                        url: '/cart/remove',  // 요청 URI
                        headers: {"content-type": "application/json"}, // 요청 헤더
                        dataType: 'text', // 전송받을 데이터의 타입
                        data: JSON.stringify(cartOptDto),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success: function (result) {  // 서버로부터 응답이 도착하면 호출될 함수
                            // ordDto = JSON.parse(result);

                            $("#list" + prodCd + '_' + optCd).remove();     // 해당 상품의 <li> 삭제
                            if ($('.opt' + prodCd).children().length === 0) {
                                $('#list' + prodCd).remove();           // 해당 상품이 없을 경우 상품 전체 삭제
                            }
                            emptyCartMsg();

                            console.log('totPRodPrc = ' + totProdPrc);
                            console.log('totOptPrc = ' + totOptPrice);
                            totProdPrc -= totOptPrice;
                            console.log('totPRodPrc = ' + totProdPrc);
                            totPrc -= totOptPrice

                            let point = Math.round(totalProdPrc / 100);
                            dlvPrc = totPrc > 30000 ? 0 : 3000;
                            finPrc = totPrc - totDcPrc + dlvPrc;
                            let finPnt = finPrc / 100;

                            optVal.value = qty;
                            $('.' + prodCd + '_' + optCd + '_totPrice')[0].value = prc.toLocaleString();
                            $('.totPrc' + prodCd).html(totalProdPrc.toLocaleString());   // 상품별 총 금액 업데이트
                            $('.totPnt' + prodCd).html(point)       // 상품별 총 포인트
                            $('#totPrc').html(totPrc.toLocaleString());              // 총 상품금액 업데이트
                            $('#totDcPrc').html(totDcPrc.toLocaleString());          // 총 할인금액 업데이트
                            $('#dlvPrc').html(dlvPrc.toLocaleString());              // 배송비 업데이트
                            $('#finPrc').html(finPrc.toLocaleString());              // 최종금액 업데이트
                            $('#point').html(finPnt)                                 // 최종 포인트
                        },
                        error: function () {
                            alert("error")
                        } // 에러가 발생했을 때, 호출될 함수
                    }); // $.ajax()
                });
            });
        });
    });
</script>
</body>
</html>
