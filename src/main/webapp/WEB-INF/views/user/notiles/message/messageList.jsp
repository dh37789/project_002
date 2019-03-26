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
	function checkAjax(){
		var mem_id = $('#msg_to').val();
		$.ajax({
			type:'POST',
			dataType:'JSON',
			data:{mem_id:mem_id},
			url:'${pageContext.request.contextPath}/member/idCheck.do',
			success : function(result){
				if(eval(result.result.flag)){
					swal("", '존재하지 않는 아이디 입니다.', "warning");
				}else{
					$('#icon').attr('class','fa fa-check mr-5');
					$('#icon').parents('#spanicon').attr('class','badge badge-success col-4 ml-auto');
				}
			},
			error:function(result){
				alert(result.status+"|"+result.responseText);
			}
		});
	}

	$(function() {
		
		var date = new Date();
		$('#datee').text(date.getFullYear()+"."+date.getMonth()+"."+date.getDay());
		$('#spanicon').click(function(){
			checkAjax();
		});
		
		$('#tbody1 tr').click(function(){
			var msg_num = $(this).find('input[name=msg_num]').val() ;
			location.href="${pageContext.request.contextPath}/message/messageInfo.do?flag=true&msg_num="+msg_num;
		});
		$('#tbody2 tr').click(function(){
			var msg_num = $(this).find('input[name=msg_num]').val() ;
			location.href="${pageContext.request.contextPath}/message/messageInfo.do?flag=false&msg_num="+msg_num;
		});
		
		$('#check-all').click(function(){
			if($('#check-all').prop('checked')){
				$('input[name=ab]').prop('checked', true );
			}else{
				$('input[name=ab]').prop('checked', false );
			}
		});
		
		$('#msgForm').submit(function(){
			if($('input[name=msg_title]').val()==''){
				swal("", '제목을 입력해주세요.', "warning");
				return false;
			}
			if($('input[name=msg_to]').val()==''){
				swal("", '받는 이를 입력해주세요.', "warning");
				return false;
			}
			if($('#msg_content').val()==''){
				swal("", '내용을 입력해주세요.', "warning");
				return false;
			}
			var flag = false;
			
			if($('#icon').parents('#spanicon').attr('class')=='badge badge-success col-4 ml-auto'){
				flag=true;
			}
			
			swal("", '쪽지가 성공적으로 전송되었습니다.', "success");
			return flag;
		});
		
		$('#deleteBtn').click(function(){
			var str="";
			if($('#check-all').prop('checked')){
				$("input:checkbox:checked:gt(0)").each(function (index) {  
			        str += $(this).parents('.tdclass').find('input[name=msg_num]').val() + ",";  
			    }); 
				
			}else{
				$("input:checkbox:checked").each(function (index) {  
			        str += $(this).parents('.tdclass').find('input[name=msg_num]').val() + ",";  
			    }); 
			}
			
			if(str==""){
				return false;
			}
		 	location.href="${pageContext.request.contextPath}/message/deleteMessage.do?msg_nums="+str;
		});

	});
