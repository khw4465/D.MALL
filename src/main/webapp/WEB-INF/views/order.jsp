<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
</head>
<body>
<div>
    <h1>주문내역 창</h1>
<ul>
    <c:forEach var="ord" items="${list}">
        <li id="list${ord.ordCd}" class="${ord.ordCd}">
            <div>${ord.ordDttm}</div>
            <div>주문번호 = ${ord.ordCd}</div>
            <div>주문상품 = ${ord.prodName}</div>
            <div>상품개수 = ${ord.totProdcnt}</div>
            <div>총상품수량 = ${ord.totQty}</div>
            <div>총 가격 = ${ord.totPrc}</div>
            <div>${ord.ordStus} + ${ord.stusChgDttm}</div>

                <%--                        <input type="hidden" id="prod${cart.prodCd}" name="prod" value="${cart}">--%>
                <%--                        <input type="text" name="prodCd" value="${cart.prodCd}">--%>
                <%--                        <input type="text" name="prodQty" value="${cart.prodQty}">--%>
                <%--                        <input type="text" name="prodPrice" value="${cart.totSetlPrice}">--%>
        </li>
    </c:forEach>
</ul>
</div>
</body>
</html>
