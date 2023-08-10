<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Notc</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/adminnotc.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/loginlist.css'/>">
<%--    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">--%>
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/sb-admin-2.min.css'/>" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href=<c:url value='/vendor/datatables/dataTables.bootstrap4.min.css'/>"" rel="stylesheet">

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

            <script>
                let msg="${msg}";
                if(msg=="WRT_ERR") alert("공지사항 등록에 실패했습니다");
                if(msg=="MOD_READY") alert("수정하실 수 있습니다.")
            </script>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <h3 class="viewtitle">공지사항${mode=="new" ? "쓰기" : ""}</h3>

                <div class="use-guide">
                    <form action="" id="form">
                        <input type="hidden" name="bbsoNo" value="${NotcDto.bbsoNo}" readonly="readonly">
                        <input type="text" name="cate" value="${NotcDto.cate}" ${mode=="new" ? '' : 'readonly="readonly"'}>
                        <h3>제목</h3>
                        <input type="text" name="ttl" value="${NotcDto.ttl}" placeholder="제목을 입력하세요."${mode=="new" ? '' : 'readonly="readonly"'}>
                        <h3>내용</h3>
                        <textarea name="cn" cols="30" rows="10" placeholder="내용을 입력하세요." ${mode=="new" ? '' : 'readonly="readonly"'} >${NotcDto.cn}</textarea>

                        <br>
                        <div class="btnlist">
                            <button type="button" id="modifyBtn" class="CSBtn">수정</button>
                            <button type="button" id="removeBtn" class="CSBtn">삭제</button>
                            <button type="button" id="listBtn" class="CSBtn">목록</button>
                        </div>
                    </form> <%--    <form action="" id="form">--%>
                </div> <!-- use-guide -->

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
<script>
    $(document).ready(function (){
        $('#listBtn').on("click",function (){
            location.href="<c:url value='/notc/adminlist${notcSearchCondition.queryString}'/>";
        });


        $('#removeBtn').on("click",function (){
            if(!confirm("삭제하시겠습니까?")) return;
            let form = $('#form');
            form.attr("action","<c:url value='/notc/adminremove${notcSearchCondition.queryString}'/>");
            form.attr("method","post");
            form.submit();
        });

        $('#writeBtn').on("click",function (){
            let form = $('#form');
            form.attr("action","<c:url value='/notc/adminwrite'/>");
            form.attr("method","post");
            form.submit();
        });

        $('#modifyBtn').on("click",function (){
            //  1. 읽기 상태이면 수정 상태로 변경
            let form = $('#form');
            let isReadonly = form.find("input[name='ttl']").attr("readonly");

            if (isReadonly=='readonly'){
                $("input[name=ttl]").attr("readonly",false);
                $("textarea").attr("readonly",false);
                $("modifyBtn").html("등록");
                $(".viewtitle").html("공지사항 수정");
                return;
            }
            //  2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action","<c:url value="/notc/adminmodify"/>");
            form.attr("method","post");
            form.submit();

        });
    });

</script>
</body>





<h1 class="h3 mb-2 text-gray-800">회원 관리</h1>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">회원 리스트</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th class="">회원아이디</th>
                    <th class="">이름</th>
                    <th class="">핸드폰번호</th>
                    <th class="">분류</th>
                    <th class="">등급</th>
                    <th class="">상태</th>
                    <th class="">생일</th>
                    <th class="">이메일</th>
                    <th class="">계좌번호</th>
                    <th class="">성별</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="custDto" items="${CustListPage}">
                    <tr>
                            <%--                        여기에 1~10까지 숫자 필요--%>
                        <th class="">${custDto.custId}</th>
                        <th class="">${custDto.name}</th>
                        <th class="">${custDto.mpNo}</th>
                        <th class="">${custDto.custTp}</th>
                        <th class="">${custDto.grade}</th>
                        <th class="">${custDto.stus}</th>
                        <th class="">${custDto.birth}</th>
                        <th class="">${custDto.email}</th>
                        <th class="">${custDto.acno}</th>
                        <th class="">${custDto.gender}</th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-5">
                <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                    최근 10건의 주문내역입니다.
                </div>
            </div>
            <div class="col-sm-12 col-md-7">
                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                    <ul class="pagination">
                        <c:if test="${cust_totalCnt==null || cust_totalCnt==0}">
                            <div> 회원이 없습니다.</div>
                        </c:if>
                        <c:if test="${cust_totalCnt!=null && cust_totalCnt!=0}">
                            <c:if test="${cust_ph.showPrev}">
                                <li class="paginate_button page-item previous disabled"
                                    id="dataTable_previous">
                                    <a href="<c:url value='/custSelectAll?page=${cust_ph.beginPage-1}&pageSize=${cust_ph.pageSize}'/>"
                                       aria-controls="dataTable" data-dt-idx="0" tabindex="0"
                                       class="page-link">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="${cust_ph.beginPage}" end="${cust_ph.endPage}">

                                <li class="paginate_button page-item ">
                                    <a href="<c:url value='/custSelectAll?page=${i}&pageSize=${cust_ph.pageSize}'/>"
                                       aria-controls="dataTable" data-dt-idx="1" tabindex="0"
                                       class="page-link">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${cust_ph.showNext}">
                                <li class="paginate_button page-item next" id="dataTable_next"><a
                                        href="<c:url value='/custSelectAll?page=${cust_ph.endPage+1}&pageSize=${cust_ph.pageSize}'/>"
                                        aria-controls="dataTable"
                                        data-dt-idx="7"
                                        tabindex="0"
                                        class="page-link">Next</a>
                                </li>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>