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
	$('#no_title').text('${notice.no_title}');
	if(eval('${empty InfoFile.nofile_name}')){
		$('#File').val('파일없음');
	}else{
		$('#File').val('${InfoFile.nofile_name}');
	}
	$('#delete').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "공지사항을 삭제하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
					if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/notice/noticeDelete.do?no_num=${notice.no_num}');	
					}else{
						return;
					}
				});
	})
	$('#update').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "공지사항을 수정하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
				if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/notice/noticeUpdateForm.do?no_num=${notice.no_num}');	
				}else{
					return;
				}
			});
	});
	$('#downloadFile').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/file/NoticeFileDownload.do?no_num=${notice.no_num}');	
	})
	$('#List').click(function() {
		$(location).attr('href','${pageContext.request.contextPath}/notice/anoticeList.do');
	});
});
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">게시판 관리</a> 
	<span class="breadcrumb-item"> 
		<a href="${pageContext.request.contextPath }/notice/anoticeList.do">공지사항</a> 
	</span>
	<span class="breadcrumb-item">  
		<a>상세보기</a> 
	</span>
</nav>
	
	   <div class="col-md-12">
                         <form action="#" method="post" onsubmit="return false;">
                             <div class="block block-rounded block-themed">
                                 <div class="block-header bg-gd-primary">
                                     <h3 class="block-title">글 내용</h3>
                                     <div class="block-options">
                                     </div>
                                 </div>
                                 <div class="block-content block-content-full">
                                     <div class="form-group row">
                                         <label class="col-12" for="ecom-product-name">제목</label>
                                         <div class="col-12">
                                             <input type="text" id="no_title" class="form-control" id="notice_title" name="notice_title" value="${notice.no_title }">
                                         </div>
                                     </div>
                                     <div class="form-group row">
                                         <label class="col-12" for="ecom-product-name">작성자</label>
                                         <div class="col-12">
                                             <input type="text" class="form-control" id="mem_id" name="mem_id" value="관리자">
                                         </div>
                                     </div>
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <textarea id="js-ckeditor" name="ckeditor" readOnly>${notice.no_content }</textarea>
                </div>
            </div>
                                     <div class="form-group row">
                                         <label class="col-12" for="example-file-input">첨부파일</label>
                                         <div class="col-sm-6">
                                             <div class="input-group">
                                                 <div class="input-group-prepend">
                                                     <span class="input-group-text">
                                                         <i class="fa fa-fw fa-archive"></i>
                                                     </span>
                                                 </div>
                                                 <input type="text" class="form-control" id="File" name="File" disabled="disabled">
                             <c:if test="${not empty InfoFile.nofile_name}">
                             <button id="downloadFile" class="btn btn-secondary mr-5 mb-5">다운로드</button>
                             </c:if>
                                             </div>
                                         </div>
                                     </div>
			<br>                 
                     <button type="button" id="List" class="btn btn-sm btn-alt-primary">
                        	목록
                     </button>
                     <button type="button" id="update" class="btn btn-sm btn-alt-primary">
                           	수정
                     </button>
                     <button type="button" id="delete" class="btn btn-sm btn-alt-primary">
                           	삭제
                     </button>
             </div>
         </div>
     </form>
 </div>
	
</body>
</html>