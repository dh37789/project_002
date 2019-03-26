<%@page import="kr.or.ddit.vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation2.js'></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
			if (evt.keyCode == 13)
			return false; 
		});
		$('#category').change(function() {
			var ftype_num = $(this).val();
			$.ajax({
						type : 'POST',
						dataType : 'JSON',
						data : {
							ftype_num : ftype_num
						},
						url : '${pageContext.request.contextPath}/project/detailList.do',
						success : function(result) {
							var detail = "";
							for ( var i in result.detailList) {
								detail += '<option value='+result.detailList[i].CATE_NUM+'>'
										+ result.detailList[i].CATE_DETAIL
										+ '</option>';
							}
							$('#detail').html(detail);
						},
						error : function(result) {
							swal("", result.status + "|"
									+ result.responseText, "info");
						}
					});
		});
		var arr = [	"PhotoShop", "CSS", "hybridapp", "HTML", "Android", "JSP",
				"ORACLE", "SQL", "DB", "C", "C++", "C#", "Visual Basic",
				"Java", "JavaScript", "Python", "R", "PHP", "어셈블리어",
				"CoffeeScript", "ABAP", "D", "Prolog", "Ruby", "Rust", "Scala",
				"파스칼", "Perl", "Objective-C", "Go", "Forth", "기타", "firmware",
				"HW설계", "IOS", "Unity", "OpenCV" ];

		$("#techInput").autocomplete({
			source : arr
		});

		$('#techBtn').click(function() {
			var jebal = $('#techInput').val();
			if(jebal==''){
				return false;
			}
			var arrChk = false;
			for (var i = 0; i < arr.length; i++) {
				if (arr[i] == jebal) {
					arrChk = true;
				}
			}
			if (arrChk == false) {
				return;
			}
			var tagg = "<span style='margin-right:10px; margin-bottom:10px;' class='tag' value='"+jebal+"' id='"+jebal+"'><span>"+jebal+"&nbsp;&nbsp;</span> <a href='#' onclick='rem("+$('#techInput').val()+");' title='Removing tag'>x</a> </span>";
			tagg+='<input type="hidden" name="technique" value="'+jebal+'">';
			$('#techDiv').append(tagg);
			$('#techInput').val('');
		});
		$('#daumzip').click(
				function() {
					new daum.Postcode({
						oncomplete : function(data) {
							var fullAddr = '';
							var extraAddr = '';
							if (data.userSelectedType === 'R') {
								fullAddr = data.roadAddress;
							} else {
								fullAddr = data.jibunAddress;
							}
							if (data.userSelectedType === 'R') {
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}
							$('#zip').val(data.zonecode);
							$('#pr_add').val(fullAddr);

						}
					}).open();
				});
		
		$('#saveBtn').click(function(){
			if($('input[name=pr_title]').val() == ''
				|| $('input[name=pr_title]').val() == null){
	   			swal("","프로젝트의 제목을 입력해주세요.", "warning");
	   			return;
			}
			swal({
		    	  title: "프로젝트를 임시저장 하시겠습니까?",
		    	  icon: "info",
		    	  buttons: true,
		    	})
		    	.then(function(exit){
		    	  if (exit) {
					$('#flag').val("false");
					$('#projectForm').submit();
		    	  } else {
		    	    return;
		    	  }
		    	});
		});

		$('#insertBtn').click(function() {
			if($('#detail').val() == null){
	   			swal("","카테고리를 선택해주세요.", "warning");
	   			return;
			}
			if($('input[name=pr_title]').val() == ''
				|| $('input[name=pr_title]').val() == null){
	   			swal("","프로젝트의 제목을 입력해주세요.", "warning");
	   			return;
			}
			if($('input[name=pr_ex_period]').val() == ''
				|| $('input[name=pr_ex_period]').val() == null){
	   			swal("","프로젝트의 예상 기간을 입력해주세요.", "warning");
	   			return;
			}
			if(!$('input[name=pr_ex_period]').val().validationNUM()){
	    		swal("경고","프로젝트의 예상 기간을 바르게 입력해주세요.", "error");
	    		return;
	    	}
			if($('input[name=pr_payment]').val() == ''
				|| $('input[name=pr_payment]').val() == null){
	   			swal("","프로젝트에 대한 지출 가능한 예산을 입력해주세요.", "warning");
	   			return;
			}
			if(!$('input[name=pr_payment]').val().validationNUM()){
	    		swal("경고","지출 가능한 예산을 바르게 입력해주세요.", "error");
	    		return;
	    	}
			if($('#pr_content').val() == ''
				|| $('#pr_content').val() == null){
	   			swal("","프로젝트의 내용을 입력해주세요.", "warning");
	   			return;
			}
			if($('input[name=pr_deadline]').val() == ''
				|| $('input[name=pr_deadline]').val() == null){
	   			swal("","지원자를 모집마감할 날짜를 입력해주세요.", "warning");
	   			return;
			}
			if($('input[name=pr_add]').val() == ''
				|| $('input[name=pr_add]').val() == null){
	   			swal("","주소를 입력해주세요.", "warning");
	   			return;
			}
			if($('input[name=pr_start]').val() == ''
				|| $('input[name=pr_start]').val() == null){
	   			swal("","프로젝트의 예상 시작일을 입력해주세요.", "warning");
	   			return;
			}
			if($('input[name=pr_end]').val() == ''
				|| $('input[name=pr_end]').val() == null){
	   			swal("","프로젝트의 마감일을 입력해주세요.", "warning");
	   			return;
			}
			if($('input[name=pr_end]').val() <  $('input[name=pr_start]').val()){
	    		swal("경고","마감일은 시작일보다 빠를 수 없습니다.", "error");
	    		return;
	    	}
			swal({
		    	  title: "프로젝트를 등록하시겠습니까?",
		    	  icon: "success",
		    	  buttons: true,
		    	})
		    	.then(function(exit){
		    	  if (exit) {
					$('#projectForm').submit();
		    	  } else {
		    	    return;
		    	  }
		    	});
		});  

	});
	
	function rem(bb){
		$(bb).remove();
		
	};
