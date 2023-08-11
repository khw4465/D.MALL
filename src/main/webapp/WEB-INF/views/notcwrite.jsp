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
    <link rel="stylesheet" type="text/css" href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/sb-admin-2.min.css'/>" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/css/adminnotc.css'/>">
<%--    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">--%>
<%--    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">--%>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="adminSideBar.jsp"/>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="adminHeader.jsp"/>
            <!-- End of Topbar -->


            <!-- Begin Page Content -->
            <div class="container-fluid">

                <h1 class="h3 mb-2 text-gray-800">게시판 관리</h1>

                <div class="col-lg-6">

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항 작성</h6>
                        </div>
                        <div class="card-body">
                            <div class="use-guide">
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

                                        <button type="button" id="WBtn" class="btn btn-primary btn-icon-split CSbtn"><span class="text">등록</span></button>
                                        <button type="button" id="listBtn" class="btn btn-primary btn-icon-split CSbtn"><span class="text">취소</span></button>
                                    </div>
                                </form>
                            </div> <!-- use-guide -->
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- /.container-fluid -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Main Content -->

</div>
<!-- End of Content Wrapper -->

<!-- End of Page Wrapper -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">현재 세션을 종료하고 싶으시면 "로그아웃"을 눌러주세요.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <a class="btn btn-primary" href="<c:url value='${loginOutLink}'/>">로그아웃</a>
            </div>
        </div>
    </div>
</div>
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
