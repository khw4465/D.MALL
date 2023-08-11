<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Notc</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/adminnotc.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/sb-admin-2.min.css'/>" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href=<c:url value='/vendor/datatables/dataTables.bootstrap4.min.css'/>"" rel="stylesheet">

</head>
<script>
    let msg = "${msg}";
    if (msg == "LIST_ERR") alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
    if (msg == "READ_ERR") alert("삭제되었거나 없는 게시물입니다.");
    if (msg == "DEL_ERR") alert("삭제되었거나 없는 게시물입니다.");
    if (msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
    if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
    if (msg == "MOD_OK") alert("성공적으로 수정되었습니다.");
</script>


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

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                    </div>
                    <div class="notcsearch">
                        <form id="cs_search" action="<c:url value="/notc/adminlist"/>" class="search-form" method="get">
                            <select class="search-option" name="option" hidden="hidden">
                                <option value="T" ${pagehandler.sc.option=='T' ? "selected" : ""} hidden="hidden">제목만
                                </option>
                            </select>
                            <input type="text" name="keyword" class="cs-search-input" type="text"
                                   value="${pagehandler.sc.keyword}" placeholder="제목을 검색해주세요">
                            <input type="submit" class="cs-search-button move-right" value="검색">
                        </form>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th class="td-num">번호</th>
                                    <th class="td-cate">카테고리</th>
                                    <th class="td-title">제목</th>
                                    <th class="td-weak">등록일</th>
                                    <th class="td-weak">조회수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="NotcDto" items="${list}">
                                    <tr>
                                        <td class="td-num">${NotcDto.bbsoNo}</td>
                                        <td class="td-cate">${NotcDto.cate}</td>
                                        <td class="none-center"><a
                                                href="<c:url value='/notc/adminread?bbsoNo=${NotcDto.bbsoNo}&amp;page=${page}&amp;pageSize=${pageSize}' />">${NotcDto.ttl}</a>
                                        </td>
                                        <td class="td-weak">${NotcDto.wrtd}</td>
                                        <td class="td-weak">${NotcDto.notcCnt}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="writeBtn">
                                <button type="button" id="writeBtn" onclick="location.href='<c:url value="/notc/adminwrite"/>'">글쓰기
                                </button>
                            </div> <!-- writeBtn -->
                            <br>
                        </div>
                        <div class="row">
                            <!-- 핸들러 -->
                            <div class="col-sm-12 col-md-5">
                            </div>
                            <div id="handle">
                                <c:if test="${totalCnt==null || totalCnt==0}">
                                    <div> 게시물이 없습니다.</div>
                                </c:if>
                                <c:if test="${totalCnt!=null && totalCnt!=0}">
                                    <c:if test="${pagehandler.showPrev}">
                                        <a class="page"
                                           href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(pagehandler.beginPage-1)}"/> ">&lt;</a>
                                    </c:if>
                                    <c:forEach var="i" begin="${pagehandler.beginPage}" end="${pagehandler.endPage}">
                                        <a class="page ${i==pagehandler.sc.page? "paging-active" : ""}"
                                           href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(i)}"/>">${i}</a>
                                    </c:forEach>
                                    <c:if test="${pagehandler.showNext}">
                                        <a class="page"
                                           href="<c:url value="/notc/adminlist${pagehandler.sc.getQueryString(pagehandler.endPage)}"/> ">&gt;</a>
                                    </c:if>
                                </c:if>
                            </div>
                            <!-- 핸들러 -->
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
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="<c:url value='${loginOutLink}'/>">Logout</a>
            </div>
        </div>
    </div>
</div>

<%--자스 파일 분리함--%>
<script type="text/javascript" src="<c:url value='/js/prodRegister.js'/>"></script>
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
<script src="<c:url value="js/demo/datatables-demo.js"/>"></script>
</body>
</html>