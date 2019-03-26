<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#conDown').click(function(){
		var cons_num = $(this).val();
		$(location).attr('href', '${pageContext.request.contextPath}/readyProject/conDownload.do?cons_num='+cons_num);
	});
	$('#ok').click(function(){
		var cons_num = $('input[name=modalInput]').val();
		var client_id = $('input[name=client_id]').val();
		var pr_num = $('input[name=pr_num]').val();
		var mem_id = $('input[name=mem_id]').val();
		location.href="${pageContext.request.contextPath}/readyProject/clientOk.do?cons_num="
				+cons_num + "&mem_id=" + mem_id + '&pr_num=' + pr_num + '&client_id=' + client_id;
	});
	
	if ('${conInfo.cons_status}' != '0') {
		$('input[name=cons_payment]').val('${conInfo.cons_payment} 원');
		$('input[name=cons_period]').val('${conInfo.cons_period} 일');
		$('select[name=part_num]').val('${conInfo.part_num}');
		$('input[name=cons_payment]').attr('disabled','true');
		$('input[name=cons_period]').attr('disabled','true');
		$('select[name=part_num]').attr('disabled','true');
	}
	$('#updateCons').click(function(){
		if (!($('input[name=cons_payment]').val().validationNUM())) {
			swal({
	        	  title: "계약금액을 다시 입력해 주세요.",
	        	  icon: "warning"
	        	})
	        	return;
		}
		if (!($('input[name=cons_period]').val().validationNUM())) {
			swal({
	        	  title: "계약 일 수를 다시 입력해 주세요.",
	        	  icon: "warning"
	        	})
	        	return;
		}
		swal({
        	  title: "정보를 입력하시겠습니까?",
        	  icon: "info",
        	  buttons: true,
        	})
        	.then(function(exit){
        	  if (exit) {
				$('#conForm').append('<input type="hidden" name="pr_num" value="${applyInfo.ap_project}">')
				$('#conForm').append('<input type="hidden" name="mem_id" value="${memberInfo.mem_id}">')
				$('#conForm').append('<input type="hidden" name="mem_name" value="${memberInfo.mem_name}">')
				$('#conForm').append('<input type="hidden" name="cons_num" value="${conInfo.cons_num}">')
				$('#conForm').attr('action', '${pageContext.request.contextPath}/readyProject/consUpdate.do');
				$('#conForm').submit();
        	  } else {
        	    return;
        	  }
        	});
	});
	$('#btnList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/readyProject/projectView.do?pr_num=${applyInfo.ap_project}');
	});
	$('#signCon').click(function(){
		var cons_num = $(this).val();
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{cons_num : cons_num},
	         url:'${pageContext.request.contextPath}/readyProject/contractFile.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
				$('#modal-default').modal('toggle');
	            $('#conImg').attr('src','${pageContext.request.contextPath}/files/' + result.consList.CONSFILE_SAVE_NAME);
	            $('input[name=modalInput]').val(result.consList.CONS_NUM);
	            $('input[name=client_id]').val('${USER_LOGININFO.mem_id}');
	            $('input[name=mem_id]').val(result.consList.CONS_FREE_ID);
	            $('input[name=pr_num]').val(result.consList.CONS_PROJ_NUM);
	         }
	      });
	});
});
</script>
</head>
<body>
<!-- Icon/Text Groups -->
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/readyProject/projectList.do">준비중인 프로젝트</a> 
	</span> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/readyProject/projectView.do?pr_num=${pr_num}">계약정보</a> 
	</span> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/readyProject/readyCon.do?pr_num=${pr_num}&mem_id=${mem_id}">상세보기</a> 
	</span> 
</nav>  

<h2 class="content-heading font-w400">${memberInfo.mem_id }님의 계약창</h2>
<div class="block">
	<div class="block-content">
	 <div class="row no-gutters text-center" style="border: 1px solid lightgray;">
                        <div class="col-3">
                            <div class="block mb-0">
                                <div class="block-content">
                                    <h5>계약 정보 입력중</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="block mb-0" style="border-left: 1px solid lightgray;">
                                <div class="block-content">
                                    <h5>프리랜서 날인중</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="block mb-0" style="border-left: 1px solid lightgray;">
                                <div class="block-content">
                                    <h5>클라이언트 날인중</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="block mb-0" style="border-left: 1px solid lightgray;">
                                <div class="block-content">
                                    <h5>계약 완료</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END Flat Grid -->
<!-- 		<div class="text-center"> -->
<!-- 			<p><span class="badge badge-pill badge-warning" style="width: 200px; height: 30px; font-size: 1.2em;">클라이언트 도장 확인중</span></p> -->
<!-- 		</div> -->
		<div class="progress push" style="border: 1px solid lightgray;">
		<c:if test="${conInfo.cons_status eq '0' }">
		    <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" style="width: 25%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
		</c:if>
		<c:if test="${conInfo.cons_status eq '1' }">
		    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: 50%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
		</c:if>
		<c:if test="${conInfo.cons_status eq '2' }">
		    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: 75%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
		</c:if>
		<c:if test="${conInfo.cons_status eq 'y' }">
		    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 100%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
		</c:if>
		    </div>
		</div>
	</div>
</div>

