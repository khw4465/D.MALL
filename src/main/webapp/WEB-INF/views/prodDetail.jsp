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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .mainImg {
            display: inline-block;
            width: 480px;
            height: 480px;
            vertical-align: top;
            margin: 60px;
            border-radius: 20px;
        }
        .prodDesc{
            display: inline-block;
        }
        .content{
            display: inline-block;
            vertical-align: top;
            width: 45%;
        }
        table.box {
            border-collapse: collapse;
        }
        table.box th,
        table.box td {
            padding: 12px;
            text-align: left;
        }
        table.box th {
            width: 100px;
            font-weight: bold;
        }
        <c:forEach var="img" items="${imgList}">
        .prodImg${img.imgCd}{
            width: ${img.imgWidth}px;
            height: ${img.imgHeight}px;
        }
        </c:forEach>
        .imgAll{
            text-align: center;
        }
        .imgAll .slider {
            overflow: hidden;
            max-height: 600px;
            transition: max-height 3s ease;
        }
        .imgAll.opened .slider{
            max-height: none;
        }
        .imgAll button {
            width: 500px;
            height: 45px;
            color: gray;
            background-color: white;
            font-size: medium;
            text-align: center;
            border: 1px solid gray;
            border-radius: 5px;
            display: inline-block;

        }
        .imgAll.opened button {
            display: none;
        }
        .prodOpt {
            width: 300px;
            height: 30px;
            color: black;
            background-color: white;
            border: 1px solid gray;
            border-radius: 5px;
            display: inline-block;
        }
        .moveBtn {
            text-align: center;
        }
        .cartBtn,
        .ordBtn {
            width: 150px;
            height: 40px;
            font-size: medium;

            border-radius: 3px;
        }
        .cartBtn{
            color: black;
            background-color: white;
            border: 1px solid darkgray;
        }
        .ordBtn{
            color: white;
            background-color: #ff7146;
            border: 0px;
        }
        .selectedOptionsList {
            list-style-type: none;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div>
    <div>
        <h1>상품 상세 </h1>
    </div>
    <img class="mainImg" src="/img/<c:out value="${imgList.get(0).prodCd}"/>.<c:out value="${imgList.get(0).imgExtns}"/>" alt="">
        <div class="content">
            <div class="prodDesc">
            <h2><c:out value="${prodDto.prodName}"/></h2>
            <div> 별점 : <c:out value="${prodDto.ascr}"/></div>
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
                <tr>
                    <th>주의사항</th>
                    <td><c:out value="${prodDto.prodDtlDesc}"/></td>
                </tr>
                <tr>
                    <th>상품 옵션</th>
                    <td>
                        <select class="prodOpt" id="prodOpt" onchange="optionChange()">
                            <option style="color: gray">옵션을 선택해주세요.</option>
                            <c:forEach var="opt" items="${optList}">
                                <option id="option${opt.optCd}" value="${opt.salePrc}" data-name="${opt.optName}">${opt.optName} (${opt.salePrc}원)</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                </tbody>
            </table>
                <ul id="selectedOptionsList" class="selectedOptionsList">

                </ul>
                    <div id="totalPrice">0원</div>
            </div>
            <div class="moveBtn">
                <input class="cartBtn" type="button" value="장바구니">
                &nbsp &nbsp &nbsp
                <input class="ordBtn" type="button" value="바로구매">
            </div>
        </div>
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
<div class="includeItem"><jsp:include page="footer.jsp" /></div>
<script>
    $(document).ready(function() {
        $('.toggle').click(function() {
            $('.imgAll').toggleClass('opened');         // 상품 이미지에 달린 토글버튼을 누르면 'opened'
        });

    });
    let prcText;
    function optionChange() {
        const selectedOption = document.getElementById('prodOpt');
        const selectedOptName = selectedOption.options[selectedOption.selectedIndex].getAttribute('data-name'); // 옵션 하나의 이름
        const selectedOptionsList = document.getElementById('selectedOptionsList');     // 옵션 리스트
        const selectedOptValue = parseInt(selectedOption.value);                // 옵션 하나의 가격


        // 중복된 옵션인지 확인
        const isDuplicate = Array.from(selectedOptionsList.children).some(option => option.textContent === selectedOptName);
        if (!isDuplicate) {
            const li = document.createElement('li');
            const div = document.createElement('div');
            const minusBtn = document.createElement('button');
            const qtyText = document.createElement('input');
            const plusBtn = document.createElement('button');
            prcText = document.createElement('span');
            li.textContent = selectedOptName;
            minusBtn.textContent = '-';
            qtyText.value = 1;
            plusBtn.textContent = '+';
            prcText.textContent = selectedOptValue+'원';

            minusBtn.addEventListener('click', decreaseQty);
            plusBtn.addEventListener('click', increaseQty);

            li.append(div);
            div.appendChild(minusBtn);
            div.appendChild(qtyText);
            div.appendChild(plusBtn);
            div.appendChild(prcText);


            // 오름차순으로 위치를 찾아서 삽입
            let insertIndex = Array.from(selectedOptionsList.children)
                .findIndex(option => option.textContent > selectedOptName);
            if (insertIndex === -1) {
                selectedOptionsList.appendChild(li); // 모든 값보다 큰 경우 맨 뒤에 삽입
            } else {
                selectedOptionsList.insertBefore(li, selectedOptionsList.children[insertIndex]);
            }
            calculateTotalPrice();
        }
    }
    function decreaseQty(e) {
        const quantityInput = e.target.nextElementSibling;
        const priceInput = quantityInput.nextElementSibling.nextElementSibling;
        let quantity = parseInt(quantityInput.value);
        let onePrice = parseInt(priceInput.value)/quantity;
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
        let onePrice = parseInt(priceInput.value)/quantity;
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
</script>
</body>
</html>