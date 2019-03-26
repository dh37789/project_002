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
	$('#title').text('${testInfo.test_title}')
	$('#type').val('${testInfo.test_type}');
	$('#order').val('${testInfo.test_status}');
	Codebase.helpers(['ckeditor']);
	CKEDITOR.instances['js-ckeditor'].config.readOnly = true;
    Codebase.helpers(['datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs', 'rangeslider', 'tags-inputs']);
    $('#boardList').click(function(){
    	$(location).attr('href','${pageContext.request.contextPath}/frmyprojecting/frmyprojecting.do');	
    });
    $('#boardDelete').click(function(){
    	swal({
	      	  title: "알림",
	      	  text: "게시물을 삭제하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
				if (result) {
					$(location).attr('href','${pageContext.request.contextPath}/projectTest/projectTestDelete.do?test_num=${testInfo.test_num}');
				}else{
					return;
				}
			});
    });
    $('#boardEdit').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectTest/projectTestUpdateForm.do?test_num=${testInfo.test_num}');
    })
})
</script>
<body>
<nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="#">Forum</a>
    <span class="breadcrumb-item active">Categories</span>
</nav>
 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
	<h2 class="content-heading">테스트 게시판</h2>
	<div class="block">
	    <div class="block-header block-header-default">
	        <h3 class="block-title">게시물 등록</h3>
	    </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
				       <label id="title" class="col-lg-11 col-form-label">제목 : </label>
                   </div>
               </div>
            </div>
             <div class="form-group row">
	            <div class="col-sm-6">
	            <div class="form-group row">
                    <label class="col-12" for="example-select">유형</label>
                    <div class="col-md-12">
                        <select class="form-control" id="type" name="test_type" disabled="disabled">
                            <option value="0">버그</option>
                            <option value="1">테스트</option>
                        </select>
                    </div>
                </div>
	            </div>
	            <div class="col-sm-6">
	            <div class="form-group row">
	             <label class="col-12" for="example-select">상태</label>
                    <div class="col-md-12">
                        <select class="form-control" id="order" name="test_status" disabled="disabled">
                            <option value="0">발견</option>
                            <option value="1">수정 중</option>
                            <option value="2">테스트 중</option>
                            <option value="3">완료</option>
                        </select>
                    </div>
                </div>
	            </div>
            </div>
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <textarea id="js-ckeditor" name="ckeditor">
                    ${testInfo.test_content }
                    </textarea>
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
                     <button type="button" id="boardDelete" class="btn btn-secondary mr-5 mb-5 pull-right">삭제</button>
                     <button type="button" id="boardEdit" class="btn btn-secondary mr-5 mb-5 pull-right">수정</button>
                     </c:if>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
	<!-- END CKEditor -->
</body>
</html>