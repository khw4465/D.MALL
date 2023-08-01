<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null || pageContext.request.session.getAttribute('id')=='' ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="addAndModify" value="${loginId=='' ? '/register/add' : 'custModify'}"/>
<c:set var="register" value="${loginId=='' ? '회원가입' : '정보수정'}"/>
<c:set var="logo" value="${loginId=='' ? '/' : '/login/logoClick'}"/>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/myPageSideBar.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/dlvAddr.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="content">
    <div class="left-content">
        <jsp:include page="myPageSideBar.jsp"/>
    </div>
    <div class="right-content">
        <div class="frame-right">
            <div class="frame-cnt-inner">
                <div class="menu-title-area">
                    <h3 class="title-menu">배송지 관리</h3>
                    <p class="sub-desc">* 배송지는 최대 30개까지 등록됩니다.</p>
                    <div class="right">
                        <a href="" class="btn-link-txt1 btn-modal-delivery"><i
                                class="ico-plus"></i><span>새 배송지 추가</span></a>
                    </div>
                </div><!--// menu-title-area -->

                <div class="board-list" id="tbl-my-delivery">
                    <table>
                        <caption>배송지 관리</caption>
                        <colgroup>
                            <col style="width:50px">
                            <col style="width:140px">
                            <col style="width:auto">
                            <col style="width:160px">
                            <col style="width:150px">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">선택</th>
                            <th scope="col">받으실 분</th>
                            <th scope="col">배송주소</th>
                            <th scope="col">연락처</th>
                            <th scope="col">관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="dlv" items="${dlvAddr}">
                            <tr>
                                <td class="text-center">
                                    <div class="custom-radio single">
                                        <input type="radio" class="radio" id="radio-delivery-20220424000000916645"
                                               name="vDeliveryid">
                                        <label for="radio-delivery-20220424000000916645" class="blind"></label>
                                    </div>
                                </td>
                                <td class="text-center">${dlv.rcpr}</td>
                                <td class="text-left">
                                    <label for="">
                                        <c:if test="${dlv.basicYn == 'T'}">
                                            <span class="text-mint">[기본배송지]</span>
                                        </c:if>
                                            ${dlv.dlvAddr}&nbsp;${dlv.dtlAddr}</label>
                                </td>
                                <td class="text-center td-delivery-cell">
                                    ${dlv.mpNo}
                                </td>
                                <td class="text-center">
                                    <ul class="sep-list type4">
                                        <li><a href="" class="btn-upd-delivery">수정</a></li>
                                        <li>
                                            <a href="" class="btn-delt-delivery">삭제</a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div><!--// board-list -->

                <div class="btn-bottom-area">
                    <button type="button" class="btn-basic-lg2 btn-navy btn-basic-delivery"><span>기본 배송지로 설정</span>
                    </button>
                </div>
            </div><!--// frame-cnt-inner -->
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<script>
    // 모달을 얻어온다.
    const modal = document.getElementById("myModal");

    // 모달을 여는 버튼의 요소를 얻어온다.
    const btn = document.getElementById("myBtn");

    // 모달 창을 닫는 요소의 엘리먼트를 가져온다.
    const xBtn = Array.from(document.querySelectorAll(".ui-close-pop"));

    const cfmBtn = document.querySelector("#cfmBtn")

    // 모달을 여는 버튼을 클릭하면 모달을 보여준다.(default = display.none)
    btn.onclick = function () {
        modal.style.display = "block";
    }


    // <span> x 를 클릭하면 모달창을 닫는다.
    xBtn.forEach(btn => {
        btn.onclick = function () {
            modal.style.display = "none";
            resetDlv();
        }
    })

    const addBtn = document.querySelector("#addDlvBtn");
    addBtn.addEventListener('click', () => {
        document.getElementById('popup-myAddress').style.display = 'none';
        document.getElementById('userDeliveryDiv').style.display = 'block';
    });

    let resetDlv = function () {
        document.getElementById('popup-myAddress').style.display = 'block';
        document.getElementById('userDeliveryDiv').style.display = 'none';
        document.getElementById('userPostNo').style.display = 'none';
    };

    // 우편번호 버튼
    const findPostNo = document.getElementById("PostNo");

    // 우편번호 팝업을 담을 div요소
    const postCdContent = document.getElementById("postCd-body");

    const postCd = document.getElementById('vPostcd');
    const dlvAddr = document.getElementById('vAddr');

    findPostNo.addEventListener('click', () => {
        document.getElementById('userDeliveryDiv').style.display = 'none';
        document.getElementById('userPostNo').style.display = 'block';
        new daum.Postcode({
            oncomplete: function (data) {
                let mainAddr = '';

                postCd.value = data.zonecode;

                if (data.userSelectedType === 'R') {
                    mainAddr = data.roadAddress;
                } else {
                    mainAddr = data.jibunAddress;
                }

                dlvAddr.value = mainAddr;

                returnDlv();
            }
        }).embed(postCdContent);
    })

    function returnDlv() {
        if (postCd.value !== '') {
            document.getElementById('userPostNo').style.display = 'none';
            document.getElementById('userDeliveryDiv').style.display = 'block';
        }
    }
</script>
</body>
</html>
