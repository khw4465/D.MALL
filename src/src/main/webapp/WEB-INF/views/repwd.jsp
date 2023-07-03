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
            /* 영역 안에 벗어나는거 잡아주는 역할임 */
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            /* 컨테이너 내부의 아이템들을 중앙에 정렬하도록 지시
            이는 수평 축에 대해 아이템들이 중앙으로 모이게 만듭니다 */
            align-items: center;
            /* flexbox 또는 grid의 자식 요소들이 컨테이너 안에서 어떻게 수직 방향(교차 축)으로 정렬될지를 지정 */
            height: 100vh;
            /* 부모태그와는 상관없이 보이는 Viewport Height의 100%를 다 쓰겠다는 의미입니다. */
        }

        .container {
            /* 바디 안의 컨테이너 (거의전체임) */
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 4px;
            background-color: white;
        }

        form {
            /* 폼 */
            display: flex;
            flex-direction: column;
            /* 아이템들은 수직방향(열 방향)으로 정렬  */
            background-color: white;

        }

        label {
            /* 라벨 */
            margin: 10px 0 5px;
        }

        input[type="password"] {
            /* 인풋태그의 패스워드 */
            /* input 태그 중 type 속성이 "password"인 요소들에 적용 */
            margin-bottom: 20px;
            /* 아래쪽 외부 여백(margin)을 20 픽셀 */
            padding: 10px;
            /* 해당 요소의 내부 여백(padding)을 10 픽셀 */
            border-radius: 4px;
            border: 1px solid #ddd;
            /* 테두리의 굵기는 1 픽셀이고,
            스타일은 실선(solid)이며, 색상은 #ddd(밝은 회색) */
        }

        input[type="submit"] {
            /* 인풋태그의 submit */
            /* input 태그 중 type 속성이 "submit"인 요소들에 적용 */
            cursor: pointer;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            /* 제출버튼에 마우스 올렸을때 */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>고객님의 개인정보를 보호하기 위해 비밀번호를 다시 한번 확인합니다</h1>
    <!-- 세션에서 현재아이디 보여주기 -->
    <h3>세션에서 아이디 가져와서 보여주기 </h3>
    <form>
        <label for="password">비밀번호</label><br>
        <input type="password" id="password" name="password"><br>
        <label for="confirm_password">비밀번호 확인</label><br>
        <input type="password" id="confirm_password" name="confirm_password"><br>
        <input type="submit" value="확인">
    </form>
</div>
</body>
</html>