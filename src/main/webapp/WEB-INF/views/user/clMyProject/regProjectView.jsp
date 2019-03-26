<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.ap_content').click(function(){
		var ap_num = $(this).find('input[name=ap_num]').val();
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{ap_num : ap_num},
	         url:'${pageContext.request.contextPath}/clRegProject/regContent.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
				$('#modal_content').modal('show');
				$('#tx_content').text(result.appInfo.ap_content);
	         }
	      });
	});
	$('.apply').click(function(){
		var ap_num = $(this).find('input[name=ap_num]').val();
		var pr_num = $(this).find('input[name=ap_project]').val();
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{ap_num : ap_num,
	        	   pr_num : pr_num},
	         url:'${pageContext.request.contextPath}/clRegProject/regMeet.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
				$('#modal_meet').modal('show');
				$('#from').val(result.projectInfo.client);
				$('#from_hidden').val(result.projectInfo.client);
				$('#to').val(result.appInfo.ap_free);
				$('#to_hidden').val(result.appInfo.ap_free);
				$('#pr_num').val(result.appInfo.ap_project);
				$('#apmt_num').val(result.appInfo.ap_num)
	         }
	      });
	});
	$('#mtOk').click(function(){
		if ($('#memo').val()=="") {
			swal({
		      	  title: "미팅 설명을 작성해 주세요",
		      	  icon: "error"
		      	});
			return;
		}
		if ($('#type').val()=="") {
			swal({
		      	  title: "미팅 타입을 선택해 주세요",
		      	  icon: "error"
		      	});
			return;
		}
		if ($('#date').val()=="") {
			swal({
		      	  title: "미팅 날짜를 입력해 주세요",
		      	  icon: "error"
		      	});
			return;
		}
		swal({
	    	  title: "전송하시겠습니까?",
	    	  icon: "success",
	    	  buttons: true,
	    	})
	    	.then(function(exit){
	    	  if (exit) {
				$('#mtForm').submit();
				$('#modal_meet').modal('hide');
	    	  } else {
	    	    return;
	    	  }
	    	});
	});
	$('.sorry').click(function(){
		var ap_num = $(this).val();
		var pr_num = $(this).find('input[name=ap_project]').val();
		swal({
	    	  title: "거절하시겠습니까?",
	    	  icon: "warning",
	    	  buttons: true,
	    	  dangerMode: true,
	    	})
	    	.then(function(exit){
	    	  if (exit) {
	    		  $(location).attr('href','${pageContext.request.contextPath }/clRegProject/sorryApply.do?ap_num=' + ap_num + '&pr_num=' + pr_num);
	    	  } else {
	    	    return;
	    	  }
	    	});
	});
	$('.appSuccess').click(function(){
		var ap_num = $(this).val();
		var pr_num = $(this).find('input[name=ap_project]').val();
		swal({
	    	  title: "수락하시겠습니까?",
	    	  icon: "success",
	    	  buttons: true,
	    	})
	    	.then(function(exit){
	    	  if (exit) {
	    		  $(location).attr('href','${pageContext.request.contextPath }/clRegProject/okayApply.do?ap_num=' + ap_num + '&pr_num=' + pr_num);
	    	  } else {
	    	    return;
	    	  }
	    	});
	});
	$('.callMt').click(function(){
		var apmt_num = $(this).val();
		var pr_num = $(this).find('input[name=ap_project]').val();
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
	$('#endAdver').click(function(){
		var pr_num = '${projectInfo.pr_num }'
		swal({
      	  title: "모집을 종료하시겠습니까?",
      	  text: "프로젝트 모집을 종료합니다.",
      	  icon: "info",
      	  buttons: true,
      	})
      	.then(function(result){
      	  if (result) {
			$(location).attr('href','${pageContext.request.contextPath }/clRegProject/endAdverProject.do?pr_num=' + pr_num)
      	  } else {
      	    return;
      	  }
      	});
	});
});
</script>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/clRegProject/regProjectList.do">등록된 프로젝트</a> 
	</span> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath}/clRegProject/regProjectView.do?pr_num=${pr_num}">지원자</a> 
	</span> 
