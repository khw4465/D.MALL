<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="totalPrice" value="${totalPrice}"/>
<c:set var="totalDcPrice" value="${totalDcPrice}"/>
<c:set var="delPrice" value="${delPrice}"/>
<c:set var="finalPrice" value="${totalPrice-totalDcPrice+delPrice}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="<c:url value='/css/cart.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<form action="/order/order">
<div class="body-frame">
    <div class="page-title-area">
        <h2 class="title-page">장바구니</h2>
        <!-- ---------------------------------------------------1 -->
<%--        <form action="<c:url value='/cart/list'/>" method="get">--%>
<%--            <input type="hidden" value="${loginId}">--%>
<%--        </form>--%>
        <div class="cart-option" id="cart-option">
            <div class="custom-checkbox">
                <input type="checkbox" id="checkAll" class="checkbox checkboxGroup" checked="">
                <label for="checkAll">전체해제</label>
            </div>
            <div style="float: right;">
                <button type="button" id="deleteUserCartList" class="btn-option btn-default"><span>선택삭제</span></button>
                <button type="button" id="deleteAllCartList" class="btn-option btn-default"><span>전체삭제</span></button>
            </div>
        </div>
    </div>
    <!-- ---------------------------------------------------2 -->
<%--    <form id="frm" name="frm" action="/order/order" method="post"><input type="hidden" name="cartType" value="01">--%>
<%--        <input type="hidden" value="${loginId}">--%>
<%--    </form>--%>
<%--    <form id="productCouponForm" name="productCouponForm" action="/order/cart?imageUrl=https%3A%2F%2Ffile.rankingdak.com" method="post">--%>
<%--        <input type="hidden" name="vProductcdArr">--%>
<%--    </form>--%>
    <div class="cart-list-area" id="delivery-group-1600" data-free-delivery-price="20000" data-v-dlv-group-cd="16" data-v-dlv-charge-cd="00" data-v-express-yn="Y" data-v-paid-delivery-yn="N" data-delivery-type="E">
        <!-- ---------------------------------------------------3번 -->
        <ul id="cart" class="cart-list">
                <c:forEach var="cart" items="${list}">
                <li id="list${cart.prodCd}" class="${cart.prodCd}">
                    <div>
                        <input type="checkbox" name="eachcheck" checked="" style="text-decoration: none">
                        ${cart.prodName}
                        <div>
                        <img src="../img/${cart.prodCd}.png" style="width: 100px; height: 100px;">
                        </div>
                        <div class="column qty">
                            <div class="qty-group">
                                <button type="button">
                                    <i class="minusBtn"></i><span class="blind">빼기</span>
                                </button>
                                <input type="text" title="" name="prod-qty" value="${cart.prodQty}" readonly="readonly">
                                <button type="button">
                                    <i class="plusBtn"></i><span class="blind">더하기</span>
                                </button>
                            </div>
                        </div>
                        <div>금액 : ${cart.totSetlPrice * cart.prodQty}원</div>
                        <div>적립 예정 포인트: ${Math.round(cart.totSetlPrice/100)}포인트</div>
                        <div>예상 할인 금액: ${cart.expctDcPrc}원</div>
                        <button type="button" id="delete${cart.prodCd}" class="deleteOne">
                            <i class="ico-x-black"></i><span class="blind">삭제</span>
                        </button>
                    </div>
<%--                        <input type="hidden" id="prod${cart.prodCd}" name="prod" value="${cart}">--%>
<%--                        <input type="text" name="prodCd" value="${cart.prodCd}">--%>
<%--                        <input type="text" name="prodQty" value="${cart.prodQty}">--%>
<%--                        <input type="text" name="prodPrice" value="${cart.totSetlPrice}">--%>
                </li>
            </c:forEach>
        </ul>

        <!-- ---------------------------------------------------5번 -->

        </div>
        <div class="price-info-all">
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">상품금액</dt>
                <dd class="price"><em class="num" id="totalProductPrice">${totalPrice}</em>원</dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">할인금액</dt>
                <dd class="price"><em class="num" id="totalDiscountPrice">${totalDcPrice}</em>원</dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">배송비</dt>
                <dd class="price"><em class="num" id="totalDeliveryPrice">${delPrice}</em>원</dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">총 결제금액</dt>
                <dd class="price">
                    <em class="totalOrderPrice">${finalPrice}</em>원
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

    <div class="btn-bottom-area">
        <a href="<c:url value='/'/>" class="btn-basic-xxlg btn-default-ex"><span>쇼핑계속하기</span></a>
        <input type="submit" class="totalOrderPrice" value="${finalPrice}원 주문하기">
        <input type="hidden" name="prodTotPrice" value="${totalPrice}">
        <input type="hidden" name="prodTotPrice" value="${totalDcPrice}">
        <input type="hidden" name="prodTotPrice" value="${delPrice}">
        <input type="hidden" name="prodTotPrice" value="${finalPrice}">
    </div>
