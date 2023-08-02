<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<html>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/prodDetailtest.css'/>">
    <script src="https://kit.fontawesome.com/dfc70c918b.js" crossorigin="anonymous"></script>
    <style>
        <c:forEach var="img" items="${imgList}">
        .prodImg${img.imgCd} {
            width: ${img.imgWidth}px;
            height: ${img.imgHeight}px;
        }

        </c:forEach>
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="wrap">
    <div id="container">
        <div>
            <img class="mainImg"
                 src="/img/<c:out value="${imgList.get(0).prodCd}"/>.<c:out value="${imgList.get(0).imgExtns}"/>"
                 alt="">
            <div class="content">
                <div class="prodDesc">
                    <div class="prodDesc-head">
                        <h2><c:out value="${prodDto.prodName}"/></h2>
                        <div> 별점 : <c:out value="${prodDto.ascr}"/></div>
                        <c:set var="mainOpt" value="${optList.get(0)}"/>
                        <div class="cost">
                            <div style="font-weight: bolder"><span style="font-size: 2.3em"><strong><c:out
                                    value="${mainOpt.salePrc}"/></strong></span>원
                            </div>
                            <div>(1팩당 : <span><c:out value="${Math.round(mainOpt.salePrc / 10)}"/></span>원)</div>
                        </div>
                    </div>
                    <div class="prodDesc-body">
                        <table class="box">
                            <tbody>
                            <tr>
                                <th>판매자</th>
                                <td><c:out value="${prodDto.fstRegr}"/></td>
                            </tr>
                            <tr>
                                <th>적립혜택</th>
                                <td>1% 적립</td>
                            </tr>
                            <tr>
                                <th>원산지</th>
                                <td><c:out value="${prodDto.prodSmrvDesc}"/></td>
                            </tr>
                            <%--                        <tr>--%>
                            <%--                            <th>주의사항</th>--%>
                            <%--                            <td><c:out value="${prodDto.prodDtlDesc}"/></td>--%>
                            <%--                        </tr>--%>
                            <tr>
                                <th>상품 옵션</th>
                                <td>
                                    <select class="prodOpt" id="prodOpt" onchange="optionChange()">
                                        <option style="color: gray">옵션을 선택해주세요.</option>
                                        <c:forEach var="opt" items="${optList}">
                                            <option id="option${opt.optCd}" value="${opt.salePrc}"
                                                    data-name="${opt.optName}" data-prodCd="${opt.prodCd}"
                                                    data-optCd="${opt.optCd}">${opt.optName} (${opt.salePrc}원)
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--                여기부터 수정 --%>
                    <ul id="selectedOptionsList" class="selectedOptionsList">

                        <%--옵션 추가될곳들 --%>

                    </ul>
                    <div id="totalPrice" class="totalPrice">
                        <span class="totPrice" style="font-size: 2.3em">${mainOpt.salePrc}</span>원
                    </div>
                </div>
                <div class="moveBtn">
                    <a href="<c:url value="/cart/list"/>"><input id="cartBtn" class="cartBtn" type="button"
                                                                 value="장바구니"></a>
                    &nbsp &nbsp &nbsp
                    <a href="#"><input class="ordBtn" type="button" value="바로구매"></a>
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
                                    <img class="prodImg${img.imgCd}"
                                         src="/img/${img.prodCd}_${img.imgCd}.${img.imgExtns}" alt="">
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
<div class="includeItem">
    <jsp:include page="footer.jsp"/>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('.toggle').click(function () {
            $('.imgAll').toggleClass('opened');         // 상품 이미지에 달린 토글버튼을 누르면 'opened'
        });

    });

    var maxOptions = ${optList.size()};
    var addedOptions = 0;

    //옵션 백틱에서 분리한 코드
    //var optionPrice = selectedData.salePrc;
    //var optionPoint = Math.round(selectedData.salePrc / 100);
    //var optionPointRate = selectedData.optQty;
    //var goodsName = selectedData.optName;

    <%--var optPrice = "${optListValue}"--%>
    <%--console.log(optPrice);--%>