</script>  
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item" href="${pageContext.request.contextPath }/project/projectForm.do">프로젝트 등록</a> 
</nav>
<c:if test="${signCnt eq '0' }">
<p class="p-10 bg-danger text-white"><strong>날인을 등록해야 프로젝트 등록이 가능합니다.</strong></p>
</c:if>
	<div class="col-md-9">
		<div class="block">    
			<div class="block-header">
				<div>
					<h2 class="col-md-30 font-size-h4 font-w700 ">프로젝트 등록</h2>
				  	<span class="col-md-30 ">상세하게 작성해주실수록 더 적합한 프리랜서를 만날 수 있습니다.</span>
				</div>  
        
			</div>
		</div>    
	</div>      

  
	<div class="col-md-9 ">         
		<div class="block  ">  
			<div class="block-content  justify-content-center in row">  
				<div class="project-register-content">
					<br>
					<form action="${pageContext.request.contextPath}/project/insertProject.do"
						method="post" id="projectForm" enctype="multipart/form-data">

						<input type="hidden" name="ap_project" value="${project.pr_num }">
						<div class="row">  
							<div class="col-md-2">
								<span class="text-pulse">*</span> 카테고리
							</div>
							<select class="form-control col-md-2" id="category">
								<option disabled="disabled" selected="selected">카테고리</option>
								<c:forEach items="${cateList}" var="cate">
									<option value="${cate.ftype_num }">${cate.ftype_name }</option>
								</c:forEach>
							</select> &nbsp; &nbsp;<select class="form-control col-md-3" id="detail"
								name="pr_cate_num">
								<option disabled="disabled" selected="selected">세부 카테고리</option>
							</select>
							<div class="col-md-4 "></div>
							<p style="color: #8c8c8c; margin-left: 175px; font-size: small;">프로젝트
								카테고리를 선택해 주세요.</p>
						</div>
						<div class="row">
							<div class="col-md-2">
								<span class="text-pulse">*</span> 프로젝트 제목
							</div>
							<input style="width: 450px;" name="pr_title"><br> <span
								class="col-md-12"
								style="color: #8c8c8c; margin-left: 160px; font-size: small;">프로젝트
								제목을 입력해 주세요. (30자 이내)</span><br>
						</div>
						<div class="row">  
							<div class="col-md-2">
								<span class="text-pulse">*</span> 예상 기간
							</div>
							<input style="width: 150px;" name="pr_ex_period">
							<p style="height: 15px; margin-bottom: 5px;">&nbsp;일</p>
							<br> <span class="col-md-12"
								style="color: #8c8c8c; margin-left: 160px; font-size: small;">프로젝트를
								진행할 기간을 일 단위로 입력해 주세요. (최대 3글자)</span><br> <br>
						</div>
						<div class="row">
							<div class="col-md-2">
								<span class="text-pulse">*</span> 지출 가능 예산
							</div>
							<input style="width: 150px;" name="pr_payment"><span
								style="text-align: center; height: 15px; margin-bottom: 5px;">
								&nbsp;원</span><br> <span class="col-md-12"
								style="color: #8c8c8c; margin-left: 160px; font-size: small;">지출
								가능한 예산을 입력해 주세요.</span><br> <br>
						</div>

						<div class="form-group row">
							<div class="col-md-2">
								<span class="text-pulse ">*</span> 기획 상태  
							</div>
							<div class="col-5">
								<div class="custom-control custom-checkbox mb-5">  
									<input class="custom-control-input" type="radio" name="pr_type"
										id="example-checkbox1" value="0" checked="checked"> <label
										class="custom-control-label" for="example-checkbox1">아이디어만
										있습니다.</label>
								</div>
								<div class="custom-control custom-checkbox mb-5">
									<input class="custom-control-input" type="radio" name="pr_type"
										id="example-checkbox2" value="1"> <label
										class="custom-control-label" for="example-checkbox2">필요한
										내용을 간단히 정리해두었습니다.</label>
								</div>
								<div class="custom-control custom-checkbox mb-5">
									<input class="custom-control-input" type="radio" name="pr_type"
										id="example-checkbox3" value="2"> <label
										class="custom-control-label" for="example-checkbox3">상세한
										기획 문서가 존재합니다.</label>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-md-2">
								<span class="text-pulse ">*</span> 프로젝트 내용
							</div>
							<textarea name="pr_content" id="pr_content" rows="20" cols="80"></textarea>

						</div>
						<br> <br>

						<div class="row ">
							<div class="col-md-2">
								<label for="example-tags3">&nbsp;관련 기술</label>
							</div>
							<div id="techDiv" class="tagsinput"
								style="width: 750px;  min-height:34px; border: 1px dotted gray; background-color: #F7F7F7;">
							</div>
						</div>
						<br>
						<div class="col-md-10" style="margin-left: 140px;">
							<div class="form-group row">
								<div class="col-lg-10">
									<div class="input-group">
										<input id="techInput" data-default="Add tag"
											style="color: rgb(102, 102, 102); width: 250px;">
										<div class="input-group-prepend">
											<button type="button" id="techBtn" class="btn btn-secondary">
												<i class="fa fa-search"></i> Search
											</button>
										</div>
									</div>
								</div>
							</div>

							프로젝트와 관련된 기술을 입력해주세요.<br> 예) Photoshop, Android, HTML5, Python, Django
						</div>
						<br> <br>
						<div class="row">
							<div class="col-md-2">
								<label for="example-datepicker6">&nbsp;기획 관련 파일</label>
							</div>
							<div class="form-group row">
								<label class="col-12" for="example-file-input">이미지/기획 문서
									추가</label>
								<div class="col-12">
									<input type="file" name="projectFile" >
								</div>
							</div>
						</div>
						<div style="color: #8c8c8c; margin-left: 155px; font-size: small;">
							첨부 파일은 파트너들에게 공개되지 않습니다. <br> 첨부 파일은 프로젝트 금액 및 기간 산정을 위한 검수
							자료로만 사용됩니다.
						</div>
						<br> <br>
						<div class="row form-material">
							<div class="col-md-2">
								<label for="example-datepicker6"><span
									class="text-pulse">*</span> 모집 마감일자</label>
							</div>
							<input type="date"
								class="js-datepicker form-control js-datepicker-enabled col-md-3"
								name="pr_deadline" data-week-start="1" data-autoclose="true"
								data-today-highlight="true" data-date-format="yyyy-mm-dd"
								placeholder="yyyy-mm-dd">
							<div class="col-md-12"
								style="color: #8c8c8c; font-size: small; margin-left: 155px;">지원자를
								모집하는 기간입니다</div>
							<br>
						</div>
						<div class="row form-material">
							<div class="col-md-2">
								<label for="example-datepicker6">&nbsp; 사전 미팅</label>
							</div>
							<select name="pr_meeting">
								<option value="1">오프라인 미팅</option>
								<option value="0">온라인 미팅</option>
							</select>
							<div
								style="color: #8c8c8c; font-size: small; margin-left: 155px;"
								class="col-md-12">사전 미팅 방식을 선택해주세요.</div>
						</div>
						<br> <br>
						<div class="form-group row">
							<div class="col-md-2">
								<label class="col-form-label" for="zip"><span
									class="text-pulse">*</span> 클라이언트 위치 </label>
							</div>
							<div class="col-lg-3">
								<input type="text" class="form-control" id="zip"
									placeholder="우편번호" name='zip'>
							</div>
							<button id="daumzip" type="button"
								class="btn btn-alt-danger btn-md">우편번호 검색</button>
							<p>&nbsp;</p>
							<div class="form-group row col-lg-10">
								<div class="col-lg-8" style="margin-left: 170px;"
									class="col-md-12">
									<input type="text" class="form-control" placeholder="주소"
										name='pr_add' id="pr_add">
									<div style="color: #8c8c8c; font-size: small;">클라이언트님이 계신
										지역을 선택해 주세요.</div>
								</div>
							</div>
						</div>
						<div class="row form-material">
							<div class="col-md-2">
								<label for="example-datepicker6"><span
									class="text-pulse">*</span> 프로젝트<br>&nbsp;&nbsp;예상 시작일</label>
							</div>
							<input type="date"
								class="js-datepicker form-control js-datepicker-enabled col-md-3"
								id="pr_start" name="pr_start" data-week-start="1"
								data-autoclose="true" data-today-highlight="true"
								data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd">
						</div>
						<div class="row form-material">
							<div class="col-md-2">
								<label for="example-datepicker6"><span
									class="text-pulse">*</span> 프로젝트<br>&nbsp;&nbsp;예상 마감일</label>
							</div>
							<input type="date"
								class="js-datepicker form-control js-datepicker-enabled col-md-3"
								name="pr_end" id="pr_end" data-week-start="1"
								data-autoclose="true" data-today-highlight="true"
								data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd">
						</div>
						<br> <Br>
						<div class="form-group row">
							<div class="col-md-2">
								<label for="example-datepicker6">&nbsp; 정부지원사업 여부</label>
							</div>
							<div class="col-5">
								<div class="custom-control custom-checkbox mb-5">
									<input class="custom-control-input" type="radio"
										name="pr_support" id="example-checkbox4" value="y"> <label
										class="custom-control-label" for="example-checkbox4">예,
										정부지원사업으로 진행되는 프로젝트입니다.</label>
								</div>
								<div class="custom-control custom-checkbox mb-5">
									<input class="custom-control-input" type="radio"
										name="pr_support" id="example-checkbox5" value="n"
										checked="checked"> <label class="custom-control-label"
										for="example-checkbox5">아니요.</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-3">
								<label for="example-datepicker6">&nbsp;선호하는 프리랜서 형태</label>
							</div>
							<div class="col-5">
								<div
									class="custom-control custom-checkbox custom-control-inline mb-5">
									<input class="custom-control-input" type="radio"
										name="mtype_num" id="example-inline-checkbox1" value="0"
										checked=""> <label class="custom-control-label"
										for="example-inline-checkbox1">개인</label>
								</div>
								<div
									class="custom-control custom-checkbox custom-control-inline mb-5">
									<input class="custom-control-input" type="radio"
										name="mtype_num" id="example-inline-checkbox2" value="1">
									<label class="custom-control-label"
										for="example-inline-checkbox2">팀</label>
								</div>
								<div
									class="custom-control custom-checkbox custom-control-inline mb-5">
									<input class="custom-control-input" type="radio"
										name="mtype_num" id="example-inline-checkbox3" value="2">
									<label class="custom-control-label"
										for="example-inline-checkbox3">개인 사업자</label>
								</div>
								<div
									class="custom-control custom-checkbox custom-control-inline mb-5">
									<input class="custom-control-input" type="radio"
										name="mtype_num" id="example-inline-checkbox4" value="3">
									<label class="custom-control-label"
										for="example-inline-checkbox4">법인 사업자</label>
								</div>
							</div>
						</div>
						<input type="hidden" id="flag" name="flag" value="true">


						<div class="justify-content-center in row">
						<c:if test="${signCnt eq '0' }">
							<button type="button" id="insertBtn"
								class="btn btn-alt-primary  min-width-200 min-height-40 "
								style="margin: 10px;" disabled="disabled">프로젝트 정보 등록 완료</button>
						</c:if>
						<c:if test="${signCnt ne '0' }">
							<button type="button" id="insertBtn"
								class="btn btn-alt-primary  min-width-200 min-height-40 "
								style="margin: 10px;">프로젝트 정보 등록 완료</button>
						</c:if>
							<button type="button" id="saveBtn"
								class="btn btn-alt-second min-height-40 min-width-100"
								style="margin: 10px;">임 시 저 장</button>
							<div class="block-header">
								<br> <br>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-2" style="position: fixed; top: 90px; left: 1450px;">
		<img alt="" style="width: 300px;"
			src="${pageContext.request.contextPath}/image/projectForm1.PNG">
	</div>
	<div class="col-md-2"
		style="position: fixed; top: 310px; left: 1450px;">

		<div class="block " style="width: 300px;">
			<br> <br>
			<div style="margin-left: 1rem; margin-right: 0.5rem;">
				<div class="row" style="font-size: small;">
					<div class="col-md-2">
						<img alt=""
							src="${pageContext.request.contextPath}/image/projectForm2.PNG">
					</div>
					<div class="col-md-10">
						파피용은 <b>클라이언트님께 무료</b>로 제공 됩니다.
					</div>
					<br> <br> <br>
					<div class="col-md-2">
						<img alt=""
							src="${pageContext.request.contextPath}/image/projectForm3.PNG">
					</div>
					<div class="col-md-10">
						다양한 지원자들의 <b>견적과 포트폴리오</b>를 한눈에 비교할 수 있습니다.
					</div>
					<br> <br> <br>
					<div class="col-md-2">
						<img alt=""
							src="${pageContext.request.contextPath}/image/projectForm4.PNG">
					</div>
					<div class="col-md-10">
						<b>온/오프라인 미팅</b>을 통해 마음에드는 지원자를 선택합니다.
					</div>
					<br> <br> <br>
					<div class="col-md-2">
						<img alt=""
							src="${pageContext.request.contextPath}/image/projectForm5.PNG">
					</div>
					<div class="col-md-10">
						<b>대금 보호 시스템</b>을 통해 돈 문제없는 안전한 계약이 가능합니다.
					</div>
					<br> <br> <br>
					<div class="col-md-2">
						<img alt=""
							src="${pageContext.request.contextPath}/image/projectForm6.PNG">
					</div>
					<div class="col-md-10">
						클라이언트님의 승인 후에 <b>프리랜서에게 대금이 지급</b>됩니다.
					</div>
					<br> <br> <br> <br>
				</div>



			</div>
		</div>
	</div>
</body>
</html>