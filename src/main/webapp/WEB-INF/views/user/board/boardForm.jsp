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
	Codebase.helpers(['ckeditor']);
	
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
 	if("${USER_LOGININFO.mem_id}" != null){
		$('input[name=mem_id]').val("${USER_LOGININFO.mem_id}");
	}
	
	$('#Add').click(function(){
		if($('input[name=bo_title]').val() == ''){
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
      	  text: "글을 등록하시겠습니까?",
      	  icon: "info",
      	  buttons: true,
      	})
	    .then(function(result){ 
				if (result) {
					var content = CKEDITOR.instances['js-ckeditor'].getData();
					$('#formadd').append('<input type="hidden" name="bo_content" value="' + content + '">');
					$('input[name=bo_content]').val(content);
					$('#formadd').submit();
				}else{
					return;
				}
			});
	});
	$('#List').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/board/boardList.do');	
	});
});
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">게시판</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/board/boardList.do">자유게시판</a> 
	</span> 
	<span class="breadcrumb-item active"> 
		<a>작성</a> 
	</span> 
</nav>

	<div class="col-md-12">
        <form action="${pageContext.request.contextPath}/board/insertBoard.do" id="formadd" method="post"  enctype="multipart/form-data">
	<div class="block">
                             <div class="block block-rounded block-themed">
                                 <div class="block-header bg-gd-primary">
                                     <h3 class="block-title">작성</h3>
                                     <div class="block-options">
                                     </div>
                                 </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
          <input name="bo_title" type="text" class="form-control" >
                   </div>
               </div>
            </div>
             <input type="hidden" id="mem_id" name="mem_id" >
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