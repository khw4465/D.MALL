<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-07-11
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>
<html>
<head>
    <title>이용안내</title>
    <link rel="stylesheet" href="<c:url value='/css/csmain.css'/>">
</head>
<body>
<h1><a href="/">드가자몰</a></h1>

<!-- 상품 카테고리 보여주는 홈페이지 간판 밑  bar-->
<div id="cate">
    <table id="cate_tb">
        <tr>
            <td id="cate_tb_td">카테고리</td>
            <td id="cate_tb_td">1</td>
            <td id="cate_tb_td">2</td>
            <td id="cate_tb_td">3</td>
            <td id="cate_tb_td">4</td>
            <td id="cate_tb_td">5</td>
        </tr>
    </table>
</div>
<div class="clear"></div>

<!-- 왼쪽 사이드에 붙어있는 각 페이지로 들어가게 하는 메뉴bar-->
<h2 id="CS"><a href="/cs">고객센터</a></h2>
<div id="CS_label">
    <nav>
        <ul id="label_ul">
            <li><a href="/notc/list">공지사항</a></li>
            <li><a href="/user/list">이용안내</a></li>
            <li><a href="/faq/list">자주묻는FAQ</a></li>
            <li><a href="/cs/inqry">1:1문의</a></li>
        </ul>
    </nav>
</div>
<div class="clear"></div>

<div id="main_4">
    <div>
        <h3><a href="/user/list">이용안내</a></h3>
        <c:forEach var="GuidDto" items="${list}">
        <button class="accordion">${GuidDto.ttl}</button>
        <div class="panel">
            <p>${GuidDto.cn}</p>
        </div>
        </c:forEach>
<br>
        <!-- 핸들러 -->
        <div class="handle_usg">
            <c:if test="${totalCnt==null || totalCnt==0}">
                <div> 게시물이 없습니다.</div>
            </c:if>
            <c:if test="${totalCnt!=null && totalCnt!=0}">
                <c:if test="${pagehandler.showPrev}">
                    <a class="page" href="<c:url value="/user/list${pagehandler.beginPage-1}"/> ">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${pagehandler.beginPage}" end="${pagehandler.endPage}">
                    <a class="page ${i==pagehandler.page? "paging-active" : ""}" href="<c:url value="/user/list?page=${i}"/>">${i}</a>
                </c:forEach>
                <c:if test="${pagehandler.showNext}">
                    <a class="page" href="<c:url value="/user/list?page=${pagehandler.endPage+1}"/> ">&gt</a>
                </c:if>
            </c:if>
        </div>
        <!-- 핸들러 -->
    </div>
</div>
<div class="clear"></div>

<br>

<div class="clear"></div>
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
