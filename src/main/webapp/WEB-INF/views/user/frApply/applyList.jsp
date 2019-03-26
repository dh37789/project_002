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
<script type="text/javascript">
$(function(){
	$('.meet').click(function(){
		var ap_num = $(this).val();
		var pr_num = $(this).find('input[name=pr_num]').val();
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{ap_num : ap_num,
				   pr_num : pr_num},
	         url:'${pageContext.request.contextPath}/apply/meetChk.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
				$('#modal_meet').modal('show');
				$('#pr_num').val(result.pr_num);
				$('#apmt_num').val(result.mtInfo.apmt_num);
				$('#from').val(result.mtInfo.mt_from);
				$('#to').val(result.mtInfo.mt_to);
				$('#memo').val(result.mtInfo.mt_memo);
				$('#type').val(result.mtInfo.mt_type);
				var date = result.mtInfo.mt_date.substring(0,10);
				$('#date').val(date);
	         }
	      });
	});
	$('#mtOk').click(function(){
		var pr_num = $('#pr_num').val();
		var apmt_num = $('#apmt_num').val();
		$(location).attr('href','${pageContext.request.contextPath}/apply/frMeetOk.do?pr_num=' + pr_num +'&apmt_num=' + apmt_num);
	});
	$('#mtCancel').click(function(){
		var pr_num = $('#pr_num').val();
		var apmt_num = $('#apmt_num').val();
		$(location).attr('href','${pageContext.request.contextPath}/apply/frMeetCancel.do?pr_num=' + pr_num +'&apmt_num=' + apmt_num);
	});
	$('.callMt').click(function(){
		var apmt_num = $(this).val();
		var pr_num = $(this).find('input').val();
		swal({
	    	  title: "화상미팅을 시작하시겠습니까?",
	    	  icon: "info",
	    	  buttons: true,
	    	})
	    	.then(function(exit){
	    	  if (exit) {
	    		  $(location).attr('href','${pageContext.request.contextPath }/client/wsclient/apCamIEetc.do?apmt_num=' + apmt_num + '&pr_num=' + pr_num);
	    	  } else {
	    	    return;
	    	  }
	    	});
	});
	
	
});
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/apply/applyList.do">지원한 프로젝트</a> 
	</span> 
</nav>  

<h2 class="content-heading">지원 프로젝트 목록 </h2>

	<c:if test="${not empty noProject}">  
          
<nav class="breadcrumb bg-white push">  
		<div class="col-md-12">  
			<div class="block-content block-content-full">
				<div class="row py-20 font-size-h3 font-w600">
					<i class="fa fa-close fa-2x text-body-bg-dark"></i>&nbsp; ${noProject }
					<div class=" col-6 text-right border-r"></div>
				</div>  
			</div>  
		</div>
		</nav>
		<br>  
	</c:if>  
<!-- 	ap_status, pr_meeting, pr_start, client -->
<c:forEach items="${applyList }" var="apply">
	<div class="col-md-12" >
		<a class="block block-link-shadow" >
			<div class="block-content block-content-full">
				<div class="font-size-sm font-w600 text-uppercase text-muted">${apply.RNUM }</div>
					<div class="row justify-content-center float-right ">
			<input type="hidden" name="ap_project" value="${apply.AP_PROJECT}">
			<input type="hidden" name="ap_num" value="${apply.AP_NUM}">


					</div>

					<div class="row">
						<div class="col-md-11 font-size-h4 font-w700 text-primary">${apply.PR_TITLE}</div>
						
					</div>
					<small><i class="fa fa-krw fa-1x" ></i> 지원 금액  ${apply.AP_PAYMENT }원 </small>  |  <small><i class="fa fa-calendar-check-o fa-1x"></i> 지원일   ${apply.AP_DATE }</small> | <small><i class="si si-clock fa-1x"></i> 모집 마감일 ${apply.PR_DEADLINE} [ D - ${apply.DDAY } ]</small>
					<br>
					<br>
					<div class="row">
					<div class="col-md-10 ">
