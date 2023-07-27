<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : '/register/modify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" href="<c:url value='/css/myPage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/myPageSideBar.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/main2.css'/>">
</head>
<body>
<!-- 전체 div -->

<jsp:include page="header.jsp"/>

<div id="header_warp" style="height: 248px;"></div>
<div id="" class="content">
    <!-- 그다음 div -->
    <jsp:include page="myPageSideBar.jsp"/>
    <form id="form" action="/" method="get">
    </form>
    <div class="right-content">
        <div class="">
            <!-- 중간에 다른 박스에 담길 내용들 -->
            <div id="points-container">
                <ul id="points-info" class="item-list">
                    <li class="points-item">포인트 : <a href="<c:url value='/point/custSelectAll'/>"><span id="points"
                                                                                                        class="points-info">${pointResult}</span></a>
                    </li>
                    <li class="points-item">쿠폰 : <a href=""><span id="coupon" class="points-info">1개</span></a></li>
                </ul>
            </div>
        </div>
        <!-- 박스 아래에 붙일 포인트 -->
        <div class="point-list">
            <div class="point-item">
                <ul>
                    <li class="point">
                        <span class="point-value"><span id="total-point">${pointResult}</span> </span>
                        <strong class="point-type">보유 포인트</strong>
                    </li>
                    <li class="point">
                        <span class="point-value"><span id="normal-point">1,000원(주문포인트)</span>&nbsp;</span>
                        <strong class="point-type">일반 포인트</strong>
                    </li>
                    <li class="point">
                        <span class="point-value"><span id="special-point">${pointResult}</span></span>
                        <strong class="point-type">특별 포인트</strong>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 그 아래에 붙일 div -->
        <div class="order-status">
            <div class="status-header">
                <h3>나의 주문처리 현황
                    <span class="time-frame">(최근 <em class="months">3개월</em> 기준)</span>
                </h3>
            </div>
            <!-- 이 div 는 box처리할거임 -->
            <div class="status-content">
                <ul class="status-list">
                    <li class="status-item">
                        <a href="" class="status-link"><span id="prepayment-count">0</span></a>
                        <strong class="status-name">입금전</strong>
                    </li>
                    <li class="status-item">
                        <a href="" class="status-link"><span id="preparing-count">0</span></a>
                        <strong class="status-name">배송준비중</strong>
                    </li>
                    <li class="status-item">
                        <a href="" class="status-link"><span id="shipping-count">0</span></a>
                        <strong class="status-name">배송중</strong>
                    </li>
                    <li class="status-item">
                        <a href="" class="status-link"><span id="delivered-count">0</span></a>
                        <strong class="status-name">배송완료</strong>
                    </li>
                </ul>
                <!-- 박스 안의 오른쪽에 붙일 내용 -->
                <ul class="status-list">
                    <li class="status-item">
                        <strong class="status-name">취소</strong>
                        <a href="" class="status-link"><span id="canceled-count">0</span></a>
                    </li>
                    <li class="status-item">
                        <strong class="status-name">교환</strong>
                        <a href="" class="status-link"><span id="exchanged-count">0</span></a>
                    </li>
                    <li class="status-item">
                        <strong class="status-name">반품</strong>
                        <a href="" class="status-link"><span id="returned-count">0</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 맨 아래에 배치시킬 div -->
        <div class="recently-viewed">
            <div class="recently-header">
                <h3>최근본상품</h3>
            </div>
            <div class="recently-content">
                <div class="recently-item">
                </div>
                <p class="no-item">최근본 상품 내역이 없습니다.</p>
            </div>
        </div>

    </div>
</div>

<jsp:include page="footer.jsp"/>

<script>
    //  let gomain = document.getElementById("form");
    // 회원탈퇴 로직 시작
    //     $(document).ready(function(){
    //         $('#delete-button').click(function(e){
    //             e.preventDefault();  // 기본 링크 클릭 동작을 방지합니다.
    //
    //             $.ajax({
    //                 url: '/deleteCust',  // 스프링 컨트롤러 메서드가 매핑된 URL
    //                 type: 'POST',
    //                 data: {memberId: 'exampleId'},  // 탈퇴하려는 회원의 ID
    //                 success: function(result){
    //                     // 성공 응답을 받으면 alert 출력
    //                         gomain.submit();
    //                     alert("탈퇴에 성공했습니다");
    //                 //히든으로 폼 만들어두고 성공하면 그게 클릭되게
    //                 },
    //                 error: function(){
    //                     alert("회원 탈퇴에 실패하였습니다.");
    //                 }
    //             });
    //         });
    //     });
    //     회원탈퇴 로직 끝
</script>
</body>

</html>
