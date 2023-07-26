<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
</head>
<body>
<div id="skipNavigation">
    <p><a href="#category">전체상품목록 바로가기</a></p>
    <p><a href="#contents">본문 바로가기</a></p>
</div>

<div id="header" class="fix" style="transform: translateY(0px);">
    <div class="hd_blet">
        <a href="http://pf.kakao.com/_CsnXj" target="_blank"><img src="/design/kr/bc3650847f8ae1e9a4d8f16c8011255e_52236.jpg" alt="드가자몰입니다."></a>
        <span class="btn_closed">닫기</span>
    </div>
    <div class="hd_box">
        <div class="w_custom">
            <div class="btn_all">
            </div>
            <div class="hd_box_table">
                <h1 class="xans-element- xans-layout xans-layout-logotop ">
                    <a href="/"><img src="/design/kr/156005c5baf40ff51a327f1c34f2975b_53977.jpg" alt="logo"><!--moguchonmall.com--></a>
                </h1>
                <div class="hd_search">
                    <form id="searchBarForm" name="" action="/prod/search" method="get" target="_self" enctype="multipart/form-data">
                        <input id="banner_action" name="banner_action" value="" type="hidden">
                        <div class="xans-element- xans-layout xans-layout-searchheader "><!--
                            $product_page=/product/detail.html
                            $category_page=/product/list.html
                        -->
                            <fieldset>
                                <legend>검색</legend>
                                <select class="search-option" name="option" hidden="">
                                    <option value="T" ${PageHandler.psc.option=='T' ? "selected" : ""}>제목만</option>
                                </select>
                                <input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="${PageHandler.psc.keyword}" type="text">
                                <button type="submit" src= alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;" style="background-color: #f5f5f5">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512" style="text-align: center"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                        <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
                                    </svg>
                                </button>
                                <ul class="autoDrop" id=""></ul>
                            </fieldset>
                        </div>
                    </form>
                </div>
                <div class="hd_state">
                    <ul class="statelog clearfix">
                        <li class="xans-element- xans-layout xans-layout-statelogon "><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
                        <li class="xans-element- xans-layout xans-layout-statelogon "><a href="<c:url value='${addAndModify}'/>">${register}</a></li>
                        <li><a href="<c:url value='/order/list'/>">주문조회</a></li>
                        <li><a href="<c:url value='/cs'/>">고객센터</a></li>
                        <c:if test="${loginAdminTrue}">
                            <li><a href="/admin">관리자홈</a></li>
                        </c:if>
                    </ul>
                    <ul class="hd_icons clearfix"><li class="hdMyshop"><a href="/myshop/index.html">마이쇼핑</a></li>
                        <li class="hdWish"><a href="<c:url value='/custMyPage'/>">마이페이지</a></li>
                        <c:set var="cartCnt" value="${cartList.size()}"/>
                        <li class="xans-element- xans-layout xans-layout-statelogon hdBasket "><a href="<c:url value='/cart/list'/>"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #b8b8b8;"></i>
                            <span class="count EC-Layout_Basket-count-display"><span class="EC-Layout-Basket-count">${cartCnt}</span></span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="hd_lnb">
        <div id="category" class="xans-element- xans-layout xans-layout-category categoryOne">
            <div class="position">
                <ul class="clearfix">
                    <li class="xans-record-" onmouseover="showDropdown()"><a href="/category/카테고리/48/">카테고리</a></li>
                    <li class="xans-record-"><a href="/category/베스트/48/">베스트</a></li>
                    <li class="xans-record-"><a href="/category/깜짝특가/56/">깜짝특가</a></li>
                    <li class="xans-record-"><a href="/category/선물세트/72/">선물세트</a></li>
                    <li class="xans-record-"><a href="/category/한정특가/74/">한정특가</a></li>
                    <li class="xans-record-"><a href="/category/정기배송/75/">정기배송</a></li>
                    <li><a href="/board/gallery/list.html?board_no=2">이벤트</a></li>
                </ul>
                <div class="dropdown-content" style="width: 100%; height: 120px">
                    <c:forEach var="mainCategory" items="${cateMain}">
                        <span class="inner-dropdown" onmouseover="showInnerDropdown(this)">
                            <a href="" style="margin: 20px 50px">
                                <i class="ico-cate-gnb"></i>
                                <span>${mainCategory.mainName}</span>
                            </a>
                            <div class="inner-dropdown-content" style="width: 100%; height: 200px">
                                <c:forEach var="subCate" items="${prodCate.get(cateMain.indexOf(mainCategory))}">
                                    <span>
                                        <a href="">${subCate.medName}</a>
                                    </span>
                                </c:forEach>
                            </div>
                        </span>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
        function showDropdown() {
        const dropdown = document.querySelector('.dropdown');
        dropdown.classList.add('show-content');
        }

        function hideDropdown() {
            const dropdown = document.querySelector('.dropdown');
            dropdown.classList.remove('show-content');
        }

        function innerHideDropdown() {
            const innerDropdown = document.querySelector('.inner-dropdown-content');
            innerDropdown.classList.remove('show-content')
        }

        function showInnerDropdown(target) {
            // 모든 inner-dropdown-content 숨기기
            const innerDropdowns = document.querySelectorAll('.inner-dropdown-content');
            innerDropdowns.forEach(item => item.classList.remove('show-content'));

            // 선택한 inner-dropdown에 대한 inner-dropdown-content 보여주기
            target.querySelector('.inner-dropdown-content').classList.add('show-content');
        }

        // 마우스가 드롭다운 영역에서 벗어날 때 숨기기
        document.querySelector('.dropdown').addEventListener('mouseleave', hideDropdown);
        document.querySelector('.inner-dropdown-content').addEventListener('mouseleave', hideDropdown);

</script>
</body>
</html>
