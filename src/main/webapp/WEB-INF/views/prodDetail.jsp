<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%><html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
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
        .prodImg${img.imgCd}{
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
            <img class="mainImg" src="/img/<c:out value="${imgList.get(0).prodCd}"/>.<c:out value="${imgList.get(0).imgExtns}"/>" alt="">
            <div class="content">
                <div class="prodDesc">
                    <div class="prodDesc-head">
                        <h2><c:out value="${prodDto.prodName}"/></h2>
                        <div> 별점 : <c:out value="${prodDto.ascr}"/></div>
                        <c:set var="mainOpt" value="${optList.get(0)}"/>
                        <div class="cost">
                            <div style="font-weight: bolder"><span style="font-size: 2.3em"><strong><c:out value="${mainOpt.salePrc}"/></strong></span>원</div>
                            <div>(1팩당 : <span><c:out value="${Math.round(mainOpt.salePrc / 10)}"/></span>원)</div>
                        </div>
                    </div>
                    <div class="prodDesc-body">
                        <table class="box">
                            <tbody>
                            <tr>
                                <th>판매자</th>
                                <td><c:out value="${prodDto.fstRegr}" /></td>
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
                                            <option id="option${opt.optCd}" value="${opt.salePrc}" data-name="${opt.optName}" data-prodCd="${opt.prodCd}" data-optCd="${opt.optCd}">${opt.optName} (${opt.salePrc}원)</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <ul id="selectedOptionsList" class="selectedOptionsList">
                        <c:forEach var="opt" items="${optList}">
                            <li id="${opt.prodCd}_${opt.optCd}" class="option-box" data-prodCd="${opt.prodCd}" data-name="${opt.optName}">
                                <input type="hidden" name="optionPrice" value="${opt.salePrc}">
                                <input type="hidden" name="optionPoint" value="${Math.round(opt.salePrc/100)}">
                                <input type="hidden" name="optionPointRate" value="${opt.optQty}">
                                <div class="inner">
                                    <p class="goods-name">${opt.optName}</p>
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
                                        <p><span class="optPrice">${opt.salePrc}</span>원</p>
                                    </div>
                                    <button type="button" class="btn-x-sm3 btnOptSelRemove" title="">
                                        <i class="ico-x-black"></i><span class="blind">삭제</span>

                                    </button>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <div id="totalPrice" class="totalPrice">
                        <span class="totPrice" style="font-size: 2.3em">${mainOpt.salePrc}</span>원
                    </div>
                </div>
                <div class="moveBtn">
                    <a href="<c:url value="/cart/list"/>"><input id="cartBtn" class="cartBtn" type="button" value="장바구니"></a>
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
<div class="includeItem"><jsp:include page="footer.jsp" /></div>
<script>
    $(document).ready(function() {
        $('.toggle').click(function() {
            $('.imgAll').toggleClass('opened');         // 상품 이미지에 달린 토글버튼을 누르면 'opened'
        });

    });
    // let prcText;
    function optionChange() {
        const selectedOption = document.getElementById('prodOpt');
        const selectedOptName = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-name'); // 옵션 하나의 이름
        const selectedProdCd = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-prodCd'); // 상품코드
        const selectedOptCd = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-optCd'); // 옵션 코드
        const selectedOptionsList = document.getElementById('selectedOptionsList');     // 옵션 리스트
        const selectedOptValue = parseInt(selectedOption.value);                // 옵션 하나의 가격

        // 옵션 중복체크
        let alreadyAdded = false;
        Array.from(selectedOptionsList.children).forEach(li => {
            if (li.querySelector('button').id === `minus${selectedProdCd}_${selectedOptCd}`) {
                alreadyAdded = true;
            }
        });

        if (alreadyAdded) return; // if option is already added, stop execution.

        let str = `<div class="qtyTag" style="display: flex;">
                        <button type="button" title="-" id="minus${selectedProdCd}_${selectedOptCd}">
                            <i class="fa-solid fa-minus"></i><input type="hidden" value=-1>
                        </button>
                        <input type="text" class="${selectedProdCd}_${selectedOptCd}_qty" name="prod-qty"
                               value="1" style="border: none" readonly="readonly">
                        <button type="button" title="+" id="plus${selectedProdCd}_${selectedOptCd}">
                            <i class="fa-solid fa-plus"></i><input type="hidden" value=1>
                        </button>
                    </div>`;

        const li = document.createElement('li');
        li.innerHTML = str;
        selectedOptionsList.appendChild(li);

        // 옵션 정렬
        Array.from(selectedOptionsList.children)
            .sort((a, b) => parseInt(a.querySelector('button').id.match(/\d+$/)) - parseInt(b.querySelector('button').id.match(/\d+$/)))
            .forEach(li => selectedOptionsList.appendChild(li));
    }

    $('#cartBtn').click(function () {
        let prodCd = '';                        //상품코드
        let prodName = '';                      //상품명
        let optCd = '';                         //옵션코드
        let optName = '';                       //옵션이름
        let prodQty = 0;                        //옵션수량
        let totProdPrice = 0;                   //옵션금액

        let optList = Array.from(document.querySelectorAll('.option-box'));

        cartO

        optList.forEach(item => {
            prodCd = item.querySelector('.prodCd').value;
            prodName = item.querySelector('.prodName').value;
            prodQty += parseInt(item.querySelector('.optQty').value);
            totProdPrice += parseInt(item.querySelector('.optPrice').value);

            let CartOptDto = {prodCd: prodCd, prodName: prodName, optCd: , optName: , prodQty: prodQty, totProdPrice: totProdPrice}

        })
        $.ajax({
            type: 'POST',       // 요청 메서드
            url: '/cart/list',  // 요청 URI
            headers: {"content-type": "application/json"}, // 요청 헤더
            dataType: 'text', // 전송받을 데이터의 타입
            data: JSON.stringify(CartOptDto),
            success: function (result) {  // 서버로부터 응답이 도착하면 호출될 함수

            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    })

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
    // function decreaseQty(e) {
    //     const quantityInput = e.target.nextElementSibling;
    //     const priceInput = quantityInput.nextElementSibling.nextElementSibling;
    //     let quantity = parseInt(quantityInput.value);
    //     let onePrice = parseInt(priceInput.value)/quantity;
    //     let totPrice;
    //     if (quantity > 1) {
    //         quantity--;
    //         quantityInput.value = quantity;
    //         totPrice = quantity * onePrice;
    //         priceInput.value = totPrice;
    //         prcText.textContent = totPrice + '원'
    //         calculateTotalPrice();
    //     }
    // }
    //
    // function increaseQty(e) {
    //     const quantityInput = e.target.previousElementSibling;
    //     const priceInput = quantityInput.nextElementSibling.nextElementSibling;
    //     let quantity = parseInt(quantityInput.value);
    //     let onePrice = parseInt(priceInput.value)/quantity;
    //     let totPrice;
    //     quantity++;
    //     quantityInput.value = quantity;
    //     totPrice = quantity * onePrice;
    //     priceInput.value = totPrice;
    //     prcText.textContent = totPrice + '원'
    //     calculateTotalPrice();
    // }
    //
    // function calculateTotalPrice() {
    //     let totalPrice = 0;
    //     const selectedOptionsList = document.getElementById('selectedOptionsList');
    //     const options = selectedOptionsList.children;
    //
    //     for (let i = 0; i < options.length; i++) {
    //         const priceInput = options[i].querySelector('input[type="number"]');
    //         const quantity = parseInt(options[i].querySelector('input[type="text"]').value);
    //         const unitPrice = parseInt(priceInput.value);
    //         const optionTotal = quantity * unitPrice;
    //         totalPrice += optionTotal;
    //     }

    //   const totalPriceElement = document.getElementById('totalPrice');
    //   totalPriceElement.textContent = `원`;
    // }


</script>
</body>
</html>