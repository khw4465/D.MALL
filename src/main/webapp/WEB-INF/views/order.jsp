<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%><html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="cust" value="${custInfo}"/>
<c:set var="dlv" value="${dlvList}"/>
<c:set var="prc" value="${prcInfo}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <link rel="stylesheet" href="<c:url value='/css/order.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>

<%--    <script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>--%>
<%--    <!-- 토스페이먼츠 -->--%>
<%--    <script src="https://js.tosspayments.com/v1"></script>--%>
<%--    <!-- 네이버페이 -->--%>
<%--    <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>--%>
<%--    <!-- 스마일페이 -->--%>
<%--    <script src="https://pg.cnspay.co.kr/dlp/scripts/smilepay.js" charset="euc-kr"></script>--%>
    <div class="n-section-block">
    <div class="order-info" id="or derUserInfo">
        <div class="n-table-title">
            <h2 class="title-list">주문자 정보</h2>
        </div><!--// list-head -->
        <!-- 회원일때 -->
        <div class="order-address">
            <ul class="info-txt">
                <li><c:out value="${custInfo.name}" /></li>
                <li><c:out value="${custInfo.mpNo}" /></li>
                <li><c:out value="${custInfo.email}" /></li>
            </ul>
            <a href="/mypage/info/mypage" class="text-primary"><span>주문자 정보변경</span><i class="ico-arr-right"></i></a>

        </div>
    </div>
        <!-- 회원일때 -->
        <div>
            <header class="n-table-title">
                <h2>배송지 정보</h2>
            </header>
            <table class="box">
                <tbody>
                <tr>
                    <th>수령인</th>
                    <td><c:out value="${dlv.rcpr}" /></td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td><c:out value="${dlv.mpNo}" /></td>
                </tr>
                <tr>
                    <th>배송지 주소</th>
                    <td>(<c:out value="${dlv.zpcd}" />) <c:out value="${dlv.dlvAddr}" /> <c:out value="${dlv.dtlAddr}" /></td>
                </tr>
                </tbody>
            </table>
            <ul class="info">
                <li>배송시작전 일때만 배송지 주소를 변경하실 수 있습니다</li>
            </ul>
        </div>

        <div>
            <div class="n-table-title">
                <h2 class="title-list">주문상품 목록</h2>
            </div>
            <c:forEach var="cart" items="${list}">
                <li style="list-style-type: none">
                    <div>
                        <span>
                            <img src="../img/${cart.prodCd}.png" style="width: 100px; height: 100px;">
                        </span>
                        <span class="column qty" style="display: inline-block">
                            <div>${cart.prodName}</div>
                            <div>${cart.prodQty}개</div>
                            <div>${cart.totSetlPrice * cart.prodQty}원</div>
                        </span>
                    </div>
                </li>
            </c:forEach>
        </div>
        <div>
            <div>
                <h2>배송 요청사항</h2>
                    <input type="text" id="dlvMsg" placeholder="메시지를 입력해 주세요." style="width: 300px; height: 50px" >
            </div>
        </div>
        <div id="payTool">
            <div class="category" name="categ"><button id="card"><strong><i class="fa-regular fa-credit-card"></i>신용카드</strong></button></div>
            <div class="category" name="categ"><button id="deposit"><strong><i class="fa-regular fa-money-bill-1"></i>무통장입금</strong></button></div>
            <div class="category" name="categ"><button id="accTransfer"><strong><i class="fa-solid fa-arrow-right-arrow-left"></i>실시간 계좌이체</strong></button></div>
            <div class="category" name="categ"><button id="mobile"><strong><i class="fa-solid fa-mobile-screen-button"></i>휴대폰 결제</strong></button></div>
            <div class="category"><button id="kakaoPay"><strong>카카오페이</strong></button></div>
            <div class="category" name="categ"><button id="naverPay"><strong>네이버페이</strong></button></div>
            <div class="category" name="categ"><button id="tossPay"><strong>토스페이</strong></button></div>
            <div class="category" name="categ"><button id="payco"><strong>페이코</strong></button></div>
        </div>
    </div>
