<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>myPage</title>
</head>
<body>
  <div class="frame-left">
    <div class="aside-menu-wrap">
      <nav class="aside-menu">
        <ul class="menu-list">
          <li>
            <a href="<c:url value='/order/list'/>" class="menu">주문관리</a>
            <ul class="depth2">
              <li class="current"><a href="<c:url value='/order/list'/>">주문내역</a></li>
              <li><a href="">취소/반품 내역</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="menu">혜택관리</a>
            <ul class="depth2">
              <li class=""><a href="/mypage/myCoupon">쿠폰</a></li>
              <li class=""><a href="/mypage/myPoint">포인트</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="menu">활동관리</a>
            <ul class="depth2">
              <li class=""><a href="/mypage/recentProduct/list">최근 본 상품</a></li>
              <li class=""><a href="/mypage/wish/list">찜한상품</a></li>
              <li><a href="/mypage/userCounsel/list">1:1문의</a></li><!-- 활성화될 경우 li에 addClass current  -->
              <li><a href="/mypage/prodReview/list">상품후기</a></li><!-- 활성화될 경우 li에 addClass current  -->
              <li><a href="/mypage/prodCounsel/list">상품문의내역</a></li><!-- 활성화될 경우 li에 addClass current  -->
            </ul>
          </li>
          <li>
            <a href="/mypage/delivery" class="menu">회원정보관리</a>
            <ul class="depth2">
              <li class=""><a href="/mypage/delivery">배송지 관리</a></li>
              <li><a href="/mypage/info/mypage">정보수정</a></li><!-- 활성화될 경우 li에 addClass current  -->
            </ul>
          </li>
        </ul>
      </nav><!--// menu-mypage -->
    </div><!--// aside-menu-wrap -->
  </div>
</body>
</html>