</nav>
<h2 class="content-heading font-w400">${projectInfo.pr_title }<small> ${fn:length(appList) }명이 지원했습니다.</small>
<c:if test="${fn:length(appList) ne 0 }">
<button id="endAdver" class="btn btn-alt-warning pull-right">모집 종료</button>
</c:if>
<c:if test="${fn:length(appList) eq 0 }">
<button id="endAdver" class="btn btn-alt-warning pull-right" disabled="disabled">모집 종료</button>
</c:if>
</h2>
<div class="col-md-12 row">
<div class="col-md-1">
</div>
<div class="col-md-10">
<c:if test="${fn:length(appList) eq 0 }">
 <table id="regList" class="table bg-white " height="auto" style="border: 1px dotted #d2e7f5" >
 <tbody>
 <tr>
	<td style="height: 200px;vertical-align: middle;">
		<i class="fa fa-close fa-3x" style="padding-left: 20px;"></i>
		<i class="fa fa-2x" style="padding-left: 5px;">&nbsp;지원한 프리랜서가 없습니다.</i>
	</td>
  </tr>
 </tbody>
 </table>
</c:if>
<c:if test="${fn:length(appList) ne 0 }">
<c:forEach items="${appList }" var="appInfo">
 <table id="regList" class="table bg-white " height="auto" style="border: 1px dotted #d2e7f5" >
   <tbody>
	<tr>
	<td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
		<div class="mb-10">
			<a href="#"> 
			<c:choose>
					<c:when test="${appInfo.MEM_PICTURE eq null }">
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:when>
					<c:otherwise>
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath }/files/${appInfo.MEM_PICTURE }" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:otherwise>
				</c:choose>
			</a>
		</div> 
		${appInfo.MEM_ID }
		<br>
		<small>
			<c:choose>
				<c:when test="${appInfo.FTYPE_NUM == '0' }">
					<img src="${pageContext.request.contextPath}/image/ftype_1.png" width="20px">
					개발자
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/image/ftype_2.png" width="20px">
					디자이너
				</c:otherwise>
			</c:choose>
		</small>
	    <br>
		<small>
			<c:choose>
				<c:when test="${appInfo.MTYPE_NUM=='0' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_0.png" width="25px">
					개인
				</c:when>
				<c:when test="${appInfo.MTYPE_NUM=='1' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_1.png" width="25px">
					팀
				</c:when>
				<c:when test="${appInfo.MTYPE_NUM=='2' }">
					<img src="${pageContext.request.contextPath}/image/mtype_2.png" width="15px">
					개인사업자
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/image/mtype_3.png" width="15px">
					법인사업자
				</c:otherwise>
			</c:choose>
		</small>
	</td>
	<td>
		<br>
		<p class="font-size-md">
		<strong>지원금액 : ${appInfo.AP_PAYMENT }원 <small>지원 날짜 : ${fn:substring(appInfo.AP_DATE,0,10) }</small></strong>
		<c:if test="${appInfo.AP_STATUS eq '0' }">
		<button class="btn btn-danger pull-right sorry" style="margin-left: 5px;" value="${appInfo.AP_NUM }"><i class="fa fa-close fa-1x"></i>거절
		<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }"></button>
		<button class="btn btn-info apply  pull-right" style="width: 80px; margin-left: 5px;">미팅
			<input type="hidden" name="ap_num" value="${appInfo.AP_NUM }">
			<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }">
		</button>
		<button class="btn btn-info ap_content pull-right" style="width: 100px;">
			<input type="hidden" name="ap_num" value="${appInfo.AP_NUM }">
			<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }">
		지원 내용</button>
		</c:if>
		<c:if test="${appInfo.AP_STATUS eq '1' }">
		<button class="btn btn-danger pull-right sorry" style="margin-left: 5px;" value="${appInfo.AP_NUM }"><i class="fa fa-close fa-1x"></i>거절
		<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }"></button>
		<button class="btn btn-info pull-right" disabled="disabled"><i class=" si si-note fa-1x"></i>미팅 협의 중</button>
		</c:if>
		<c:if test="${appInfo.AP_STATUS eq '2' }">
		<c:if test="${appInfo.MT_TYPE eq '0' }">
		<button class="btn btn-danger pull-right sorry" style="margin-left: 5px;" value="${appInfo.AP_NUM }"><i class="fa fa-close fa-1x"></i>거절
		<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }"></button>
		<button class="btn btn-success pull-right appSuccess" style="margin-left: 5px;" value="${appInfo.AP_NUM }">
		<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }"><i class="fa fa-check fa-1x"></i>수락</button>
		<button class="btn btn-info pull-right callMt" value="${appInfo.APMT_NUM }">
		<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }"><i class="si si-call-end"></i>화상회의</button>
		</c:if>
		<c:if test="${appInfo.MT_TYPE eq '1' }">
		<button class="btn btn-danger pull-right sorry" style="margin-left: 5px;" value="${appInfo.AP_NUM }"><i class="fa fa-close fa-1x"></i>거절
		<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }"></button>
		<button class="btn btn-success pull-right appSuccess" value="${appInfo.AP_NUM }">
		<input type="hidden" name="ap_project" value="${appInfo.AP_PROJECT }"><i class="fa fa-check fa-1x"></i>
		수락</button>
		</c:if>
		</c:if>
		<c:if test="${appInfo.AP_STATUS eq 'y' }">
		<button class="btn btn-success pull-right" disabled="disabled"><i class="fa fa-check fa-1x"></i>미팅 완료</button>
		</c:if>
		<c:if test="${appInfo.AP_STATUS eq 'n' }">
		<button class="btn btn-danger pull-right" disabled="disabled"><i class="fa fa-close fa-1x"></i>거절됨</button>
		</c:if>
		</p>
		<hr>