<pre>${apply.AP_CONTENT}</pre>
<br>
					<div class=" font-size-md font-700w badge badge-primary">
					선호 미팅 유형 :
					<c:if test="${apply.PR_MEETING eq 0 }">
					온라인
					</c:if> 
					<c:if test="${apply.PR_MEETING eq 1 }">
					오프라인
					</c:if> 
					&nbsp;|&nbsp; 프로젝트 시작일 : ${apply.PR_START }
					</div>
					</div>
					<br>
					<div class="col-md-2" >
					<c:if test="${apply.AP_STATUS eq '0'}">
					<button class="btn btn-alt-warning" style="width: 150px; height: 50px;" disabled="disabled"><i class=" si si-note fa-1x"></i>미팅 조율중</button>
					</c:if>
					<c:if test="${apply.AP_STATUS eq '1'}">
					<button class="btn btn-alt-secondary meet" style="width: 150px; height: 50px;" value="${apply.AP_NUM }"><i class=" si si-note fa-1x"></i>
					<input type="hidden" name="pr_num" value="${apply.AP_PROJECT }"/>미팅 확인</button>
					</c:if>
					<c:if test="${apply.AP_STATUS eq '2'}">
					<c:if test="${apply.MT_TYPE eq '0' }">
					<button class="btn btn-alt-info callMt" style="width: 150px; height: 50px;" value="${apply.APMT_NUM }"><i class="si si-call-end"></i>
					<input type="hidden" name="pr_num" value="${apply.AP_PROJECT }"/>
					화상회의</button>
					</c:if>
					<c:if test="${apply.MT_TYPE eq '1' }">
					<button id="meet" class="btn btn-alt-info" style="width: 150px; height: 50px;" disabled="disabled"><i class=" si si-note fa-1x"></i>승인대기중</button>
					</c:if>
					</c:if>
					<c:if test="${apply.AP_STATUS eq 'y'}">
					<button class="btn btn-alt-success" style="width: 150px; height: 50px;" disabled="disabled" value="${apply.AP_NUM }"><i class="fa fa-close fa-1x">미팅 완료</i></button>
					</c:if>
					<c:if test="${apply.AP_STATUS eq 'n'}">
					<button class="btn btn-alt-secondary" style="width: 150px; height: 50px;" disabled="disabled" value="${apply.AP_NUM }"><i class="fa fa-close fa-1x">거절됨</i></button>
					</c:if>
					</div>
					</div>
					<br>
			</div>
		</a>
	</div>
	<!-- END Fade In Modal -->
</c:forEach>

<div class="modal fade" id="modal_meet" tabindex="-1" role="dialog" aria-labelledby="modal-fadein" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="block block-themed block-transparent mb-0">
                <div class="block-header bg-primary-dark">
                    <h3 class="block-title">미팅 신청란</h3>
                    <div class="block-options">
                        <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                            <i class="si si-close"></i>
                        </button>
                    </div>
                </div>
                <div class="block-content">
					<!-- Normal Form -->
                    <form id="mtForm" action="${pageContext.request.contextPath}/clRegProject/regMeetingAdd.do" method="post">
                        <div class="form-group row">
                        <div class="col-6">
                            <label for="example-nf-password">클라이언트</label>
                            <input type="text" id="from" class="form-control" disabled="disabled">
                            <input type="hidden" id="pr_num" name="pr_num" class="form-control">
                            <input type="hidden" id="apmt_num" name="apmt_num" class="form-control">
                        </div>
                        <div class="col-6">
                            <label for="example-nf-password">프리랜서</label>
                            <input type="text" id="to" class="form-control" disabled="disabled">
                        </div>
                        </div>
                        <div class="form-group">
                            <label for="example-nf-password">미팅 설명</label>
                            <input type="text" id="memo" name="mt_memo" class="form-control" disabled="disabled">
                        </div>
                        <div class="form-group">
                            <label for="example-nf-password">미팅 타입</label>
                            <select name="mt_type" id="type" class="form-control" disabled="disabled">
                            <option value="">타입 선택</option>
                            <option value="0">Online</option>
                            <option value="1">Offline</option>
                            </select>
                        </div>
                        <div class="form-group">
                        	<label for="example-nf-email">미팅 날짜</label>
                            <input name="mt_date" type="text" id="date" class="form-control" disabled="disabled">
                        </div>
                    </form>
                    <!-- END Normal Form -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-alt-success" data-dismiss="modal" id="mtOk">
                    <i class="fa fa-check"></i>확인
                </button>
                <button type="button" class="btn btn-alt-danger" data-dismiss="modal" id="mtCancel">
                    <i class="fa fa-close"></i>거절
                </button>
                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- END Fade In Modal -->
</body>
</html>