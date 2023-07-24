<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="<c:url value='/css/cart.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="https://kit.fontawesome.com/dfc70c918b.js" crossorigin="anonymous"></script>
</head>
<body>
<div>
    <div class="body-frame">
        <div class="page-title-area">
            <h2 class="title-page">장바구니</h2>
            <div class="cart-option" id="cart-option">
                <div class="custom-checkbox">
                    <input type="checkbox" id="checkAll" class="checkbox checkboxGroup" checked="">
                    <label for="checkAll">전체해제</label>
                </div>
                <div style="float: right;">
                    <button type="button" id="removeAll" class="btn-option btn-default"><span>선택삭제</span></button>
                    <button type="button" id="removeCheck" class="btn-option btn-default"><span>전체삭제</span></button>
                </div>
            </div>
        </div>
        <ul id="cart" class="cart-list">
            <c:forEach var="cart" items="${cartList}">
                <li id="list${cart.prodCd}" class="${cart.prodCd}">
                    <div>
                        <input type="checkbox" name="eachcheck" checked="" style="text-decoration: none">
                        <table class="box">
                            <tbody>
                            <tr>
                                <th style="border: 1px solid red">
                                    <img src="/img/${cart.prodCd}.png" style="width: 100px; height: 100px;">
                                </th>
                                <td style="border: 1px solid green; display: block">
                                    <h4>${cart.prodName}</h4>
                                    <ul class="opt${cart.prodCd}" id="">
                                        <c:forEach var="opt" items="${optList}">
                                            <li id="${opt.prodCd}_${opt.optCd}" class="${opt.optCd}" style="border: 1px solid blue;">
                                                <div style="border: 1px solid darkorange; display: inline-block;">
                                                    <div style="border: 1px solid blueviolet">${opt.optName}</div>
                                                    <div style="border: 1px solid darkgreen">${opt.optPrice}원</div>
                                                </div>
                                                <div id="btn" style="border: 1px solid lightcoral; display: inline-block;">
                                                    <button type="button" id="minus${opt.prodCd}">
                                                        <i class="fa-solid fa-minus"></i><input type="hidden" value=-1>
                                                    </button>
                                                    <input type="text" class="${opt.prodCd}_${opt.optCd}_qty" name="prod-qty" value="${opt.optQty}" readonly="readonly">
                                                    <button type="button" id="plus${opt.prodCd}">
                                                        <i class="fa-solid fa-plus"></i><input type="hidden" value=1>
                                                    </button>
                                                    <span><span class="${opt.prodCd}_${opt.optCd}_totPrice">${opt.totOptPrice}</span>원</span>
                                                    <button type="button" id="delete${cart.prodCd}" class="deleteOne" style="text-align: right">
                                                        <i class="fa-solid fa-xmark"></i>
                                                    </button>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div style="text-align: center">총 상품 금액 : ${cart.totProdPrice}원</div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <c:set var="ord" value="${ord}" />
    <div id="priceInfo" class="price-info-all">
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">상품금액</dt>
                <dd class="price"><em class="num"><c:out value="${ord.totPrc}" /></em>원</dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">할인금액</dt>
                <dd class="price"><em class="num"><c:out value="${ord.totDcPrc}" /></em>원</dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">배송비</dt>
                <dd class="price"><em class="num"><c:out value="${ord.dlvPrc}" /></em>원</dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">총 결제금액</dt>
                <dd class="price">
                    <em class="totalOrderPrice"><c:out value="${ord.finPrc}" /></em>원
                </dd>
            </dl>
        </div>
    </div>

    <div class="page-guide-center">
        <ul class="list-type1">
            <li>배송방법 선택 또는 배송지에 따라 배송비가 달라질 수 있습니다.</li>
            <li>제품별로 출고지 및 출고일정이 상이하여 합포장 또는 개별발송될 수 있습니다.</li>
        </ul>
    </div>
    <form action="/order/order">
        <div class="btn-bottom-area">
            <a href="<c:url value='/'/>" class="btn-basic-xxlg btn-default-ex"><span>쇼핑계속하기</span></a>
            <input type="hidden" id="sumPrice" name="prodPrice" value="<c:out value="${ord.totPrc}" />">
            <input type="hidden" id="totalDcPrc" name="prodDcPrice" value="<c:out value="${ord.totDcPrc}" />">
            <input type="hidden" id="dlvPrc" name="prodDlvPrice" value="<c:out value="${ord.dlvPrc}" />">
            <input type="hidden" id="totalPrice" name="prodFinPrice" value="<c:out value="${ord.finPrc}" />">
            <a herf="<c:url value='/order/order'/>" id="orderBtn"><input type="submit" class="totalOrderPrice" id="totalOrdPrice" value="<c:out value="${ord.finPrc}" />원 주문하기"></a>
        </div>
    </form>