<div class="col-md-12 row row-deck">
<div class="col-md-3">
 <div class="block block-link-shadow text-center">
     <div class="block-content block-content-full">
        <c:choose>
			<c:when test="${memberInfo.mem_picture eq null }">
				<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
				alt="" style="border: 1px solid #e1e1e1">
			</c:when>
			<c:otherwise>
				<img class="img-avatar img-avatar96" src="${memberInfo.mem_picture }" width="100px"
				alt="" style="border: 1px solid #e1e1e1">
			</c:otherwise>
		</c:choose>
     </div>
     <div class="block-content block-content-full block-content-sm bg-body-light">
         <div class="font-w600 mb-5">${memberInfo.mem_id }</div>
         <div class="font-size-sm text-muted">
         <c:choose>
			<c:when test="${memberInfo.ftype_num == '0' }">
				<img src="${pageContext.request.contextPath}/image/ftype_1.png" width="20px">
				개발자
			</c:when>
			<c:otherwise>
				<img src="${pageContext.request.contextPath}/image/ftype_2.png" width="20px">
				디자이너
			</c:otherwise>
		 </c:choose>
         </div>
     </div>
     <div class="block-content">
         <div class="row items-push text-center">
             <div class="col-6">
                 <div class="mb-5"><i class="si si-wallet fa-2x"></i></div>
                 <div class="font-size-sm text-muted">지원금액<br>${applyInfo.ap_payment }원</div>
             </div>
             <div class="col-6">
                 <div class="mb-5"><i class="si si-calendar fa-2x"></i></div>
                 <div class="font-size-sm text-muted">지원날짜<br>${fn:substring(applyInfo.ap_date,0,10 ) }</div>
             </div>
         </div>
     </div>
 </div>
</div>
<div class="col-md-9">
<div class="block">
    <div class="block-header block-header-default">
        <h3 class="block-title">${memberInfo.mem_id }님의 계약정보 입력</h3>
    </div>
    <div class="block-content">
        <form id="conForm" method="post">
            <div class="form-group row">
                <div class="col-lg-12">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-money"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="example-input1-group1" name="cons_payment" placeholder="Payment">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-12">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-calendar-times-o"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="example-input2-group1" name="cons_period" placeholder="Period">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-12">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-users"></i>
                            </span>
                        </div>
                        <select class="form-control" name="part_num">
                        <option value="0">PM</option>
                        <option value="1">PL</option>
                        <option value="2">TA</option>
                        <option value="3">DA</option>
                        <option value="4">AA</option>
                        <option value="5">BA</option>
                        <option value="6">UA</option>
                        </select>
                    </div>
                </div>
            </div>
        </form>
            <div align="right">
               		<c:if test="${conInfo.cons_status eq '0' }">
                    &nbsp;&nbsp;<button id="updateCons" type="button" class="btn btn-alt-primary" data-toggle="click-ripple" >정보 입력</button>
					</c:if>
               		<c:if test="${conInfo.cons_status eq '1' }">
					&nbsp;&nbsp;<button class="btn btn-alt-warning" data-toggle="click-ripple" disabled="disabled">계약서 도장 찍기</button>
					</c:if>
					<c:if test="${conInfo.cons_status eq '2' }">
					&nbsp;&nbsp;<button id="signCon" class="btn btn-alt-danger" data-toggle="click-ripple" value="${conInfo.cons_num}" >계약서 도장 찍기</button>
					</c:if>
					<c:if test="${conInfo.cons_status eq 'y' }">
					<button id="conDown" class="btn btn-alt-primary" data-toggle="click-ripple" value="${conInfo.cons_num}">계약서 다운로드</button>
					</c:if>
					&nbsp;&nbsp;<button id="btnList" class="btn btn-alt-primary" data-toggle="click-ripple">목록</button>
            </div>
    </div>
</div>
</div>
</div>
<!-- END Icon/Text Groups -->

<div class="modal fade" id="modal-default"  tabindex="-1" role="dialog" aria-labelledby="modal-popout" style="display: none;" aria-hidden="true">
             <div class="modal-dialog modal-dialog-popout" style="max-width: 836px; max-height:1000em;">
             <input type="hidden" name="modalInput">
             <input type="hidden" name="mem_id">
             <input type="hidden" name="client_id">
             <input type="hidden" name="pr_num">
               <div class="modal-content ">
               <div class="block block-themed block-transparent mb-0">
                 <div class="block-header bg-primary-dark">
                   <h4 class="block-title">계약 결제 </h4>
                   <div class="block-options">
                                <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                    <i class="si si-close"></i>
                                </button>
                   </div>
                 </div>
                 <div class="modal-body row">
                 <div class="col-md-10">
                   <img style="width: 800px; height: 1100px;" id="conImg"
						alt="">
				</div>
                 </div>
                 </div>
                 <div class="modal-footer">
                 	위 계약의 내용을 모두 확인했으면 해당 내용을 동의합니다.&nbsp;&nbsp;&nbsp;
                   <button type="button" class="btn btn-primary" id="ok" >네</button>
                   <button type="button" class="btn btn-default pull-left" data-dismiss="modal">아니요</button>
                 </div>
               </div>
               <!-- /.modal-content -->
             </div>
             <!-- /.modal-dialog -->
           </div>
</body>
</html>