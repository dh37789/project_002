<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지함</title>
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

<script type='text/javascript'>
	

	$(function() {
		if(!eval("${flag}")){
			$('#hideForm').hide();
		}
		
		$('#listBtn').click(function(){
			location.href="${pageContext.request.contextPath }/message/messageList.do?mem_id=${sessionScope.USER_LOGININFO.mem_id}";
		});
		
		$('#reBtn').submit(function(){
			
			if($('#msg_content').val()==''){
				return false;
			}
			
			
		});

	});
</script>
</head>
<body>
	<div class="col-12">
	<button type="button" id="listBtn" class="btn btn-outline-primary mb-10 mt-2" style="height: 30px;">
		<i class="si si-list mr-2 "></i>리스트
	</button>
	<div class="block col-12">
		<div class="block-header">
		<input type="hidden" name="msg_num" value="${message.msg_num }">
			<h3 class="block-title" ><label  for="wizard-simple-location">${message.msg_title}</label></h3>
		</div>
		<div class="block-options col-4 ml-auto " style="margin-top: -20px;">
			<span>${fn:substring(message.msg_date,0,10) }</span>
			<span><span class="badge badge-secondary">from</span> ${message.msg_from }</span>
		</div>
		<div class="block-content" style="min-height: 50px; margin-top: -10px;" >
		내용
		<div class="col-12 mt-5">
					<pre ><textarea class="form-control" id="msg_content" name="msg_content" rows="3">
							${message.msg_content }
					</textarea></pre>	

				</div>
		</div>
	</div>
	
	<div class="block col-12" id="hideForm">
	<form action="${pageContext.request.contextPath }/message/insertMessage.do" method="post"  id="msgForm" >
		<div class="block-header">
		<input type="hidden" name="msg_num" value="${message.msg_num }">
			<h3 class="block-title"><label  for="wizard-simple-location">RE : ${message.msg_title }</label></h3>
		</div>
		<div class="block-options col-4 ml-auto " style="margin-top: -20px;">
			<span>${fn:substring(message.msg_date,0,10) }</span>
			<span><span class="badge badge-secondary">to</span> ${message.msg_from }</span>
			<input name="msg_from" type="hidden" value="${message.msg_to }">
			<input name="msg_to" type="hidden" value="${message.msg_from }">
			<input name="msg_title" type="hidden" value="RE : ${message.msg_title }">
		</div>
		<div class="block-content" style="min-height: 50px; margin-top: -10px;">
		내용
		<div class="col-12 mt-5" style="margin-top: -10px;">
			<textarea class="form-control" id="msg_content"
								name="msg_content" rows="4"></textarea>
		</div>
		</div>
		<div class="form-material floating"></div>
	<button id="reBtn" type="submit" class="btn btn-alt-primary"  style="margin-left: 70%; margin-top: -10px; margin-bottom: 10px;">답장하기</button>
	</form>
	</div>
</div>
</body>
</html>