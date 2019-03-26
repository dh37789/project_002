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
<script type="text/javascript">
$(function(){
	
// 	CKEDITOR.instances['js-ckeditor'].getData(); 데이터 가져오기
	Codebase.helpers(['ckeditor']);
	CKEDITOR.instances['js-ckeditor'].config.readOnly = true;
	$('#prno_title').text('${boardInfo.prno_title}');
	$('#prno_writer').text('${boardInfo.prno_writer}');
	if(eval('${empty boardInfoFile.prnofile_name}')){
		$('#ntcFile').val('파일없음');
	}else{
		$('#ntcFile').val('${boardInfoFile.prnofile_name}');
	}
	$('#boardDelete').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "공지사항을 삭제하시겠습니까?",
	      	  icon: "warning",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
					if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/frprojectntcDelete.do?prno_num=${boardInfo.prno_num}&pnum=${pnum}&part=${part}');	
					}else{
						return;
					}
				});
	})
	$('#boardEdit').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "공지사항을 수정하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
				if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/frprojectntcUpdateForm.do?prno_num=${boardInfo.prno_num}&pnum=${pnum}&part=${part}');	
				}else{
					return;
				}
			});
	});
	$('#boardList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/frprojectntcList.do?pnum=${pnum}&part=${part}');	
	});
	$('#downloadFile').click(function(){
		var prnofile_num = $(this).val();
		$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/downloadFile.do?prnofile_num=' + prnofile_num);	
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
		<a>상세보기</a> 
	</span>
</nav>

 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
	<h2 class="content-heading">프로젝트 공지사항</h2>
	<div class="block">
	    <div class="block-header block-header-default">
	        <h3 class="block-title">글 내용</h3>
	    </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
                       <label id="prno_title" name="prno_title" class="col-lg-11 col-form-label" ></label>
                   </div>
               </div>
            </div>
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">작성자 : </label>
                   <div class="col-11">
                       <label class="col-lg-11 col-form-label" id="prno_writer" name="prno_writer"></label>
                   </div>
               </div>
            </div>
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <div id="js-ckeditor" class="js-ckeditor-inline-enabled cke_editable cke_editable_inline cke_contents_ltr cke_show_borders"  spellcheck="false" role="textbox" aria-label="Rich Text Editor, js-ckeditor-inline" title="Rich Text Editor, js-ckeditor-inline" aria-describedby="cke_102" style="position: relative;">${boardInfo.prno_content}</div>
<%--                     <textarea id="js-ckeditor" name="ckeditor"></textarea> --%>
                </div>
            </div>
		    <div class="form-group row">
                <label class="col-12" for="example-file-input">첨부 파일</label>
                <div class="col-12">
                    <input type="text" id="ntcFile" name="ntcFile" disabled="disabled">
                    <c:if test="${not empty boardInfoFile.prnofile_name}">
                    <button id="downloadFile" class="btn btn-secondary mr-5 mb-5" value="${boardInfoFile.prnofile_num }">다운로드</button>
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
                     <c:if test="${empty ADMIN_LOGININFO }">
                     <c:choose>
		               <c:when test="${part eq 'PM'}">
                       <button type="button" id="boardDelete" class="btn btn-secondary mr-5 mb-5 pull-right">삭제</button>
                       <button type="button" id="boardEdit" class="btn btn-secondary mr-5 mb-5 pull-right">수정</button>
		               </c:when>
		               <c:when test="${part eq 'PL'}">
                       <button type="button" id="boardDelete" class="btn btn-secondary mr-5 mb-5 pull-right">삭제</button>
                       <button type="button" id="boardEdit" class="btn btn-secondary mr-5 mb-5 pull-right">수정</button>
		               </c:when>
		               <c:when test="${USER_LOGININFO.iden_num eq '1'}">
                       <button type="button" id="boardDelete" class="btn btn-secondary mr-5 mb-5 pull-right">삭제</button>
                       <button type="button" id="boardEdit" class="btn btn-secondary mr-5 mb-5 pull-right">수정</button>
		               </c:when>
		               <c:otherwise>
                       <button type="button" id="boardDelete" class="btn btn-secondary mr-5 mb-5 pull-right" disabled="disabled">삭제</button>
                       <button type="button" id="boardEdit" class="btn btn-secondary mr-5 mb-5 pull-right" disabled="disabled">수정</button>
		               </c:otherwise>
		               </c:choose>
                     </c:if>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
	<!-- END CKEditor -->
</body>
</html>