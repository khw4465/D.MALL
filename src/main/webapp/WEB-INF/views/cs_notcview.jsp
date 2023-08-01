<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-07-11
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="<c:url value='/css/csmain.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
<jsp:include page="header.jsp"/>

<!-- 왼쪽 사이드에 붙어있는 각 페이지로 들어가게 하는 메뉴bar-->
<section id="contents" class="container">

    <div class="content-wrap frame-sm">
        <div class="page-title-area">
            <h2 class="title-page"><a href="/cs">고객센터</a></h2>
        </div>
        <div class="frame-wrap">
            <div class="frame-left">
                <div class="aside-menu-wrap">
                    <nav class="aside-menu">
                        <ul class="menu-list">
                            <li><a href="/notc/list" class="menu">공지사항</a></li>
                            <li><a href="/user/list" class="menu">이용안내</a></li>
                            <li><a href="/faq/list" class="menu">자주묻는 FAQ</a></li>

                        </ul>
                    </nav><!--// aside-menu -->

                    <div class="aside-guide-box">
                        <dl>
                            <dt>드가자몰 고객센터</dt>
                            <dd class="phone-num">02-1234-1234</dd>
                            <dd>평일 <span class="text-num-md">09:00 ~ 18:00</span></dd>
                            <dd>주말, 공휴일 휴무</dd>
                        </dl>
                        <dl>
                            <dt>실시간 채팅 상담</dt>
                            <dd>평일 <span class="text-num-md">09:00 ~ 21:00</span></dd>
                            <dd>토요일 <span class="text-num-md">09:00 ~ 15:00</span></dd>
                            <dd>일요일 <span class="text-num-md">13:00 ~ 21:00</span></dd>
                        </dl>
                    </div><!--// aside-guide-box -->
                </div><!--// aside-menu-wrap -->
            </div><!--// frame-left -->
            <div class="frame-right">
                <div class="frame-cnt-inner">

                    <div class="list-title-area">
                        <h3 class="title-list-type2">공지사항</h3>
                    </div>

                    <div class="use-guide">
                        <form action="" id="form">
                            <input type="hidden" name="bbsoNo" value="${NotcDto.bbsoNo}" readonly="readonly">
                            <h3>제목</h3>
                            <input type="text" name="ttl" value="${NotcDto.ttl}" placeholder="제목을 입력하세요."${mode=="new" ? '' : 'readonly="readonly"'}>
                            <h3>내용</h3>
                            <textarea name="cn" cols="30" rows="10" placeholder="내용을 입력하세요." ${mode=="new" ? '' : 'readonly="readonly"'} >${NotcDto.cn}</textarea>
                            <button type="button" id="listBtn" class="btn">목록</button>
                        </form>
                    </div><!--// use-guide -->

                </div>
            </div>
        </div><!--frame-wrap-->
    </div><!--// content-wrap -->
    <div class="includeItem"><jsp:include page="footer.jsp" /></div>
</section>

<script>
    $(document).ready(function (){
        $('#listBtn').on("click",function (){
            location.href="<c:url value='/notc/list${notcSearchCondition.queryString}'/>";
        });
    });
</script>
</body>
</html>
