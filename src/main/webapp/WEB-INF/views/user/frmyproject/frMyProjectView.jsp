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
	$('#projectInfo').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frmyproject/projectView.do?pnum=${projectInfo.pr_num}')
	});
	$('#noticeList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/frprojectntcList.do?pnum=${projectInfo.pr_num}&part=${part}');	
	});
	$('#workList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectWork/workList.do?pnum=${projectInfo.pr_num}&part=${part}');	
	});
	$('#gantt').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectWork/ganttChart.do');	
	});
	$('#present').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frmyprojecting/frmyprojecting.do');	
	});
	$('#meeting').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingList.do');	
	})
	$('#schedule').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/scheduler/prSchedule.do?mem_id=${USER_LOGININFO.mem_id}&pr_num=${projectInfo.pr_num}')
	})
	$('#btnList').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/frmyproject/projectList.do?mem_id=${USER_LOGININFO.mem_id}')
	})
	$('#clBtnList').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/clMyProject/projectList.do')
	})
	$('#btnEnd').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "프로젝트 완료 및 평가창으로 넘어가시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){
					if (result){
						$('#modal-large').modal('show');
						
					}else{
						return;
					}
			});
	})	
	
	$('#btnSave').click(function(){
		for(var i=0; i<"${fn:length(consMemInfo)}"; i++){
			for (var j=0;  j<"${fn:length(eval)}"; j++ ) {
				if($('input[name=radioEval'+i+j+']:checked').val() ==  undefined){
					swal("경고","모든 사람의 평가를 선택해주세요.", "error");
					return;
				}
			}
		}
		
		swal({
	      	  title: "알림",
	      	  text: "평가표 작성을 완료하겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){
					if (result){
						var cnt = 0;
						var cntContent = "${fn:length(consMemInfo)}";
						$('#eval_tbody tr').each(function () {
							var checkItem = $(this).find(":checked")
							var inputItem = $(this).find(":input")
							var contentItem = $(this).find("#ev_content"+cnt)
							cnt++;
							
							var ev_to = inputItem.eq(0).val();
							var ev_professione = checkItem.eq(0).val();
							var ev_satisfy = checkItem.eq(1).val();
							var ev_communi = checkItem.eq(2).val();
							var ev_schedule = checkItem.eq(3).val();
							var ev_active = checkItem.eq(4).val();
							var ev_content = contentItem.val();
							
							$.ajax({
						         type:'POST',
						         dataType:'JSON',
						         data:{ev_to : ev_to,
						        	 ev_professione : ev_professione,
						        	 ev_satisfy : ev_satisfy,
						        	 ev_communi : ev_communi,
						        	 ev_schedule : ev_schedule, 
						        	 ev_active : ev_active,
						        	 ev_content : ev_content,
						        	 ev_from : '${USER_LOGININFO.mem_id}',
						        	 cons_num : '${projectInfo.pr_num}'},
						        	 
						        	 
						         url:'${pageContext.request.contextPath}/eval/insertEval.do',
						         error:function(result){
						            swal("", result.message, "info");
						         },
						         success:function(result){
						            if(eval(result.result.flag)){
						            	$.ajax({
									         type:'POST',
									         dataType:'JSON',
									         data:{
									        	 pr_num : '${projectInfo.pr_num}'},
									        	 
									         url:'${pageContext.request.contextPath}/frmyproject/updateEndCheck.do',
									         error:function(result){
									            swal("", result.message, "info");
									         },
									         success:function(result){
									            if(eval(result.result.flag)){
									            	location.href = '${pageContext.request.contextPath}/frmyproject/projectView.do?pnum=${pnum}&mem_id=${USER_LOGININFO.mem_id}';
									            }
									         }
									      });
						            	
						            	
						            }
						         }
						      });
							
						
						
						
					})
						
					}else{
						return;
					}
			});
	})
	
	
	
	
	
	
	
	$('#btnFreeEnd').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "프로젝트 완료 및 평가창으로 넘어가시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){
					if (result){
						$('#modal-large2').modal('show');
						
					}else{
						return;
					}
			});
	})	
	
	
	$('#btnFreeSave').click(function(){
		for (var i=0;  i<"${fn:length(eval)}"; i++ ) {
				if($('input[name=frradioEval'+i+']:checked').val() ==  undefined){
					swal("경고","클라이언트의 평가를 빠짐없이 선택해주세요.", "error");
					return;
				}
			}
		
		swal({
	      	  title: "알림",
	      	  text: "평가표 작성을 완료하겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){
					if (result){
						$('#eval_tbody2 tr').each(function () {
							var checkItem = $(this).find(":checked")
							var inputItem = $(this).find(":input")
							var contentItem = $(this).find("#frEv_content")
							
							var ev_to = inputItem.eq(0).val();
							var ev_professione = checkItem.eq(0).val();
							var ev_satisfy = checkItem.eq(1).val();
							var ev_communi = checkItem.eq(2).val();
							var ev_schedule = checkItem.eq(3).val();
							var ev_active = checkItem.eq(4).val();
							var ev_content = contentItem.val();
							
							$.ajax({
						         type:'POST',
						         dataType:'JSON',
						         data:{ev_to : ev_to,
						        	 ev_professione : ev_professione,
						        	 ev_satisfy : ev_satisfy,
						        	 ev_communi : ev_communi,
						        	 ev_schedule : ev_schedule, 
						        	 ev_active : ev_active,
						        	 ev_content : ev_content,
						        	 ev_from : '${USER_LOGININFO.mem_id}',
						        	 cons_num : '${projectInfo.pr_num}'},
						        	 
						        	 
						         url:'${pageContext.request.contextPath}/eval/insertEval.do',
						         error:function(result){
						            swal("", result.message, "info");
						         },
						         success:function(result){
						            if(eval(result.result.flag)){
						            	$.ajax({
									         type:'POST',
									         dataType:'JSON',
									         data:{
									        	 pr_num : '${projectInfo.pr_num}',
									        	 cons_free_id : '${USER_LOGININFO.mem_id}'},
									        	 
									         url:'${pageContext.request.contextPath}/contract/updateEndCheck.do',
									         error:function(result){
									            swal("", result.message, "info");
									         },
									         success:function(result){
									            if(eval(result.result.flag)){
									            	location.href = '${pageContext.request.contextPath}/contract/countEndCheck.do?mem_id=${USER_LOGININFO.mem_id}&pr_num=${projectInfo.pr_num}';
									            }
									         }
									      });
						            	
						            	
						            }
						         }
						      });
							
						
						
						
					})
						
					}else{
						return;
					}
			});
	})
	
});
</script>
<style>
#schedule{
	width: 100%;
	height: 100%;
	color: #9238B9;
	background-color: #f2e6ff;
}
#schedule:hover {
	background-color: #e6ccff;
	color: #9238B9; 
}
</style>
<body>
<!-- <nav class="breadcrumb bg-white push">  -->
<!-- 	<a class="breadcrumb-item">나의 프로젝트</a>  -->
<!-- 	<span class="breadcrumb-item active">  -->
<%-- 		<c:if test="${sessionScope.USER_LOGININFO.iden_num =='1' }"> --%>
<%-- 			<a href="${pageContext.request.contextPath }/clMyProject/projectList.do">진행중인 프로젝트</a> --%>
<%-- 		</c:if>  --%>
<%-- 		<c:if test="${sessionScope.USER_LOGININFO.iden_num =='2' }"> --%>
<%-- 			<a href="${pageContext.request.contextPath }/frmyproject/projectList.do">진행중인 프로젝트</a> --%>
<%-- 		</c:if>  --%>
<!-- 	</span>  -->
<!-- 	<span class="breadcrumb-item active">  -->
<!-- 		<a>상세보기</a>  -->
<!-- 	</span>  -->
<!-- </nav> -->

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
		<a>프로젝트 정보</a> 
	</span>
