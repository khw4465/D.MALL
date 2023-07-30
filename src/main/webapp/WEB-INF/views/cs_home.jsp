<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-06-30
  Time: 오후 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>CS_Home</title>
    <link rel="stylesheet" href="<c:url value='/css/csmain.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main1.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main2.css'/>">
</head>

<body>
<jsp:include page="header.jsp"/>
<div class="clear"></div>

<%--여기가 메인--%>

<!-- 고객센터 메뉴바-->
<section id="contents" class="container">

    <div class="content-wrap frame-sm">
        <div class="page-title-area">
            <h2 class="title-page"><a href="/cs">고객센터</a></h2>
        </div>
        <div class="frame-wrap">
            <div class="frame-left">
                <div class="aside-menu-wrap">
                    <nav class="aside-menu">
                        <ul class="menu-list">
                            <li><a href="/notc/list" class="menu">공지사항</a></li>
                            <li><a href="/user/list" class="menu">이용안내</a></li>
                            <li><a href="/faq/list" class="menu">자주묻는 FAQ</a></li>

                        </ul>
                    </nav><!--// aside-menu -->
<%----%>
                    <div class="aside-guide-box">
                        <dl>
                            <dt>드가자몰 고객센터</dt>
                            <dd class="phone-num">02-1234-1234</dd>
                            <dd>평일 <span class="text-num-md">09:00 ~ 18:00</span></dd>
                            <dd>주말, 공휴일 휴무</dd>
                        </dl>
                        <dl>
                            <dt>실시간 채팅 상담</dt>
                            <dd>평일 <span class="text-num-md">09:00 ~ 21:00</span></dd>
                            <dd>토요일 <span class="text-num-md">09:00 ~ 15:00</span></dd>
                            <dd>일요일 <span class="text-num-md">13:00 ~ 21:00</span></dd>
                        </dl>
                    </div><!--// aside-guide-box -->
                </div><!--// aside-menu-wrap -->
            </div><!--// frame-left -->
            <div class="frame-right">
                <div class="frame-cnt-inner">

                        <div class="list-title-area">
                            <h3 class="title-list-type2">이용안내</h3>
                            <a href="/user/list" class="btn-link-txt2"><span>전체보기</span><i class="ico-arr-right"></i></a>
                        </div>
                        <div class="use-guide">
                            <button class="accordion">주문취소 방법</button>
                            <div class="panel"><br>
                                <p>드가자몰은 주문 완료 후 빠른 출고를 위해 구매 내역에서 취소가 불가합니다.<br><br>

                                    주문 취소를 원하시는 경우 1:1 문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후 안내드리겠습니다.<br><br>

                                    업무시간 이후의 경우 실시간 채팅 또는 1:1문의에 남겨주시면 순차적으로 답변 드리겠습니다</p><br>
                            </div>

                            <button class="accordion">한가지 제품만 왔을 경우</button>
                            <div class="panel"><br>
                                <p>이용에 불편드려서 죄송합니다.<br><br>


                                    1. 누락- 누락된 상품과 수량을 게시판이나 고객센터(02-1234-1234)로 연락주시면 바로 출고하도록 하겠습니다.<br><br>


                                    2. 오배송- 오배송된상품의경우 오배송된 상품사진을 게시판에 첨부해주시거나 고객센타로 연락주시면 바로 주문하신상품으로 출고하도록 하겠습니다.<br><br>


                                    오배송된상품은 신선식품으로 회수되지 않으니 가능하시면 맛있게 섭취부탁드립니다(브랜드별 일부제외)<br><br>


                                    "드가자몰에서 판매되는 제품은 각 브랜드 별로만 묶음 배송이 가능합니다. 주문시에 다른 브랜드의 제품 두가지를 주문하셨을 경우 브랜드에서 직접 출고되기 때문에 각각 따로 다른 배송사로 배송처리 됩니다."</p><br>
                            </div>

                            <button class="accordion">로그인이 안될때 </button>
                            <div class="panel">
                                <br>
                                <p>[로그인] 페이지 아이디/패스워드 입력란의 우측 하단 [아이디/비밀번호찾기]를 이용하시면 아이디 및 비밀번호를 확인/변경 하실 수 있습니다.<br><br>


                                    1. [로그인] 페이지로 이동<br><br>

                                    2. 아이디/패스워드 입력란의 우측하단 [아이디/비밀번호 찾기] 버튼 클릭<br><br>

                                    3. 휴대폰 번호 입력 인증번호 받기<br><br>

                                    4. 인증번호 입력<br><br>

                                    5. 인증 후 비밀번호 변경<br><br>


                                    위 방법으로도 로그인이 되지 않는 경우 고객센터(02-1234-1234)로 연락주시면 정보 확인 후 임시 비밀번호를 발급해 드립니다.</p><br>
                            </div>

                            <button class="accordion">현금 영수중 발행 방법</button>
                            <div class="panel">
                                <br>
                                <p>아래 방법중 택일하여 진행해 주시면 됩니다.</p>
                                    <br>
                                    <p>1. 마이페이지 -> 무통장입금 및 계좌이체로 결제하신 주문서 내역(주문번호) 클릭 -> 하단 현금영수증란 현금 영수증 발급 버튼 클릭 ->
                                        용도에 따라 소득공제용&지출증빙용(사업자) 선택 -> 정보 입력후 발급버튼을 클릭.</p>
                                    <br>
                                    <p>2. 1:1 문의 게시판 또는 드가자몰 고객센터(02-1234-1234)로 연락주시면 질문에 대한 답변 드리고 발급 진행해 드립니다</p><br>
                            </div>

                            <button class="accordion">쿠폰발행받는 방법</button>
                            <div class="panel">
                                <br>
                                <p>어플을 설치하시고 로그인 상태에서 다시한번 로그아웃을 해주시고, 재로그인을 해주시면 자동으로 쿠폰이 발급됩니다!</p>

                                <br>
                                <p>마이페이지 > 쿠폰 > 사용가능쿠폰 에서 확인이 가능합니다.</p>

                                <br>
                                <p>* 재로그인시 쿠폰목록에서 확인이 안되시는경우 고객센터로 문의주시면 확인 후 빠른 처리 도와드리겠습니다.</p>
                                <br>
                            </div>

                        </div><!--// use-guide -->
                        <br>
                        <div class="list-title-area">
                            <h3 class="title-list-type2">자주묻는 FAQ TOP5</h3>
                            <a href="/faq/list" class="btn-link-txt2"><span>전체보기</span><i class="ico-arr-right"></i></a>
                        </div>
                    <div class="use-guide">
                        <button class="accordion">구매한 제품의 옵션을 변경하고 싶어요</button>
                        <div class="panel"><br>
                            <p>주문완료 후 옵션 변경은 불가합니다.<br><br>
                                주문 취소 후 재 주문을 해주셔야합니다.<br><br>
                                주문은 실시간으로 확인 후 출고가 진행되기 때문에 취소 가능여부는 고객센터로 연락주셔서 확인 부탁드립니다.</p><br>
                        </div>

                        <button class="accordion">제품을 잘못 선택했습니다. 교환 or 반품이 가능한가요?</button>
                        <div class="panel"><br>
                            <p>냉장, 냉동 식품의 경우 변심에 의한 교환, 반품이 어렵습니다. 식품 특성상 회수 입고 후 전량 폐기가 되는 품목이기 때문에 교환, 반품 접수가 어려운 점 이용에 참고 바랍니다.</p><br>
                        </div>

                        <button class="accordion">정기배송은 언제 결제되나요?</button>
                        <div class="panel"><br>
                            <p>정기배송은 출고일에  오전10시에 자동 결제 됩니다.<br><br>

                                결제 실패 시 오전 11시에 추가 결제를 진행하며,<br>
                                최종 결제 실패 시 정오 12시에 알림톡을 발송해드리고 있습니다.<br><br>

                                결제 실패 주문 건은 당일에 한해 새 카드 등록 후 재결제 가능합니다.</p><br>
                        </div>

                        <button class="accordion">정기배송 가능한 상품이 따로 있나요?</button>
                        <div class="panel"><br>
                            <p>제품 페이지에 정기배송 아이콘을 확인 부탁드립니다.</p><br>
                        </div>

                        <button class="accordion">상품이 주문한 것과 다르게 배송되었습니다.</button>
                        <div class="panel"><br>
                            <p>이용에 불편을 드려 죄송합니다.<br>
                                받으신 제품의 사진을 찍어 1:1문의, 실시간채팅, 고객센터로 연락주시면 확인 후 안내드리겠습니다.<br>
                                (※누락, 오배송의 경우 상품 수령 후 2주 이내에 교환 가능합니다.)</p><br>
                        </div>

                    </div><!--// use-guide -->

                        <div class="grid-area-span2 gap30">
                            <div class="colum">
                                <div class="list-title-area">
                                    <h3 class="title-list-type2">공지사항</h3>
                                    <a href="/notc/list" class="btn-link-txt2"><span>전체보기</span><i class="ico-arr-right"></i></a>
                                </div>
                                <div class="board-list">
                                    <table>
                                        <caption>문의내역</caption>
                                        <colgroup>
                                            <col style="width:auto"><col style="width:90px">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <td class="text-left">
                                                <a href="/service/notice/view?noticeId=20230524000000000160" class="text-elps">공지사항 1번</a>
                                            </td>
                                            <td class="text-center"><span class="text-guide-sm">공지사항 1번 날자</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <a href="/service/notice/view?noticeId=20230426000000000157" class="text-elps">공지사항 2번</a>
                                            </td>
                                            <td class="text-center"><span class="text-guide-sm">공지사항 2번 날자</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <a href="/service/notice/view?noticeId=20230619000000000163" class="text-elps">공지사항 3번</a>
                                            </td>
                                            <td class="text-center"><span class="text-guide-sm">공지사항 3번 날자</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <a href="/service/notice/view?noticeId=20230605000000000162" class="text-elps">공지사항 4번</a>
                                            <td class="text-center"><span class="text-guide-sm">공지사항 4번 날자</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <a href="/service/notice/view?noticeId=20230531000000000161" class="text-elps">공지사항 5번</a>
                                            </td>
                                            <td class="text-center"><span class="text-guide-sm">공지사항 5번 날자</span></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div><!--// board-list -->
                            </div><!--// colum -->
                            <div class="colum">
                                <div class="customer-info-box">
                                    <ul class="info-list">
                                        <li>
                                            <a href="" onclick="checkLogin('/mypage/userCounsel/regCouncel');">
                                                <img src="svg/people.svg">
                                                <span class="txt">1:1문의</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" onclick="ht.open(); return false;">
                                                <img src="svg/cs_chat.svg">
                                                <span class="txt">실시간 채팅</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" onclick="checkLogin('/service/voc');">
                                                <img src="svg/cs_speaker.svg">
                                                <span class="txt">고객의 소리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="inner-box">
                                        <strong class="tel">02-1234-1234</strong>
                                        <ul class="time-list">
                                            <li class="text-grey">평일 <span class="time">09:00 ~ 18:00</span></li>
                                            <li class="text-grey3">점심 <span class="time">12:00 ~ 13:00</span></li>
                                        </ul>
                                        <p class="txt text-grey">주말, 휴일에는 실시간 채팅 상담을 이용해주세요.</p>
                                    </div>
                                </div><!--// customer-info-box -->
                            </div><!--// colum -->
                        </div><!--// grid-area-span2 -->

                </div>
            </div>
        </div><!--frame-wrap-->
    </div><!--// content-wrap -->
</section>

<!-- W3school에서 가져오는 FAQ와 이용안내에 사용할 코드-->

<!-- 여기서부터 자바 스크립트-->
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
</script>
</body>
</html>
