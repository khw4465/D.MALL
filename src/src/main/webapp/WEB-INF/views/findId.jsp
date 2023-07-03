<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>아이디찾기</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
        }

        .find-id-container {
            width: 60%;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .title {
            font-size: 24px;
            color: #333;
            text-align: center;
            padding: 20px 0;
        }

        ul {
            list-style: none;
            /* ul 및 li의 점과 동그라미 없애기 */
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

        .submit-button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }
        .input-section-radio{
            padding: 15px;
        }
    </style>
</head>
<body>
<div class="find-id-container">
    <h2 class="title">아이디찾기</h2>
    <form action="<c:url value="/login/findid"/>" method="post" onsubmit="return onSubmitFindMemberId();">

        <ul>
            <!-- 이메일로 찾기 -->
            <li>
                <div class="input-section-radio">
                    <!-- div 라디오버튼 css 적용 안되어있음 -->
                    <input type="radio" value="email">
                    <label>이메일로 찾기</label>
                </div>

                <div class="input-section">
                    <label>이름 입력</label>
                    <input type="text" name="name" class="input-section" placeholder="이름 2자 이상 입력" maxlength="50">
                </div><!--// input-group -->

                <div class="input-section">
                    <label>이메일 주소</label>
                    <input type="text" name="email" class="input-section" placeholder="이메일 주소">
                </div><!--// input-group -->

                <div class="input-section">
                    <button type="submit" class="submit-button"><span>확인</span></button>
                </div><!--// btn-bottom-area -->
            </li><!--// 이메일로 찾기 -->
        </ul>
    </form>
</div>
</body>
</html>