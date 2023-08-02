<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Notc</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/adminnotc.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">

</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">
    <jsp:include page="adminSideBar.jsp"/>

    <div class="right-list">

        <div class="use-guide">
            <table>
                <h3><a href="/notc/adminlist">공지사항 관리</a></h3>
                <!-- 게시물 검색창 -->
                <div class="notcsearch">
                    <form id="cs_search" action="<c:url value="/notc/adminlist"/>" class="search-form" method="get">
                        <select class="search-option" name="option" hidden="hidden">
                            <option value="T" ${pagehandler.sc.option=='T' ? "selected" : ""} hidden="hidden">제목만
                            </option>
                        </select>
                        <input type="text" name="keyword" class="cs-search-input" type="text"
                               value="${pagehandler.sc.keyword}" placeholder="제목을 검색해주세요">
                        <input type="submit" class="cs-search-button move-right" value="검색">
                    </form>
                </div>
                <!-- 게시물 검색창 -->
                <thead>
                <tr>
                    <th>번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="NotcDto" items="${list}">
                    <tr>
                        <td>${NotcDto.bbsoNo}</td>
                        <td>${NotcDto.cate}</td>
                        <td class="none-center"><a
                                href="<c:url value='/notc/adminread?bbsoNo=${NotcDto.bbsoNo}&amp;page=${page}&amp;pageSize=${pageSize}' />">${NotcDto.ttl}</a>
                        </td>
                        <td class="td-weak">${NotcDto.wrtd}</td>
                        <td class="td-weak">${NotcDto.notcCnt}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="writeBtn">
                <button type="button" id="writeBtn" onclick="location.href='<c:url value="/notc/adminwrite"/>'">글쓰기
                </button>
            </div> <!-- writeBtn -->
            <br>

            <!-- 핸들러 -->
            <div id="handle">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다.</div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${pagehandler.showPrev}">
                        <a class="page"
                           href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(pagehandler.beginPage-1)}"/> ">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${pagehandler.beginPage}" end="${pagehandler.endPage}">
                        <a class="page ${i==pagehandler.sc.page? "paging-active" : ""}"
                           href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${pagehandler.showNext}">
                        <a class="page"
                           href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(pagehandler.endPage)}"/> ">&gt;</a>
                    </c:if>
                </c:if>
            </div>
            <!-- 핸들러 -->
        </div>  <!-- use-guide -->
    </div> <!-- right-list -->
    <div class="clear"></div>
</div> <!-- content -->

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