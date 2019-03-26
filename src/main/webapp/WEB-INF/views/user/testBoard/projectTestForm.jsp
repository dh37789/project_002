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
	$('#rank').val('1');
	$('#order').val('0');
	Codebase.helpers(['ckeditor']);
    Codebase.helpers(['datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs', 'rangeslider', 'tags-inputs']);
    $('#boardAdd').click(function(){
    	swal({
	      	  title: "알림",
	      	  text: "일감을 등록하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
				if (result) {
					var content = CKEDITOR.instances['js-ckeditor'].getData();
					$('#form').append('<input type="hidden" name="test_content">');
					$('input[name=test_content]').val(content);
					$('#form').append('<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">');
					$('#form').append('<input type="hidden" name="test_pr_num" value="${pnum}">');
					$('#form').submit();
				}else{
					return;
				}
			});
    });
    
    $("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
    
    $('#boardList').click(function(){
       	$(location).attr('href','${pageContext.request.contextPath}/frmyprojecting/frmyprojecting.do');	
    });
})
</script>
<body>
<nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="#">Forum</a>
    <span class="breadcrumb-item active">Categories</span>
</nav>
 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
	<form class="form-horizontal" action="${pageContext.request.contextPath }/projectTest/projectTestAdd.do" method="post"
	enctype="multipart/form-data" id="form">
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
                       <input name="test_title" type="text" class="form-control" >
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
	            <div class="col-sm-6">
	            <div class="form-group row">
                    <label class="col-12" for="example-select">유형</label>
                    <div class="col-md-12">
                        <select class="form-control" id="rank" name="test_type">
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
                        <select class="form-control" id="order" name="test_status">
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
	            <div class="col-sm-4">
	            </div>
	            <div class="col-sm-4">
	            </div>
	            <div class="col-sm-4 mb-10">
	            <div class="mb-10">
                     <button type="button" id="boardList" class="btn btn-secondary mr-5 mb-5 pull-right">목록</button>
                     <button type="button" id="boardAdd" class="btn btn-secondary mr-5 mb-5 pull-right">등록</button>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
	</form>
	<!-- END CKEditor -->
</body>
</html>