</div>

<script>
    const allCBox = document.getElementById('checkAll');    // 전체 체크박스
    const eachCBox = Array.from(document.getElementsByName('eachcheck'));   // 상품별 체크박스
    let selText = document.querySelector('label[for="checkAll"]');  // 전체선택/전체해제

    // 전체 체크박스가 (true/false)면 개별 체크박스도 (true/false) && (전체해제/전체선택)

    allCBox.addEventListener("change", () =>{
        const allChecked = allCBox.checked;
        eachCBox.forEach(tag => tag.checked = allChecked);
        selText.textContent = allChecked ? '전체해제' : '전체선택';
    });

    // 개별 체크박스가 다 true면 전체 체크박스도 true,  하나라도 false면 전체 체크박스도 false && (전체해제/전체선택)

    eachCBox.forEach(function(tag){
        tag.addEventListener('change', () =>{
            const allChecked = eachCBox.every(tag => tag.checked);
            allCBox.checked = allChecked;
            selText.textContent = allChecked ? "전체해제" : "전체선택";
        });
    });

    //삭제 버튼 구현

    const allDelBtn = document.getElementById('deleteAll');          // 전체삭제 버튼
    const selectDelBtn = document.getElementById('deleteCheck');     // 선택삭제 버튼
    // const delBtn = document.getElementsByClassName('deleteOne');  // 개별삭제 버튼
    const cart = document.getElementById("cart");
    const cartOpt = document.getElementById("cart-option");
    const listhead = document.getElementById("list-head");
    const priceInfo = document.getElementById('priceInfo');
    const ordBtn = document.getElementById('orderBtn');

    // 장바구니가 비었는지 확인하는 함수
    function isCartEmpty() {
        const items = cart.getElementsByTagName("li");
        return items.length === 0;
    }

    function emptyCartMsg() {
        if (isCartEmpty()) {
            cart.innerHTML = "<h1 style='text-align:center'>장바구니가 비어있습니다.</h1>"; // 장바구니가 비었을 때 나타내는 메시지
            cartOpt.style.display = "none";
            listhead.style.display = "none";
            priceInfo.style.display = "none";
            ordBtn.style.display = "none";
        }
    }

    //체크박스가 선택된 곳의 list만 삭제
    selectDelBtn.addEventListener('click', () =>{
        eachCBox.forEach(function(checkbox){
            if(checkbox.checked) {
                let checkList = checkbox.closest('li'); // 가장 가까운 'li' 찾기
                checkList.remove();
                emptyCartMsg();
            }
        });
    });

    // 개별삭제 버튼 구현
    delBtnArr.forEach(button =>{
        button.addEventListener('click', () =>{
            const product = button.closest('li');
            product.remove();
            emptyCartMsg();
        });
    }) ;



</script>
<script>
    const throttle = (callback, delay) => {     // 수량체크할 때 사용할 스로틀 함수
        let timerId;
        return (...args) => {
            if (timerId) return;
            timerId = setTimeout(() => {
                callback(...args);
                timerId = null;
            }, delay);
        };
    };

    let sumPrice = parseInt($('#sumPrice').val());       // 모든 상품의 가격을 합한 금액
    let dcPrice = parseInt($('#totalDcPrc').val());      // 각각의 할인 금액을 모두 더한 금액
    let dlvPrice = parseInt($('#dlvPrc').val());         // 배송비
    let totalPrice = parseInt($('#totalPrice').val());   // 위의 3개의 가격을 계산한 최종 금액

    let prodCd;
    let prodOpt;
    let optlist;
    let optCd;
    let optQty;
    // AJAX    // 상품쪽이 dev에 들어와야 fetch한 후 가능
    let prodlist = Array.from(document.getElementById("cart").children);       // 장바구니 목록의 자식(개별상품 목록)을 배열화
    $(document).ready(function(){
        prodlist.forEach(function(cartList){                                   // 장바구니에서 상품을 하나씩 뽑아냄
            prodCd = cartList.className; // 상품코드 출력
            prodOpt = cartList.getElementsByClassName('opt' + prodCd);     // 상품의 옵션을 묶어놓은 ul태그
            optlist = Array.from(prodOpt[0].children);                     // 상품의 옵션을 배열화

            optlist.forEach(function(optList){                                 // 각 상품에서 옵션을 하나씩 뽑아냄
                optCd = optList.className;                                 // 상품 옵션코드
                optQty = document.querySelector('.' + prodCd + '_' + optCd + '_qty').value;
                // let totOptPrice = $('.' + prodCd + '_' + optCd + '_totPrice').innerText();
                console.log("prodCd = "+ prodCd);
                console.log("optCd = " + optCd);
                console.log('optQty = ' + optQty);
            })
        });
    });
</script>
</body>
</html>