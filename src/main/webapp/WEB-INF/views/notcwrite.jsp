<%--
  Created by IntelliJ IDEA.
  User: ftisa
  Date: 2023-07-22
  Time: 오후 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>
<html>
<head>
    <title>공지사항 작성</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/adminnotc.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminnotc.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">

</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">

    <jsp:include page="adminSideBar.jsp"/>
<div class="write-list">
    <div id="use-guide">
        <h3>공지사항 작성</h3>

        <form action="" id="form">
            <div>
                <select name="category">
                    <option value="업데이트">업데이트</option>
                    <option value="안내">안내</option>
                    <option value="점검">점검</option>
                    <option value="이벤트">이벤트</option>
                </select>
            </div>

            <div>
                <input type="text" id="ttl" name="ttl" value="${NotcDto.ttl}" placeholder="제목을 입력하세요.">
            </div>
            <div>
                <textarea id="cn" name="cn" cols="30" rows="10" placeholder="내용을 입력하세요.">${NotcDto.cn}</textarea>
            </div>

            <div>
                <button type="button" id="WBtn" class="CSbtn">등록</button>
                <button type="button" id="listBtn" class="CSbtn">취소</button>
            </div>
        </form>


</div>
        </div> <!-- end of right-list -->

</div> <!-- end of container -->
<script>
    $(document).ready(function (){
        $('#listBtn').on("click",function (){
            location.href="<c:url value='/notc/adminlist${notcSearchCondition.queryString}'/>";
        });

        <%--$('#writeBtn').on("click",function (){--%>
        <%--    let form = $('#form');--%>
        <%--    form.attr("action","<c:url value='/notc/adminwrite'/>");--%>
        <%--    form.attr("method","post");--%>
        <%--    form.submit();--%>
        <%--});--%>

        $('#WBtn').on("click",function (){
            // 기존 폼 제출 코드를 sendData 호출로 변경
            sendData();
        });


    });

    // 서버로 데이터를 전송하는 함수
    function sendData() {
        var ttl = $('#ttl').val(); // 이 부분에 타이틀 값을 가져오세요
        var cn = $('#cn').val(); // 이 부분에 글 내용을 가져오세요

        $.ajax({
            url: '/notc/adminwrite',
            type: 'POST',
            data: {
                ttl: ttl,
                cn: cn,
                selectedOption: $('select[name=category]').val()
            },
            success: function(response) {
                console.log(response);

                if (response.success) {
                    alert("등록이 완료되었습니다.");
                    window.location.href = '/notc/adminlist';
                } else {
                    alert("오류가 발생했습니다: " + response.message);
                }
            }
        });
    }


    // 버튼 클릭 이벤트에 sendData 함수를 연결
    $("#your_send_button_id").on('click', sendData);
</script>
</body>
</html>