</nav>

<h2 class="content-heading">${projectInfo.pr_title } <small>${fTypeInfo.ftype_name }</small></h2>
<div class="block">
  <!-- Navigation -->
  <div class="block-content-full border-b clearfix">
  <div class="col-13">
  	<table style="width: 100%; height: 100%;">
  	<tr>
	  	<td style="width:14%;height: 50px;"><button id="projectInfo" type="button" class="btn btn-alt-primary" style="width: 100%;height: 100%;">프로젝트 정보</button></td>
	  	<td style="width:14%;"><button id="noticeList" type="button" class="btn btn-alt-info" style="width: 100%;height: 100%;">프로젝트 공지</button></td>
	  	<td style="width:14%;"><button id="workList" type="button" class="btn btn-alt-danger" style="width: 100%;height: 100%;">프로젝트 일감</button></td>
	  	<td style="width:14%;"><button id="gantt" type="button" class="btn btn-alt-warning" style="width: 100%;height: 100%;">간트차트</button></td>
	  	<td style="width:14%;"><button id="present" type="button" class="btn btn-alt-success" style="width: 100%;height: 100%;">프로젝트 현황</button></td>
	  	<td style="width:14%;"><button id="meeting" type="button" class="btn btn-alt-secondary" style="width: 100%;height: 100%;">미팅신청</button></td>
	  	<td style="width:14%;"><button id="schedule" type="button" class="btn">일정 관리</button></td>
  	</tr>
  	</table>
  </div>
  </div>
  <!-- END Navigation -->

  <!-- Project -->
  <div class="block-content block-content-full">
  <div class="col-sm-12 invisible" data-toggle="appear">
              <!-- Project Info -->
              <table class="table table-striped table-borderless mt-20">
                  <tbody>
                      <tr>
                          <td class="font-w600">Client</td>
                          <td>${projectInfo.client }</td>
                      </tr>
                      <tr>
                          <td class="font-w600">Budget</td>
                          <td>${projectInfo.pr_payment }원</td>
                      </tr>
                      <tr>
                          <td class="font-w600">Category</td>
                          <td>${fTypeInfo.ftype_name }/${cateInfo.cate_detail }</td>
                      </tr>
                      <tr>
                          <td class="font-w600">시작일</td>
                          <td>${fn:substring(projectInfo.pr_start, 0, 10) }</td>
                      </tr>
                      <tr>
                          <td class="font-w600">종료일</td>
                          <td>${fn:substring(projectInfo.pr_deadline, 0, 10) }</td>
                      </tr>
                  </tbody>
              </table>
              <!-- END Project Info -->
          </div>
      <div class="row py-20">
          <div class="col-sm-12">
              <pre>
              ${projectInfo.pr_content }
              </pre>
          </div>
      </div>
      <div align="right">
      <c:if test="${USER_LOGININFO.iden_num eq '2' }">
          <button id="btnList" class="btn btn-alt-secondary">목록</button>
      </c:if>
      <c:if test="${USER_LOGININFO.iden_num eq '1' }">
          <button id="clBtnList" class="btn btn-alt-secondary">목록</button>
      </c:if>
      <c:if test="${projectInfo.pr_endcheck eq '0' && USER_LOGININFO.iden_num eq '1'}">
          <button type="button" class="btn btn-alt-warning" id="btnEnd">프로젝트 완료 및 평가</button>
      </c:if>    
      <c:if test="${projectInfo.pr_endcheck eq '1' && USER_LOGININFO.iden_num eq '1'}">
          <button type="button" class="btn btn-alt-warning" id="btnEndCheck" title="모든 프리랜서가 평가를 완료하면 프로젝트가 완료 상태로 전환됩니다." disabled="disabled">완료 대기중</button>
      </c:if>
      <c:if test="${projectInfo.pr_endcheck eq '0' && USER_LOGININFO.iden_num eq '2'}">
      	  <button type="button" class="btn btn-alt-success" id="btnFreeEndDis" title="클라이언트가 평가를 완료하면 버튼이 활성화 됩니다." disabled="disabled">프로젝트 완료 및 평가</button>    
      </c:if>
      <c:if test="${projectInfo.pr_endcheck eq '1' && USER_LOGININFO.iden_num eq '2' && checkEndChk eq 0}">
      	  <button type="button" class="btn btn-alt-success" id="btnFreeEnd" >프로젝트 완료 및 평가</button>    
      </c:if>
      <c:if test="${projectInfo.pr_endcheck eq '1' && USER_LOGININFO.iden_num eq '2' && checkEndChk eq 1}">
          <button type="button" class="btn btn-alt-warning" id="btnEndCheck" title="모든 프리랜서가 평가를 완료하면 프로젝트가 완료 상태로 전환됩니다." disabled="disabled">완료 대기중</button>
      </c:if>
      </div>
      
      
      
      
      
      <!-- Large Modal -->
      
        <div class="modal" id="modal-large" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="block block-themed block-transparent mb-0">
                        <div class="block-header bg-primary-dark">
                            <h3 class="block-title">Terms &amp; Conditions</h3>
                            <div class="block-options">
                                <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                    <i class="si si-close"></i>
                                </button>
                            </div>
                        </div>
                        <div class="block-content">
                        
                        <!-- 모달시작 -->
                       	<div class="col-md-12 row">
						<div class="col-md-1">
						</div>
						<div class="col-md-10">
						<form id="evalForm" name="evalForm" action="${pageContext.request.contextPath}/eval/insertEval.do" method="post">
						<c:forEach items="${consMemInfo }" var="free" varStatus="status">
						 <table class="table bg-white " height="250px" style="border: 1px dotted #d2e7f5" >
						   <tbody id="eval_tbody">
						   <tr>  
						   <td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
						   <div class="font-size-sm font-w600 text-uppercase text-muted  float-left"></div>
						      <div class="mb-10">
						         <a> 
						         <c:choose>
						               <c:when test="${free.mem_picture==null }">
						                  <img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
						                  alt="" style="border: 1px solid #e1e1e1">
						               </c:when>  
						               <c:otherwise>  
						                  <img class="img-avatar img-avatar96" src="/files/${free.mem_picture}" width="100px"
						                  alt="" style="border: 1px solid #e1e1e1">
						               </c:otherwise>
						            </c:choose>
						         </a>
						      </div> 
						      <small>
						         <c:choose>  
						            <c:when test="${free.ftype_num=='0' }">
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
						            <c:when test="${free.mtype_num=='0' }">
						               <img src="${pageContext.request.contextPath}/image/mmtype_0.png" width="25px">
						               개인
						            </c:when>
						            <c:when test="${free.mtype_num=='1' }">
						               <img src="${pageContext.request.contextPath}/image/mmtype_1.png" width="25px">
						               팀
						            </c:when>
						            <c:when test="${free.mtype_num=='2' }">
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
						      <div class="row">
						      <div class="col-md-10" style="height: 30px;">
						      <p class="font-size-xl">${free.cons_free_id }</p>
						      <input type="hidden" name="ev_to" value=${free.cons_free_id }>
						      </div>
						      <div class=" col-md-1 justify-content-right float-right " style="padding-left: 75px; padding-top: 10px;">
						               </div>
						      </div>
						      <hr>
						      <div class="form-group row" id="evalDiv">
						      <c:forEach items="${eval }" var="evalInfo" varStatus="evalStatus">
                                            <label class="col-12">${evalInfo }</label>
                                            <div class="col-12">
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="radioEval${status.index }${evalStatus.index }" value="5">
                                                <span class="css-control-indicator"></span> 매우 만족
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="radioEval${status.index }${evalStatus.index }" value="4">
                                                <span class="css-control-indicator"></span> 만족
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="radioEval${status.index }${evalStatus.index }" value="3">
                                                <span class="css-control-indicator"></span> 보통
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="radioEval${status.index }${evalStatus.index }" value="2">
                                                <span class="css-control-indicator"></span> 나쁨
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="radioEval${status.index }${evalStatus.index }" value="1">
                                                <span class="css-control-indicator"></span> 매우 나쁨
                                            </label>
                                            <br>
                                            </div>
                              </c:forEach>
                              				<label class="col-12">평가 내용</label>
                                            <div class="col-lg-12">
			                                	<textarea class="form-control" id="ev_content${status.index }" name="ev_content${status.index }" rows="6" ></textarea>
			                            	</div>
                              
                              </div>
                              <hr>
						   </td>
						   </tr>
						 </tbody>
						 </table>
