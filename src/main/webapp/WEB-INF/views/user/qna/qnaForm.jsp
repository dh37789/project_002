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
//    CKEDITOR.instances['js-ckeditor'].getData(); 데이터 가져오기
// CKEDITOR.instances['js-ckeditor'].config.readOnly = true; 읽기모드
   Codebase.helpers(['ckeditor']);
   var mem_id =   $('input[name=mem_id]').val();
   
   $("input").keydown(function(evt) { 
      if (evt.keyCode == 13) return false; 
   });
   
   $('#Add').click(function(){
      if($('input[name=qa_title]').val() == ''){
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
              text: "질문을 등록하시겠습니까?",
              icon: "info",
              buttons: true,
            })
          .then(function(result){ 
            if (result) {
               var content = CKEDITOR.instances['js-ckeditor'].getData();
               if($('input[type=checkbox]').is(':checked')){
                  $('input[name=qa_pass]').val(mem_id);
               }else{
                  $('input[name=qa_pass]').val(null);
               }
               $('#formadd').append('<input type="hidden" name="qa_content" value="' + content + '">');
               $('input[name=qa_content]').val(content);
               $('#formadd').submit();
            }else{
               return;
            }
         });
   });
   $('#List').click(function(){
      $(location).attr('href','${pageContext.request.contextPath}/qna/qnaList.do');   
   });
});
</script>
<body>
	<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">게시판</a>
	<span class="breadcrumb-item active"> <a href="${pageContext.request.contextPath }/qna/qnaList.do">Q&A</a></span> 
	<span class="breadcrumb-item active"> <a>작성</a></span> </nav>

	<div class="col-md-12">
		<form action="${pageContext.request.contextPath }/qna/insertQna.do"
			id="formadd" method="post" enctype="multipart/form-data">
			<div class="block">
				<div class="block block-rounded block-themed">
					<div class="block-header bg-gd-primary">
						<h3 class="block-title">작성</h3>
						<div class="block-options"></div>
					</div>
					<div class="block-content">
						<div class="form-group">
							<div class="row">
								<label class="col-lg-1 col-form-label">제목 : </label>
								<input name ="qa_title" type="text" class="form-control" style="width: 80%;">&nbsp&nbsp
								<label class="css-control css-control-sm css-control-secondarycss-checkbox" style="font-weight: bold;"> 
								<input type="checkbox"  name="qa_pass" >
								<span class="css-control-indicator"></span>&nbsp<i class="si si-lock">비밀글</i> </label>
							</div>
						</div>
						<c:if test="${not empty sessionScope.USER_LOGININFO }">
							<input type="hidden" id="mem_id" name="mem_id" value="${USER_LOGININFO.mem_id}">
						</c:if>
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
						<button type="button" id="Add" class="btn btn-sm btn-alt-primary">글작성</button>
					</div>
					<br>
				</div>
			</div>
		</form>

	</div>

</body>
</html>