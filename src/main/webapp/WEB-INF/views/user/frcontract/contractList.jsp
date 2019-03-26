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
	$('#ok').click(function(){
		var cons_num = $('input[name=modalInput]').val();
		var mem_id = $('input[name=mem_id]').val();
		location.href="${pageContext.request.contextPath}/contract/freeOk.do?cons_num="+cons_num + "&mem_id=" + mem_id;
	});
	
	$('.contractFile').click(function(){
		var cons_num = $(this).val();
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{cons_num : cons_num},
	         url:'${pageContext.request.contextPath}/contract/contractFile.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
				$('#modal-default').modal('show');
	            $('#conImg').attr('src','${pageContext.request.contextPath}/files/' + result.consList.CONSFILE_SAVE_NAME);
	            $('input[name=modalInput]').val(result.consList.CONS_NUM);
	            $('input[name=mem_id]').val(result.consList.CONS_FREE_ID);
	         }
	      });
	});
	$('.conShow').click(function(){
		var cons_num = $(this).val();
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{cons_num : cons_num},
	         url:'${pageContext.request.contextPath}/contract/contractFile.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
				$('#conModal').modal('show');
	            $('#conImgShow').attr('src','${pageContext.request.contextPath}/files/' + result.consList.CONSFILE_SAVE_NAME);
	         }
	      });
	});
	$('.downCon').click(function(){
		var cons_num = $(this).val();
		$(location).attr('href', '${pageContext.request.contextPath}/readyProject/conDownload.do?cons_num='+cons_num);
	});
});


function no(val){
	var cons_content=$('#content').val();
	location.href="${pageContext.request.contextPath}/contract/freeNo.do?cons_num="+val+"&cons_content="+cons_content;
	
};

</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/contract/contractList.do">계약중인 프로젝트</a> 
	</span> 
</nav>  
    
<h2 class="content-heading">계약중인 프로젝트 목록</h2>

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
<c:forEach items="${contractList }" var="contract">
	<div class="col-md-12">
		<a class="block block-link-shadow" >
			<div class="block-content block-content-full">
				<input type="hidden" name="cons_num" value="${contract.CONS_NUM }">
				<h3 class="text-primary text-center" style="font-style: italic;">
                       ${contract.PR_TITLE }</h3>
				<div class="row text-center" >
				<div class="col-md-3">
                    <div class="block">
                       <div class="block-content">
							<img style="width: 150px; height: 150px; "
								class="img-avatar img-avatar-thumb"
								src="${pageContext.request.contextPath}/assets/img/avatars/avatar5.jpg"
								alt="">
							<div class="block-content" >
							<code>
							${contract.MEM_NAME} (${contract.CLIENT })<br></code><code>
							MAIL</code> ${contract.MEM_MAIL}<br>
							<code>HP</code> ${contract.MEM_HP}<br>
							<code>FAX</code> ${contract.MEM_FAX}
							</div>
						</div>
                    </div>
                </div>
				<div class="col-md-5">  
                    <div class="block">
                       <div class="block-content font-size-md ">
                       
                       <div style="text-align: left;" ><span style="font-weight: bold; text-align: left;">계약내용</span><br><br>
                       <c:choose>
                       <c:when test="${contract.CONS_STATUS eq '1' }">
                       		<textarea rows="5" cols="82" id="content" style="resize:none;">${contract.CONS_CONTENT }</textarea>
                       
                       </c:when>
                       <c:otherwise>
                       		<textarea rows="5" cols="82" id="content"  style="resize:none;" readonly="readonly">${contract.CONS_CONTENT }</textarea>
                       
                       </c:otherwise>
						</c:choose>
                      </div>
                      <br>
                      <div class="font-size-sm">
                     <code> 계약일  </code>
                     <c:if test="${empty contract.CONS_DATE }"> 작성 중&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</c:if> 
                     <c:if test="${not empty contract.CONS_DATE }">   ${contract.CONS_DATE }&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</c:if>  
                     <code> 계약금  </code> 
                     <c:if test="${empty contract.CONS_PAYMENT }"> 작성 중</c:if>
                     <c:if test="${not empty contract.CONS_PAYMENT }">   ${contract.CONS_PAYMENT } 원</c:if> 
                     <code><br> 프로젝트 담당 </code>   
                     <c:if test="${empty contract.PART }"> 작성 중&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</c:if>
                     <c:if test="${not empty contract.PART }"> ${contract.PART } &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</c:if>
                     <code> 프로젝트 기간 </code>
					 <c:if test="${empty contract.PR_START }"> 작성 중</c:if>
                     <c:if test="${not empty contract.PR_START }">   ${contract.PR_START } ~ ${contract.PR_END } </c:if> 
                          </div>
                       </div>
                    </div>
                    <br>
                    <button class="btn btn-hero btn-alt-info min-width-125 conShow" value="${contract.CONS_NUM }"> 계약서 </button>
                    <button class="btn btn-alt-secondary downCon" style="height: 46px;" value="${contract.CONS_NUM }"><i class="si si-cloud-download"></i></button>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-md-3">
                    <div class="block">
                    <div class="block"><br></div>
                       <div class="block-content ">
                       <c:if test="${contract.CONS_STATUS eq '0'}">
                       <br><br>
                       		<button class="btn btn-hero btn-alt-success text-uppercase "> 계약 작성 혹은 조정 중 </button><br><br><br>
                       </c:if>
                       <c:if test="${contract.CONS_STATUS eq '1'}">
                       		<button class="btn btn-hero btn-alt-success text-uppercase "> 계약 확인 </button><br><br><br>
                       		<button class="btn  btn-md btn-outline-success text-uppercase mb-10 contractFile" value="${contract.CONS_NUM}"> 확인 </button>&nbsp;&nbsp;
