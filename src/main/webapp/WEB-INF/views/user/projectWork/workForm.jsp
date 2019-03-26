<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <!-- Page JS Code -->
<script src="assets/js/pages/be_forms_plugins.js"></script>
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation2.js'></script>
<script type="text/javascript">
$(function(){
	$('#rank').val('1');
	$('#time').val('0');
	Codebase.helpers(['ckeditor']);
	CKEDITOR.instances['js-ckeditor'].config.autoParagraph = false;
	CKEDITOR.instances['js-ckeditor'].config.fillEmptyBlocks = false;
	CKEDITOR.instances['js-ckeditor'].config.fullPage = false;
	CKEDITOR.instances['js-ckeditor'].config.ignoreEmptyParagraph = true;
	CKEDITOR.instances['js-ckeditor'].config.enterMode = CKEDITOR.ENTER_BR
    Codebase.helpers(['datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs', 'rangeslider', 'tags-inputs']);
	
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
    $('#boardAdd').click(function(){
    	if($('input[name=work_title]').val() == ''){
    		swal("경고","제목을 입력해주세요.", "error");
    		return false;
    	}
    	var content = CKEDITOR.instances['js-ckeditor'].getData();
    	if(content == ''){
    		swal("경고","내용을 입력해주세요.", "error");
    		return false;
    	}
    	if($('input[name=work_start]').val() == ''){
    		swal("경고","시작일을 입력해주세요.", "error");
    		return false;
    	}
    	if($('input[name=work_end]').val() == ''){
    		swal("경고","마감일을 입력해주세요.", "error");
    		return false;
    	}
    	if($('input[name=work_end]').val() <  $('input[name=work_start]').val()){
    		swal("경고","마감일은 시작일보다 빠를 수 없습니다.", "error");
    		return false;
    	}
    	if($('input[name=work_time]').val() <= 0){
    		swal("경고","추정시간을 입력해주세요.", "error");
    		return false;
    	}
    	if(!$('input[name=work_time]').val().validationNUM()){
    		swal("경고","추정시간을 바르게 입력해주세요.", "error");
    		return false;
    	}
    	
    	swal({
        	  title: "알림",
        	  text: "일감을 등록하시겠습니까?",
        	  icon: "info",
        	  buttons: true,
        	})
	    .then(function(result){ 
				if (result) {
					var content = CKEDITOR.instances['js-ckeditor'].getData();
					$('#form').append('<input type="hidden" name="work_content">');
					$('input[name=work_content]').val(content);
					$('#form').append('<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">');
					$('#form').append('<input type="hidden" name="work_proj_num" value="${pnum}">');
					$('#form').submit();
				}else{
					return;
				}
				
			});
    });
    $('#boardList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectWork/workList.do');
    });
})
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
		<a href="javascript:history.go(-1)">프로젝트 일감</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>작성</a> 
	</span>
</nav>	

 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
	<form class="form-horizontal" action="${pageContext.request.contextPath }/projectWork/workWrite.do" method="post"
	enctype="multipart/form-data" id="form">
	<h2 class="content-heading">일감</h2>
	<div class="block">
	    <div class="block-header block-header-default">
	        <h3 class="block-title">일감 등록</h3>
	    </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-1 col-form-label">제목 : </label>
                   <div class="col-11">
                       <input name="work_title" type="text" class="form-control" >
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
                    <label class="col-6" for="example-select">우선순위</label>
                    <label class="col-6" for="example-select">당담자</label>
                    <div class="col-md-6">
                        <select class="form-control" id="rank" name="work_priority">
                            <option value="0">상</option>
                            <option value="1">중</option>
                            <option value="2">하</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <select class="form-control" id="order" name="work_char_id">
                        <c:forEach items="${memList }" var="memberInfo">
                            <option value="${memberInfo.CONS_FREE_ID }">${memberInfo.CONS_FREE_ID } : ${memberInfo.PART }</option>
                        </c:forEach>
                        </select>
                    </div>
                </div>
	            </div>
	            <div class="col-sm-6">
	            <div class="form-group row">
                    <label class="col-6" for="example-select">시작일</label>
                    <label class="col-6" for="example-select">마감일</label>
                    <div class="col-6">
                        <input type="date" class="js-datepicker form-control" id="datepicker1" name="work_start" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd">
                    </div>
                    <div class="col-6">
                        <input type="date" class="js-datepicker form-control" id="datepicker2" name="work_end" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd">
                    </div>
                </div>
	            </div>
            </div>
	        <div class="form-group row">
	            <div class="col-sm-6">
	            <div class="form-group row">
                    <label class="col-12" for="example-select">상위 일감</label>
                    <div class="col-md-12">
                        <select class="form-control" id="order" name="work_order">
                            	<option></option>
                        	<c:forEach items="${orderList }" var="orderInfo">
                            	<option value="${orderInfo.rnum }">${orderInfo.rnum } : ${orderInfo.work_title }</option>
                        	</c:forEach>
                        </select>
                    </div>
                </div>
	            </div>
	            <div class="col-sm-6">
	            <div class="form-group row">
		            <label class="col-6" for="example-select">추정 시간</label>
		            <label class="col-6" for="example-select">진척도</label>
		            <div class="col-5">
	                    <input type="text" class="form-control" id="time" name="work_time" placeholder="Email..">
	                </div>
		            <label class="col-1" for="example-select">시간</label>
                   <div class="col-md-5">
                        <select class="form-control" id="progress" name="work_progress">
                            <option value="0">0</option>
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                            <option value="40">40</option>
                            <option value="50">50</option>
                            <option value="60">60</option>
                            <option value="70">70</option>
                            <option value="80">80</option>
                            <option value="90">90</option>
                            <option value="100">100</option>
                        </select>
                    </div>
		            <label class="col-1" for="example-select">%</label>
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
                     <button type="button" id="boardAdd" class="btn btn-secondary mr-5 mb-5 pull-right">일감 등록</button>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
	</form>
	<!-- END CKEditor -->
</body>
</html>