<!-- 						 <input type="hidden" name="ev_to"> -->
<!-- 						<input type="hidden" name="ev_from"> -->
<!-- 						<input type="hidden" name="cons_num"> -->
<!-- 						<input type="hidden" name="ev_professione"> -->
<!-- 						<input type="hidden" name="ev_satisfy"> -->
<!-- 						<input type="hidden" name="ev_communi"> -->
<!-- 						<input type="hidden" name="ev_schedule"> -->
<!-- 						<input type="hidden" name="ev_active">  -->
						</c:forEach>
						</form>
						</div>
						<div class="col-md-1">
						</div>
						</div> 
                       
                       <!-- 모달끝 --> 
                        
                        
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-alt-success" data-dismiss="modal" id="btnSave">
                            <i class="fa fa-check"></i> 완료
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- END Large Modal -->
        
        
        
        
       <!-- 클라이언트 -->
      <!-- Large Modal -->
      
        <div class="modal" id="modal-large2" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="block block-themed block-transparent mb-0">
                        <div class="block-header bg-primary-dark">
                            <h3 class="block-title">Terms &amp; Conditions</h3>
                            <div class="block-options">
                                <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                    <i class="si si-close"></i>
                                </button>
                            </div>
                        </div>
                        <div class="block-content">
                        
                        <!-- 모달시작 -->
                       	<div class="col-md-12 row">
						<div class="col-md-1">
						</div>
						<div class="col-md-10">
						<form id="evalForm" name="evalForm" action="${pageContext.request.contextPath}/eval/insertEval.do" method="post">
						 <table class="table bg-white " height="250px" style="border: 1px dotted #d2e7f5" >
						   <tbody id="eval_tbody2">
						   <tr>  
						   <td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
						   <div class="font-size-sm font-w600 text-uppercase text-muted  float-left"></div>
						      <div class="mb-10">
						         <a> 
						         <c:choose>
						               <c:when test="${consClInfo.mem_picture==null }">
						                  <img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
						                  alt="" style="border: 1px solid #e1e1e1">
						               </c:when>  
						               <c:otherwise>  
						                  <img class="img-avatar img-avatar96" src="/files/${consClInfo.mem_picture}" width="100px"
						                  alt="" style="border: 1px solid #e1e1e1">
						               </c:otherwise>
						            </c:choose>
						         </a>
						      </div> 
						      <small>
