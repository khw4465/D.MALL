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
    <link rel="stylesheet" href="<c:url value='/css/myPage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/myPageSideBar.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/main2.css'/>">
</head>
<body>
<header>
    <nav>
        <jsp:include page="header.jsp"/>
    </nav>
</header>
<%--<jsp:include page="adminHeader.jsp"/>--%>

<%--<div class="cust-container">--%>
<%--임시수정--%>
<div id="header_warp" style="height: 248px;"></div>
<div id="" class="content">

    <div class="dashboard1">
        <jsp:include page="myPageSideBar.jsp"/>
<%--        <jsp:include page="admin.jsp"/>--%>
    </div>

    <div class="dashboard2">
        <H2 class="paging-container">회원 포인트 적립내역</H2>
<%--        아래쪽 페이지핸들러 css와 연동--%>
    <table border="1">
        <%--        티바디 추가 7/27--%>
        <tbody class="brTag">
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
            <div class="">
        <tr class="forEachTag">
            <th class="">${pointDto.custId}</th>
            <th class="">${pointDto.stus}</th>
            <th class="">${pointDto.chngPnt}</th>
            <th class="">${pointDto.point}</th>
            <th class="">${pointDto.dttm}</th>
            <th class="">${pointDto.expiDttm}</th>
            <th class="">${pointDto.chgCn}</th>
        </tr>
            </div>

        </c:forEach>

        </tbody>
<%--        티바디 추가 7/27--%>
    </table>

    <div class="paging-container">
        <c:if test="${totalCnt==null || totalCnt==0}">
            <div> 포인트 내역이 없습니다.</div>
        </c:if>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
<%--            http://localhost:8080/point/custSelectAll?page=2&pageSize=10--%>
            <c:if test="${ph.showPrev}">
                <a class="spacing" href="<c:url value='/point/custSelectAll?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
               <a class="spacing" href="<c:url value='/point/custSelectAll?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a class="spacing" href="<c:url value='/point/custSelectAll?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
            </c:if>
        </c:if>
    </div>
    </div>
</div>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>