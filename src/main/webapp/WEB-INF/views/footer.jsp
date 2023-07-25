<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>푸터</title>
    <style>
        /* reset css */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* global css */
        body {
            font-family: Arial, sans-serif;
        }

        /* footer styles */
        .footer {
            background-color: #f8f9fa;
            padding: 2em 10%;
            color: #212529;
        }

        .footer a {
            color: inherit;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .footer h5,
        .footer p,
        .footer .colum-info {
            margin-bottom: 1.5em;
        }

        /* footer-logo */
        .footer-logo {
            font-size: 1.5em;
            font-weight: bold;
        }

        /* footer menu styles */
        .footer-menu-list {
            list-style: none;
            display: flex;
            justify-content: space-between;
            padding: 1em 0;
            border-top: 1px solid #dee2e6;
            border-bottom: 1px solid #dee2e6;
        }

        /* footer info styles */
        .footer-info {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .colum-info {
            width: 45%;
            line-height: 1.6;
        }

        @media screen and (max-width: 600px) {
            .colum-info {
                width: 100%;
            }
        }

        /* customer buttons */
        .customer-btns {
            display: flex;
            gap: 1em;
        }

        .customer-btns a {
            background-color: #007bff;
            color: #fff;
            padding: .5em 1em;
            border-radius: .25em;
            text-align: center;
            transition: background-color .3s ease;
        }

        .customer-btns a:hover {
            background-color: #0056b3;
        }

        li {
            list-style: none;
        }
    </style>
</head>
<body>
<footer id="footer" class="footer">
    <!-- footer menu -->
    <div class="footer-menu">
        <ul class="footer-menu-list">
            <li><a href="/etc/footer/company">회사소개</a></li>
            <li><a href="/service/notice">공지사항</a></li>
            <li><a href="/product/storeInquiry">입점 · 제휴 · 광고문의</a></li>
            <li><a href="/etc/footer/uselaw">이용약관</a></li>
            <li><a href="/etc/footer/privacy">개인정보처리방침</a></li>
        </ul>
    </div>

    <!-- footer info -->
    <div class="footer-info">
        <div class="colum-info">
            <h5 class="footer-logo"></h5>
            <ul>
                <li>(주)드가닭</li>
                <li>대표 : 김유성</li>
                <li>주소 : 서울특별시 종로 2가 9 522호 정석코딩학원</li>
                <li>사업자등록번호 : 123-45-67891</li>
                <li>통신판매업신고번호 : 제2023-서울종로-1234호</li>
                <li>개인정보보호책임자 : 김현우</li>
            </ul>
        </div>

        <div class="colum-info">
            <h5 class="footer-logo" ></h5>
            <ul>
                <li>고객센터 <em class="footer-tel">02-1234-1234</em></li>
                <li>FAX. 02-1234-1234</li>
                <li>E-mail. Useodam@naver.com</li>
            </ul>
            <div class="customer-btns">
                <a href="#"><span>고객의 제안</span></a>
                <a href="#"><span>1:1 문의</span></a>
            </div>
        </div>
    </div>
</footer>
</body>

</html>