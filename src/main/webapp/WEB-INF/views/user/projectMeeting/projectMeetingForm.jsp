<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <!-- Page JS Code -->
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script src="assets/js/pages/be_forms_plugins.js"></script>
<script type="text/javascript">
$(function(){
	$('#rank').val('1');
	$('#time').val('0');
    Codebase.helpers(['datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs', 'rangeslider', 'tags-inputs']);
    
    $("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
    
    $('#boardAdd').click(function(){
    	if($('input[name=mt_reason]').val() == ''){
    		swal("경고","미팅주제를 입력해주세요.", "error");
    		return false;
    	}
    	if($('input[name=mt_time]').val() == ''){
    		swal("경고","미팅 희망날짜를 선택해주세요.", "error");
    		return false;
    	}
    	swal({
	      	  title: "알림",
	      	  text: "미팅을 신청하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){
	      	  if (result) {
	      		$('#form').append('<input type="hidden" name="mt_from" value="${USER_LOGININFO.mem_id}">');
				$('#form').append('<input type="hidden" name="pr_num" value="${pnum}">');
				$('#form').submit();
	      	  } else {
	      		return;
	      	  }
	      	});
    })
    $('#boardList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingList.do');
    });
})
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<c:if test="${not empty USER_LOGININFO }">
		<a class="breadcrumb-item">나의 프로젝트</a> 
	</c:if>
	<c:if test="${not empty ADMIN_LOGININFO }">
		<a class="breadcrumb-item">프로젝트 관리</a> 
	</c:if>
	<span class="breadcrumb-item"> 
		<c:if test="${USER_LOGININFO.mem_id != 'admin' }">
			<a href="${pageContext.request.contextPath }/frmyproject/projectList.do?mem_id=${USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
		</c:if>
		<c:if test="${not empty ADMIN_LOGININFO }">
			<a href="${pageContext.request.contextPath }/projectMgn/projectingList.do">진행중인 프로젝트</a>
		</c:if>
	</span>
	<span class="breadcrumb-item"> 
		<a href="javascript:history.go(-1)">프로젝트 미팅</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>작성</a> 
	</span>
</nav>

 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
	<form class="form-horizontal" action="${pageContext.request.contextPath }/projectMeeting/meetingWrite.do" method="post"
	enctype="multipart/form-data" id="form">
	<h2 class="content-heading">미팅</h2>
	<div class="block">
	    <div class="block-header block-header-default">
	        <h3 class="block-title">미팅 신청</h3>
	    </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">미팅 주제   : </label>
                   <div class="col-11">
                       <input name="mt_reason" type="text" class="form-control" >
                   </div>
               </div>
            </div>
            
	        <div class="form-group row">
	            <div class="col-sm-6">
	            <div class="form-group row">
                    <label class="col-6" for="example-select">희망 미팅 유형</label>
                    <label class="col-6" for="example-select">미팅 희망 날짜</label>
                    <div class="col-md-6">
                    <select class="form-control" id="type" name="mt_type">
                        <option value="0">Offline</option>
                        <option value="1">Online</option>
                    </select>
                    </div>
                    <div class="col-md-6">
                        <input type="date" class="js-datepicker form-control" id="date" name="mt_time" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd">
                    </div>
                </div>
	            </div>
	            <div class="col-sm-6">
	            <div class="form-group row">
                    <label class="col-12" for="example-select">대상자</label>
                    <div class="col-12">
                     <select class="form-control" id="to" name="mt_to">
                     <c:forEach items="${memList }" var="memberInfo">
                         <option value="${memberInfo.CONS_FREE_ID }">${memberInfo.CONS_FREE_ID } : ${memberInfo.PART }</option>
                     </c:forEach>
                     </select>
                    </div>
                </div>
	            </div>
            </div>
	        <div class="form-group row">
	            <div class="col-sm-4">
	            </div>
	            <div class="col-sm-4">
	            </div>
	            <div class="col-sm-4 mb-10">
	            <div class="mb-10">
                     <button type="button" id="boardList" class="btn btn-secondary mr-5 mb-5 pull-right">목록</button>
                     <button type="button" id="boardAdd" class="btn btn-secondary mr-5 mb-5 pull-right">미팅 등록</button>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
	</form>
	<!-- END CKEditor -->
</body>
</html>