</script>
</head>
<body>  
<div class="form-material floating"></div>
	<div class="col-md-12">
		<!-- Simple Wizard -->
		<div class="js-wizard-simple block">    
			<!-- Step Tabs -->    
			<ul class="nav nav-tabs nav-tabs-block nav-fill" role="tablist">
				<li class="nav-item"><a class="nav-link" 
					href="#wizard-simple-step1" data-toggle="tab">받은 쪽지함</a></li>
				<li class="nav-item"><a class="nav-link active show"
					href="#wizard-simple-step2" data-toggle="tab">보낸 쪽지함</a></li>
				<li class="nav-item"><a class="nav-link"
					href="#wizard-simple-step3" data-toggle="tab">쪽지 보내기</a></li>
			</ul>  
			<!-- END Step Tabs -->  

			<!-- Form -->
				<!-- Steps Content -->
				<div class="block-content block-content-full tab-content"
					style="min-height: 265px;">  
					<!-- Step 1 -->
					<div class="tab-pane" id="wizard-simple-step1" role="tabpanel">
						<table class="table table-hover table-vcenter text-center">
							<thead class="thead-light">
								<tr>
									<th style="width: 5%;">
									<label class="css-control css-control-primary css-checkbox py-0">
                                         <input type="checkbox" class="css-control-input check-all" id="check-all" name="check-all">
                                         <span class="css-control-indicator"></span>
                                    </label>
									</th>
									<th style="width: 40%;">제목</th>
									<th style="width: 25%;">날짜</th>
									<th style="width: 15%;">보낸이</th>
									<th style="width: 15%;"><small>조회수</small></th>
								</tr>
							</thead>
							<tbody id="tbody1">
								<c:forEach items="${messageTO }" var="message">
								<c:if test="${message.msg_hit !='0' }">
									<tr>
								</c:if>
								<c:if test="${message.msg_hit =='0' }">
									<tr class="font-w700">
								</c:if>
										<td class="tdclass"><input type="hidden" name="msg_num"  
											value="${message.msg_num }" />
											<label class="css-control css-control-primary css-checkbox">
                                                <input type="checkbox" class="css-control-input" class="ab" name="ab">
                                                <span class="css-control-indicator"></span>
                                            </label>
                                        </td>
										
										<td>${message.msg_title }</td>
										<td><small>${fn:substring(message.msg_date, 0, 10) }</small></td>
										<td>${message.msg_from }</td>
										<td>${message.msg_hit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button id="deleteBtn" class="btn btn-alt-primary"  style="margin-left: 80%; margin-bottom: -10px;">삭제하기</button>
					</div>
					<!-- END Step 1 -->

					<!-- Step 2 -->
					<div class="tab-pane active show" id="wizard-simple-step2"
						role="tabpanel">  
						<table class="table table-hover table-vcenter text-center">
							<thead class="thead-light">
								<tr>
									<th style="width: 10%;"><small>읽음</small></th>
									<th style="width: 30%;">제목</th>
									<th style="width: 30%;">날짜</th>
									<th style="width: 15%;">받는이</th>
									<th style="width: 15%;"><small>조회수</small></th>
								</tr>
							</thead>
							<tbody id="tbody2">
								<c:forEach items="${messageFROM }" var="message">
								<c:if test="${message.msg_hit !='0' }">
									<tr>
								</c:if>
								<c:if test="${message.msg_hit =='0' }">
									<tr class="font-w700">
								</c:if>
										<td><input type="hidden" name="msg_num"
											value="${message.msg_num }" />
											<c:if test="${message.msg_hit > 0 }">
											<i class="fa fa-check fa-1x"></i>
											</c:if>
                                        </td>
										
										<td>${message.msg_title }</td>
										<td><small>${fn:substring(message.msg_date, 0, 10) }</small></td>
										<td>${message.msg_to }</td>
										<td>${message.msg_hit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- END Step 2 -->

					<!-- Step 3 -->
					<div class="tab-pane" id="wizard-simple-step3" role="tabpanel"  style="margin-top: -10px;">
						<form action="${pageContext.request.contextPath }/message/insertMessage.do" method="post"  id="msgForm" >
						<label class="col-md-5" style="margin-left: 75%; margin-bottom: -15px;" id="datee"> </label>
						<div class="form-group col-12">
							<label  for="wizard-simple-location">제목</label>
							 <input	class="form-control" type="text" id="wizard-simple-location"
								name="msg_title">
						</div>
						<div class="form-group col-12"  style="margin-top: -10px;">
							<label  for="wizard-simple-location">받는이</label> 
							<div class="row col-12">
							<input
								class="form-control col-7" type="text" name="msg_to" id="msg_to" > <span id="spanicon" class="badge badge-secondary col-4 ml-auto " style="margin-top:6px; height: 25px;"><i class="fa fa-times-circle mr-5" id="icon" ></i><big>CHECK</big> </span>
						</div>
							
						</div>
						<div class="form-group col-12"  style="margin-top: -10px;">
							<label for="wizard-simple-bio">내용</label>
							<textarea class="form-control" id="msg_content"
								name="msg_content" rows="9"></textarea>
						</div>
							<button  type="submit" class="btn btn-alt-primary"  style="margin-left: 80%; margin-bottom: -10px;">보내기</button>
							
							<input type="hidden" name="msg_from" value="${sessionScope.USER_LOGININFO.mem_id }">
						</form>
					</div>
				</div>
		</div>
	</div>


</body>
</html>