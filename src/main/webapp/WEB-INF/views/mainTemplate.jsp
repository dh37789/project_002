<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>

<meta name="description" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework created by pixelcave and published on Themeforest">
<meta name="author" content="pixelcave">
<meta name="robots" content="noindex, nofollow">

<!-- Open Graph Meta -->
<meta property="og:title" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework">
<meta property="og:site_name" content="Codebase">
<meta property="og:description" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework created by pixelcave and published on Themeforest">
<meta property="og:type" content="website">
<meta property="og:url" content="">
<meta property="og:image" content="">

<!-- Icons -->
<!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/img/favicons/favicon.png">
<link rel="icon" type="image/png" sizes="192x192" href="${pageContext.request.contextPath }/assets/img/favicons/favicon-192x192.png">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath }/assets/img/favicons/apple-touch-icon-180x180.png">
<!-- END Icons -->

<!-- Stylesheets -->
<!-- Codebase framework -->
<link rel="stylesheet" id="css-main" href="${pageContext.request.contextPath }/assets/css/codebase.min.css">
<!-- Codebase Core JS -->
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.scrollLock.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.appear.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.countTo.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/js.cookie.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/codebase.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<!-- CK Editor -->
<script src="${pageContext.request.contextPath }/assets/js/plugins/ckeditor/ckeditor.js"></script>
<!-- Page JS Plugins -->
<script src="${pageContext.request.contextPath }/assets/js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/assets/js/plugins/sweetalert2/es6-promise.auto.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/assets/js/plugins/sweetalert2/sweetalert2.min.js"></script> --%>
<!-- Page JS Code -->
<script src="${pageContext.request.contextPath }/assets/js/pages/be_ui_activity.js"></script>
<!-- 부트스트랩 다이얼로그 js 파일 시작 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<!-- 부트스트랩 다이얼로그 js 파일 끝 -->
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Page JS Plugins -->
<script src="${pageContext.request.contextPath }/assets/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/jquery-auto-complete/jquery.auto-complete.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/masked-inputs/jquery.maskedinput.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/dropzonejs/min/dropzone.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/pages/be_ui_activity.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/pages/be_ui_icons.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation2.js'></script>
<c:remove var="message" scope="request"/>
</head>
<body>
  <div id="page-container" class="side-scroll side-trans-enabled sidebar-o main-content-narrow">
<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<tiles:insertAttribute name="left"></tiles:insertAttribute>
	<main id="main-container">
	<c:if test="${requestScope['javax.servlet.forward.servlet_path'] eq '/main/hello.do'}">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</c:if>
	<c:if test="${requestScope['javax.servlet.forward.servlet_path'] eq '/index.jsp'}">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</c:if>
	<c:if test="${requestScope['javax.servlet.forward.servlet_path'] eq '/join/loginCheck.do'}">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</c:if>
	<c:if test="${requestScope['javax.servlet.forward.servlet_path'] ne '/main/hello.do' && requestScope['javax.servlet.forward.servlet_path'] ne '/join/loginCheck.do'
	&& requestScope['javax.servlet.forward.servlet_path'] ne '/index.jsp' }">
		<div class="content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
	</c:if>
	</main>
   <!-- END Main Container -->
		<tiles:insertAttribute name="overlay"></tiles:insertAttribute>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>
</html>