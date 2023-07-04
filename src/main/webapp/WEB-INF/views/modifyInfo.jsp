<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : '/register/modify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<html>
<head>
    <title>정보수정</title>
    <link rel="stylesheet" href="<c:url value='/css/modifyInfo.css'/>">
</head>
<body>
<div class="content">
    <!-- 아이디,비번입력,비번확인 시작 -->
    <div class="cust-id">
        <div class="input-field">
            <label for="cust-id" class="label">아이디</label>
            <div class="cust-id">mhs1020</div>
        </div>

        <div class="cust-pwd">
            <label for="cust-password" class="label">비밀번호</label>
            <div class="cust-password-input">
                <label for="cust-pwd-input" class="cust-pwd">비밀번호 입력</label>
                <input type="password" id=" cust-password-input" name="cust-pwd-input" class="input-field"
                       placeholder="6 ~ 16자 영문, 숫자, 특문">
            </div>

            <div class="password-confirmation">
                <label for=" cust-password-confirmation" class="sub-label">비밀번호 확인</label>
                <input type="password" id=" cust-password-confirmation" name=" cust-password-confirmation"
                       class="input-field" placeholder="비밀번호 확인">
            </div>
        </div>
    </div>
    <!-- 아이디,비번입력,비번확인 종료 -->

    <!-- 이름 시작-->
    <div class="form-group">
        <div class="input-field">
            <label for="cust-name" class="label">이름</label>
            <div class="input-wrap">
                <input type="text" id="cust-name" name="cust-name" class="input-field" placeholder="2자 이상 입력"
                       maxlength="50" value="문희석">
                <span class="button-wrap">
                        <button type="button" class="edit-button"> <span id="edit-name">실명수정</span> </button>
                    </span>
            </div>
        </div>
    </div>
    <!-- 이름 종료-->

    <!-- 핸드폰 시작-->
    <div class="mpno">
        <div class="input-field">
            <label for="cust-mpno" class="label">휴대전화</label>
            <div class="input-wrap">
                <input type="text" id="cust-mpno" name="cust-mpno" class="input-field" placeholder="휴대폰 인증"
                       value="01012341234">
            </div>
        </div>
    </div>
    <!-- 핸드폰 종료-->

    <!-- 닉네임 시작-->
    <div class="grade">
        <div class="input-field">
            <label for="grade-name" class="label">등급</label>
            <div class="input-wrap">
                <input type="text" id="gradeName" name="gradeName" class="input-field"
                       placeholder="한글 8자, 영문 16자 이내" value="브론즈">
            </div>
            <p>다음 등급까지 남은금액 5000원</p>
        </div>
    </div>
    <!-- 닉네임 종료-->

    <!-- 생일 시작 -->
    <div class="birthdate">
        <div class="input-field">
            <label for=" cust-birthdate" class="label">생년월일 2000년1월1일</label>
        </div>
    </div>
    <!-- 생일 종료 -->

    <!-- 이메일 시작 -->
    <div class="email">
        <div class="input-field">
            <label for="cust-email" class="label">이메일</label>
            <div class="input-wrap">
                <input type="text" id=" cust-email" name="cust-email" class="input-field" placeholder="이메일 주소"
                       value="hsm1020s">
            </div>
        </div>
    </div>
    <!-- 이메일 종료 -->

    <!-- 계좌번호 시작-->
    <div class="acno">
        <div class="input-field">
            <label for="acno-num" class="label">계좌번호</label>
            <div class="input-wrap">
                <input type="text" id="acno-num" name="acno-num" class="input-field" maxlength="20"
                       value="010101-01-530099">
                <span class="button-wrap">
                        <button type="button" class="edit-button"> <span id="edit-name">계좌번호 변경</span> </button>
                    </span>
            </div>

        </div>
    </div>
    <!-- 계좌번호 종료-->
    <!-- 버튼 시작 -->
    <div class="button-group">
        <button type="button" class="cancel-btn"><span>취소하기</span></button>
        <button type="button" class="confirm-btn"><span>수정완료</span></button>
    </div>
    <!-- 버튼 종료 -->

    <!-- 평생회원 시작 -->
    <!-- <div class="life-member">

        <div class="input-field">
            <label for="lifetime-membership" class="label">평생회원</label>

            <ul class="membership-selection">
                <li class="life-y">
                    <input type="radio" id="membership-agree" class="radio-input" name="lifetime-membership"
                        value="Y"><label for="membership-agree">동의</label>
                </li>

                <li class="life-n">
                    <input type="radio" id="membership-disagree" class="radio-input" name="lifetime-membership"
                        checked value="N"><label for="membership-disagree">동의안함</label>
                </li>
            </ul>

        </div>

    </div> -->
    <!-- 평생회원 종료 -->
</div>
</body>
</html>
