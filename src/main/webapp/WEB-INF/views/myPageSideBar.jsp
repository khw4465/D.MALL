<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <div class="frame-left">
    <div class="aside-menu-wrap">
      <nav class="aside-menu">
        <ul class="menu-list">
          <li>
            <a href="<c:url value='/order/list'/>" class="menu">주문관리</a>
            <ul class="depth2">
              <li class="current"><a href="<c:url value='/order/list'/>">주문내역</a></li>
              <li><a href="<c:url value='/order/cnclRtn'/>">취소/반품 내역</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="menu">혜택관리</a>
            <ul class="depth2">
              <li class=""><a href="/mypage/mycoupon">쿠폰</a></li>
              <li class=""><a href="<c:url value='/point/custSelectAll'/>">포인트</a></li>

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
              <li class=""><a href="<c:url value='/dlvAddr/list'/>">배송지 관리</a></li>
              <li><a href="<c:url value='/custModify'/>">정보수정</a></li>
              <li><a href="<c:url value='/deleteCust'/>" onclick="return confirmDeletion()">회원탈퇴</a></li>
            </ul>
          </li>
        </ul>
      </nav><!--// menu-mypage -->
    </div><!--// aside-menu-wrap -->
  </div>

<script>
  $(document).ready(function(){
    let url = window.location.pathname; // 현재 페이지의 URL 경로를 가져옵니다.

    $('.depth2 li').each(function(){
      let anchor = $(this).find('a'); // li 요소 내부의 a 요소를 찾습니다.

      if(anchor.attr('href') === url){
        // 현재 URL과 일치하는 링크를 가진 li 요소에 'current' 클래스를 추가합니다.
        $(this).addClass('current');
      } else {
        // 현재 URL과 일치하지 않는 링크를 가진 li 요소에서 'current' 클래스를 제거합니다.
        $(this).removeClass('current');
      }
    });
  });

  function confirmDeletion() {
    return confirm("탈퇴하시겠습니까?");
  }

</script>