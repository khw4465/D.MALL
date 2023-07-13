<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-07-06
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<html>
<head>
  <title>공지사항</title>
  <link rel="stylesheet" href="<c:url value='/css/csmain.css'/>">

</head>

<body>
<h1>드가자몰</h1>

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

<script>
  let msg = "${msg}"
  if(msg=="LIST_ERR") alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
  if(msg=="READ_ERR") alert("삭제되었거나 없는 게시물입니다.");
  if(msg=="DEL_ERR") alert("삭제되었거나 없는 게시물입니다.");
  if(msg=="DEL_OK") alert("성공적으로 삭제되었습니다.");
  if(msg=="WRT_OK") alert("성공적으로 등록되었습니다.");
  if(msg=="MOD_OK") alert("성공적으로 수정되었습니다.");

</script>

<div id="main_1">
  <table id="CS_tb">
    <h3><a href="/notc/list">공지사항</a></h3>
    <tr id="CS_tb">
      <th id="CS_tb_bno">번호</th>
      <th id="CS_tb_cate">카테고리</th>
      <th id="CS_tb_td">제목</th>
      <th id="CS_tb_day">등록일</th>
    </tr>
    <c:forEach var="notcDTO" items="${list}">
      <tr>
        <td id="CS_tb_bno">${notcDTO.BBSO_NO}</td>
        <td id="CS_tb_cate">${notcDTO.CATE}</td>
        <td id="CS_tb_td"><a href="<c:url value='/notc/read?BBSO_NO=${notcDTO.BBSO_NO}&page=${page}&pageSize=${pageSize}'/> ">${notcDTO.TTL}</a></td>
        <td id="CS_tb_day">${notcDTO.WRTD}</td>
<%--        <c:choose>--%>
<%--          <c:when test="${notcDTO.FST_REG.time >= startOfToday}">--%>
<%--            <td> <fmt:formatDate value="${notcDTO.FST_REG}" pattern="HH:mm" type="time"/> </td>--%>
<%--          </c:when>--%>
<%--          <c:otherwise>--%>
<%--            <td> <fmt:formatDate value="${notcDTO.FST_REG}" pattern="yyyy-MM-dd" type="date"/> </td>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--        <td> ${notcDTO.NOTC_CNT}</td>--%>
      </tr>
    </c:forEach>

  </table>
</div>
<!-- 게시물 검색창 -->
<div>
  <form action="<c:url value="/notc/list"/>" class="search-form" method="get">
    <select class="search-option" name="option">
      <option value="T" ${pagehandler.sc.option=='T' ? "selected" : ""}>제목만</option>
    </select>

    <input type="text" name="keyword" class="search-input" type="text" value="${pagehandler.sc.keyword}">
    <input type="submit" class="search-button" value="검색">
  </form>
</div>
<!-- 게시물 검색창 -->
<br>
<!-- 핸들러 -->
<div id="handle">
  <c:if test="${totalCnt==null || totalCnt==0}">
    <div> 게시물이 없습니다.</div>
  </c:if>
  <c:if test="${totalCnt!=null && totalCnt!=0}">
    <c:if test="${pagehandler.showPrev}">
      <a class="page" href="<c:url value="/notc/list${pagehandler.sc.getQueryString(pagehandler.beginPage-1)}"/> ">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${pagehandler.beginPage}" end="${pagehandler.endPage}">
      <a class="page ${i==pagehandler.sc.page? "paging-active" : ""}" href="<c:url value="/notc/list${pagehandler.sc.getQueryString(i)}"/>">${i}</a>
    </c:forEach>
    <c:if test="${pagehandler.showNext}">
      <a class="page" href="<c:url value="/notc/list${pagehandler.sc.getQueryString(pagehandler.endPage)}"/> ">&gt;</a>
    </c:if>
  </c:if>
</div>
<!-- 핸들러 -->
<div class="clear"></div>
</body>
</html>
