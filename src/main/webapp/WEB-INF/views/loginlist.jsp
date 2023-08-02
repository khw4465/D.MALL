<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--T 제거하는 라이브러리--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인이력</title>
    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">

</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">
        <jsp:include page="adminSideBar.jsp"/>
    <div id="sidebar2" class="dashboard2">
        <div class="cust-container">
            <table>
                <tr>
                    <th class="">회원아이디</th>
                    <th class="">로그인일자</th>
                    <th class="">로그인성공여부</th>
                    <th class="">로그인IP</th>
                    <th class="">로그인실패원인</th>
                    <th class="">로그인국가</th>
                    <th class="">로그인기기</th>
                    <th class="">실패횟수</th>
                </tr>
                <c:forEach var="LoginHistoryDTO" items="${LoginHistoryList}">
                <div class="">
                    <tr>
                        <th class="">${LoginHistoryDTO.custId}</th>
                        <th class="">${fn:replace(LoginHistoryDTO.dttm, 'T', ' ')}</th>
<%--                        <th class="">${LoginHistoryDTO.dttm}</th>--%>
                        <th class="">${LoginHistoryDTO.scssYn}</th>
                        <th class="">${LoginHistoryDTO.ip}</th>
                        <th class="">${LoginHistoryDTO.failCaus}</th>
                        <th class="">${LoginHistoryDTO.natn}</th>
                        <th class="">${LoginHistoryDTO.mhrLS}</th>
                        <th class="">${LoginHistoryDTO.failCnt}</th>
                    </tr>
                </div>
                </c:forEach>

            </table>
            <br>
            <div class="paging-container">
                <c:if test="${hist_totalCnt==null || hist_totalCnt==0}">
                    <div> 로그인 이력이 없습니다.</div>
                </c:if>
                <c:if test="${hist_totalCnt!=null && hist_totalCnt!=0}">
                    <c:if test="${hist_ph.showPrev}">
                        <a class="spacing"
                           href="<c:url value='/loginHist?page=${hist_ph.beginPage-1}&pageSize=${hist_ph.pageSize}'/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${hist_ph.beginPage}" end="${hist_ph.endPage}">
                        <a class="spacing"
                           href="<c:url value='/loginHist?page=${i}&pageSize=${hist_ph.pageSize}'/>">${i}</a>
                    </c:forEach>
                    <c:if test="${hist_ph.showNext}">
                        <a class="spacing"
                           href="<c:url value='/loginHist?page=${hist_ph.endPage+1}&pageSize=${hist_ph.pageSize}'/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>