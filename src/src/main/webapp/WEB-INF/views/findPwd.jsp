<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호찾기</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body#password-recovery.password-page {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
        }

        .password-container {
            width: 60%;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .search-title {
            font-size: 24px;
            color: #333;
            text-align: center;
            padding: 20px 0;
        }

        ul {
            list-style: none;
        }

        .input-section {
            margin-bottom: 10px;
        }

        .input-section label {
            display: block;
            margin-bottom: 5px;
        }

        .input-section input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .button-section {
            display: flex;
            gap: 10px;
        }

        .button-section button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            flex: 1;
        }

        .button-section button:disabled {
            background-color: #ccc;
        }

        .button-section button:hover:not(:disabled) {
            background-color: #0056b3;
        }
        .ul{
            padding: 5px;
            /*  */
        }
    </style>
</head>

<body id="password-recovery" class="password-page">
<div class="password-container">
    <h2 class="search-title">비밀번호 찾기</h2>
    <form action="/경로" method="post" onsubmit="return onSubmitFindMemberPw();">
        <ul class="ul">
            <li>
                <div class="input-section-radio">
                    <input type="radio" value="email">
                    <label>이메일로 찾기</label>
                </div>
                <div class="input-section">
                    <label>아이디</label>
                    <input type="text" placeholder="아이디">
                </div>
                <div class="input-section">
                    <label>이름 입력</label>
                    <input type="text" placeholder="이름 2자 이상 입력" maxlength="50">
                </div>
                <div class="input-section">
                    <label>이메일 주소</label>
                    <input type="text" placeholder="이메일 주소">
                </div>
                <div class="input-section">
                    <label>인증번호 입력</label>
                    <input type="text" placeholder="인증번호 입력">
                </div>
                <div class="button-section">
                    <button type="button">인증번호 받기</button>
                    <button type="submit" disabled>비밀번호 재설정</button>
                </div>
            </li>
        </ul>
    </form>
</div>
</body>
<script>

</script>
</html>
