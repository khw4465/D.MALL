<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<%--T 제거하는 라이브러리--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인이력</title>
<%--    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">--%>
<%--    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/sb-admin-2.min.css'/>" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">
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

                <!-- Page Heading -->

                <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">회원 로그인 이력</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th class="">회원아이디</th>
                                    <th class="">로그인일자</th>
                                    <th class="">로그인성공여부</th>
                                    <th class="">로그인IP</th>
                                    <th class="">로그인실패원인</th>
                                    <th class="">로그인국가</th>
                                    <th class="">로그인기기</th>
                                    <th class="">실패횟수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="LoginHistoryDTO" items="${LoginHistoryList}">
                                    <div class="">
                                        <tr>
                                            <th class="">${LoginHistoryDTO.custId}</th>
                                            <th class="">${fn:replace(LoginHistoryDTO.dttm, 'T', ' ')}</th>
                                            <th class="">${LoginHistoryDTO.scssYn}</th>
                                            <th class="">${LoginHistoryDTO.ip}</th>
                                            <th class="">${LoginHistoryDTO.failCaus}</th>
                                            <th class="">${LoginHistoryDTO.natn}</th>
                                            <th class="">${LoginHistoryDTO.mhrLS}</th>
                                            <th class="">${LoginHistoryDTO.failCnt}</th>
                                        </tr>
                                    </div>
                                </c:forEach>
                                </tbody>
                            </table>
                            <br>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-5">
                                <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                                    최근 10건의 로그인 이력입니다.
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                    <ul class="pagination">
                                        <c:if test="${hist_totalCnt==null || hist_totalCnt==0}">
                                            <div> 로그인 이력이 없습니다.</div>
                                        </c:if>
                                        <c:if test="${hist_totalCnt!=null && hist_totalCnt!=0}">
                                            <c:if test="${hist_ph.showPrev}">
                                                <li class="paginate_button page-item previous disabled"
                                                    id="dataTable_previous">
                                                    <a href="<c:url value='/loginHist?page=${hist_ph.beginPage-1}&pageSize=${hist_ph.pageSize}'/>"
                                                       aria-controls="dataTable" data-dt-idx="0" tabindex="0"
                                                       class="page-link"><</a>
                                                </li>
                                            </c:if>
                                            <c:forEach var="i" begin="${hist_ph.beginPage}" end="${hist_ph.endPage}">
                                                <li class="paginate_button page-item ">
                                                    <a href="<c:url value='/loginHist?page=${i}&pageSize=${hist_ph.pageSize}'/>"
                                                       aria-controls="dataTable" data-dt-idx="1" tabindex="0"
                                                       class="page-link">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <c:if test="${hist_ph.showNext}">
                                                <li class="paginate_button page-item next" id="dataTable_next"><a
                                                        href="<c:url value='/loginHist?page=${hist_ph.endPage+1}&pageSize=${hist_ph.pageSize}'/>"
                                                        aria-controls="dataTable"
                                                        data-dt-idx="7"
                                                        tabindex="0"
                                                        class="page-link">></a>
                                                </li>
                                            </c:if>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->
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

<!-- Bootstrap core JavaScript-->
<script src="<c:url value="vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="js/sb-admin-2.min.js"/>"></script>

<!-- Page level plugins -->
<script src="<c:url value="vendor/datatables/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="vendor/datatables/dataTables.bootstrap4.min.js"/>"></script>

<!-- Page level custom scripts -->
<%--<script src="<c:url value="js/demo/datatables-demo.js"/>"></script>--%>

</body>
</html>