<%--    <c:forEach var="price" items="${optListValue}">--%>
<%--    optPrice=${price};--%>
<%--    </c:forEach>--%>


    const selectedOption = document.getElementById('prodOpt');
    const selectedOptName = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-name'); // 옵션 하나의 이름
    const selectedProdCd = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-prodCd'); // 상품코드
    const selectedOptCd = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-optCd'); // 옵션 코드
    const selectedOptionsList = document.getElementById('selectedOptionsList');     // 옵션 리스트
    const selectedOptValue =    parseInt(selectedOption.value);                // 옵션 하나의 가격


    function optionChange() {
        // 이미 최대 옵션 수에 도달했다면, 추가하지 않고 경고 메시지를 표시
        if (addedOptions >= maxOptions) {
            alert("더 이상 옵션을 추가할 수 없습니다.");
            return;
        }

        var selectedOption = document.getElementById("prodOpt");
        var selectedValue = selectedOption.value;
        var selectedData = selectedOption.options[selectedOption.selectedIndex].dataset;

        // li 요소 생성
        var li = document.createElement("li");
        li.id = selectedData.prodCd + '_' + selectedData.optCd;
        li.className = "option-box";
        li.dataset.prodCd = selectedData.prodCd;
        li.dataset.name = selectedData.optName;

        // 내부 요소들을 li에 추가
        li.innerHTML = `
    <input type="hidden" name="optionPrice" value="` + optionPrice + `">
    <input type="hidden" name="optionPoint" value="` + optionPoint + `">
    <input type="hidden" name="optionPointRate" value="` + optionPointRate + `">
    <div class="inner">
        <p class="goods-name">` + goodsName + `</p>
        <div class="qty-group type-sm">
            <button type="button" class="btn-qty btnOptQtyMinus">
                <i class="ico-minus"></i><span class="blind">빼기</span>
            </button>
            <input type="text" class="input-qty" name="qty" value="1" min="1" max="999999" readonly="">
            <input type="hidden" class="input-qty" name="optionStock" value="999999">
            <button type="button" class="btn-qty btnOptQtyPlus">
                <i class="ico-plus"></i><span class="blind">더하기</span>
            </button>
        </div>
        <div class="price">
            <p><span class="optPrice">` + optPrice + `</span>원</p>
        </div>
        <button type="button" class="btn-x-sm3 btnOptSelRemove" title="">
            <i class="ico-x-black"></i><span class="blind">삭제</span>
        </button>
    </div>`;

        // 생성한 li 요소를 ul에 추가
        document.getElementById("selectedOptionsList").appendChild(li);

        // 추가된 옵션 수 증가
        addedOptions++;
    }

    // let prcText;
    <%--function optionChange() {--%>
    <%--    const selectedOption = document.getElementById('prodOpt');--%>
    <%--    const selectedOptName = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-name'); // 옵션 하나의 이름--%>
    <%--    const selectedProdCd = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-prodCd'); // 상품코드--%>
    <%--    const selectedOptCd = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-optCd'); // 옵션 코드--%>
    <%--    const selectedOptionsList = document.getElementById('selectedOptionsList');     // 옵션 리스트--%>
    <%--    const selectedOptValue = parseInt(selectedOption.value);                // 옵션 하나의 가격--%>

    <%--    // 옵션 중복체크--%>
    <%--    let alreadyAdded = false;--%>
    <%--    Array.from(selectedOptionsList.children).forEach(li => {--%>
    <%--        if (li.querySelector('button').id === `minus${selectedProdCd}_${selectedOptCd}`) {--%>
    <%--            alreadyAdded = true;--%>
    <%--        }--%>
    <%--    });--%>

    <%--    if (alreadyAdded) return; // if option is already added, stop execution.--%>

    <%--    let str = `<div class="qtyTag" style="display: flex;">--%>
    <%--                    <button type="button" title="-" id="minus${selectedProdCd}_${selectedOptCd}">--%>
    <%--                        <i class="fa-solid fa-minus"></i><input type="hidden" value=-1>--%>
    <%--                    </button>--%>
    <%--                    <input type="text" class="${selectedProdCd}_${selectedOptCd}_qty" name="prod-qty"--%>
    <%--                           value="1" style="border: none" readonly="readonly">--%>
    <%--                    <button type="button" title="+" id="plus${selectedProdCd}_${selectedOptCd}">--%>
    <%--                        <i class="fa-solid fa-plus"></i><input type="hidden" value=1>--%>
    <%--                    </button>--%>
    <%--                </div>`;--%>

    <%--    const li = document.createElement('li');--%>
    <%--    li.innerHTML = str;--%>
    <%--    selectedOptionsList.appendChild(li);--%>

    <%--    // 옵션 정렬--%>
    <%--    Array.from(selectedOptionsList.children)--%>
    <%--        .sort((a, b) => parseInt(a.querySelector('button').id.match(/\d+$/)) - parseInt(b.querySelector('button').id.match(/\d+$/)))--%>
    <%--        .forEach(li => selectedOptionsList.appendChild(li));--%>
    <%--}--%>

    //     // 중복된 옵션인지 확인
    //     const isDuplicate = Array.from(selectedOptionsList.children).some(option => option.textContent === selectedOptName);
    //     if (!isDuplicate) {
    //         const li = document.createElement('li');
    //         const div = document.createElement('div');
    //         const minusBtn = document.createElement('button');
    //         const qtyText = document.createElement('input');
    //         const plusBtn = document.createElement('button');
    //         prcText = document.createElement('span');
    //         li.textContent = selectedOptName;
    //         minusBtn.textContent = '-';
    //         qtyText.value = 1;
    //         plusBtn.textContent = '+';
    //         prcText.textContent = selectedOptValue+'원';
    //
    //         minusBtn.addEventListener('click', decreaseQty);
    //         plusBtn.addEventListener('click', increaseQty);
    //
    //         li.append(div);
    //         div.appendChild(minusBtn);
    //         div.appendChild(qtyText);
    //         div.appendChild(plusBtn);
    //         div.appendChild(prcText);
    //
    //
    //         // 오름차순으로 위치를 찾아서 삽입
    //         let insertIndex = Array.from(selectedOptionsList.children)
    //             .findIndex(option => option.textContent > selectedOptName);
    //         if (insertIndex === -1) {
    //             selectedOptionsList.appendChild(li); // 모든 값보다 큰 경우 맨 뒤에 삽입
    //         } else {
    //             selectedOptionsList.insertBefore(li, selectedOptionsList.children[insertIndex]);
    //         }
    //         calculateTotalPrice();
    //     }
    // }
    function decreaseQty(e) {
        const quantityInput = e.target.nextElementSibling;
        const priceInput = quantityInput.nextElementSibling.nextElementSibling;
        let quantity = parseInt(quantityInput.value);
        let onePrice = parseInt(priceInput.value) / quantity;
        let totPrice;
        if (quantity > 1) {
            quantity--;
            quantityInput.value = quantity;
            totPrice = quantity * onePrice;
            priceInput.value = totPrice;
            prcText.textContent = totPrice + '원'
            calculateTotalPrice();
        }
    }

    function increaseQty(e) {
        const quantityInput = e.target.previousElementSibling;
        const priceInput = quantityInput.nextElementSibling.nextElementSibling;
        let quantity = parseInt(quantityInput.value);
        let onePrice = parseInt(priceInput.value) / quantity;
        let totPrice;
        quantity++;
        quantityInput.value = quantity;
        totPrice = quantity * onePrice;
        priceInput.value = totPrice;
        prcText.textContent = totPrice + '원'
        calculateTotalPrice();
    }

    function calculateTotalPrice() {
        let totalPrice = 0;
        const selectedOptionsList = document.getElementById('selectedOptionsList');
        const options = selectedOptionsList.children;

        for (let i = 0; i < options.length; i++) {
            const priceInput = options[i].querySelector('input[type="number"]');
            const quantity = parseInt(options[i].querySelector('input[type="text"]').value);
            const unitPrice = parseInt(priceInput.value);
            const optionTotal = quantity * unitPrice;
            totalPrice += optionTotal;
        }

        const totalPriceElement = document.getElementById('totalPrice');
        totalPriceElement.textContent = `${totalPrice}원`;
    }

    $('#cartBtn').click(function () {


    })
</script>
</body>
</html>