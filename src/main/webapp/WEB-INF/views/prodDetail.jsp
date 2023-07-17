<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%><html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        <c:forEach var="img" items="${imgList}">
            .prodImg${img.imgCd}{
                width: ${img.imgWidth}px;
                height: ${img.imgHeight}px;
            }
        </c:forEach>
        .imgAll{
            text-align: center;
        }
    </style>
</head>
<body>
<div>
    <div>
        <h1>상품 상세 </h1>
    </div>
    <div>
        <h2><c:out value="${prodDto.prodName}"/></h2>
        <div> 별점 : <c:out value="${prodDto.ascr}"/></div>
        <p><c:out value="${prodDto.prodSmrvDesc}"/></p>
        <p><c:out value="${prodDto.prodDtlDesc}"/></p>


    </div>
    <div class="imgAll">
        <c:forEach var="img" items="${imgList}">
            <div>
                <img class="prodImg${img.imgCd}" src="${img.imgPath}${img.prodCd}_${img.imgCd}.${img.imgExtns}" alt="">
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>