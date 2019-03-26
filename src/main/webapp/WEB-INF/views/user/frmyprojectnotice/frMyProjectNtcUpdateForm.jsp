<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
// 	CKEDITOR.instances['js-ckeditor'].getData(); 데이터 가져오기
// CKEDITOR.instances['js-ckeditor'].config.readOnly = true; 읽기모드
	Codebase.helpers(['ckeditor']);
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	$('#prno_title').val('${boardInfo.prno_title}');
	if(eval('${empty boardInfoFile.prnofile_name}')){
		$('#ntcFile').val('파일없음');
	}else{
		$('#ntcFile').val('${boardInfoFile.prnofile_name}');
	}
	$('#boardEdit').click(function(){
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
      	  text: "공지사항을 수정하시겠습니까?",
      	  icon: "info",
      	  buttons: true,
      	})
      	.then(function(result){ 
				if (result) {
					var content = CKEDITOR.instances['js-ckeditor'].getData();
					$('#formadd').append('<input type="hidden" name="prno_num" value="${boardInfo.prno_num}">');
					$('#formadd').append('<input type="hidden" name="prno_content" value="' + content + '">');
					$('#formadd').append('<input type="hidden" name="pr_num" value="${pnum}">');
					$('#formadd').submit();
				}else{
					return;
				}
			});
	});
	$('#fileDelete').click(function(){
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{prnofile_num : '${boardInfoFile.prnofile_num}',
	        	 prnofile_save_name : '${boardInfoFile.prnofile_save_name}'},
	         url:'${pageContext.request.contextPath}/frprojectntc/ntcFileDelete.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
	              $('#ntcFile').val('파일없음');
	              $('#fileDelete').attr('type', 'hidden');
	              $('#fileForm').append('<input type="file" name="ntcFile">')
	            }else{
	               swal("", '사용할 수 없는 아이디입니다.', "error");
	            }
	         }
	      });
	});
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
		<a href="${pageContext.request.contextPath }/frprojectntc/frprojectntcList.do">프로젝트 공지</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>수정</a> 
	</span>
</nav>

 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
<form class="form-horizontal" action="${pageContext.request.contextPath }/frprojectntc/noticeUpdate.do?pnum=${pnum}&part=${part}" method="post"
	enctype="multipart/form-data" id="formadd">
	<h2 class="content-heading">프로젝트 공지사항</h2>
	<div class="block">
	    <div class="block-header block-header-default">
	        <h3 class="block-title">글 수정하기</h3>
	    </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
                       <input name="prno_title" id="prno_title" type="text" class="form-control" >
                   </div>
               </div>
            </div>
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <textarea id="js-ckeditor" name="ckeditor">
                    ${boardInfo.prno_content}
                    </textarea>
                </div>
            </div>
		    <div class="form-group row">
                <label class="col-12" for="example-file-input">첨부 파일</label>
                <div id="fileForm" class="col-12">
                    <input type="text" id="ntcFile" disabled="disabled">
                    <c:if test="${not empty boardInfoFile.prnofile_name}">
                    <input type="button" id="fileDelete" class="btn btn-secondary mr-5 mb-5" value="삭제">
                    </c:if>
                    <c:if test="${empty boardInfoFile.prnofile_name}">
                    <input type="file" name="ntcFile">
                    </c:if>
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
                     <button type="button" id="boardEdit" class="btn btn-secondary mr-5 mb-5 pull-right">수정</button>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
</form>
	<!-- END CKEditor -->
</body>
</html>