<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원리스트</title>
    <link rel="stylesheet" href="<c:url value='/css/custSelectAll.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">
    <jsp:include page="adminSideBar.jsp"/>

    <div id="sidebar2" class="dashboard2">
        <div class="cust-container">
            <h1>회원 관리</h1>
            <div class="notcsearch">
                <form id="cs_search" action="" class="search-form-cust" method="get">
                    <select class="search-option" name="option" hidden="hidden">
                        <option value="T" ${pagehandler.sc.option=='T' ? "selected" : ""} hidden="hidden">제목만</option>
                    </select>
                    <input type="text" name="keyword" class="cust-search-input" type="text"
                           value="${pagehandler.sc.keyword}" placeholder="회원아이디 입력">
                    <input type="submit" class="cust-search-button move-right" value="검색">
                </form>
            </div>
            <table>
                <tr>
                    <th class="">회원아이디</th>
                    <th class="">이름</th>
                    <th class="">핸드폰번호</th>
                    <th class="">분류</th>
                    <th class="">등급</th>
                    <th class="">상태</th>
                    <th class="">생일</th>
                    <th class="">이메일</th>
                    <th class="">계좌번호</th>
                    <th class="">성별</th>
                </tr>

                <c:forEach var="custDto" items="${CustListPage}">
                    <tr>
                            <%--                        여기에 1~10까지 숫자 필요--%>
                        <th class="">${custDto.custId}</th>
                        <th class="">${custDto.name}</th>
                        <th class="">${custDto.mpNo}</th>
                        <th class="">${custDto.custTp}</th>
                        <th class="">${custDto.grade}</th>
                        <th class="">${custDto.stus}</th>
                        <th class="">${custDto.birth}</th>
                        <th class="">${custDto.email}</th>
                        <th class="">${custDto.acno}</th>
                        <th class="">${custDto.gender}</th>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <div class="paging-container">
                <c:if test="${cust_totalCnt==null || cust_totalCnt==0}">
                    <div> 회원이 없습니다.</div>
                </c:if>
                <c:if test="${cust_totalCnt!=null && cust_totalCnt!=0}">
                    <c:if test="${cust_ph.showPrev}">
                        <a class="spacing"
                           href="<c:url value='/custSelectAll?page=${cust_ph.beginPage-1}&pageSize=${cust_ph.pageSize}'/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${cust_ph.beginPage}" end="${cust_ph.endPage}">
                        <a class="spacing"
                           href="<c:url value='/custSelectAll?page=${i}&pageSize=${cust_ph.pageSize}'/>">${i}</a>
                    </c:forEach>
                    <c:if test="${cust_ph.showNext}">
                        <a class="spacing"
                           href="<c:url value='/custSelectAll?page=${cust_ph.endPage+1}&pageSize=${cust_ph.pageSize}'/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>