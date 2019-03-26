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
<script type="text/javascript">
$(function(){
	$('#title').text('${workInfo.work_title}');
	if ('${workInfo.work_priority}' == '0') {
		$('#rank').text('상');
	}else if('${workInfo.work_priority}' == '1'){
		$('#rank').text('중');
	}else{
		$('#rank').text('하');
	}
	$('#time').text('${workInfo.work_time} 시간');
	$('#order').text('${workInfo.work_char_id}');
	$('#orderWork').text('${workInfo.work_order} 번 글 : ${orderInfo.work_title}');
	var startday = '${workInfo.work_start}'.split(' ');
	$('#start').text(startday[0]);
	var endday = '${workInfo.work_end}'.split(' ');
	$('#end').text(endday[0]);
	Codebase.helpers(['ckeditor']);
	CKEDITOR.instances['js-ckeditor'].config.readOnly = true;
	CKEDITOR.instances['js-ckeditor'].config.autoParagraph = false;
	CKEDITOR.instances['js-ckeditor'].config.fillEmptyBlocks = false;
	CKEDITOR.instances['js-ckeditor'].config.fullPage = false;
	CKEDITOR.instances['js-ckeditor'].config.ignoreEmptyParagraph = true;
	CKEDITOR.instances['js-ckeditor'].config.enterMode = CKEDITOR.ENTER_BR;
    Codebase.helpers(['datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs', 'rangeslider', 'tags-inputs']);
    $('#boardDel').click(function(){
    	swal({
	      	  title: "알림",
	      	  text: "일감을 삭제하시겠습니까?",
	      	  icon: "warning",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
				if (result) {
					$(location).attr('href','${pageContext.request.contextPath}/projectWork/workDel.do?work_num=${workInfo.work_num}');
				}else{
					return;
				}
			});
    });
    $('#boardList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectWork/workList.do');
    });
    $('#boardEdit').click(function(){
    	swal({
	      	  title: "알림",
	      	  text: "일감을 수정하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
				if (result) {
					$(location).attr('href','${pageContext.request.contextPath}/projectWork/workEditForm.do?work_num=${workInfo.work_num}');
				}else{
					return;
				}
			});
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
		<c:if test="${USER_LOGININFO.iden_num == 2}">
			<a href="${pageContext.request.contextPath }/frmyproject/projectList.do?mem_id=${USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
		</c:if>
		<c:if test="${USER_LOGININFO.iden_num == 1}">
			<a href="${pageContext.request.contextPath }/clMyProject/projectList.do?mem_id=${USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
		</c:if>
		<c:if test="${not empty ADMIN_LOGININFO }">
			<a href="${pageContext.request.contextPath }/projectMgn/projectingList.do">진행중인 프로젝트</a>
		</c:if>
	</span>
	<span class="breadcrumb-item"> 
		<a href="javascript:history.go(-1)">프로젝트 일감</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>상세보기</a> 
	</span>
</nav>

 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
	<form class="form-horizontal" action="${pageContext.request.contextPath }/projectWork/workWrite.do" method="post"
	enctype="multipart/form-data" id="form">
	<h2 class="content-heading">일감</h2>
	<div class="block">
	    <div class="block-header block-header-default">
	        <h3 class="block-title">일감</h3>
	    </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
			       	<label id="title" class="col-lg-11 col-form-label"></label>
                   </div>
               </div>
            </div>
            <div class="form-group row">
	            <label class="col-1" for="example-select">우선순위</label>
	            <label class="col-2" id="rank" for="example-select"></label>
	            <label class="col-1" for="example-select">당담자</label>
	            <label class="col-2" id="order" for="example-select"></label>
	            <label class="col-1" for="example-select">추정시간</label>
	            <label class="col-2" id="time" for="example-select"></label>
            </div>
            <c:if test="${not empty orderInfo }">
            <div class="form-group row">
	            <label class="col-1" for="example-select">상위일감</label>
	            <label class="col-11" id="orderWork" for="example-select"></label>
            </div>
            </c:if>
            <div class="form-group row">
	           <label class="col-1" for="example-select">시작일</label>
	           <label class="col-5" id="start" for="example-select"></label>
               <label class="col-1" for="example-select">마감일</label>
               <label class="col-5" id="end" for="example-select"></label>
            </div>
            <div class="form-group row">
	           <label class="col-1" for="example-select">진척도</label>
	           <div class="col-11">
	           <div class="progress push">
                   <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: ${workInfo.work_progress }%;" aria-valuenow="${workInfo.work_progress }" aria-valuemin="0" aria-valuemax="100">
                       <span class="progress-bar-label">${workInfo.work_progress }%</span>
                   </div>
               </div>
               </div>
            </div>
            
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <textarea id="js-ckeditor" name="ckeditor">${workInfo.work_content }</textarea>
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
                     <c:if test="${empty ADMIN_LOGININFO }">
                     <c:if test="${USER_LOGININFO.iden_num eq '2' }">
                     <button type="button" id="boardDel" class="btn btn-secondary mr-5 mb-5 pull-right">일감 삭제</button>
                     <button type="button" id="boardEdit" class="btn btn-secondary mr-5 mb-5 pull-right">일감 수정</button>
                     </c:if>
                     </c:if>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
	</form>
	<!-- END CKEditor -->
</body>
</html>