<%-- 						         <c:choose>   --%>
<%-- 						            <c:when test="${client.ftype_num=='0' }"> --%>
<%-- 						               <img src="${pageContext.request.contextPath}/image/ftype_1.png" width="20px"> --%>
<!-- 						               개발자 -->
<%-- 						            </c:when> --%>
<%-- 						            <c:otherwise> --%>
<%-- 						               <img src="${pageContext.request.contextPath}/image/ftype_2.png" width="20px"> --%>
<!-- 						               디자이너 -->
<%-- 						            </c:otherwise> --%>
<%-- 						         </c:choose> --%>
<!-- 						      </small> -->
<!-- 						       <br> -->
						      <small>
						         <c:choose>
						            <c:when test="${consClInfo.mtype_num=='0' }">
						               <img src="${pageContext.request.contextPath}/image/mmtype_0.png" width="25px">
						               개인
						            </c:when>
						            <c:when test="${consClInfo.mtype_num=='1' }">
						               <img src="${pageContext.request.contextPath}/image/mmtype_1.png" width="25px">
						               팀
						            </c:when>
						            <c:when test="${consClInfo.mtype_num=='2' }">
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
						      <div class="row">
						      <div class="col-md-10" style="height: 30px;">
						      <p class="font-size-xl">${consClInfo.client }</p>
						      <input type="hidden" name="frev_to" value=${consClInfo.client }>
						      </div>
						      <div class=" col-md-1 justify-content-right float-right " style="padding-left: 75px; padding-top: 10px;">
						               </div>
						      </div>
						      <hr>
						      <div class="form-group row" id="evalDiv">
						      <c:forEach items="${eval }" var="evalInfo" varStatus="evalStatus">
                                            <label class="col-12">${evalInfo }</label>
                                            <div class="col-12">
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="frradioEval${evalStatus.index }" value="5">
                                                <span class="css-control-indicator"></span> 매우 만족
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="frradioEval${evalStatus.index }" value="4">
                                                <span class="css-control-indicator"></span> 만족
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="frradioEval${evalStatus.index }" value="3">
                                                <span class="css-control-indicator"></span> 보통
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="frradioEval${evalStatus.index }" value="2">
                                                <span class="css-control-indicator"></span> 나쁨
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="frradioEval${evalStatus.index }" value="1">
                                                <span class="css-control-indicator"></span> 매우 나쁨
                                            </label>
                                            <br>
                                            </div>
                              </c:forEach>
                              				<label class="col-12">평가 내용</label>
                                            <div class="col-lg-12">
			                                	<textarea class="form-control" id="frEv_content" name="frEv_content" rows="6" ></textarea>
			                            	</div>
                              
                              </div>
                              <hr>
						   </td>
						   </tr>
						 </tbody>
						 </table>
