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
	Codebase.helpers(['ckeditor']);
	
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	var a= 0;
	$('#qa_title').val('${qna.qa_title}');
	if(eval('${empty InfoFile.qafile_name}')){
		$('#File').val('파일없음');
	}else{
		$('#File').val('${InfoFile.qafile_name}');
	}
	$('#update').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "글을 수정하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
				if (result) {
					var content = CKEDITOR.instances['js-ckeditor'].getData();
					$('#formadd').append('<input type="hidden" name="qa_num" value="${qna.qa_num}">');
					$('#formadd').append('<input type="hidden" name="qa_content" value="' + content + '">');
					$('#formadd').submit();
				}else{
					return;
				}
			});
	});
	$('#fileDelete').click(function(){
	
		$(location).attr('href','${pageContext.request.contextPath}/qna/qnaFileDelete.do?qafile_num=${InfoFile.qafile_num}&qa_num=${qna.qa_num}');	
	});
	$('#List').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/qna/qnaList.do');	
	});
});
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">게시판</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/qna/qnaList.do">Q&A</a> 
	</span> 
	<span class="breadcrumb-item active"> 
		<a>수정</a> 
	</span> 
</nav>

<form class="form-horizontal" action="${pageContext.request.contextPath }/qna/qnaUpdate.do" method="post"
	enctype="multipart/form-data" id="formadd">
	 <div class="block block-rounded block-themed">
                                 <div class="block-header bg-gd-primary">
                                     <h3 class="block-title">Q&A 수정</h3>
                                     <div class="block-options">
                                     </div>
                                 </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
                       <input name="qa_title" id="qa_title" type="text" class="form-control" >
                   </div>
               </div>
            </div>
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <textarea id="js-ckeditor" name="ckeditor">
                    ${qna.qa_content}
                    </textarea>
                </div>
            </div>
		    <div class="form-group row">
                <label class="col-12" for="example-file-input">첨부 파일</label>
                <div id="fileForm" class="col-12">
                    <input type="text" id="File" disabled="disabled">
                    <c:if test="${not empty InfoFile.qafile_name}">
                    <input type="button" id="fileDelete" class="btn btn-secondary mr-5 mb-5" value="삭제">
                    </c:if>
                    <c:if test="${empty InfoFile.qafile_name}">
                    <input type="file" name="File" id="File1" value="null">
                    </c:if>
                </div>
            </div>
                     <button type="button" id="List" class="btn btn-sm btn-alt-primary">
                        	목록
                     </button>
                     <button type="button" id="update" class="btn btn-sm btn-alt-primary">
                           	수정
                     </button>
                 </div>
                     <br>
	            </div>
</form>



</body>
</html>