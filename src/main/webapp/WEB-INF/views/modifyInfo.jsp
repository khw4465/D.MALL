<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : '/register/modify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>정보수정</title>
    <link rel="stylesheet" href="<c:url value='/css/myPage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/myPageSideBar.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/main2.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/modifyInfo.css'/>">
</head>
<body>

<nav>
    <jsp:include page="header.jsp"/>
</nav>

<%--<form id="modify-info" action="/register/add" method="post">--%>
<div class="content">
    <div class="dashboard1">
        <jsp:include page="myPageSideBar.jsp"/>
    </div>
    <div class="dashboard2">
<%--        가운데정렬 modifyinfo.css에있음--%>
        <!-- 아이디,비번입력,비번확인 시작 -->
        <div class="cust-id">
            <div class="input-field">
                <label for="cust-id" class="label">아이디</label>
                <div class="cust-id">${modydto.custId}</div>
            </div>

            <div class="cust-pwd">
                <label for="cust-password" class="label">비밀번호</label>
                <div class="cust-password-input">
                    <label for="cust-pwd-input" class="cust-pwd">비밀번호 입력</label>
                    <input type="password" id=" cust-password-input" name="cust-pwd-input" class="input-field_p"
                           placeholder="6 ~ 16자 영문, 숫자, 특문">
                </div>

                <div class="password-confirmation">
                    <label for=" cust-password-confirmation" class="sub-label">비밀번호 확인</label>
                    <input type="password" id=" cust-password-confirmation" name=" cust-password-confirmation"
                           class="input-field_p" placeholder="비밀번호 확인">
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
                           maxlength="50" value="${modydto.name}">

                    <%--                <span class="button-wrap">--%>
                    <%--                            <button type="button" class="edit-button"> <span id="edit-name">이름 변경</span> </button>--%>
                    <%--                </span>--%>
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
                           value="${modydto.mpNo}">
                    <%--                <span class="button-wrap">--%>
                    <%--                            <button type="button" class="edit-button"> <span id="edit-mpno">전화번호 변경</span> </button>--%>
                    <%--                </span>--%>
                </div>
            </div>
        </div>
        <!-- 핸드폰 종료-->

        <!-- 이메일 시작 -->
        <div class="email">
            <div class="input-field">
                <label for="cust-email" class="label">이메일</label>
                <div class="input-wrap">
                    <input type="text" id="cust-email" name="cust-email" class="input-field" placeholder="이메일 주소"
                           value="${modydto.email}">
                    <%--                <span class="button-wrap">--%>
                    <%--                            <button type="button" class="edit-button"> <span id="edit-email">이메일 변경</span> </button>--%>
                    <%--                </span>--%>
                </div>
            </div>
        </div>
        <!-- 이메일 종료 -->

        <!-- 계좌번호 시작-->
        <div class="acno">
            <div class="input-field">
                <label for="acno-num" class="label">계좌번호</label>
                <div class="input-wrap">
                    <input type="text" id="cust-acno" name="cust-acno" class="input-field" maxlength="20"
                           value="${modydto.acno}">
                    <%--                <span class="button-wrap">--%>
                    <%--                            <button type="button" class="edit-button"> <span id="edit-acno">계좌번호 변경</span> </button>--%>
                    <%--                </span>--%>
                </div>
            </div>
        </div>
        <!-- 계좌번호 종료-->

        <!-- 생일 시작 -->
        <div class="birthdate">
            <div class="input-field">
                <label for="cust-birthdate" class="label">생년월일 ${modydto.birth}</label>
                <select id="year"></select>
                <select id="month"></select>
                <select id="day"></select>
            </div>
        </div>
        <!-- 생일 종료 -->

        <!-- 등급 시작-->
        <div class="grade">
            <div class="input-field">
                <label for="grade-name" class="label">등급</label>
                <div class="input-wrap">
                    <input type="text" id="gradeName" name="gradeName" class="input-field"
                           value="${modydto.grade}">
                </div>
                <p>다음 등급까지 남은금액 5000원</p>
            </div>
        </div>
        <!-- 등급 종료-->

        <!-- 버튼 시작 -->
        <div class="button-group">
            <button type="button" class="cancel-btn" onclick="location.href='<c:url value='/custMyPage'/>'">
                <span>취소하기</span></button>
            <button type="button" class="confirm-btn"><span>수정완료</span></button>
        </div>
        <!-- 버튼 종료 -->
    </div>
</div>
<%--</form>--%>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>
<script>
    window.addEventListener('load', function () {
        var yearSelect = document.getElementById('year');
        var monthSelect = document.getElementById('month');
        var daySelect = document.getElementById('day');

        // 년도 추가
        for (var i = 2023; i >= 1900; --i) {
            var option = document.createElement('option');
            option.text = option.value = i;
            yearSelect.add(option);
        }

        // 월 추가
        for (var i = 1; i <= 12; ++i) {
            var option = document.createElement('option');
            option.text = option.value = i;
            monthSelect.add(option);
        }

        // 일 추가
        for (var i = 1; i <= 31; ++i) {
            var option = document.createElement('option');
            option.text = option.value = i;
            daySelect.add(option);
        }
    });

    window.addEventListener('load', function () {
        const inputs = document.querySelectorAll('.input-field');
        inputs.forEach(input => {
            //input.setAttribute('readonly', true);
        });

        const buttons = document.querySelectorAll('.edit-button');

        buttons.forEach(button => {
            button.addEventListener('click', (e) => {
                const inputField = e.target.closest('.input-wrap').querySelector('.input-field');
                const buttonText = e.target.innerText;
                if (buttonText.includes('변경')) {
                    // e.target.innerText = buttonText.replace('변경', '수정');
                    // inputField.removeAttribute('readonly');
                } else if (buttonText.includes('수정')) {
                    // e.target.innerText = buttonText.replace('수정', '변경');
                    // inputField.setAttribute('readonly', true);
                }
            });
        });
    });

    $(document).ready(function () {
        $('.confirm-btn').click(function () {
            let modydto_name = $('#cust-name').val();
            let modydto_phone = $('#cust-mpno').val();
            let modydto_email = $('#cust-email').val();
            let modydto_acno = $('#cust-acno').val();

            $.ajax({
                type: 'POST',
                url: '/custModify',
                headers: {"content-type": "application/json"},
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({
                    "cust-name": modydto_name,
                    "cust-mpno": modydto_phone,
                    "cust-email": modydto_email,
                    "cust-acno": modydto_acno
                }),
                success: function (result) {
                    $('#cust-name').val(result.name);
                    $('#cust-mpno').val(result.mpno);
                    $('#cust-email').val(result.email);
                    $('#cust-acno').val(result.acno);
                    alert("회원 정보가 업데이트되었습니다.");
                    window.location.href = "/custModify";
                },
                error: function (request, status, error) {
                    // 에러 메세지를 자세히 출력
                    alert("에러");
                    alert(JSON.stringify(request))
                    alert(JSON.stringify(status))
                    alert(JSON.stringify(error))
                }
            });
        });
    });

</script>

</html>
