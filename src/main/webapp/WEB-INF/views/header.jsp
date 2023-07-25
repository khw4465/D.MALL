<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
      <ul class="menu">
        <li>
          <div class="dropdown" onmouseover="showDropdown()">
            <div id="lod">
              <i class="fa fa-caret-down">카테고리</i>
            </div>
            <div class="dropdown-content" style="width: 100%; height: 120px">
              <c:forEach var="mainCategory" items="${cateMain}">
                <span class="inner-dropdown" onmouseover="showInnerDropdown(this)">
                  <a href="" style="margin: 20px 50px">
                    <i class="ico-cate-gnb">
                      <img src="https://file.rankingdak.com/image/RANK/BANNER/CATE_PC1_1/20230419/IMG1681JRj889432369.png" class="active" alt="">
                      <img src="https://file.rankingdak.com/image/RANK/BANNER/CATE_PC1_2/20230419/IMG1681vTX889434740.png" class="notActive" alt="">
                    </i>
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
        </li>
      </ul>
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
</html>
