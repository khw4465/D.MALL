<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<head>
    <meta charset="UTF-8">
    <title>Order</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/adminOrd.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">

</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">
    <jsp:include page="adminSideBar.jsp"/>

    <div class="right-list">

        <div class="use-guide">
            <h3><a href="">주문 관리</a></h3>
            <table>
                <colgroup>
                    <col style="width:5%">
                    <col style="width:5%">
                    <col style="width:8%">
                    <col style="width:10%">
                    <col style="width:15%">
                    <col style="width:12%">
                    <col style="width:11%">
                    <col style="width:11%">
                    <col style="width:24%">
                    <col style="width:6%">
                </colgroup>
                <thead>
                <tr>
                    <th class="select" scope="col">선택</th>
                    <th scope="col">번호</th>
                    <th scope="col">구매자명</th>
                    <th scope="col">구매자 ID</th>
                    <th scope="col">주문번호</th>
                    <th scope="col">주문일시</th>
                    <th scope="col">주문상태</th>
                    <th scope="col">상품번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">수량</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${list}">
                    <tr>
                        <td class="check"><input type="checkbox" class="CBox${list.seq}"></td>
                        <td>${list.seq}</td>
                        <td>${list.custName}</td>
                        <td>${list.custId}</td>
                        <td class="none-center">${list.ordCd}</td>
                        <td class="td-weak"><fmt:formatDate value="${list.ordDttm}" pattern="yyyy-MM-dd"/></td>
                        <td class="td-weak">${list.ordStus}</td>
                        <td class="td-weak">${list.mainProdCd}</td>
                        <td class="td-weak">${list.prodName}</td>
                        <td class="td-weak">${list.totProdCnt}개</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <br>

            <!-- 핸들러 -->
            <div id="handle">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 주문 이력이 없습니다.</div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="spacing"
                           href="<c:url value='/order/adminOrdHist?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="spacing"
                           href="<c:url value='/order/adminOrdHist?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
                    </c:forEach>
                    <c:if test="${hist_ph.showNext}">
                        <a class="spacing"
                           href="<c:url value='/order/adminOrdHist?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
            <!-- 핸들러 -->

            <div class="allBtn" style="margin: 40px 0">
            <div class="writeBtn">
                <button type="button" class="_2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">선택건 주문서 출력</button>
            </div> <!-- writeBtn -->
            <div class="npay_board_area">
                <div>
                            <div class="_bbDqXY6I5b _1RHctT4n_N"><i
                                    class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i>주문확인
                            </div>

                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">발주확인</span></button>
                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">발송지연 처리</span></button>
                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">고객 배송지 정보수정</span></button>
                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">배송희망일 변경</span></button>
                </div>
                <div>
                            <div class="_bbDqXY6I5b _1RHctT4n_N"><i
                                    class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i>발송처리
                            </div>

                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">발송처리</span></button>
                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">엑셀 일괄 발송처리</span></button>
                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">합포장 일괄 발송처리</span></button>
                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">송장수정</span></button>
                </div>
                <div>
                            <div class="_bbDqXY6I5b _1RHctT4n_N"><i
                                    class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i>취소처리
                            </div>

                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">판매자 직접취소 처리</span></button>
                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
                                <span class="">취소 승인처리</span></button>
                </div>
            </div>
            </div>

        </div>  <!-- use-guide -->
    </div> <!-- right-list -->
    <div class="clear"></div>
</div> <!-- content -->

</body>

</html>