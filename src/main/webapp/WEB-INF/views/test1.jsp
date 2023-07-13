<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }

        a {
            text-decoration: none;
            color: black;
        }

        button,
        input {
            border: none;
            outline: none;
        }

        .board-container {
            width: 60%;
            height: 1200px;
            margin: 0 auto;
            /* border: 1px solid black; */
        }

        .search-container {
            background-color: rgb(253, 253, 250);
            width: 100%;
            height: 110px;
            border: 1px solid #ddd;
            margin-top: 10px;
            margin-bottom: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .search-form {
            height: 37px;
            display: flex;
        }

        .search-option {
            width: 100px;
            height: 100%;
            outline: none;
            margin-right: 5px;
            border: 1px solid #ccc;
            color: gray;
        }

        .search-option>option {
            text-align: center;
        }

        .search-input {
            color: gray;
            background-color: white;
            border: 1px solid #ccc;
            height: 100%;
            width: 300px;
            font-size: 15px;
            padding: 5px 7px;
        }

        .search-input::placeholder {
            color: gray;
        }

        .search-button {
            /* 메뉴바의 검색 버튼 아이콘  */
            width: 20%;
            height: 100%;
            background-color: rgb(22, 22, 22);
            color: rgb(209, 209, 209);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }

        .search-button:hover {
            color: rgb(165, 165, 165);
        }

        table {
            border-collapse: collapse;
            width: 100%;
            border-top: 2px solid rgb(39, 39, 39);
        }

        tr:nth-child(even) {
            background-color: #f0f0f070;
        }

        th,
        td {
            width: 300px;
            text-align: center;
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
        }

        td {
            color: rgb(53, 53, 53);
        }

        .no {
            width: 150px;
        }

        .title {
            width: 50%;
        }

        td.title {
            text-align: left;
        }

        td.writer {
            text-align: left;
        }

        td.viewcnt {
            text-align: right;
        }

        td.title:hover {
            text-decoration: underline;
        }

        .paging {
            color: black;
            width: 100%;
            align-items: center;
        }

        .page {
            color: black;
            padding: 6px;
            margin-right: 10px;
        }

        .paging-active {
            background-color: rgb(216, 216, 216);
            border-radius: 5px;
            color: rgb(24, 24, 24);
        }

        .paging-container {
            width: 100%;
            height: 70px;
            display: flex;
            margin-top: 50px;
            margin: auto;
        }

        .btn-write {
            background-color: rgb(236, 236, 236);
            /* Blue background */
            border: none;
            /* Remove borders */
            color: black;
            /* White text */
            padding: 6px 12px;
            /* Some padding */
            font-size: 16px;
            /* Set a font size */
            cursor: pointer;
            /* Mouse pointer on hover */
            border-radius: 5px;
            margin-left: 30px;
        }

        .btn-write:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="cust-container">
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

        <c:forEach var="custDto" items="${list}">
        <tr>
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
        <div class="paging">
            <!-- add/remove these links manually -->
            <a class="page" href="/board/list?page=1">&lt;</a>
            <a class="page" href="/board/list?page=2">2</a>
            <a class="page" href="/board/list?page=3">3</a>
            <!-- ... more links ... -->
            <a class="page" href="/board/list?page=4">&gt;</a>
        </div>
    </div>
</div>
</body>
</html>