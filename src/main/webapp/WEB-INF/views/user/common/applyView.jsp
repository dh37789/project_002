<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#divv {
	border: 1px solid #d2d2d2;
}
</style>
<script type="text/javascript">
	$(function() {
		 $("input").keydown(function(evt) { 
				if (evt.keyCode == 13) return false; 
			});
		 
		$("#project_content").hide();
		
		$("#contentBtn").click(function(){
			
		if($("#contentBtn").text()=='내용 보기'){
			$("#project_content").show();
			$("#contentBtn").text('내용 접기');
			
		}else{
			$("#project_content").hide();
			$("#contentBtn").text('내용 보기');
			
		}
		});
		
		$('#cancle').click(function(){
			var pr_num = "${project.pr_num}";
			location.href="${pageContext.request.contextPath}/project/projectView.do?pr_num="+pr_num;
		});
		
		$('#applyBtn').click(function(){
			if(!($('input[name=ap_payment]').val().validationNUM())){
				swal("", '지원 금액을 올바르게 입력해주세요.', "warning");
				return;
			}
			if($('#ap_content').val() == ''){
				swal("", '지원 내용을 올바르게 입력해주세요.', "warning");
				return;
			}
			swal({
	          	  title: "지원 하시겠습니까?",
	          	  icon: "info",
	          	  buttons: true,
	          	})
	          	.then(function(exit){
	          	  if (exit) {
	          		  $('#applyForm').submit();
	          	  } else {
	          	    return;
	          	  }
	          	});
		});
		
		

	});
	
function checkKey(){
	var content =$('#ap_content').val();
	$('#countText').html(content.length);
};
</script>
<body>
	<nav class="col-md-9 breadcrumb bg-white push ">
		 <a class="breadcrumb-item" href="${pageContext.request.contextPath}/project/projectList.do">프로젝트</a>
		 <a class="breadcrumb-item" href="${pageContext.request.contextPath}/project/projectView.do?pr_num=${project.pr_num}">글</a>
		<span class="breadcrumb-item active" >지원하기 </span>
	<button type="button"
		class="btn btn-secondary btn-noborder btn-secondary ml-auto"
		id="listBtn">프로젝트 목록</button>
	</nav>

	<div class="col-md-9">
		<div class="block">
			<div class="block-header">
				<div>
					<h2 class="col-md-30 font-size-h4 font-w700 ">'${project.pr_title }'에 지원하기</h2>
				</div>
				<div class="block-options">
					<span class="badge badge-primary">마감 ${project.dday}일 전</span><br>
				</div>

			</div>
			<hr>
			<div class="col-md-12 justify-content-center in row">
				<div
					class="col-md-9 text-center alert alert-secondary alert-dismissable ">
					<i class="fa fa-krw fa-1x"></i> 예상금액 ${project.pr_payment }원
					&nbsp;&nbsp; <i class="fa fa-calendar-check-o fa-1x"></i> 예상기간
					${project.pr_ex_period }일 &nbsp;&nbsp;<i class=" si si-note fa-1x"></i>
					모집마감일 ${project.pr_end }
				</div>
			</div>

			<div class="row no-gutters justify-content-center in row">
				<div class="col-1.5 ">
					<div class="block mb-0 bg-body-dark">
						<div id="divv" class="block-content">
							<p>기획 상태</p>
						</div>
					</div>
					<div class="block mb-0 bg-body-dark">
						<div id="divv" class="block-content">
							<p>정부 지원 유무</p>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>
								<c:choose>
									<c:when test="${project.pr_type}=='0'">아이디어만</c:when>
									<c:when test="${project.pr_type}=='1'">필요 내용 정리</c:when>
									<c:otherwise>상세한 문서 존재</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>
								<c:choose>
									<c:when test="${project.pr_support}=='n'">X</c:when>
									<c:otherwise>O</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
				</div>
				<div class="col-1.5">
					<div class="block mb-0 bg-body-dark">
						<div id="divv" class="block-content">
							<p>등록 일자</p>
						</div>
					</div>
					<div class="block mb-0 bg-body-dark">
						<div id="divv" class="block-content">
							<p>예상 시작일</p>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>${project.pr_date }</p>
						</div>
					</div>
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>${project.pr_start }</p>
						</div>
					</div>
				</div>
				<div class="col-1.7">
					<div class="block mb-0 bg-body-dark">
						<div id="divv" class="block-content">
							<p>미팅 방식</p>
						</div>
					</div>
					<div class="block mb-0 bg-body-dark">
						<div id="divv" class="block-content">
							<p>위치</p>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>
								<c:choose>
									<c:when test="${project.pr_meeting}=='0'">온라인 미팅</c:when>
									<c:otherwise>오프라인 미팅</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>${project.pr_add }</p>
						</div>
					</div>
				</div>
			</div>
			<br>
				<button id="contentBtn" class="btn btn-alt-info col-md-3 " style="margin-left: 30rem;">내용 보기</button>
				<br>
			<div class="block-content" id="project_content" >
				<h3 class="col-md-30 font-size-h5 font-w600 ">프로젝트 내용</h3>
				<pre>${project.pr_content }
				</pre>
				<br>

			
			<div class="block-content block-content-full">
				<h3 class="col-md-30 font-size-h5 font-w600 ">관련 기술</h3>
				<c:forEach items="${project.techList}" var="tech">&nbsp;<span
						class="badge badge-secondary font-size-sm">
						${tech.lan_name} </span>&nbsp;</c:forEach>
				<div class="pull-all">
					<br>
					<!-- Lines Chart Container -->
				</div>
			</div>
