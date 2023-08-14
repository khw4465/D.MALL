<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<%@ page buffer="none" %>

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/admin"/> ">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">D.GAJA<sup></sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item">
        <a class="nav-link" href="index.html">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages1"
           aria-expanded="true" aria-controls="collapsePages1">
            <i class="fas fa-fw fa-folder"></i>
            <span>주문관리</span>
        </a>
        <div id="collapsePages1" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">주문관리</h6>
                <a class="collapse-item" href="<c:url value='/order/adminOrdHist'/>">주문 통합검색</a>
                <a class="collapse-item" href="login.html">발주(주문)확인/발송관리</a>
                <a class="collapse-item" href="register.html">배송현황 관리</a>
                <a class="collapse-item" href="forgot-password.html">구매확정 내역</a>
                <a class="collapse-item" href="404.html">취소관리</a>
                <a class="collapse-item" href="blank.html">반품관리</a>
                <a class="collapse-item" href="<c:url value='/order/stats'/>">일별매출내역 통계</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages2"
           aria-expanded="true" aria-controls="collapsePages2">
            <i class="fas fa-fw fa-folder"></i>
            <span>회원관리</span>
        </a>
        <div id="collapsePages2" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">회원관리</h6>
                <a class="collapse-item" href="<c:url value='/custSelectAll'/>">회원리스트</a>
                <a class="collapse-item" href="<c:url value='/loginHist'/>">회원로그인이력</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages3"
           aria-expanded="true" aria-controls="collapsePages3">
            <i class="fas fa-fw fa-folder"></i>
            <span>상품관리</span>
        </a>
        <div id="collapsePages3" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">상품관리</h6>
                <a class="collapse-item" href="<c:url value='/prod/register'/>">상품 등록</a>
                <a class="collapse-item" href="#">상품 조회/수정</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages4"
           aria-expanded="true" aria-controls="collapsePages4">
            <i class="fas fa-fw fa-folder"></i>
            <span>게시판관리</span>
        </a>
        <div id="collapsePages4" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">게시판관리</h6>
                <a class="collapse-item" href="<c:url value='/notc/adminlist'/>">공지사항 관리</a>
                <a class="collapse-item" href="forgot-password.html">리뷰 관리</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link" href="charts.html">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
    </li>

    <!-- Nav Item - Tables -->
    <li class="nav-item active">
        <a class="nav-link" href="tables.html">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>