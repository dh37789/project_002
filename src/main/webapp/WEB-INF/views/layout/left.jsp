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
                        <a class="link-effect font-w700" href="${pageContext.request.contextPath}/main/hello.do">
<%--                             <img src="${pageContext.request.contextPath}/image/giphy.gif" width="100px"></img> --%>
                            <img src="${pageContext.request.contextPath}/image/butterfly.png" width="30px"></img>
                            <span class="font-size-xl text-dual-primary-dark">Pap</span><span class="font-size-xl text-primary">illon</span>
                        </a>
                    </div>
                    <!-- END Logo -->
                </div>
                <!-- END Normal Mode -->
            </div>
            <!-- END Side Header -->

            <!-- Side User -->
            <c:if test="${not empty sessionScope.USER_LOGININFO}">
            <div class="content-side content-side-full content-side-user px-10 align-parent">
                <!-- Visible only in mini mode -->
                <div class="sidebar-mini-visible-b align-v animated fadeIn">
  		             <c:if test="${USER_LOGININFO.mem_picture == null }">
                   	 	 <img class="img-avatar img-avatar32" src="${pageContext.request.contextPath }/assets/img/avatars/avatar15.jpg" alt="">
			         </c:if>
			         <c:if test="${USER_LOGININFO.mem_picture != null }">
			             <img class="img-avatar img-avatar-thumb" src="/files/${USER_LOGININFO.mem_picture}" alt="" width="200" height="150">
			         </c:if>
                </div>
                <!-- END Visible only in mini mode -->

                <!-- Visible only in normal mode -->
               
                <div class="sidebar-mini-hidden-b text-center">
                    <a class="img-link" href="">
                    <c:if test="${USER_LOGININFO.mem_picture == null }">
                        <img class="img-avatar" src="${pageContext.request.contextPath }/assets/img/avatars/avatar15.jpg" alt="">
			         </c:if>
			         <c:if test="${USER_LOGININFO.mem_picture != null }">
			             <img class="img-avatar img-avatar-thumb" src="/files/${USER_LOGININFO.mem_picture}" alt="" width="200" height="150">
			         </c:if>
                    </a>
                    <ul class="list-inline mt-10">
                        <li class="list-inline-item">
                            <a class="link-effect text-dual-primary-dark font-size-xs font-w600 text-uppercase" href="${pageContext.request.contextPath}/freProfile/frmyProfileList.do?mem_id=${USER_LOGININFO.mem_id }">
                            ${sessionScope.USER_LOGININFO.mem_name }
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a class="link-effect text-dual-primary-dark" href="${pageContext.request.contextPath }/join/logOut.do">
                                <i class="si si-logout"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- END Visible only in normal mode -->
            </div>
            <!-- END Side User -->
            </c:if>
<!-- 메뉴 시작 -->
            <!-- Side Navigation -->
            <div class="content-side content-side-full">
                <ul class="nav-main">
                    <li>
                        <a href="${pageContext.request.contextPath }/project/projectList.do"><i class="si si-briefcase"></i><span class="sidebar-mini-hide">프로젝트 목록</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/freelancer/freelancerList.do"><i class="si si-users"></i><span class="sidebar-mini-hide">프리랜서 목록</span></a>
                    </li>
                    <li>
                        <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-list"></i><span class="sidebar-mini-hide">게시판</span></a>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath }/notice/noticeList.do?currentPage=1">공지사항 게시판</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/board/boardList.do?currentPage=1">자유 게시판</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/qna/qnaList.do?currentPage=1">Q&A 게시판</span></a>
                            </li>
                         </ul>
                    </li>
                    <!-- 프리랜서 메뉴 -->
                    <c:if test="${sessionScope.USER_LOGININFO.iden_num eq 2 }">
                    <li class="nav-main-heading"><span class="sidebar-mini-visible">UI</span><span class="sidebar-mini-hidden">Freelancer Menu</span></li>
	                    <li>
	                        <a href="${pageContext.request.contextPath }/interest/projectList.do"><i class="si si-heart"></i><span class="sidebar-mini-hide">관심 프로젝트</span></a>
	                    </li>
	                    <li>
	                        <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-folder-alt"></i><span class="sidebar-mini-hide">나의 프로젝트</span></a>
	                        <ul>
	                            <li>
	                                <a href="${pageContext.request.contextPath }/apply/applyList.do">지원한 프로젝트</a>
	                            </li>
	                            <li>
	                                <a href="${pageContext.request.contextPath }/contract/contractList.do">계약중인 프로젝트</a>
	                            </li>
	                            <li>
	                                <a href="${pageContext.request.contextPath }/frmyproject/projectList.do?mem_id=${sessionScope.USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
	                            </li>
	                            <li>
	                                <a href="${pageContext.request.contextPath }/frmyendproject/frMyEndProjectList.do">완료한 프로젝트</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li>
                       		 <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/chat/chattingBot.do"><i class="si si-bubbles"></i><span class="sidebar-mini-hide">채팅 봇</span></a>
                    	</li>
	                  	</c:if>
	                <c:if test="${sessionScope.USER_LOGININFO.iden_num eq 1}">
                    <li class="nav-main-heading"><span class="sidebar-mini-visible">BD</span><span class="sidebar-mini-hidden">Client Menu</span></li>
                    <li>
	                        <a href="${pageContext.request.contextPath }/interest/freeList.do"><i class="si si-heart"></i><span class="sidebar-mini-hide">관심 프리랜서</span></a>
	                    </li>
                    <li>
                        <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/project/projectForm.do"><i class="si si-note"></i><span class="sidebar-mini-hide">프로젝트 등록</span></a>
                    </li>
                    <li>
                        <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-reload"></i><span class="sidebar-mini-hide">검수중인 프로젝트</span></a>
                        <ul>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/project/inspectionList.do"><span class="sidebar-mini-hide">검수 중</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/project/temporaryList.do"><span class="sidebar-mini-hide">임시 저장</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/project/refuseList.do"><span class="sidebar-mini-hide">등록 실패</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="si si-folder-alt"></i><span class="sidebar-mini-hide">나의 프로젝트</span></a>
                        <ul>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/clRegProject/regProjectList.do">등록된 프로젝트</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/readyProject/projectList.do"><span class="sidebar-mini-hide">준비중인 프로젝트</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/clMyProject/projectList.do?mem_id=${sessionScope.USER_LOGININFO.mem_id }"><span class="sidebar-mini-hide">진행중인 프로젝트</span></a>
                            </li>
                            <li>
                                <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/clMyProject/clEndPrList.do"><span class="sidebar-mini-hide">완료된 프로젝트</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="nav-menu" data-toggle="nav-menu" href="${pageContext.request.contextPath }/chat/chattingBot.do"><i class="si si-bubbles"></i><span class="sidebar-mini-hide">채팅 봇</span></a>
                    </li>
                    </c:if>
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