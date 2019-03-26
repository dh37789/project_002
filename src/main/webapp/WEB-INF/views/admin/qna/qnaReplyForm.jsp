<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	Codebase.helpers(['ckeditor']);
	$('#qa_title').text('${qna.qa_title}');
	$('input[name=mem_id]').val('${ADMIN_LOGININFO.mem_id}');
	$('input[name=qa_pass]').val('${qna.qa_pass}')
	$('input[name=qa_depth]').val('${qna.qa_depth}');
	$('input[name=qa_group]').val('${qna.qa_num}');
	$('input[name=qa_title]').val('${qna.qa_title}');
	$('#Add').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "답변을 작성하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
				if (result) {
					var content = CKEDITOR.instances['js-ckeditor'].getData();
					$('#formadd').append('<input type="hidden" name="qa_content" value="' + content + '">');
					$('input[name=qa_content]').val(content);
					$('#formadd').submit();
				}else{
					return;
				}
			});
	});
	$('#List').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/qna/aqnaList.do');	
	});
});
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">게시판 관리</a> 
	<span class="breadcrumb-item"> 
		<a href="${pageContext.request.contextPath }/qna/aqnaList.do">Q&A</a> 
	</span>
	<span class="breadcrumb-item">  
		<a>작성</a> 
	</span>
</nav>
 
 	<div class="col-md-12">
        <form action="${pageContext.request.contextPath }/qna/insertQnaReply.do" id="formadd" method="post" enctype="multipart/form-data">
	<h2 class="content-heading">QnA</h2>
	<div class="block">
                             <div class="block block-rounded block-themed">
                                 <div class="block-header bg-gd-primary">
                                     <h3 class="block-title">Q&A 답글</h3>
                                     <div class="block-options">
                                     </div>
                                 </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
            <input type="hidden" name="qa_title">
					    <label id="qa_title" 
							class="col-lg-11 col-form-label"></label>
                   </div>
               </div>
            </div>
            <input type="hidden" name="mem_id" id="mem_id" value="관리자">
            <input type="hidden" name="qa_pass" id="qa_pass">
            <input type="hidden" name="qa_depth" id="qa_depth">
            <input type="hidden" name="qa_group" id="qa_group">
            
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <textarea id="js-ckeditor" name="ckeditor"></textarea>
                </div>
            </div>
            
	         <div class="form-group row">
                <label class="col-12" for="example-file-input">첨부 파일</label>
                <div class="col-12">
                    <input type="file" name="File">
                </div>
            </div>
				<br>
                     <button type="button" id="List" class="btn btn-sm btn-alt-primary">목록</button>
                     <button type="button" id="Add" class="btn btn-sm btn-alt-primary">글 작성</button>
                 </div>
                 <br>
	            </div>
            </div>
            </form>
	</div>
	
</body>
</html>