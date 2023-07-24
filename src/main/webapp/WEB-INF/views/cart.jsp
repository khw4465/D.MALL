<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="ord" value="${ord}" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="<c:url value='/css/cart.css'/>">
    <style>
        .qtyTag button,
        .qtyTag input {
            padding: 0px;
            margin: 0px;
            width: 20px;
            height: 20px;
            border: none;
            text-align: center;
        }
        .qtyTag input {
            border-right: 1px solid black;
            border-left: 1px solid black;
        }
        .qtyTag {
            border: 1px solid black;
            margin: 0 50px;
        }
        .totTag input {
            width: 50px;
        }
        .totTag button {
            width: 20px;
            height: 20px;
            border: 1px solid black;
        }
        button {
            background-color: white;
        }
    </style>
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
                    <button type="button" id="removeCheck" class="btn-option btn-default"><span>선택삭제</span></button>
                    <button type="button" id="removeAll" class="btn-option btn-default"><span>전체삭제</span></button>
                </div>
            </div>
        </div>
        <ul id="cart" class="cart-list">
            <c:forEach var="cart" items="${cartList}">
                <li id="list${cart.prodCd}" class="${cart.prodCd}">
                    <div>
                        <input type="checkbox" class="CBox${cart.prodCd}" name="eachcheck" checked="" style="text-decoration: none">
                        <table class="box">
                            <tbody>
                                <tr>
                                    <th>
                                        <img src="/img/${cart.prodCd}.png" style="width: 100px; height: 100px;">
                                    </th>
                                    <td>
                                        <h4 class="prod${cart.prodCd}">${cart.prodName}</h4>
                                        <ul class="opt${cart.prodCd}" id="">
                                            <c:forEach var="opt" items="${optLists.get(cartList.indexOf(cart))}" varStatus="i">
                                                <li id="list${opt.prodCd}_${opt.optCd}" class="${opt.optCd}">
                                                    <dl style="display: inline-block">
                                                        <dt style="text-align: center">${opt.optName}</dt>
                                                        <dt style="text-align: center" class="onePrc${opt.prodCd}_${opt.optCd}">${opt.optPrice}원</dt>
                                                    </dl>
                                                    <div style="display: inline-block; margin-left: 280px">
                                                        <div class="qtyTag" style="display: inline-block;">
                                                            <button type="button" id="minus${opt.prodCd}_${opt.optCd}">
                                                                <i class="fa-solid fa-minus"></i><input type="hidden" value=-1>
                                                            </button><input type="text" class="${opt.prodCd}_${opt.optCd}_qty" name="prod-qty" value="${opt.optQty}" readonly="readonly"><button type="button" id="plus${opt.prodCd}_${opt.optCd}">
                                                                <i class="fa-solid fa-plus"></i><input type="hidden" value=1>
                                                            </button>
                                                        </div>
                                                        <div class="totTag" style="display: inline-block">
                                                            <span><input class="${opt.prodCd}_${opt.optCd}_totPrice" value="${opt.totOptPrice}" style="text-align: right; border: none">원</span>
                                                            <button type="button" id="delete${opt.prodCd}_${opt.optCd}" class="deleteOne" style="text-align: right">
                                                                <i class="fa-solid fa-xmark"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div style="text-align: center">총 상품 금액 : <em class="totPrc${cart.prodCd}">${cart.totProdPrice}</em>원</div>
                        <div style="text-align: center">적립 포인트 : <em class="totPnt${cart.prodCd}">${Math.round(cart.totProdPrice/100)}</em>p</div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div id="priceInfo" class="price-info-all" style="display: ">
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">상품금액</dt>
                <dd class="price">
                    <em class="totPrc"><c:out value="${ord.totPrc}" /></em>원
                </dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">할인금액</dt>
                <dd class="price">
                    <em class="totDcPrc"><c:out value="${ord.totDcPrc}" /></em>원
                </dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">배송비</dt>
                <dd class="price">
                    <em class="dlvPrc"><c:out value="${ord.dlvPrc}" /></em>원
                </dd>
            </dl>
        </div>
        <div class="colum">
            <dl class="price-info">
                <dt class="tit">총 결제금액</dt>
                <dd class="price">
                    <em class="finPrc"><c:out value="${ord.finPrc}" /></em>원
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
            <input type="hidden" id="totPrc" name="totPrc" value="<c:out value="${ord.totPrc}" />">
            <input type="hidden" id="totDcPrc" name="totDcPrc" value="<c:out value="${ord.totDcPrc}" />">
            <input type="hidden" id="dlvPrc" name="dlvPrc" value="<c:out value="${ord.dlvPrc}" />">
            <input type="hidden" id="finPrc" name="finPrc" value="<c:out value="${ord.finPrc}" />">
            <a herf="<c:url value='/order/order'/>" id="orderBtn"><input type="submit" class="totalOrderPrice" id="totalOrderPrice" value="<c:out value="${ord.finPrc}" />원 주문하기"></a>
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
    const cart = document.getElementById("cart");
    const cartOpt = document.getElementById("cart-option");
    // const listhead = document.getElementById("list-head");
    const priceInfo = document.getElementById('priceInfo');
    const ordBtn = document.getElementById('totalOrderPrice');

    // 장바구니가 비었는지 확인하는 함수
    function isCartEmpty() {
        const items = cart.getElementsByTagName("li");
        return items.length === 0;
    }

    function emptyCartMsg() {
        if (isCartEmpty()) {
            cart.innerHTML = "<h1 style='text-align:center'>장바구니가 비어있습니다.</h1>"; // 장바구니가 비었을 때 나타내는 메시지
            cartOpt.style.display = 'none';
            // listhead.style.display = 'none';
            priceInfo.style.display = 'none';
            ordBtn.style.display = 'none';
        }
    }


    // //체크박스가 선택된 곳의 list만 삭제
    // selectDelBtn.addEventListener('click', () =>{
    //     eachCBox.forEach(function(checkbox){
    //         if(checkbox.checked) {
    //             let checkList = checkbox.closest('li'); // 가장 가까운 'li' 찾기
    //             checkList.remove();
    //             emptyCartMsg();
    //         }
    //     });
    // });

    // // 개별삭제 버튼 구현
    // delBtnArr.forEach(button =>{
    //     button.addEventListener('click', () =>{
    //         const product = button.closest('li');
    //         product.remove();
    //         emptyCartMsg();
    //     });
    // }) ;

    //  빼기, 더하기 기능
    // const plus = document.getElementsByClassName("plusBtn");  // 더하기 버튼
    // const minus = document.getElementsByClassName("minusBtn");    // 빼기 버튼
    // let qtyVal = document.getElementsByName("prod-qty");    // 수량 text
    //
    //
    //
    // for(let i=0; i<eachCBox.length; i++){       //  plus
    //     plus[i].closest('button').addEventListener('click', throttle(() =>{
    //         qtyVal[i].value++;
    //     },700));
    // }
    //
    // for(let i=0; i<eachCBox.length; i++){       // minus
    //     minus[i].closest('button').addEventListener('click', () => {
    //         qtyVal[i].value--;
    //         if (qtyVal[i].value < 1) qtyVal[i].value = 1;  // 음수x
    //     });
    // }


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

    // AJAX
    $(document).ready(function() {

        emptyCartMsg();

        let totPrc = parseInt(document.getElementsByClassName('totPrc')[0].innerText);       // 모든 상품의 가격을 합한 금액
        let totDcPrc = parseInt(document.getElementsByClassName('totDcPrc')[0].innerText);      // 각각의 할인 금액을 모두 더한 금액
        let dlvPrc = parseInt(document.getElementsByClassName('dlvPrc')[0].innerText);         // 배송비
        let finPrc = parseInt(document.getElementsByClassName('finPrc')[0].innerText);   // 위의 3개의 가격을 계산한 최종 금액

        let prodlist = Array.from(document.getElementById("cart").children);       // 장바구니 목록의 자식(개별상품 목록)을 배열화

        let prodCd;                         // 상품코드 출력
        let prodOpt;                        // 상품의 옵션을 묶어놓은 ul태그
        let prodQty = 0;                    // 상품 수량
        let totProdPrc = 0;                 // 상품별 최종가격


        // let optCd;
        prodlist.forEach(function (cartList) {                               // 장바구니에서 상품을 하나씩 뽑아냄
            const prodCd = cartList.className;
            prodOpt = cartList.getElementsByClassName('opt' + prodCd)[0];

            const optlist = Array.from(prodOpt.children);                    // 상품의 옵션을 배열화

            optlist.forEach(function (optList) {                             // 각 상품에서 옵션을 하나씩 뽑아냄
                const optCd = optList.className;                             // 상품 옵션코드
                let optVal = 0;
                let optQty = 0;
                let totOptPrice = 0;
                let optPrice = 0;

                // 개별 delete
                $("#delete" + prodCd + '_' + optCd).click(function () {
                    optVal = document.querySelector('.' + prodCd + '_' + optCd + '_qty');                                 // 옵션 수량
                    totProdPrc = parseInt(document.getElementsByClassName('totPrc' + prodCd)[0].innerText);
                    optQty = parseInt(optVal.value);                                                                      // 옵션 수량
                    totOptPrice = document.querySelector('.' + prodCd + '_' + optCd + '_totPrice').value;                 // 옵션별 총 금액
                    optPrice = parseInt(document.getElementsByClassName('onePrc' + prodCd + '_' + optCd) [0].innerText);  // 옵션 개당 금액

                    console.log('hi'+prodCd+'.'+optCd);
                    let cartOptDto = {prodCd: prodCd, optCd: optCd, optQty: optQty, optPrice: optPrice, totOptPrice: totOptPrice};   // 상품코드 객체에 담기
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

                            let point = Math.round(totOptPrice / 100);

                            console.log('totPRodPrc = ' + totProdPrc);
                            console.log('totOptPrc = ' + totOptPrice);
                            totProdPrc -= totOptPrice;
                            console.log('totPRodPrc = ' + totProdPrc);
                            totPrc -= totOptPrice
                            dlvPrc = totPrc > 30000 ? 0 : 3000;
                            finPrc = totPrc - totDcPrc + dlvPrc;

                            $('.totPrc' + prodCd).html(totProdPrc);   // 상품별 총 금액 업데이트
                            $('.totPnt' + prodCd).html(point)       // 상품별 총 포인트
                            $('.totPrc').html(totPrc);              // 총 상품금액 업데이트
                            $('.totDcPrc').html(totDcPrc);          // 총 할인금액 업데이트
                            $('.dlvPrc').html(dlvPrc);              // 배송비 업데이트
                            $('.finPrc').html(finPrc);              // 최종금액 업데이트
                            $('.totalOrderPrice').html(finPrc + '원 주문하기');
                        },
                        error: function () {
                            alert("error")
                        } // 에러가 발생했을 때, 호출될 함수
                    }); // $.ajax()
                });


                //  modify --1
                $("#minus" + prodCd + '_' + optCd).click(function () {

                    optVal = document.querySelector('.' + prodCd + '_' + optCd + '_qty');                               // 옵션 수량
                    optQty = parseInt(optVal.value);                                                                    // 옵션 수량
                    totOptPrice = parseInt(document.querySelector('.' + prodCd + '_' + optCd + '_totPrice').value);     // 옵션별 총 금액
                    totProdPrc = parseInt(document.getElementsByClassName('totPrc' + prodCd)[0].innerText);             // 상품 별 금액
                    optPrice = parseInt(document.getElementsByClassName('onePrc' + prodCd + '_' + optCd)[0].innerText); // 옵션 개당 금액


                    if (optQty > 1) {      // 수량이 1 아래로 떨어지지 않게
                        --optQty;
                        totOptPrice -= optPrice;
                        totProdPrc -= optPrice;
                        totPrc -= optPrice


                        let cartOptDto = {prodCd: prodCd, optCd: optCd, optQty: optQty, totOptPrice: totOptPrice};
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

                                let point = Math.round(totProdPrc / 100);
                                dlvPrc = totPrc > 30000 ? 0 : 3000;
                                finPrc = totPrc - totDcPrc + dlvPrc;

                                optVal.value = qty;
                                $('.' + prodCd + '_' + optCd + '_totPrice')[0].value = prc;
                                $('.totPrc' + prodCd).html(totProdPrc);   // 상품별 총 금액 업데이트
                                $('.totPnt' + prodCd).html(point)       // 상품별 총 포인트
                                $('.totPrc').html(totPrc);              // 총 상품금액 업데이트
                                $('.totDcPrc').html(totDcPrc);          // 총 할인금액 업데이트
                                $('.dlvPrc').html(dlvPrc);              // 배송비 업데이트
                                $('.finPrc').html(finPrc);              // 최종금액 업데이트
                                $('.totalOrderPrice').html(finPrc + '원 주문하기');
                            },
                            error: function () {
                                alert("error")
                            } // 에러가 발생했을 때, 호출될 함수
                        });
                    }
                });


                // modify ++1
                $("#plus" + prodCd + '_' + optCd).click(function () {

                    optVal = document.querySelector('.' + prodCd + '_' + optCd + '_qty');     // 옵션 수량
                    optQty = parseInt(optVal.value);                             // 옵션 수량
                    totOptPrice = parseInt(document.querySelector('.' + prodCd + '_' + optCd + '_totPrice').value);         // 옵션별 총 금액
                    totProdPrc = parseInt(document.getElementsByClassName('totPrc' + prodCd)[0].innerText);                 // 상품 별 금액
                    optPrice = parseInt(document.getElementsByClassName('onePrc' + prodCd + '_' + optCd) [0].innerText);    // 옵션 개당 금액


                    ++optQty;  // 개수 + 1
                    totOptPrice += optPrice;
                    totProdPrc += optPrice;
                    totPrc += optPrice


                    let cartOptDto = {prodCd: prodCd, optCd: optCd, optQty: optQty, totOptPrice: totOptPrice};
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

                            let point = Math.round(totProdPrc / 100);
                            dlvPrc = totPrc > 30000 ? 0 : 3000;
                            finPrc = totPrc - totDcPrc + dlvPrc;

                            optVal.value = qty;
                            $('.' + prodCd + '_' + optCd + '_totPrice')[0].value = prc;
                            $('.totPrc' + prodCd).html(totProdPrc);   // 상품별 총 금액 업데이트
                            $('.totPnt' + prodCd).html(point)       // 상품별 총 포인트
                            $('.totPrc').html(totPrc);              // 총 상품금액 업데이트
                            $('.totDcPrc').html(totDcPrc);          // 총 할인금액 업데이트
                            $('.dlvPrc').html(dlvPrc);              // 배송비 업데이트
                            $('.finPrc').html(finPrc);              // 최종금액 업데이트
                            $('.totalOrderPrice').html(finPrc + '원 주문하기');
                        },
                        error: function () {
                            alert("error")
                        } // 에러가 발생했을 때, 호출될 함수
                    });
                });




            });

            // 전체 delete
            $("#removeAll").click(function () {
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/cart/removeAll',  // 요청 URI
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    dataType: 'text', // 전송받을 데이터의 타입
                    success: function (result) {  // 서버로부터 응답이 도착하면 호출될 함수
                        $('#cart').children()[0].remove()
                        emptyCartMsg();
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            });
            // 선택 delete
            $("#removeCheck").click(function () {
                const selectedProdCds = [];
                totProdPrc = 0;
                const checkboxes = document.querySelectorAll('[type="checkbox"][class^="CBox"]:checked')
                checkboxes.forEach(function (checkbox) {
                    const prodCd = checkbox.classList[0].substring(4);
                    selectedProdCds.push(prodCd);
                    const optPrices = document.querySelectorAll('.totPrc' + prodCd);
                    optPrices.forEach(function (optPriceElem) {
                        totProdPrc += parseInt(optPriceElem.innerHTML);
                    });
                    const jsonData = JSON.stringify({prodCds: selectedProdCds})
                    $.ajax({
                        type: 'DELETE',       // 요청 메서드
                        url: '/cart/removeChecks',  // 요청 URI
                        headers: {"content-type": "application/json"}, // 요청 헤더
                        dataType: 'json', // 전송받을 데이터의 타입
                        data: jsonData,  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success: function (result) {  // 서버로부터 응답이 도착하면 호출될 함수
                            for (let i = 0; i < selectedProdCds.length; i++) {
                                // console.log(selectedProdCds[i])
                                document.querySelector("#list" + selectedProdCds[i]).remove();
                            }
                            emptyCartMsg();

                            totPrc -= totProdPrc
                            dlvPrc = totPrc > 30000 ? 0 : 3000;
                            finPrc = totPrc - totDcPrc + dlvPrc;

                            $('.totPrc').html(totPrc);              // 총 상품금액 업데이트
                            $('.totDcPrc').html(totDcPrc);          // 총 할인금액 업데이트
                            $('.dlvPrc').html(dlvPrc);              // 배송비 업데이트
                            $('.finPrc').html(finPrc);              // 최종금액 업데이트
                            $('.totalOrderPrice').html(finPrc + '원 주문하기');
                        },
                        error: function () { alert("error"); } // 에러가 발생했을 때, 호출될 함수
                    }); // $.ajax()
                });
            });
        });
    });


</script>

</body>
</html>
