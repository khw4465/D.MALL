<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%><html>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="custName" value="${custInfo.name}"/>
<c:set var="custMpno" value="${custInfo.mpNo}"/>
<c:set var="custEmail" value="${custInfo.email}"/>
<c:set var="dlvRcpr" value="${dlvList.rcpr}"/>
<c:set var="dlvDlvAddr" value="${dlvList.dlvAddr}"/>
<c:set var="dlvDtlAddr" value="${dlvList.dtlAddr}"/>
<c:set var="dlvZpcd" value="${dlvList.zpcd}"/>
<c:set var="dlvMpno" value="${dlvList.mpNo}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .n-section-block {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 0px 8px 2px rgba(0, 0, 0, 0.1);
        }
        .n-table-title h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 20px;
        }
        table.box {
            width: 100%;
            border-collapse: collapse;
        }
        table.box th,
        table.box td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table.box th {
            background-color: #f8f8f8;
            font-weight: bold;
        }
        ul.info {
            margin-top: 20px;
            padding-left: 0;
        }
        ul.info li {
            list-style-type: none;
            font-size: 16px;
            color: #666;
        }
        .category{
            text-align: center;
            border-radius: 10px;
            display: inline-block;
            margin: 20px 30px;
        }
        button{
            border-style: none;
            background-color: white;
            width: 150px;
        }
        #mainBtn{
            display: inline-block;
            margin: 50px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<%--    <script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>--%>
<%--    <!-- 토스페이먼츠 -->--%>
<%--    <script src="https://js.tosspayments.com/v1"></script>--%>
<%--    <!-- 네이버페이 -->--%>
<%--    <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>--%>
<%--    <!-- 스마일페이 -->--%>
<%--    <script src="https://pg.cnspay.co.kr/dlp/scripts/smilepay.js" charset="euc-kr"></script>--%>
    <div class="n-section-block">
    <div class="order-info" id="or derUserInfo">
        <div class="n-table-title">
            <h2 class="title-list">주문자 정보</h2>
        </div><!--// list-head -->

        <!-- 회원일때 -->
        <div class="order-address">
            <ul class="info-txt">
                <li>${custName}</li>
                <li>${custMpno}</li>
                <li>${custEmail}</li>
            </ul>
            <a href="/mypage/info/mypage" class="text-primary"><span>주문자 정보변경</span><i class="ico-arr-right"></i></a>

        </div>
    </div>
        <!-- 회원일때 -->
        <div>
            <header class="n-table-title">
                <h2>배송지 정보</h2>
            </header>
            <table class="box">
                <tbody>
                <tr>
                    <th>수령인</th>
                    <td>${dlvRcpr}</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>${dlvMpno}</td>
                </tr>
                <tr>
                    <th>배송지 주소</th>
                    <td>(${dlvZpcd}) ${dlvDlvAddr} ${dlvDtlAddr}</td>
                </tr>
                </tbody>
            </table>
            <ul class="info">
                <li>배송시작전 일때만 배송지 주소를 변경하실 수 있습니다</li>
            </ul>
        </div>

        <div>
            <div class="n-table-title">
                <h2 class="title-list">주문상품 목록</h2>
            </div>
            <c:forEach var="cart" items="${list}">
                <li style="list-style-type: none">
                    <div>
                        <span>
                            <img src="../img/${cart.prodCd}.png" style="width: 100px; height: 100px;">
                        </span>
                        <span class="column qty" style="display: inline-block">
                            <div>${cart.prodName}</div>
                            <div>${cart.prodQty}개</div>
                            <div>${cart.totSetlPrice * cart.prodQty}원</div>
                        </span>
                    </div>
                </li>
            </c:forEach>
        </div>

        <div id="payTool">
            <div class="category" name="categ"><button id="card"><strong><i class="fa-regular fa-credit-card"></i>신용카드</strong></button></div>
            <div class="category" name="categ"><button id="deposit"><strong><i class="fa-regular fa-money-bill-1"></i>무통장입금</strong></button></div>
            <div class="category" name="categ"><button id="accTransfer"><strong><i class="fa-solid fa-arrow-right-arrow-left"></i>실시간 계좌이체</strong></button></div>
            <div class="category" name="categ"><button id="mobile"><strong><i class="fa-solid fa-mobile-screen-button"></i>휴대폰 결제</strong></button></div>
            <div class="category"><button id="kakaoPay"><strong>카카오페이</strong></button></div>
            <div class="category" name="categ"><button id="naverPay"><strong>네이버페이</strong></button></div>
            <div class="category" name="categ"><button id="tossPay"><strong>토스페이</strong></button></div>
            <div class="category" name="categ"><button id="payco"><strong>페이코</strong></button></div>
        </div>
    </div>

<script>
        $('#kakaoPay').click(function(){
            $.ajax({
                url: '/order/kakao',  // 요청 URI
                dataType : 'json', // 전송받을 데이터의 타입
                success:function (data){
                    let url = data.next_redirect_pc_url;
                    window.open(url);
                },
                error:function (error){
                    alert(error);
                }
            })
        })
</script>
</body>
</html>