<div class="payment-info-box">
    <h3 class="tit">주문결제 금액</h3>
    <div class="order-price">
        <ul class="div-price">
            <li>
                <div class="list-inner">
                    <span class="tit">상품금액</span>
                    <p class="price"><strong class="num resetOrderPaySide" id="txt_tot_price"><c:out value="${prc.totPrc}" /></strong> 원
                        <span class="text-guide-sm" id="txt_add_cold_price" style="display:none">(보냉제 추가 <span id="totalIcePackPrice"></span>원 포함)</span>
                    </p>
                    <input type="hidden" name="tot_price" class="resetOrderPaySide" value="39800"></div>
            </li>
            <!-- [Dev] 20210608 추가 -->
            <li>
                <div class="list-inner">
                    <span class="tit">할인금액</span>
                    <p class="price"><strong class="num resetOrderPaySide" id="totalDiscountPrice"><c:out value="${prc.totDcPrc}" /></strong> 원</p>
                </div>
                <ul class="list-sub-inner">
                    <li id="pointDiscount" class="discountType" style="display: none;"><span class="tit">포인트할인</span><span class="txt"><span id="txt_use_point" class="resetOrderPaySide">0</span>원</span></li>
                    <li id="productCouponDiscount" class="discountType" style="display: none;"><span class="tit">상품쿠폰할인</span><span class="txt"><span id="txt_sale_coupon" class="resetOrderPaySide">0</span>원</span></li>
                    <li id="orderCouponDiscount" class="discountType" style="display: none;"><span class="tit">주문쿠폰할인</span><span class="txt"><span id="txt_sale_order_coupon" class="resetOrderPaySide">0</span>원</span></li>
                    <li id="deliveryCouponDiscount" class="discountType" style="display: none;"><span class="tit">배송비쿠폰할인</span><span class="txt"><span id="txt_sale_dlv_coupon" class="resetOrderPaySide">0</span>원</span></li>
                    <li id="orangeDiscount" class="discountType" style="display: none;"><span class="tit">오렌지멤버스 할인</span><span class="txt"><span id="txt_sale_grade" class="resetOrderPaySide"></span>원</span></li>
                </ul>
            </li>
            <!--// [Dev] 20210608 추가 -->
            <li>
                <div class="list-inner">
                    <span class="tit">배송비</span>
                    <p class="price">
                        <strong class="num resetOrderPaySide" id="txt_tot_dlv_price"><c:out value="${prc.dlvPrc}" /></strong> 원
                    </p>
                    <input type="hidden" name="tot_dlv_price" class="resetOrderPaySide" value="3000"></div>
                <p class="text-guide-sm" id="txt_island" style="display: none">(도서산간 배송비 포함)</p>
            </li>
        </ul>
        <div class="total-price" style="padding:20px 0;">
            <div class="list-inner">
                <span class="tit">총 결제금액</span>
                <div class="price">
                    <strong class="num text-primary resetOrderPaySide" id="txt_tot_pg_price"><c:out value="${prc.finPrc}" /></strong> 원
                    <input type="hidden" name="tot_pg_price" class="resetOrderPaySide" value="42800">
                </div>
            </div>
        </div>
    </div><!--// order-price -->
    <div class="point-container-box">
        <ul class="list-sub-inner">
            <li><span class="tit">적립예정 포인트</span><span class="txt"><span id="totalSavePointTot"><c:out value="${prc.totPrc}/100" /></span>P</span></li>
        </ul>
    </div>
    <ul class="terms-view">
        <!-- wnsgml351 인수인계 추가 - 오렌지멤버스인 경우 오렌지멤버스 약관동의 보이게 수정 -->
        <!-- wnsgml351 인수인계 추가 - 오렌지멤버스인 경우 오렌지멤버스 약관동의 보이게 수정 -->
        <!-- wnsgml351 인수인계 추가 - 처리위탁 및 3자 제공동의 추가 -->
        <li>
            <a href="#popup-terms-type-04" class="ui-open-pop" onclick="return false;">
                <span class="txt">처리위탁 및 3자 제공 동의</span>
                <span class="view">내용보기<i class="ico-arrfill-right"></i></span>
            </a>
        </li>
        <!-- wnsgml351 인수인계 추가 - 처리위탁 및 3자 제공동의 추가 -->
        <li>
            <a href="#popup-terms-type-02" class="ui-open-pop" onclick="return false;">
                <span class="txt">결제대행서비스 이용 동의</span>
                <span class="view">내용보기<i class="ico-arrfill-right"></i></span>
            </a>
        </li>

        <li>
            <a href="#popup-terms-type-14" class="ui-open-pop" onclick="return false;">
                <span class="txt">개인정보 수집 및 이용 동의</span>
                <span class="view">내용보기<i class="ico-arrfill-right"></i></span>
            </a>
        </li>
    </ul><!--// terms-view -->
    <div class="check-area">
        <div class="custom-checkbox">
            <!-- wnsgml351 인수인계 추가 - 비회원일때 이용약관 체크시 결제정보 팝업 나오는 부분 안 나오게 처리 -->
            <input type="checkbox" id="checkTerms" class="checkbox" name="check_terms" data-nonmember-yn="N">
            <label for="checkTerms">상기 필수약관을 확인하였으며<br>결제에 동의합니다.</label>
        </div>

        <div class="final-info-box">
            <div class="inner">
                <ul class="list">
                    <li id="payType" class="final-info-box-reset"></li>
                    <li id="divCardInst" class="final-info-box-reset"></li>
                    <li><span id="totPgPrice" class="final-info-box-reset"></span>원</li>
                </ul>
                <p class="address final-info-box-reset" id="address"></p>
                <a class="link-txt" id="dlvLocationSaveBtn" href="javascript:void(0);" onclick="openUserDeliveryListPop();"><span>배송지변경</span><i class="ico-arr-right"></i></a>
            </div>
            <button class="btn-x-sm3" type="button"><i class="ico-x-white"></i><span class="blind">닫기</span></button>
        </div>

    </div>
    <button type="button" class="btn-basic-xlg btn-primary" onclick="fnCheckOrder()">
        <span class="num"><span id="txt_btn_payment" class="resetOrderPaySide"><c:out value="${prc.finPrc}" /></span>원 결제하기</span>
    </button>
</div>
<script>
        $('#kakaoPay').click(function(){
            let dlvMsg = $('#dlvMsg'.valueOf())
            $.ajax({
                url: '/order/kakao',  // 요청 URI
                dataType : 'json', // 전송받을 데이터의 타입
                success:function (data){
                    let tid = data.tid; // 주문코드로 쓸 tid
                    // alert(tid);
                    $.ajax({
                        url: '/order/list',
                        method: 'POST',     // post를 안적었더니 에러남..  URL이 order/list?ordCd=~~~&dlvMsg=~~~ 형식이라 그런듯
                        headers: {"content-type": "application/json"}, // 요청 헤더
                        dataType: 'text', // 전송받을 데이터의 타입
                        data: JSON.stringify({ordCd: tid, dlvMsg: dlvMsg.val()}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success: function(response){
                            // alert('주문이 완료되었습니다.')
                        },
                        error: function(error) {
                            alert('주문 중 오류가 발생하였습니다.');
                            console.log(error);
                        }
                    });

                    let url = data.next_redirect_pc_url;
                    window.location.replace(url);

                },
                error:function (error){
                    alert(error);
                }
            })
        })
</script>
</body>
</html>