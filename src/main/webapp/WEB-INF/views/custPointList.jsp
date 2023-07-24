<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>포인트상세</title>
    <link rel="stylesheet" href="<c:url value='/css/custPointList.css'/>">
</head>
<body>
<div class="cust-container">
    <table border="1">
        <tr>
            <th class="">회원아이디</th>
            <th class="">적립/사용여부</th>
            <th class="">변동 포인트</th>
            <th class="">현재포인트</th>
            <th class="">적립일</th>
            <th class="">만료일</th>
            <th class="">포인트적립사유</th>
        </tr>

        <c:forEach var="pointDto" items="${pointlist}">
        <tr>
            <th class="">${pointDto.custId}</th>
            <th class="">${pointDto.stus}</th>
            <th class="">${pointDto.chngPnt}</th>
            <th class="">${pointDto.point}</th>
            <th class="">${pointDto.dttm}</th>
            <th class="">${pointDto.expiDttm}</th>
            <th class="">${pointDto.chgCn}</th>
        </tr>
        </c:forEach>

    </table>
    <br>
    <div class="paging-container">
        <c:if test="${totalCnt==null || totalCnt==0}">
            <div> 포인트 내역이 없습니다.</div>
        </c:if>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
<%--            http://localhost:8080/point/custSelectAll?page=2&pageSize=10--%>
            <c:if test="${ph.showPrev}">
                <a href="<c:url value='/point/custSelectAll?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
               <a href="<c:url value='/point/custSelectAll?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a href="<c:url value='/point/custSelectAll?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
            </c:if>
        </c:if>
    </div>
</div>
</body>
</html>