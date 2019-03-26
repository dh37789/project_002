<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	Codebase.helpers(['ckeditor']);
//	CKEDITOR.instances['js-ckeditor-inline'].config.readOnly = true;
	$('#qa_title').text('${qna.qa_title}');
	$('#mem_id').text('${qna.mem_id}');
//	$('#depth').val('${qna.qa_depth}'); 
	if(eval('${qa_group}') > 1||'${qna.qa_status}'=='n'){
	    	$('#reply').hide();
	    }
	if(eval('${empty InfoFile.qafile_name}')){
		$('#ntcFile').val('파일없음');
	}else{
		$('#ntcFile').val('${InfoFile.qafile_name}');
	}
	
	var depth =$('input[name=qa_depth]').val();
	var sr =$('input[name=sr]').val();
	$('#delete').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "글을 삭제하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
					if (result) {
						if( depth == 0){
							$(location).attr('href','${pageContext.request.contextPath}/qna/aqnaDelete.do?qa_num=${qna.qa_num}');					
						}else{
							$(location).attr('href','${pageContext.request.contextPath}/qna/aqnaReDelete.do?qa_group=${qna.qa_group}&qa_num=${qna.qa_num}');													
						}
					}else{
						return;
					}
				});
	})
	$('#downloadFile').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/file/QnaFileDownload.do?qa_num=${qna.qa_num}');	
	})
	$('#reply').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "답글을 작성하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
					if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/qna/qnaReplyForm.do?qa_num=${qna.qa_num}');
					}else{
						return;
					}
				});
	})
	$('#List').click(function() {
		$(location).attr('href','${pageContext.request.contextPath}/qna/aqnaList.do');
	});
});
</script>
<body>
	<nav class="breadcrumb bg-white push"> <a class="breadcrumb-item">게시판
		관리</a> <span class="breadcrumb-item"> <a
		href="${pageContext.request.contextPath }/qna/aqnaList.do">Q&A</a>
	</span> <span class="breadcrumb-item"> <a>상세보기</a>
	</span> </nav>

	<div class="col-md-12">
		<form action="#" method="post"
			onsubmit="return false;">
			<div class="block block-rounded block-themed">
				<div class="block-header bg-gd-primary">
					<h3 class="block-title">글 내용</h3>
					<div class="block-options"></div>
				</div>
				<div class="block-content block-content-full">
					<div class="form-group row">
						<label class="col-12" for="ecom-product-name">제목</label>
						<div class="col-12">
							<input type="text" id="no_title" class="form-control"
								id="notice_title" name="notice_title" value="${qna.qa_title }">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-12" for="ecom-product-name">작성자</label>
						<div class="col-12">
							<input type="text" class="form-control" id="mem_id" name="mem_id"
								value="${qna.mem_id }">
						</div>
					</div>
					
					<div class="form-group row">
						<div class="col-12">
							<!-- CKEditor Container -->
							<textarea id="js-ckeditor" name="ckeditor" readOnly>${qna.qa_content }</textarea>
						</div>
					</div>
					<input type="hidden" name="qa_depth" value="${qna.qa_depth }">

					<div class="form-group row">
						<label class="col-12" for="example-file-input">첨부파일</label>
						<div class="col-sm-6">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fa fa-fw fa-archive"></i>
									</span>
								</div>
								<input type="text" class="form-control" id="ntcFile"
									name="ntcFile" disabled="disabled">
								<c:if test="${not empty InfoFile.qafile_name}">
									<button id="downloadFile" class="btn btn-secondary mr-5 mb-5">다운로드</button>
								</c:if>
							</div>
						</div>
					</div>

					<br>

					<c:if
						test="${ (qna.qa_depth eq 0 && qna.qa_status eq 'y') ||(qna.qa_depth eq 0 && qna.qa_status eq 'd')}">
						<button type="button" id="reply"
							class="btn btn-secondary mr-5 mb-5 pull-right">답글</button>
					</c:if>
					<button type="button" id="List" class="btn btn-sm btn-alt-primary">
						목록</button>
					<button type="button" id="delete"
						class="btn btn-sm btn-alt-warning">삭제</button>
				</div>
			</div>
		</form>
	</div>


</body>
</html>