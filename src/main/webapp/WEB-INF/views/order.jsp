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
<c:set var="prc" value="${prcInfo}"/>
<c:set var="dlvCnt" value="${dlvList.size()}"/>
<c:if test="${dlvCnt >= 1}">
    <c:set var="dlvOne" value="${dlvList.get(0)}"/>
</c:if>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/order.css'/>">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="orderContent">
    <div class="content-wrap frame-sm">
        <div class="page-title-area">
            <h1 class="title-page">주문/결제</h1>
        </div>

        <div class="order-payment-area">

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
                        <button id="myBtn" class="btn-basic-sm2 btn-default">
                            <span>배송지변경</span><i class="ico-arr-right"></i>
                        </button>
                    </div>


                    <!-- 배송지 변경 모달창 -->
                    <div id="myModal" class="modal" style="display: none">
                        <div id="modal-content" class="modal-content">
                            <div class="layer-wrap onload" id="popup-myAddress" style="display:block;">
                                <div id="userDeliveryList" class="layer-pop dlv-addr-pop hideLayers" style="display: block">
                                    <div class="layer-inner">
                                        <div class="layer-head">
                                            <h4 class="layer-pop-title">배송지 목록</h4>
                                            <button type="button" id="addDlvBtn" class="btn-basic-sm btn-default-ex" data-v-deliveryid="new" data-func="defaultForm">
                                                <i class="ico-plus"></i><span>신규 배송지 추가</span>
                                            </button>
                                        </div>

                                        <div id="dlvList" class="layer-content">
                                            <div class="inner">
                                                <div class="scroll-area ui-custom-scroll mCustomScrollbar _mCS_2 mCS_no_scrollbar">
                                                    <div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                                                    <ul id="dlvAddrList" class="dlv-addr-list">
                                                        <c:forEach var="dlv" items="${dlvList}">
                                                            <li>
                                                                <div class="custom-radio">
                                                                    <input type="radio" id="dlvNo${dlv.addrNo}" class="radio" name="vDeliveryid" value="${dlv.addrNo}" checked="checked">
                                                                    <label for="dlvNo${dlv.addrNo}">
                                                                        <span class="name">${dlv.rcpr}</span>
                                                                        <em class="badge-sm-navy">기본배송지</em><em class="imgbadge-dlv-exp"></em>
                                                                        <span class="addr-txt">${dlv.dlvAddr} ${dlv.dtlAddr}</span>
                                                                        <span class="phoneNumber" style="display: none">${dlv.mpNo}</span>
                                                                    </label>
                                                                </div><!--// custom-radio -->
                                                                <div class="bottom-line">
                                                                    <p class="tel">${dlv.mpNo}</p>
                                                                    <div class="btn-area">
                                                                        <button type="button" class="btn-option btn-default"><span>수정</span></button>
                                                                        <button type="button" class="btn-option btn-default"><span>삭제</span></button>
                                                                    </div>
                                                                </div><!--// bottom-line -->
                                                            </li>
                                                        </c:forEach>
                                                    </ul><!--// dlv-addr-list -->
                                                    <!-- paging -->
                                                    <div class="pagination">
                                                    </div>
                                                    <!--// paging -->
                                                </div>
                                                    </div>
                                                </div><!--// scroll-area -->
                                            </div>
                                        </div><!--// layer-content -->

                                        <div class="layer-bottom type-shadow">
                                            <div class="btn-area">
                                                <button type="button" id="cfmBtn" class="btn-basic-lg2 btn-black w-full"><span>확인</span></button>
                                            </div>
                                        </div><!--// layer-bottom -->

                                        <button type="button" id="closeBtn" class="btn-x-md2 ui-close-pop" title=""><i class="ico-x-black"></i><span class="blind">닫기</span></button>
                                    </div><!--// layer-inner -->
                                </div>

                            </div>
                            <form id="userDeliveryForm" name="userDeliveryForm"  action="/order/order/userDeliveryList" method="post">
                                <div id="userDeliveryDiv" class="layer-pop dlv-addr-pop hideLayers" style="display: none;">
                                    <div class="layer-inner">
                                        <div class="layer-head">
                                            <h4 class="layer-pop-title" id="popTitle">배송지 추가</h4>
                                        </div>

                                        <div class="layer-content">
                                            <div class="inner">
                                                <div class="lineless-table type2" style="border: none">
                                                    <table>
                                                        <caption>정보 입력</caption>
                                                        <colgroup>
                                                            <col style="width:70px">
                                                            <col>
                                                        </colgroup>
                                                        <tbody>
                                                        <tr>
                                                            <th scope="row">받는분 <em class="es"><span class="blind">필수입력</span></em></th>
                                                            <td>
                                                                <input type="text" id="vRcpr" name="vDeliveryNm" title="" class="input-text w-full removeEmoji" placeholder="받는분 입력" value="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">배송지명</th>
                                                            <td>
                                                                <input type="text" id="vDlvName" name="vDeliveryNm" title="" class="input-text w-full removeEmoji" placeholder="배송지명 입력" value="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">주소 <em class="es"><span class="blind">필수입력</span></em></th>
                                                            <td>
                                                                <div class="input-group">
                                                                    <input type="text" id="vPostcd" name="vPostcd" title="" class="input-text" placeholder="우편번호" readonly="readonly" value="">
                                                                    <span class="input-group-btn">
                                                                        <a href="#" id="PostNo" class="btn-ex-white"><span>우편번호 찾기</span></a>
                                                                    </span>
                                                                </div>
                                                                <div class="input-group w-full">
                                                                    <input type="text" id="vAddr" name="vAddr" title="" class="input-text" placeholder="기본주소" readonly="readonly" value="">
                                                                </div>
                                                                <div class="input-group w-full">
                                                                    <input type="text" id="vAddrDtl" name="vAddrDtl" title="" class="input-text removeEmoji" placeholder="상세주소" value="" maxlength="80">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">휴대폰 <em class="es"><span class="blind">필수입력</span></em></th>
                                                            <td>
                                                                <div class="input-group w-full">
                                                                    <input type="text" id="mpNo" name="vDeliveryTel" title="" class="input-text w-full" value="" maxlength="11" placeholder="숫자만 입력">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"></th>
                                                            <td>
                                                                <div class="custom-checkbox">
                                                                    <input type="checkbox" id="vBasicDlvYn" class="checkbox" name="vBasicDlvYn" value="">
                                                                    <label for="vBasicDlvYn"> 기본배송지로 등록</label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div><!--// layer-content -->

                                        <div class="layer-bottom">
                                            <div class="btn-area">
                                                <button type="button" class="btn-basic-lg2 btn-grey3 closeDiv"><span>취소</span></button>
                                                <button type="button" id="addAddr" class="btn-basic-lg2 btn-black"><span>확인</span></button>
                                            </div>
                                        </div><!--// layer-bottom -->

                                        <button type="button" class="btn-x-md2 ui-close-pop closeDiv" title=""><i class="ico-x-black"></i><span class="blind">닫기</span></button>
                                    </div><!--// layer-inner -->
                                </div>
                            </form>
                            <div id="userPostNo" class="userPostNo" style="display: none">
                                <div class="layer-inner">
                                    <div class="layer-head">
                                        <h4 class="layer-pop-title">우편번호 검색</h4>
                                    </div>
                                    <div id="postCd-body" class="postCd-body" ></div>
                                    <button type="button" class="btn-x-md2 ui-close-pop" title=""><i class="ico-x-black"></i><span class="blind">닫기</span></button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="lineless-table type1">
                            <div id="addressPresent" style="display: ${dlvCnt >= 1 ? 'block' : 'none'}">
                                <table id="hasAddr" >
                                    <caption>배송지 정보</caption>
                                    <colgroup>
                                        <col style="width:115px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">받는분</th>
                                        <td id="rcpr">${dlvOne.rcpr}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">주소</th>
                                        <td id="addr">(${dlvOne.zpcd})&nbsp;${dlvOne.dlvAddr}&nbsp; ${dlvOne.dtlAddr}&nbsp;<em class="badge-point" style="display: inline-block">기본배송지</em></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">휴대전화</th>
                                        <td id="phone">${dlvOne.mpNo}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>


                            <div id="addressAbsent" style="display: ${dlvCnt >= 1 ? 'none' : 'block'}">
                                <div id="noAddr" style="text-align: center">
                                    <h4>배송지를 추가해주세요</h4>
                                </div>
                            </div>
                    </div>
                </div>



                <div id="userOrderList" class="user-order-list">
                    <div class="list-head">
                        <h3 class="title-list">주문 상품</h3>
                    </div>
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

            <div class="dlv-request-box" id="expReqBox" style="display: block">

                <div class="inner-div">
                    <div class="request-detail">
                        <div class="epx-m-chk-con">
                            <h4 for="epx-m-chk1" class="custom-label">배송요청사항</h4>
                            <select id="deliveryRequest">
                                <option value="option1">-- 메시지 선택 (선택사항) --</option>
                                <option value="option2">배송 전에 미리 연락바랍니다.</option>
                                <option value="option3">부재 시 경비실에 맡겨주세요.</option>
                                <option value="option4">부재 시 문 앞에 놓아주세요.</option>
                                <option value="option5">빠른 배송 부탁드립니다.</option>
                                <option value="option6">택배함에 보관해 주세요.</option>
                                <option value="custom">직접 입력</option>
                            </select>
                            <div id="customRequest" class="custom-radio s-li s-li1" style="display: none">
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
                                <input type="text" title="" class="input-text ui-point-input" id="textUsePoint" name="tex용tUsePoint" placeholder="2,000P부터 사용가능">
                                <span class="input-group-btn">
                                        <button type="button" class="btn-x-xs btn-input-del" title=""><i class="ico-x-normal"></i><span class="blind">삭제</span></button>
                                        <button type="button" id="pntBtn" class="btn-ex-grey"><span>적용</span></button>
                                    </span>
                            </div>
                        </div><!--// input-group-wrap -->
                        <p class="point-guide">사용 가능 포인트 <em class="text-num-bold">${pointResult} </em>P</p>     <!-- 07/ 29 mhs 포인트 추가 -->
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

    document.getElementById('deliveryRequest').addEventListener('change', function() {
        if (this.value === 'custom') {
            document.getElementById('customRequest').style.display = 'block';
        } else {
            document.getElementById('customRequest').style.display = 'none';
        }
    });

    // 모달을 얻어온다.
    const modal = document.getElementById("myModal");

    // 모달을 여는 버튼의 요소를 얻어온다.
    const btn = document.getElementById("myBtn");

    // 모달 창을 닫는 요소의 엘리먼트를 가져온다.
    const xBtn = Array.from(document.querySelectorAll(".ui-close-pop"));

    const cfmBtn = document.querySelector("#cfmBtn")

    // 모달을 여는 버튼을 클릭하면 모달을 보여준다.(default = display.none)
    btn.onclick = function() {
        modal.style.display = "block";
    }


    // <span> x 를 클릭하면 모달창을 닫는다.
    xBtn.forEach(btn => {
        btn.onclick = function () {
            modal.style.display = "none";
            resetDlv();
        }
    })

    const addBtn = document.querySelector("#addDlvBtn");
    addBtn.addEventListener('click', () => {
        document.getElementById('popup-myAddress').style.display = 'none';
        document.getElementById('userDeliveryDiv').style.display = 'block';
    });

    let resetDlv =function() {
        document.getElementById('popup-myAddress').style.display = 'block';
        document.getElementById('userDeliveryDiv').style.display = 'none';
        document.getElementById('userPostNo').style.display = 'none';
    };

    // 우편번호 버튼
    const findPostNo = document.getElementById("PostNo");

    // 우편번호 팝업을 담을 div요소
    const postCdContent = document.getElementById("postCd-body");

    const postCd = document.getElementById('vPostcd');
    const dlvAddr = document.getElementById('vAddr');

    // 배송지 변경하기
    findPostNo.addEventListener('click', () => {
        document.getElementById('userDeliveryDiv').style.display = 'none';
        document.getElementById('userPostNo').style.display = 'block';

        // 우편번호 api
        new daum.Postcode({
            oncomplete: function(data) {
                let mainAddr = '';

                postCd.value = data.zonecode;

                if(data.userSelectedType === 'R') {
                    mainAddr = data.roadAddress + ' (' + data.buildingName + ')';
                } else {
                    mainAddr = data.jibunAddress + ' (' + data.buildingName + ')';
                }

                dlvAddr.value = mainAddr;

                returnDlv();
            }
        }).embed(postCdContent);
    })

    function returnDlv() {
        if(postCd.value !== ''){
            document.getElementById('userPostNo').style.display = 'none';
            document.getElementById('userDeliveryDiv').style.display = 'block';
        }
    }

    document.getElementById('pntBtn').addEventListener('click', function() {
        let usePnt = document.getElementById('textUsePoint').value;
        let dcPrc = ${prc.totDcPrc} + usePnt;
        let totPrc = ${prc.totPrc} - dcPrc + ${prc.dlvPrc};
        let totPnt = Math.floor(totPrc / 100);
        document.querySelector('#totalDiscountPrice').innerHTML = parseInt(dcPrc).toLocaleString();
        document.querySelector('#txt_tot_pg_price').innerHTML = parseInt(totPrc).toLocaleString();
        document.querySelector('#txt_btn_payment').innerHTML = parseInt(totPrc).toLocaleString();
        document.querySelector('#totalSavePointTot').innerHTML = parseInt(totPnt).toLocaleString();
    });




        $('#kakaoPay').click(function(){
            let dlvMsg = $('#dlvMsg'.valueOf())
            let usePnt = document.getElementById('textUsePoint').value;
            let totDcPrc = ${prc.totDcPrc} + usePnt;

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
                        data: JSON.stringify({ordCd: tid, totDcPrc: totDcPrc, dlvMsg: dlvMsg.val()}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success: function(response){
                            alert('주문이 완료되었습니다.')
                        },
                        error: function(error) {
                            alert('주문 중 오류가 발생하였습니다.');
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


        $('#addAddr').click(function() {

            let rcpr = $('#vRcpr').val();
            let dlvpn = $('#vDlvName').val();
            let postCd = $('#vPostcd').val();
            let dlvAddr = $('#vAddr').val();
            let dtlAddr = $('#vAddrDtl').val();
            let mpNo = $('#mpNo').val();
            let basicYn = $('#vBasicDlvYn').prop('checked') ? 'T' : 'F';

            let dlvAddrDto = { rcpr: rcpr, dlvpn: dlvpn, zpcd: postCd, dlvAddr: dlvAddr, dtlAddr: dtlAddr, mpNo: mpNo, basicYn: basicYn};

            $.ajax({
                url: '/order/addDlvAddr',
                method: 'POST',
                headers: {"content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify(dlvAddrDto),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function(response){


                        let ulElement = document.querySelector('.dlv-addr-list'); // UL 태그 선택

                        // 새로운 LI 태그 생성
                        let newLi = document.createElement('li');

                        // LI 태그 내부 HTML 구조 작성
                        newLi.innerHTML = `
                          <div class="custom-radio">
                            <input type="radio" id="dlvNo" class="radio" name="vDeliveryid" value="20220424000000916645">
                            <label for="dlvNo">
                              <span class="name">${response.rcpr}</span>
                              <em class="badge-sm-navy">기본배송지</em><em class="imgbadge-dlv-exp">
                            </em>
                              <span class="addr-txt">${response.dlvAddr} ${response.dtlAddr}</span>
                            </label>
                          </div>
                          <div class="bottom-line">
                            <p class="tel">${response.mpNo}</p>
                            <div class="btn-area">
                              <button type="button" class="btn-option btn-default"><span>수정</span></button>
                              <button type="button" class="btn-option btn-default"><span>삭제</span></button>
                            </div>
                          </div>
                        `;


                        // LI 태그 UL의 자식 요소로 추가
                        ulElement.appendChild(newLi);

                    alert('배송지 등록이 완료되었습니다.');

                        // 모달 부분만 새로고침 (함수 다시 연결)
                    $("#modal-content").load(location.href + ' #popup-myAddress', function (){
                        Array.from(document.querySelectorAll(".ui-close-pop")).forEach(btn => {
                            btn.onclick = function () {
                                modal.style.display = "none";
                                resetDlv();
                            }
                        })

                        document.querySelector("#addDlvBtn").addEventListener('click', () => {
                            document.getElementById('popup-myAddress').style.display = 'none';
                            document.getElementById('userDeliveryDiv').style.display = 'block';
                        })

                                // 시간이 없어 하드코딩 -> 3차때 고칠 예정
                                $("#cfmBtn").click(function () {
                                    modal.style.display = "none";

                                    if ($('#dlvAddrList').childElementCount !== 0) {
                                        let addrNo = parseInt(document.querySelector('.radio:checked').value);

                                        console.log(addrNo)

                                        $.ajax({
                                            url: '/order/modifyDlvAddr',
                                            method: 'PATCH',
                                            headers: {"content-type": "application/json"}, // 요청 헤더
                                            data: JSON.stringify({addrNo: addrNo}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                                            success: function (result) {
                                                let name = result.rcpr;
                                                let zpcd = result.zpcd;
                                                let dlvAddr = result.dlvAddr;
                                                let dtlAddr = result.dtlAddr
                                                let addr = '(' + zpcd + ') ' + dlvAddr + ' ' + dtlAddr;
                                                let mpNo = result.mpNo;

                                                $('#rcpr').text(name);
                                                $('#addr').text(addr);
                                                $('#phone').text(mpNo);

                                                $('#addressAbsent').hide();
                                                $('#addressPresent').show();
                                            },
                                            error: function () {
                                                alert('등록에 실패했습니다.')
                                            }
                                        });
                                    }
                                });
                    });

                },
                error: function() {
                    alert('등록에 실패했습니다.')
                }
            });
        })

    // $("#cfmBtn").click(showDlv());
</script>
</body>
</html>