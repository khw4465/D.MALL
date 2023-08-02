<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
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
            <!-- 게시물 검색창 -->
            <div class="notcsearch">
                <form id="cs_search" action="" class="search-form" method="get">
                    <select class="search-option" name="option" hidden="hidden">
                        <option value="T" ${pagehandler.sc.option=='T' ? "selected" : ""} hidden="hidden">제목만</option>
                    </select>
                    <input type="text" name="keyword" class="cs-search-input" type="text"
                           value="${pagehandler.sc.keyword}" placeholder="주문번호를 입력해주세요.">
                    <input type="submit" class="cs-search-button move-right" value="검색">
                </form>
            </div>
            <!-- 게시물 검색창 -->
            <table>
                <colgroup>
                    <col style="width:1%">
                    <col style="width:1%">
                    <col style="width:5%">
                    <col style="width:8%">
                    <col style="width:9%">
                    <col style="width:11%">
                    <col style="width:8%">
                    <col style="width:7%">
                    <col style="width:20%">
                    <col style="width:5%">
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
            <div class="writeBtn">
                <button type="button" class="printBtn">선택건 주문서 출력</button>
            </div> <!-- writeBtn -->
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

<%--            <div class="npay_board_area">--%>
<%--                <table class="npay_board_table">--%>
<%--                    <colgroup>--%>
<%--                        <col class="label_width">--%>
<%--                        <col>--%>
<%--                    </colgroup>--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <th scope="row">주문확인--%>
<%--                            <div class="_bbDqXY6I5b _1RHctT4n_N"><i--%>
<%--                                    class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span class="_1heWiz4gj3">도움말</span>--%>
<%--                            </div>--%>
<%--                        </th>--%>
<%--                        <td colspan="1">--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">발주확인</span></button>--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">발송지연 처리</span></button>--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">고객 배송지 정보수정</span></button>--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">배송희망일 변경</span></button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th scope="row">발송처리--%>
<%--                            <div class="_bbDqXY6I5b _1RHctT4n_N"><i--%>
<%--                                    class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span class="_1heWiz4gj3">도움말</span>--%>
<%--                            </div>--%>
<%--                        </th>--%>
<%--                        <td colspan="1">--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">발송처리</span></button>--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">엑셀 일괄 발송처리</span></button>--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">합포장 일괄 발송처리</span></button>--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">송장수정</span></button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th scope="row">취소처리--%>
<%--                            <div class="_bbDqXY6I5b _1RHctT4n_N"><i--%>
<%--                                    class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span class="_1heWiz4gj3">도움말</span>--%>
<%--                            </div>--%>
<%--                        </th>--%>
<%--                        <td colspan="1">--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">판매자 직접취소 처리</span></button>--%>
<%--                            <button type="button" class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">--%>
<%--                                <span class="">취소 승인처리</span></button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>


        </div>  <!-- use-guide -->
    </div> <!-- right-list -->
    <div class="clear"></div>
</div> <!-- content -->

</body>

</html>