</div>
<br>
<div class="text-pulse">
<i class="fa fa-warning  fa-1x" style="margin-left: 3rem;"></i> 위 내용은 클라이언트의 제시 기간 및 금액으로 충분히 변동 가능합니다.
</div>
<br>
		</div>
	</div>
	<div class="col-md-9">
		<div class="block ">
			<div class="block-header">
				<div class="project-register-content">
					<a class="btn btn-large btn-block  text-center" style="font-size: 25px;">지원서 작성</a> 
					<hr style="color: #000000;">
					<form id="applyForm" action="${pageContext.request.contextPath}/apply/insertApply.do" method="post" name="applyForm">
					<input type="hidden" name="ap_project" value="${project.pr_num }">
						<span class="text-pulse" >*</span> 지원 금액 &nbsp;&nbsp;
						<i class="fa fa-krw fa-1x" ></i> 
						<input  name="ap_payment" type="text">
						
						<br>
						<span style=" color:#8c8c8c; margin-left: 100px; ">희망 금액을 원 단위로 입력해주세요. (예 : 100000000)</span><br>
						<span class="text-pulse" style="color:#8c8c8c; margin-left: 100px; ">
						<i class="fa fa-warning  fa-1x" ></i> 파피용 이용요금 10%를 포함한 금액을 입력해주세요.
						</span>
						<br>
						<br>

						<div>
						<span class="text-pulse" >*</span> 지원 내용 &nbsp;&nbsp;<br>
						<textarea name="ap_content" id="ap_content" rows="15" cols="100" onkeyup="checkKey()" style="margin-left: 100px; resize:none;">&lt;프로젝트에 대한 분석/제안 등&gt;


&lt;프로젝트에 관련된 경험과 기술 등&gt;</textarea>
						<p style="text-align: right;" >(글자수 : <span id="countText"></span>)</p>
						
						
						<span class="text-pulse" style="color:#8c8c8c; margin-left: 100px; ">
						<i class="fa fa-warning  fa-1x" ></i> 이메일, 전화번호 등을 게시하여 직거래를 유도하는 경우 서비스 이용에 제재를 받을 수 있습니다.
						</span>
						</div>
						<br>
						<br>
						
						<div class="justify-content-center in row">
						<button type="button" id="applyBtn"
							class="btn btn-alt-primary  min-width-200 min-height-40 "
							style="margin: 10px;"> 지 원 하 기 </button>
						<button type="button" id="cancle"  class="btn btn-alt-second min-height-40 min-width-100"
							style="margin: 10px;"> 취 소 </button>
						</div>
						</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-md-2" style="position: fixed; top: 155px; left: 1450px;">
		
		<div class="block font-size-5px " >
<br><br>
<div style="margin-left: 1rem;">
 <span class=" font-w700 " >
 	<i class="fa fa-check-square-o text-info fa-1x" ></i> 프로필
 </span>
 <br>
&nbsp;&nbsp;&nbsp;프로필과 포트폴리오가 매력적일수록<br>&nbsp;&nbsp; 프로젝트를 진행할 기회가 많아집니다.<br><br>


<span class=" font-w700 " ><i class="fa fa-check-square-o text-info fa-1x"></i> 지원내용</span><br>

&nbsp;&nbsp;&nbsp;프로젝트 내용을 분석하여,<br>&nbsp;&nbsp;
어떤 방식으로 프로젝트를 진행할지<br>&nbsp;&nbsp; 구체적으로 설명해주세요.
<br><br>


<span class=" font-w700 " ><i class="fa fa-check-square-o text-info fa-1x"></i> 금액과 기간</span><br>

&nbsp;&nbsp;&nbsp;금액과 기간은 고정되어 있지 않습니다.<br>&nbsp;&nbsp; 제공할 수 있는 서비스에 대한<br>&nbsp;&nbsp; 합리적인 견적을 산정해주세요
		<br>		
		<br>
			</div>
		</div>
	</div>
</body>
</html>