<!-- 		<p class="font-size-sm text-muted" style="width: 90%;"> -->
<!-- 		</p> -->
	</td>
	</tr>
 </tbody>
 </table>
</c:forEach>
</c:if>
</div>
<div class="col-md-1">
</div>
</div>
<!-- Fade In Modal -->
<div class="modal fade" id="modal_content" tabindex="-1" role="dialog" aria-labelledby="modal-fadein" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="block block-themed block-transparent mb-0">
                <div class="block-content">
                	<div class="block">
					 <div class="block-content" style="background-color: #ffffcc;">
						<ul class="list-unstyled text-center">
							<li>지원 동기 및 내용</li>
						</ul>
							<div class="text-center">
							</div>
						</div>
					</div>
					<form method="post" onsubmit="return false;">
					<div class="form-group">
					<textarea id="tx_content" class="form-control" rows="10" cols="63" style="resize: none;" readonly="readonly"></textarea>
					</div>
					</form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- END Fade In Modal -->
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
                            <input type="hidden" id="from_hidden" name="mt_from" class="form-control">
                            <input type="hidden" id="pr_num" name="pr_num" class="form-control">
                            <input type="hidden" id="apmt_num" name="apmt_num" class="form-control">
                        </div>
                        <div class="col-6">
                            <label for="example-nf-password">프리랜서</label>
                            <input type="text" id="to" class="form-control" disabled="disabled">
                            <input type="hidden" id="to_hidden" name="mt_to" class="form-control">
                        </div>
                        </div>
                        <div class="form-group">
                            <label for="example-nf-password">미팅 설명</label>
                            <input type="text" id="memo" name="mt_memo" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="example-nf-password">미팅 타입</label>
                            <select name="mt_type" id="type" class="form-control">
                            <option value="">타입 선택</option>
                            <option value="0">Online</option>
                            <option value="1">Offline</option>
                            </select>
                        </div>
                        <div class="form-group">
                        	<label for="example-nf-email">미팅 날짜</label>
                            <input name="mt_date" type="date" id="date" class="form-control">
                        </div>
                    </form>
                    <!-- END Normal Form -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-alt-success" id="mtOk">
                    <i class="fa fa-check"></i>확인
                </button>
            </div>
        </div>
    </div>
</div>
<!-- END Fade In Modal -->
</body>
</html>