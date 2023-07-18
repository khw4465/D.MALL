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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .mainImg {
            display: inline-block;
            width: 480px;
            height: 480px;
            vertical-align: top;
            margin: 50px 60px 50px 50px;

        }
        .prodDesc{
            display: inline-block;
        }
        .content{
            display: inline-block;
            vertical-align: top;
            width: 45%;
        }
        table.box {
            border-collapse: collapse;
        }
        table.box th,
        table.box td {
            padding: 12px;
            text-align: left;
        }
        table.box th {
            width: 100px;
            font-weight: bold;
        }
        <c:forEach var="img" items="${imgList}">
        .prodImg${img.imgCd}{
            width: ${img.imgWidth}px;
            height: ${img.imgHeight}px;
        }
        </c:forEach>
        .imgAll{
            text-align: center;
        }
        .imgAll .slider {
            overflow: hidden;
            max-height: 600px;
            transition: max-height 3s ease;
        }
        .imgAll.opened .slider{
            max-height: none;
        }
        .imgAll button {
            width: 500px;
            height: 45px;
            color: gray;
            background-color: white;
            font-size: medium;
            text-align: center;
            border: 1px solid gray;
            border-radius: 5px;
            display: inline-block;

        }
        .imgAll.opened button {
            display: none;
        }
        #prodOpt {
            width: 300px;
            height: 30px;
            color: black;
            background-color: white;
            border: 1px solid gray;
            border-radius: 5px;
            display: inline-block;
        }
        .moveBtn {
            text-align: center;
        }
        .cartBtn,
        .ordBtn {
            width: 150px;
            height: 40px;
            font-size: medium;

            border-radius: 3px;
        }
        .cartBtn{
            color: black;
            background-color: white;
            border: 1px solid black;
        }
        .ordBtn{
            color: white;
            background-color: #ff7146;
            border: 0px;
        }
    </style>
</head>
<body>
<div>
    <div>
        <h1>상품 상세 </h1>
    </div>
    <img class="mainImg" src="<c:out value="${imgList.get(0).imgPath}"/><c:out value="${imgList.get(0).prodCd}"/>.<c:out value="${imgList.get(0).imgExtns}"/>" alt="">
        <div class="content">
            <div class="prodDesc">
            <h2><c:out value="${prodDto.prodName}"/></h2>
            <div> 별점 : <c:out value="${prodDto.ascr}"/></div>
            <table class="box">
                <tbody>
                <tr>
                    <th>판매자</th>
                    <td><c:out value="${prodDto.fstRegr}" /></td>
                </tr>
                <tr>
                    <th>적립혜택</th>
                    <td>1% 적립</td>
                </tr>
                <tr>
                    <th>원산지</th>
                    <td><c:out value="${prodDto.prodSmrvDesc}"/></td>
                </tr>
                <tr>
                    <th>주의사항</th>
                    <td><c:out value="${prodDto.prodDtlDesc}"/></td>
                </tr>
                <tr>
                    <th>상품 옵션</th>
                    <td><select name="prodOpt" id="prodOpt">
                        <option>옵션을 선택해주세요.</option>
                        <c:forEach var="opt" items="${optList}">
                            <option id="option${opt.optCd}" value="${opt.optCd}">${opt.optName} (${opt.salePrc}원)</option>
                        </c:forEach>
                    </select></td>
                </tr>
                </tbody>
            </table>

            </div>
            <div class="moveBtn">
                <input class="cartBtn" type="button" value="장바구니">
                &nbsp &nbsp &nbsp
                <input class="ordBtn" type="button" value="바로구매">
            </div>
        </div>
        <div class="imgAll">
            <div class="slider">
                <c:forEach var="img" items="${imgList}">
                    <div>
                        <img class="prodImg${img.imgCd}" src="${img.imgPath}${img.prodCd}_${img.imgCd}.${img.imgExtns}" alt="">
                    </div>
                </c:forEach>
            </div>
            <button class="toggle">상품설명 펼쳐보기 v</button>
        </div>
    </div>
<script>
    $(document).ready(function() {
        $('.toggle').click(function() {
            $('.imgAll').toggleClass('opened');
        });
    });
</script>
</body>
</html>