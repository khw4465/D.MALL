<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%><html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<c:set var="cust" value="${custInfo}"/>
<c:set var="dlv" value="${dlvList}"/>
<c:set var="prc" value="${prcInfo}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <link rel="stylesheet" href="<c:url value='/css/main2.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/order.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="orderContent">
    <div class="content-wrap frame-sm">
        <div class="page-title-area">
            <h2 class="title-page">주문/결제</h2>
        </div>

        <div class="order-payment-area">
            <input type="hidden" id="holidayDlvFlag" value="Y">
            <form id="ordFrm" name="ordFrm" action="/order/order" method="post">

                <div class="order-info" id="orderUserInfo">
                    <div class="list-head">
                        <h3 class="title-list">주문자 정보</h3>
                    </div><!--// list-head -->

                    <!-- 회원일때 -->
                    <div class="order-address">
                        <ul class="info-txt">
                            <li><c:out value="${custInfo.name}" /></li>
                            <li><c:out value="${custInfo.mpNo}" /></li>
                            <li><c:out value="${custInfo.email}" /></li>
                        </ul>
                        <a href="/mypage/info/mypage" class="text-primary">
                            <span>주문자 정보변경</span><i class="ico-arr-right"></i>
                        </a>
                    </div>

                    <div class="list-head-sub">
                        <h3 class="title-list">배송지 정보</h3>
                        <a href="javascript:void(0);" class="btn-basic-sm2 btn-default">
                            <span>배송지변경</span><i class="ico-arr-right"></i>
                        </a>
                    </div>

                    <div class="lineless-table type1">
                        <table>
                            <caption>배송지 정보</caption>
                            <colgroup>
                                <col style="width:115px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">받는분</th>
                                <td><c:out value="${dlv.rcpr}" /></td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td>(<c:out value="${dlv.zpcd}" />) <c:out value="${dlv.dlvAddr}" /> <c:out value="${dlv.dtlAddr}" />&nbsp;<em class="badge-point" style="display: inline-block">기본배송지</em></td>
                            </tr>
                            <tr>
                                <th scope="row">휴대전화</th>
                                <td><c:out value="${dlv.mpNo}" /></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="userOrderList" class="user-order-list">
                    <div class="list-head">
                        <h3 class="title-list">주문 상품</h3>
                    </div>
                    <div class="delivery-guide type02" id="delivery-guide-1600"><div class="type02-inner"><p class="txt"></p></div></div>
                    <ul class="cart-list">
                        <c:forEach var="cart" items="${cartList}">
                            <li>
                                <div class="prd-info-area">
                                    <input type="hidden" class="vProductCd" value="${cart.prodCd}">
                                    <div class="column img">
                                        <img src="/img/${cart.prodCd}.png" alt="상품이미지" style="height: 100px; width: 100px">
                                    </div>
                                    <div class="column tit">
                                        <p class="prod-desc">${cart.prodName}</p>
                                        <c:forEach var="opt" items="${optLists.get(cartList.indexOf(cart))}" varStatus="i">
                                            <div class="prd-info-area option-line">
                                                <div class="inner">
                                                    <div class="column tit">
                                                        <p class="desc">${opt.optName}</p>
                                                        <ul class="price-item">
                                                            <li><span class="num"><fmt:formatNumber value="${opt.optPrice}" type="number" pattern="#,###"/></span>원</li>
                                                            <li><span class="num">${opt.optQty}</span>개</li>
                                                        </ul>
                                                    </div>
                                                    <div class="column price w70">
                                                        <span class="num"><fmt:formatNumber value="${opt.totOptPrice}" type="number" pattern="#,###"/></span>원
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </form>

            <div class="dlv-request-box" id="expReqBox" style="display: block">

                <div class="inner-div">
                    <div class="request-detail">
                        <div class="epx-m-chk-con">
                            <div class="custom-radio s-li s-li1">
                                <h4 for="epx-m-chk1" class="custom-label">배송요청사항</h4>
                                <p id="express-memo-p" style=""><input type="text" name="expressMemo01" id="dlvMsg" class="input-text epx-txt" placeholder="예) 문 앞에 두고 벨 눌러주세요." maxlength="300"><span class="notice">· 요청사항을 입력해주세요.</span></p>
                            </div>
                        </div>

                    </div><!--// request-detail -->
                </div><!--// inner-div -->
            </div>

    <div class="lineless-table type1">
        <h3 class="title-list">포인트 / 쿠폰 사용</h3>
        <table>
            <caption>쿠폰/할인 사용</caption>
            <colgroup>
                <col style="width:190px">
                <col>
            </colgroup>
            <tbody>
            <tr>
                <th scope="row"><span class="tit">포인트 사용</span></th>
                <td>
                    <div class="order-point">
                        <div class="input-group-wrap box-type">
                            <div class="input-group">
                                <!-- 현재 보유 포인트 -->
                                <input type="text" title="" class="input-text ui-point-input" id="textUsePoint" name="textUsePoint" placeholder="2,000P부터 사용가능" onkeydown="return numberOnly(event)" onkeyup="removeChar(event)" onblur="fnUsePoint()">
                                <span class="input-group-btn">
                                        <button type="button" class="btn-x-xs btn-input-del" title=""><i class="ico-x-normal"></i><span class="blind">삭제</span></button>
                                        <button type="button" class="btn-ex-grey" onclick="fnUsePoint('all')"><span>전액사용</span></button>
                                    </span>
                            </div>
                        </div><!--// input-group-wrap -->
                        <p class="point-guide">사용 가능 포인트 <em class="text-num-bold">0</em>P</p>
                    </div><!--// order-point -->
                </td>
            </tr>
            <tr>
                <th scope="row"><span class="tit">쿠폰 사용</span></th>
                <td>
                    <div class="order-point">
                        <div class="input-group-wrap box-type">
                            <div class="input-group">
                                <input type="text" title="" class="input-text" id="text_use_coupon" readonly="">
                                <span class="input-group-btn">
                                        <a href="#popup-coupon" class="btn-ex-grey cpn_select_btn"><span>쿠폰선택</span></a>
                                    </span>
                            </div><!--// input-group -->
                        </div>
                        <p class="point-guide">사용 가능한 쿠폰<em class="text-num-bold" id="userCouponCount">0</em>개</p>
                    </div><!--// order-point -->
                </td>
            </tr>
            </tbody>
        </table>
    </div>

        </div>
    </div>

    <div class="side-fix-area fixed">
        <div class="payment-info-box ui-box-fix" style="top: 1439.22px;">
            <h3 class="tit">주문결제 금액</h3>
            <div class="order-price">
                <ul class="div-price">
                    <li>
                        <div class="list-inner">
                            <span class="tit">상품금액</span>
                            <p class="price">
                                <strong class="num resetOrderPaySide" id="txt_tot_price"><fmt:formatNumber value="${prc.totPrc}" type="number" pattern="#,###"/></strong> 원
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="list-inner">
                            <span class="tit">할인금액</span>
                            <p class="price">
                                <strong class="num resetOrderPaySide" id="totalDiscountPrice"><fmt:formatNumber value="${prc.totDcPrc}" type="number" pattern="#,###"/></strong> 원
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="list-inner">
                            <span class="tit">배송비</span>
                            <p class="price">
                                <strong class="num resetOrderPaySide" id="txt_tot_dlv_price"><fmt:formatNumber value="${prc.dlvPrc}" type="number" pattern="#,###"/></strong> 원
                            </p>
                        </div>
                    </li>
                </ul>
                <div class="total-price" style="padding:20px 0;">
                    <div class="list-inner">
                        <span class="tit">최종 결제금액</span>
                        <div class="price">
                            <strong class="num text-primary resetOrderPaySide" id="txt_tot_pg_price"><fmt:formatNumber value="${prc.finPrc}" type="number" pattern="#,###"/></strong> 원
                        </div>
                    </div>
                </div>
            </div><!--// order-price -->
            <div class="point-container-box">
                <ul class="list-sub-inner">
                    <li><span class="tit">적립예정 포인트</span><span class="txt"><span id="totalSavePointTot"><c:out value="${Math.round(prc.totPrc/100)}" /></span>P</span></li>
                </ul>
            </div>
            <ul class="terms-view">
                <li>
                    <a href="#popup-terms-type-04" class="ui-open-pop" onclick="return false;">
                        <span class="txt">처리위탁 및 3자 제공 동의</span>
                        <span class="view">내용보기<i class="ico-arrfill-right"></i></span>
                    </a>
                </li>

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
            </ul>
            <div class="check-area">
                <div class="custom-checkbox">
                    <input type="checkbox" id="checkTerms" class="checkbox" name="check_terms" data-nonmember-yn="N">
                    <label for="checkTerms">상기 필수약관을 확인하였으며<br>결제에 동의합니다.</label>
                </div>
            </div>
            <button type="button" id="kakaoPay" class="btn-basic-xlg btn-primary">
                <span class="num"><span id="txt_btn_payment" class="resetOrderPaySide"><fmt:formatNumber value="${prc.finPrc}" type="number" pattern="#,###"/></span>원 결제하기</span>
            </button>
        </div> <!--// payment-info-box -->
    </div>
</div>
</div>

<jsp:include page="footer.jsp"/>

<script>
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        let childElement = document.getElementsByClassName("side-fix-area")[0];
        childElement.style.top = window.scrollY + "px";
    }

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
                        method: 'POST',     // post를 안적었더니 에러남..  URL이 order/complete?ordCd=~~~&dlvMsg=~~~ 형식이라 그런듯
                        headers: {"content-type": "application/json"}, // 요청 헤더
                        dataType: 'text', // 전송받을 데이터의 타입
                        data: JSON.stringify({ordCd: tid, dlvMsg: dlvMsg.val()}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success: function(response){
                            alert('주문이 완료되었습니다.')
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