<!-- 						 <input type="hidden" name="ev_to"> -->
<!-- 						<input type="hidden" name="ev_from"> -->
<!-- 						<input type="hidden" name="cons_num"> -->
<!-- 						<input type="hidden" name="ev_professione"> -->
<!-- 						<input type="hidden" name="ev_satisfy"> -->
<!-- 						<input type="hidden" name="ev_communi"> -->
<!-- 						<input type="hidden" name="ev_schedule"> -->
<!-- 						<input type="hidden" name="ev_active">  -->
						</form>
						</div>
						<div class="col-md-1">
						</div>
						</div> 
                       
                       <!-- 모달끝 --> 
                        
                        
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-alt-success" data-dismiss="modal" id="btnFreeSave">
                            <i class="fa fa-check"></i> 완료
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- END Large Modal -->

      
      
      
      
      
  </div>
  <!-- END Project -->
</div>
<h5>팀원<small>&nbsp;&nbsp; ${fn:length(memList) }명이 프로젝트를 함께 진행중 입니다.</small></h5>
<div class="row">
<c:forEach items="${memList }" var="memInfo">
<div class="col-md-4 col-xl-2">
    <a class="block block-link-pop text-center" href="javascript:void(0)">
        <div class="block-content block-content-full">
        <c:if test="${memInfo.MEM_PICTURE eq null}">
            <img class="img-avatar" src="${pageContext.request.contextPath }/assets/img/avatars/avatar2.jpg" alt="">
        </c:if>
        <c:if test="${memInfo.MEM_PICTURE ne null}">
            <img class="img-avatar" src="${pageContext.request.contextPath }/files/${memInfo.MEM_PICTURE }" alt="">
        </c:if>
        </div>
        <div class="block-content block-content-full bg-body-light">
            <div class="font-w600 mb-5">${memInfo.PART }</div>
            <div class="font-size-sm text-muted">${memInfo.CONS_FREE_ID }</div>
        </div>
    </a>
</div>
</c:forEach>
</div>
</body>
</html>