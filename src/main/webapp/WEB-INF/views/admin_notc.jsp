<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Notc</title>
  <link rel="stylesheet" href="<c:url value='/css/adminnotc.css'/>">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="admin-menu">
  <ul class="menu-bar1">
    <a href="<c:url value='/login/logoClick'/>"><img id="logo" src="/img/logo1.png" alt="logo" style="width:90px; height:90px;"></a>
  </ul>
  <ul class="menu-bar2">
    <li><a href="<c:url value='/prod/Manage'/>">상품관리</a></li>
    <li><a href="<c:url value='/ord/Manage'/>">주문관리</a></li>
    <li><a href="<c:url value='/cust/Manage'/>">회원관리</a></li>
    <li><a href="<c:url value='/board/Manage'/>">게시판관리</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <input type="hidden" name="toURL" value="${param.toURL}">
  </ul>
</div>

<div class="content">
  <div class="left-list">
    <h2>관리자 매뉴얼</h2>
    <button class="list">상품관리</button>
    <div class="panel">
      <li><a href="/prod/register">상품등록 |</a></li>
      <li></li>

    </div>

    <button class="list">주문관리</button>
    <div class="panel">
      <li>hello</li>
    </div>
    <button class="list">회원관리</button>
    <div class="panel">
      <li><a href="<c:url value='/custselect'/>">회원리스트</a></li>
    </div>
    <button class="list">게시판관리</button>
    <div class="panel">
      <li><a href="<c:url value="/notc/adminlist"/>"> 공지사항 관리 </a></li>
    </div>
  </div>


</div>

  <!-- 게시물 검색창 -->
  <div class="notcsearch">
    <form id="cs_search" action="<c:url value="/notc/adminlist"/>" class="search-form" method="get">
      <select class="search-option" name="option" hidden="hidden">
        <option value="T" ${pagehandler.sc.option=='T' ? "selected" : ""} hidden="hidden">제목만</option>
      </select>

      <input type="text" name="keyword" class="search-input" type="text" value="${pagehandler.sc.keyword}" placeholder="제목을 검색해주세요">
      <input type="submit" class="search-button" value="검색">
    </form>
  </div>
  <!-- 게시물 검색창 -->
</div>


<table id="CS_tb">
  <h3><a href="/notc/adminlist">공지사항 관리</a></h3>
  <thead>
  <tr>
    <th class="CS_tb_bno">번호</th>
    <th class="CS_tb_cate">카테고리</th>
    <th class="CS_tb_td">제목</th>
    <th class="CS_tb_day">등록일</th>
    <th>조회수</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="NotcDto" items="${list}">
    <tr>
      <td class="CS_tb_bno">${NotcDto.bbsoNo}</td>
      <td class="CS_tb_cate">${NotcDto.cate}</td>
      <td class="CS_tb_td"><a href="<c:url value='/notc/adminread?bbsoNo=${NotcDto.bbsoNo}&amp;page=${page}&amp;pageSize=${pageSize}' />">${NotcDto.ttl}</a></td>
      <td class="CS_tb_day">${NotcDto.wrtd}</td>
      <td>${NotcDto.notcCnt}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

</div>

  <div>
    <button type="button" id="writeBtn" class="writeBtn" onclick="location.href='<c:url value="/notc/adminwrite"/>'">글쓰기</button>
  </div>


<br>
<!-- 핸들러 -->
<div id="handle">
  <c:if test="${totalCnt==null || totalCnt==0}">
    <div> 게시물이 없습니다.</div>
  </c:if>
  <c:if test="${totalCnt!=null && totalCnt!=0}">
    <c:if test="${pagehandler.showPrev}">
      <a class="page" href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(pagehandler.beginPage-1)}"/> ">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${pagehandler.beginPage}" end="${pagehandler.endPage}">
      <a class="page ${i==pagehandler.sc.page? "paging-active" : ""}" href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(i)}"/>">${i}</a>
    </c:forEach>
    <c:if test="${pagehandler.showNext}">
      <a class="page" href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(pagehandler.endPage)}"/> ">&gt;</a>
    </c:if>
  </c:if>
</div>
<!-- 핸들러 -->
<div class="clear"></div>


<script>
  $(document).ready(function () {
    var list = document.getElementsByClassName("list");

    for (var i = 0; i < list.length; i++) {
      list[i].addEventListener("click", function () {
        this.classList.toggle("active");
      });
    }

    let msg = "${msg}";
    if (msg == "LIST_ERR") alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
    if (msg == "READ_ERR") alert("삭제되었거나 없는 게시물입니다.");
    if (msg == "DEL_ERR") alert("삭제되었거나 없는 게시물입니다.");
    if (msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
    if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
    if (msg == "MOD_OK") alert("성공적으로 수정되었습니다.");
  });
</script>



</body>

</html>