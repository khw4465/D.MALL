<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<div class="layer-wrap onload" id="popup-myAddress" style="display:block;">
    <div id="userDeliveryList" class="layer-pop dlv-addr-pop hideLayers" style="display: block">
        <div class="layer-inner">
            <div class="layer-head">
                <h4 class="layer-pop-title">배송지 목록</h4>
                <button type="button" id="addDlvBtn" class="btn-basic-sm btn-default-ex" data-v-deliveryid="new" data-func="defaultForm">
                    <i class="ico-plus"></i><span>신규 배송지 추가</span>
                </button>
            </div>

            <div class="layer-content">
                <div class="inner">
                    <div class="scroll-area ui-custom-scroll mCustomScrollbar _mCS_2 mCS_no_scrollbar"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                        <ul class="dlv-addr-list">
                            <c:forEach var="dlv" items="${dlvAddr}">
                                <li>
                                    <div class="custom-radio">
                                        <input type="radio" id="dlvNo${dlv.addrNo}" class="radio" name="vDeliveryid" value="20220424000000916645" checked="checked">
                                        <label for="dlvNo${dlv.addrNo}">
                                            <span class="name">${dlv.rcpr}</span>
                                            <em class="badge-sm-navy">기본배송지</em><em class="imgbadge-dlv-exp"></em>
                                            <span class="addr-txt">${dlv.dlvAddr} ${dlv.dtlAddr}</span>
                                        </label>
                                    </div><!--// custom-radio -->
                                    <div class="bottom-line">
                                        <p class="tel">${dlv.mpno}</p>
                                        <div class="btn-area">
                                            <button type="button" class="btn-option btn-default"><span>수정</span></button>
                                        </div>
                                    </div><!--// bottom-line -->
                                </li>
                            </c:forEach>
                        </ul><!--// dlv-addr-list -->
                        <!-- paging -->
                        <div class="pagination">
                        </div>
                        <!--// paging -->
                    </div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 0px; height: 0px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 0px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div><!--// scroll-area -->
                </div>
            </div><!--// layer-content -->

            <div class="layer-bottom type-shadow">
                <div class="btn-area">
                    <button type="button" class="btn-basic-lg2 btn-black w-full" onclick="addrReturn();"><span>확인</span></button>
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
                                    <input type="text" name="vDeliveryNm" title="" class="input-text w-full removeEmoji" placeholder="받는 분 입력" value="">
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
                                        <input type="text" name="vAddrDtl" title="" class="input-text removeEmoji" placeholder="상세주소" value="" maxlength="80">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">휴대폰 <em class="es"><span class="blind">필수입력</span></em></th>
                                <td>
                                    <div class="input-group w-full">
                                        <input type="text" name="vDeliveryTel" title="" class="input-text w-full" value="" maxlength="11" placeholder="숫자만 입력해주세요." >
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">전화번호</th>
                                <td>
                                    <div class="input-group w-full">
                                        <input type="text" name="vDeliveryTel" title="" class="input-text w-full" value="" maxlength="11" >
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td>
                                    <div class="custom-checkbox">
                                        <input type="checkbox" id="check-101" class="checkbox" name="vBasicDlvYn" value="">
                                        <label for="check-101"> 기본배송지로 등록</label>
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
                    <button type="button" class="btn-basic-lg2 btn-black" onclick="save();"><span>확인</span></button>
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
<script>
    // 모달을 얻어온다.
    const modal = document.getElementById("myModal");

    // 모달을 여는 버튼의 요소를 얻어온다.
    const btn = document.getElementById("myBtn");

    // 모달 창을 닫는 요소의 엘리먼트를 가져온다.
    const xBtn = Array.from(document.querySelectorAll(".ui-close-pop"));

    // 모달을 여는 버튼을 클릭하면 모달을 보여준다.(default = display.none)
    btn.onclick = function () {
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

    findPostNo.addEventListener('click', () => {
        document.getElementById('userDeliveryDiv').style.display = 'none';
        document.getElementById('userPostNo').style.display = 'block';
        new daum.Postcode({
            oncomplete: function(data) {
                let mainAddr = '';

                postCd.value = data.zonecode;

                if(data.userSelectedType === 'R') {
                    mainAddr = data.roadAddress;
                } else {
                    mainAddr = data.jibunAddress;
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
</script>
