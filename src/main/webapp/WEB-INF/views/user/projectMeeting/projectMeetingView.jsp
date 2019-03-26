<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <!-- Page JS Code -->
 <script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script type="text/javascript">
$(function(){
	if ('${boardInfo.mt_to_accept}' == 1) {
		$('#fail').hide();
		$('#success').hide();
		$('#call').show();
	}else if('${boardInfo.mt_to_accept}' == 2){
		$('#success').attr('disabled', 'true');
// 		$('#fail').attr('disabled', 'true');
		$('#call').hide();
	}else{
		$('#call').hide();
	}
	$('#from').text('${boardInfo.mt_from }');
	$('#to').text('${boardInfo.mt_to }');
	if ('${boardInfo.mt_type}' == '0') {
		$('#type').text('Offline')
	}else if('${boardInfo.mt_type}' == '1'){
		$('#type').text('Online')
	}
	var time = '${boardInfo.mt_time}'.split(' ');
	$('#time').text(time[0]);
    Codebase.helpers(['datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs', 'rangeslider', 'tags-inputs']);
    $('#boardDel').click(function(){
    	if ('${boardInfo.mt_from}' != '${USER_LOGININFO.mem_id}') {
    		swal({
         	  	  title: "작성자만 삭제할 수 있습니다.",
        	      icon: "warning",
        	    });
    		return;
		}
    	swal({
	      	  title: "알림",
	      	  text: "미팅내역을 삭제하시겠습니까?",
	      	  icon: "warning",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
				if (result) {
					$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingDel.do?mt_num=${boardInfo.mt_num}');
				}else{
					return;
				}
			});
    });
    $('#boardList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingList.do');
    });
    $('#success').click(function(){
    	if ('${boardInfo.mt_to}' != '${USER_LOGININFO.mem_id}') {
    		swal({
         	  	  title: "당사자만 선택 가능합니다.",
        	      icon: "warning",
        	    });
    		return;
		}
    	$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{ mt_num : '${boardInfo.mt_num}',
	        	    mt_to_accept : '${boardInfo.mt_to_accept}'},
	         url:'${pageContext.request.contextPath}/projectMeeting/meetingAccept.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
	            	$('#fail').hide();
	        		$('#success').hide();
	        		$('#call').show();
	        		$('#block').before('<p class="p-10 bg-success text-white">미팅이 수락 되었습니다.</p>');
	            }else{
	            }
	         }
	      });	
    });
  
    $('#fail').click(function(){
    	if ('${boardInfo.mt_to}' != '${USER_LOGININFO.mem_id}') {
    		swal({
         	  	  title: "당사자만 선택 가능합니다.",
        	      icon: "warning",
        	    });
    		return;
		}
    	$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{ mt_num : '${boardInfo.mt_num}',
	        	    mt_to_accept : '${boardInfo.mt_to_accept}'},
	         url:'${pageContext.request.contextPath}/projectMeeting/meetingReject.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
	            	$('#success').attr('disabled', 'true');
	        		$('#fail').attr('id', 'newFail');
	        		$('#block').before('<p id="failInfo" class="p-10 bg-danger text-white">미팅이 거절 되었습니다.</p>');
	            }else{
	            }
	         }
	      });	
    });
    $('#call').click(function(){
    	$(location).attr('href','${pageContext.request.contextPath}/client/wsclient/webCamIEetc.do?mt_num=${boardInfo.mt_num}');
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
		<a href="javascript:history.go(-1)">프로젝트 미팅</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>상세보기</a> 
	</span>
</nav>
 <!-- CKEditor (js-ckeditor-inline + js-ckeditor ids are initialized in Codebase() -> uiHelperCkeditor()) -->
	<!-- For more info and examples you can check out http://ckeditor.com -->
	<h2 class="content-heading">미팅</h2>
	<c:if test="${boardInfo.mt_from eq USER_LOGININFO.mem_id || boardInfo.mt_to eq USER_LOGININFO.mem_id}">
	<c:if test="${boardInfo.mt_to_accept eq 1}">
	<p class="p-10 bg-success text-white">미팅이 수락 되었습니다.</p>
	</c:if>
	<c:if test="${boardInfo.mt_to_accept eq 2}">
	<p id="failInfo" class="p-10  bg-danger text-white">미팅이 거절 되었습니다.</p>
	</c:if>
	</c:if>
	<c:if test="${boardInfo.mt_from ne USER_LOGININFO.mem_id && boardInfo.mt_to ne USER_LOGININFO.mem_id}">
	<p class="p-10 bg-warning text-white">대상자만 참여 가능합니다.</p>
	</c:if>
	<div id="block" class="block">
	    <div class="block-header block-header-default">
	        <h3 class="block-title">미팅 내역 일람</h3>
	    </div>
	    <div class="block-content">
	   	    <div class="form-group">
               <div class="row">
			       <label class="col-lg-12 col-form-label font-size-h5 font-w600">${boardInfo.mt_reason }</label>
                   <div class="col-11">
			       	<label id="title" class="col-lg-11 col-form-label"></label>
                   </div>
               </div>
            </div>
            <div class="form-group row">
	            <label class="col-1" for="example-select">신청자</label>
	            <label class="col-2" id="from" for="example-select"></label>
	            <label class="col-1" for="example-select">대상자</label>
	            <label class="col-2" id="to" for="example-select"></label>
	            <label class="col-1" for="example-select">미팅 유형</label>
	            <label class="col-2" id="type" for="example-select"></label>
            </div>
            <div class="form-group row">
	           <label class="col-1" for="example-select">신청일</label>
	           <label class="col-5" id="time" for="example-select"></label>
            </div>
            <br>
            <br>
            <br>
            <div class="form-group row text-center">
                <div class="col-1"></div>
                <div class="col-4">
                <c:if test="${boardInfo.mt_from ne USER_LOGININFO.mem_id && boardInfo.mt_to ne USER_LOGININFO.mem_id}">
                	<button id="success" class="btn btn-rounded btn-noborder btn-success min-width-125 mb-10" style="width:40%; height: 80px;" disabled="disabled"><i class="fa fa-check"></i><br>미팅 수락</button>
				</c:if>
                <c:if test="${boardInfo.mt_from eq USER_LOGININFO.mem_id || boardInfo.mt_to eq USER_LOGININFO.mem_id}">
                	<button id="success" class="btn btn-rounded btn-noborder btn-success min-width-125 mb-10" style="width:40%; height: 80px;"><i class="fa fa-check"></i><br>미팅 수락</button>
				</c:if>
                </div>
                <div class="col-1"></div>
                <div class="col-1"></div>
                <div class="col-4">
                <c:if test="${boardInfo.mt_from ne USER_LOGININFO.mem_id && boardInfo.mt_to ne USER_LOGININFO.mem_id}">
                	<button id="fail" class="btn btn-rounded btn-noborder btn-danger min-width-125 mb-10" style="width:40%; height: 80px;" disabled="disabled"><i class="fa fa-close"></i><br>미팅 거절</button>
				</c:if>
                <c:if test="${boardInfo.mt_from eq USER_LOGININFO.mem_id || boardInfo.mt_to eq USER_LOGININFO.mem_id}">
                	<button id="fail" class="btn btn-rounded btn-noborder btn-danger min-width-125 mb-10" style="width:40%; height: 80px;"><i class="fa fa-close"></i><br>미팅 거절</button>
				</c:if>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="form-group row text-center">
                <div class="col-1"></div>
                <div class="col-10">
                <c:if test="${boardInfo.mt_from ne USER_LOGININFO.mem_id && boardInfo.mt_to ne USER_LOGININFO.mem_id}">
                	<button id="call" class="btn btn-rounded btn-noborder btn-primary min-width-125 mb-10" style="width:40%; height: 80px;" disabled="disabled"><i class="si si-call-end"></i><br>화상 회의</button>
				</c:if>
                <c:if test="${boardInfo.mt_from eq USER_LOGININFO.mem_id || boardInfo.mt_to eq USER_LOGININFO.mem_id}">
                	<button id="call" class="btn btn-rounded btn-noborder btn-primary min-width-125 mb-10" style="width:40%; height: 80px;"><i class="si si-call-end"></i><br>화상 회의</button>
				</c:if>
                </div>
                <div class="col-1"></div>
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
                     <button type="button" id="boardDel" class="btn btn-secondary mr-5 mb-5 pull-right">미팅 삭제</button>
                     </c:if>
                 </div>
	            </div>
            </div>
	    </div>
	</div>
	<!-- END CKEditor -->
</body>
</html>