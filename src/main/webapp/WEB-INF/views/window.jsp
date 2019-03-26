<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!-- Codebase Core JS -->
<script src="${pageContext.request.contextPath }/js/build/jquery.js"></script>
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<%-- <script src="${pageContext.request.contextPath }/assets/js/core/jquery.min.js"></script> --%>
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/css/bootstrap.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!-- Latest compiled JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>Page JS Code -->
<%-- <script src="${pageContext.request.contextPath }/assets/js/pages/be_ui_activity.js"></script> --%>
<!-- 부트스트랩 다이얼로그 js 파일 시작 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script> -->
<!-- 부트스트랩 다이얼로그 js 파일 끝 -->

<!-- Page JS Plugins -->
</head>
<body>
<tiles:insertAttribute name="content"></tiles:insertAttribute>
</body>
</html>