</div>
</form>
<script>
    const allCBox = document.getElementById('checkAll');    // 전체 체크박스
    const eachCBox = Array.from(document.getElementsByName('eachcheck'));   // 개별 체크박스
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

    const selectDelBtn = document.getElementById('deleteUserCartList');     // 선택삭제 버튼
    // const delBtn = document.getElementsByClassName('deleteOne');  // 개별삭제 버튼
    // const delBtnArr = Array.from(delBtn); // 개별삭제버튼 배열화
    const cart = document.getElementById("cart");
    const cartOpt = document.getElementById("cart-option");
    const listhead = document.getElementById("list-head");

    // 장바구니가 비었는지 확인하는 함수
    function isCartEmpty() {
        const items = cart.getElementsByTagName("li");
        return items.length === 0;
    }

    if(isCartEmpty()){
        cart.innerHTML ="<h1 style='text-align:center'>장바구니가 비어있습니다.</h1>";
        cartOpt.style.display = "none";
        listhead.style.display = "none";
    }


    //체크박스가 선택된 곳의 list만 삭제
    selectDelBtn.addEventListener('click', () =>{
        eachCBox.forEach(function(checkbox){
            if(checkbox.checked) {
                let checkList = checkbox.closest('li'); // 가장 가까운 'li' 찾기
                checkList.remove();
                if (isCartEmpty()) {
                    cart.innerHTML ="<h1 style='text-align:center'>장바구니가 비어있습니다.</h1>";
                    cartOpt.style.display = "none";
                    listhead.style.display = "none";
                }
            }
        });
    });

    // 개별삭제 버튼 구현
    // delBtnArr.forEach(button =>{
    //     button.addEventListener('click', () =>{
    //         const product = button.closest('li');
    //         product.remove();
    //         if (isCartEmpty()) {
    //             cart.innerHTML ="<h1 style='text-align:center'>장바구니가 비어있습니다.</h1>";
    //             cartOpt.style.display = "none";
    //             listhead.style.display = "none";
    //         }
    //     });
    // });

    // 빼기, 더하기 기능
    const plus = document.getElementsByClassName("plusBtn");  // 더하기 버튼
    const minus = document.getElementsByClassName("minusBtn");    // 빼기 버튼
    let qtyVal = document.getElementsByName("prod-qty");    // 수량 text

    for(let i=0; i<eachCBox.length; i++){       //  plus
        plus[i].closest('button').addEventListener('click', () =>{
            qtyVal[i].value++;
        });
    }

    for(let i=0; i<eachCBox.length; i++){       // minus
        minus[i].closest('button').addEventListener('click', () =>{
            qtyVal[i].value--;
            if(qtyVal[i].value < 0) qtyVal[i].value=0;  // 음수x
        });
    }

</script>
<script>

    // AJAX로 update, delete 하기     // 상품쪽이 dev에 들어와야 fetch한 후 가능
        let prodlist = Array.from(document.getElementById("cart").children);    // 장바구니 목록의 자식(개별상품 목록)을 배열화
    $(document).ready(function(){
        prodlist.forEach(function(list){
            let prodCd = list.className;    // 상품코드 출력
            let prod = {prodCd : prodCd};   // 상품코드 객체에 담기

            $("#delete"+prodCd).click(function(){
                $.ajax({
                    type:'DELETE',       // 요청 메서드
                    url: '/cart/delete',  // 요청 URI
                    headers : { "content-type": "application/json"}, // 요청 헤더
                    dataType : 'text', // 전송받을 데이터의 타입
                    data : JSON.stringify(prod),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success : function(result){
                        $("#list"+prodCd).remove();
                        if (isCartEmpty()) {
                            cart.innerHTML ="<h1 style='text-align:center'>장바구니가 비어있습니다.</h1>";
                            cartOpt.style.display = "none";
                            listhead.style.display = "none";
                        }   // 서버로부터 응답이 도착하면 호출될 함수
                    },
                    error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                    }); // $.ajax()
                });
            });
        });
</script>
</body>
</html>