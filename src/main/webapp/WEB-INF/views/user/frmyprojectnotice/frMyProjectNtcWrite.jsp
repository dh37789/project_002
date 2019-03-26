<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation.js'></script>
<script type="text/javascript">
$(function(){
// 	CKEDITOR.instances['js-ckeditor'].getData(); 데이터 가져오기
// CKEDITOR.instances['js-ckeditor'].config.readOnly = true; 읽기모드
	Codebase.helpers(['ckeditor']);
	
	$('#boardAdd').click(function(){
		if($('input[name=prno_title]').val() == ''){
    		swal("경고","제목을 입력해주세요.", "error");
    		return false;
    	}
		
    	var content = CKEDITOR.instances['js-ckeditor'].getData();
    	if(content == ''){
    		swal("경고","내용을 입력해주세요.", "error");
    		return false;
    	}
    	
		swal({
      	  title: "알림",
      	  text: "공지사항을 작성하시겠습니까?",
      	  icon: "info",
      	  buttons: true,
      	})
      	.then(function(result){
      	  if (result) {
      		  var content = CKEDITOR.instances['js-ckeditor'].getData();
			$('#formadd').append('<input type="hidden" name="prno_content" value="">');
			$('input[name=prno_content]').val(content);
			$('#formadd').append('<input type="hidden" name="prno_writer" value="${USER_LOGININFO.mem_id}">');
			$('#formadd').append('<input type="hidden" name="pr_num" value="${pnum}">');
			$('#formadd').submit();
      	  } else {
      		return;
      	  }
      	});
      	
	})
      	
	$('#boardList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/frprojectntcList.do?pnum=${pnum}&part=${part}');	
	});
	});
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
		<a href="javascript:history.go(-1)">프로젝트 공지</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>작성</a> 
	</span>
</nav>

 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
	<form class="form-horizontal" action="${pageContext.request.contextPath }/frprojectntc/ntcwrite.do?pnum=${pnum}&part=${part}" method="post"
	enctype="multipart/form-data" id="formadd">
	<h2 class="content-heading">프로젝트 공지사항</h2>
	<div class="block">
	    <div class="block-header block-header-default">
	        <h3 class="block-title">글 작성하기</h3>
	    </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
                       <input name="prno_title" type="text" class="form-control" >
                   </div>
               </div>
            </div>
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <textarea id="js-ckeditor" name="ckeditor"></textarea>
                </div>
            </div>
		    <div class="form-group row">
                <label class="col-12" for="example-file-input">첨부 파일</label>
                <div class="col-12">
                    <input type="file" name="ntcFile">
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
                     <button type="button" id="boardAdd" class="btn btn-secondary mr-5 mb-5 pull-right">글 작성</button>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
	</form>
	<!-- END CKEditor -->
</body>
</html>