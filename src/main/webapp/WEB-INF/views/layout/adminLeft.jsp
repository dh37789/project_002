<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Sidebar -->
<!--
    Helper classes

    Adding .sidebar-mini-hide to an element will make it invisible (opacity: 0) when the sidebar is in mini mode
    Adding .sidebar-mini-show to an element will make it visible (opacity: 1) when the sidebar is in mini mode
        If you would like to disable the transition, just add the .sidebar-mini-notrans along with one of the previous 2 classes

    Adding .sidebar-mini-hidden to an element will hide it when the sidebar is in mini mode
    Adding .sidebar-mini-visible to an element will show it only when the sidebar is in mini mode
        - use .sidebar-mini-visible-b if you would like to be a block when visible (display: block)
-->
<!-- Left -->
<nav id="sidebar">
    <!-- Sidebar Scroll Container -->
    <div id="sidebar-scroll">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
            <!-- Side Header -->
            <div class="content-header content-header-fullrow px-15">
                <!-- Mini Mode -->
                <div class="content-header-section sidebar-mini-visible-b">
                    <!-- Logo -->
                    <span class="content-header-item font-w700 font-size-xl float-left animated fadeIn">
                        <span class="text-dual-primary-dark">c</span><span class="text-primary">b</span>
                    </span>
                    <!-- END Logo -->
                </div>
                <!-- END Mini Mode -->

                <!-- Normal Mode -->
                <div class="content-header-section text-center align-parent sidebar-mini-hidden">
                    <!-- Close Sidebar, Visible only on mobile screens -->
                    <!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
                    <button type="button" class="btn btn-circle btn-dual-secondary d-lg-none align-v-r" data-toggle="layout" data-action="sidebar_close">
                        <i class="fa fa-times text-danger"></i>
                    </button>
                    <!-- END Close Sidebar -->

                    <!-- Logo -->
                    <div class="content-header-item">
                        <a class="link-effect font-w700" href="${pageContext.request.contextPath}/main/admin.do">
                            <img src="${pageContext.request.contextPath}/image/butterfly.png" width="30px"></img>
                            <span class="font-size-xl text-dual-primary-dark">Pap</span><span class="font-size-xl text-primary">illon</span>
                        </a>
                    </div>
                    <!-- END Logo -->
                </div>
                <!-- END Normal Mode -->
            </div>
            <!-- END Side Header -->

<!-- 메뉴 시작 -->
            <!-- Side Navigation -->
            <div class="content-side content-side-full">
                <ul class="nav-main">
                    <li>
                        <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-users"></i><span class="sidebar-mini-hide">회원관리</span></a>
                        <ul>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/memberMgn/clientMgn.do"><span class="sidebar-mini-hide">클라이언트 관리</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/memberMgn/freelancerMgn.do"><span class="sidebar-mini-hide">프리랜서 관리</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/memberMgn/blackMgn.do"><span class="sidebar-mini-hide">블랙리스트 관리</span></a>
                            </li>
                         </ul>
                    </li>
                    <li>
                        <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-list"></i><span class="sidebar-mini-hide">게시판 관리</span></a>
                        <ul>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/notice/anoticeList.do?currentPage=1"><span class="sidebar-mini-hide">공지사항 게시판</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/board/aboardList.do?currentPage=1"><span class="sidebar-mini-hide">자유 게시판</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/qna/aqnaList.do?currentPage=1"><span class="sidebar-mini-hide">Q&A 게시판</span></a>
                            </li>
                         </ul>
                    </li>
                    <li>
                        <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-folder-alt"></i><span class="sidebar-mini-hide">프로젝트 관리</span></a>
                       <ul>
                        <li>
                            	<a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/projectMgn/standbyPjList.do"><span class="sidebar-mini-hide">승인 대기 프로젝트</span></a>
                            </li>
                            
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/projectMgn/adverProjectList.do"><span class="sidebar-mini-hide">모집 중인 프로젝트</span></a>
                            </li>
                            
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/projectMgn/contractPjList.do"><span class="sidebar-mini-hide">계약 중인 프로젝트</span></a>
                            </li>
                            
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/projectMgn/projectingList.do"><span class="sidebar-mini-hide">진행 프로젝트</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath}/projectMgn/adEndPrList.do"><span class="sidebar-mini-hide">완료 프로젝트</span></a>
                            </li>
                         </ul>
                    </li>
                    <li>
                        <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-bar-chart"></i><span class="sidebar-mini-hide">통계</span></a>
                        <ul>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/statsMgn/projectStats.do"><span class="sidebar-mini-hide">매출, 프로젝트 통계</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/statsMgn/memberStats.do"><span class="sidebar-mini-hide">회원 통계</span></a>
                            </li>
                         </ul>
                    </li>
<!--                     <li> -->
<!--                         <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-bubbles"></i><span class="sidebar-mini-hide">채팅 관리</span></a> -->
<!--                         <ul> -->
<!--                             <li> -->
<!--                                 <a class="nav-menu" data-toggle="nav-menu" href="#"><span class="sidebar-mini-hide">채팅 봇</span></a> -->
<!--                             </li> -->
<!--                          </ul> -->
<!--                     </li> -->
                </ul>
            </div>
            <!-- END Side Navigation -->
        </div>
        <!-- Sidebar Content -->
    </div>
    <!-- END Sidebar Scroll Container -->
</nav>
<!-- END Sidebar -->
</body>
</html>