<%--                        		<button class="btn  btn-md btn-outline-success text-uppercase mb-10" data-toggle="modal" data-target="#modal-default" onclick="clickOk(${contract.CONS_NUM});" > 확인 </button>&nbsp;&nbsp; --%>
<!--                        		<script type="text/javascript"> -->
<!--                        		function clickOk(val) { -->
<!-- 								$('input[name=modalInput]').val(val); -->
								
<!-- 							};  -->
<!--                        		</script> -->
                       		<button class="btn btn-md btn-outline-success text-uppercase mb-10" onclick="no(${contract.CONS_NUM});"> 수정 요청 </button>
                       </c:if>
                       <c:if test="${contract.CONS_STATUS eq '2'}">
                       <br><br>
                       		<button class="btn btn-hero btn-alt-success text-uppercase "> 클라이언트 확인 대기 </button><br><br><br>
                       </c:if>
                       <c:if test="${contract.CONS_STATUS eq 'y'}">
                       		<button class="btn btn-hero btn-alt-success text-uppercase "> 계약 완료 </button><br><br><br>
                       		<c:if test="${empty contract.PR_CHECK}">
                       		<button class="btn btn-hero btn-alt-success text-uppercase"> 클라이언트 입금 대기 </button>
                       		</c:if>
                       </c:if>
                       
                       </div>
                    </div>
                </div>
				</div>
				
				</div>
		</a>
	</div>
</c:forEach>






<div class="modal fade" id="modal-default"  tabindex="-1" role="dialog" aria-labelledby="modal-popout" style="display: none;" aria-hidden="true">
             <div class="modal-dialog modal-dialog-popout" style="max-width: 836px; max-height:1000em;">
             <input type="hidden" name="modalInput">
             <input type="hidden" name="mem_id">
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
<div class="modal fade" id="conModal"  tabindex="-1" role="dialog" aria-labelledby="modal-popout" style="display: none;" aria-hidden="true">
             <div class="modal-dialog modal-dialog-popout" style="max-width: 836px; max-height:1000em;">
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
                   <img style="width: 800px; height: 1100px;" id="conImgShow"
						alt="">
				</div>
                 </div>
                 </div>
                 <div class="modal-footer">
                   <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                 </div>
               </div>
               <!-- /.modal-content -->
             </div>
             <!-- /.modal-dialog -->
           </div>
</body>
</html>