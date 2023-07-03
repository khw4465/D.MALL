<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-06-30
  Time: 오후 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CS_Home</title>
</head>
<body>
<h1>드가자몰</h1>

<!-- 상품 카테고리 보여주는 홈페이지 간판 밑  bar-->
<div id="cate">
    <table id="cate_tb">
        <tr>
            <td id="cate_tb_td">카테고리</td>
            <td id="cate_tb_td">상품 대분류1</td>
            <td id="cate_tb_td">상품 대분류2</td>
            <td id="cate_tb_td">상품 대분류3</td>
            <td id="cate_tb_td">상품 대분류4</td>
            <td id="cate_tb_td">상품 대분류5</td>
        </tr>
    </table>
</div>
<div class="clear"></div>

<!-- 왼쪽 사이드에 붙어있는 각 페이지로 들어가게 하는 메뉴bar-->
<h2 id="CS"><a href="/cs">고객센터</a></h2>
<div id="CS_label">
    <nav>
        <ul id="label_ul">
            <li><a href="/cs/notc/list">공지사항</a></li>
            <li><a href="/cs/user/list">이용안내</a></li>
            <li><a href="/cs/faq">자주묻는FAQ</a></li>
            <li><a href="/cs/inqry">1:1문의</a></li>
        </ul>
    </nav>
</div>
<div class="clear"></div>

<!-- CS 메인에서 미리 최근 공지사항을 보여주는 테이블-->
<div id="main_1">
    <table id="CS_tb" border="1px">
        <h3><a href="/cs/notc/list">공지사항</a></h3>
        <tr id="CS_tb">
            <td id="CS_tb_cate">업데이트</td>
            <td id="CS_tb_td">TEST2</td>
            <td id="CS_tb_day">2023.06.20</td>
        </tr>

        <tr id="CS_tb">
            <td id="CS_tb_cate">점검</td>
            <td id="CS_tb_td">TEST1</td>
            <td id="CS_tb_day">2023.06.19</td>
        </tr>
    </table>
</div>
<div class="clear"></div>

<div id="main_2">
    <div>
        <h3><a href="/cs/faq">자주묻는 FAQ</a></h3>
        <button class="accordion">자주묻는 FAQ 1번</button>
        <div class="panel">
            <p>자주묻는 FAQ 1번에 대한 답변</p>
        </div>

        <button class="accordion">자주묻는 FAQ 2번</button>
        <div class="panel">
            <p>자주묻는 FAQ 2번에 대한 답변</p>
        </div>

        <button class="accordion">자주묻는 FAQ 3번</button>
        <div class="panel">
            <p>자주묻는 FAQ 3번에 대한 답변</p>
        </div>
    </div>
    <div class="clear"></div>

    <div>
        <h3 class="usg"><a href="/cs/user/list">이용안내</a></h3>
        <button class="accordion">이용안내 1번</button>
        <div class="panel">
            <p>이용안내 1번에 대한 답변</p>
        </div>

        <button class="accordion">이용안내 2번</button>
        <div class="panel">
            <p>이용안내 2번에 대한 답변</p>
        </div>

        <button class="accordion">이용안내 3번</button>
        <div class="panel">
            <p>이용안내 3번에 대한 답변</p>
        </div>
    </div>
</div>

<!-- W3school에서 가져오는 FAQ와 이용안내에 사용할 코드-->

<!-- 여기서부터 자바 스크립트-->
<script>
    let acc = document.getElementsByClassName("accordion");
    let i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            /* Toggle between adding and removing the "active" class,
            to highlight the button that controls the panel */
            this.classList.toggle("active");

            /* Toggle between hiding and showing the active panel */
            let panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
</script>
</body>
</html>
