<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	Codebase.blocks('#ref','close');
	$('#refuse').click(function(){
		Codebase.blocks('#ref','open');
	})
	
	
	if(eval('${empty proFile.prfile_name}')){
		$('#prFile').val('파일없음');
	}else{
		$('#prFile').val('${proFile.prfile_name}');
	}
	$('#downloadFile').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/file/ProjectFileDownload.do?pr_num=${project.pr_num}');	
	})
	
	
	$('#sendRef').click(function(){
		if($('#pr_ref').val() == ''){
    		swal("경고","거절사유를 입력해주세요.", "error");
    		return;
    	}
		swal({
	      	  title: "알림",
	      	  text: "거절 사유를 등록하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
				if (result) {
					$('#formRef').submit();
				}else{
					return;
				}
			})
	})
	
// 	$('form').submit(function(){
//     	swal({
// 	      	  title: "알림",
// 	      	  text: "프로젝트를 거절하시겠습니까?",
// 	      	  icon: "info",
// 	      	  buttons: true,
// 	      	})
// 		    .then(function(result){ 
// 				if (result) {
// 					$('#refA').val();
// 					$('#formRef').submit();
// 				}else{
// 					return;
// 				}
// 			})
// 	})
	
	$('#accept').click(function(){
    	swal({
	      	  title: "알림",
	      	  text: "프로젝트를 수락하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
				if (result) {
					$(location).attr('href', '${pageContext.request.contextPath}/projectMgn/accProject.do?pr_num=${project.pr_num}');
				}else{
					return;
				}
			})
	})
})
</script>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">프로젝트 관리</a> 
	<span class="breadcrumb-item"> 
		<a href="${pageContext.request.contextPath}/projectMgn/standbyPjList.do">승인 대기 프로젝트</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>상세보기</a> 
	</span>
</nav>

	<div class="col-md-9">
		<div class="block">
			<div class="block-header">
				<div> 
					<br>
					<h2 class="col-md-30 font-size-h4 font-w700" align="center">${project.pr_title }</h2>
					<div class="col-md-30 font-size-sm ">${project.category}
						${project.cate_Detail }</div>
				</div>

			</div>
			<hr>
			<br>
			<div class="col-md-12 justify-content-center in row">
				<div
					class="col-md-9 text-center alert alert-secondary alert-dismissable ">
					<i class="fa fa-krw fa-1x"></i> 예상금액 ${project.pr_payment }원
					&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-calendar-check-o fa-1x"></i> 예상기간
					${project.pr_ex_period }일
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

			<div class="block-content">
				<br>
				<h3 class="col-md-30 font-size-h5 font-w600 ">프로젝트 내용</h3>
				<pre>
					${project.pr_content }
				</pre>
				<br>
				
				<div class="form-group row">
                   <label class="col-12" for="example-file-input">첨부파일</label>
                    <div class="col-sm-6">
                      <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-fw fa-archive"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="prFile" name="prFile" disabled="disabled">
      					<c:if test="${not empty proFile.prfile_name}">
      						<button id="downloadFile" class="btn btn-secondary mr-5 mb-5">다운로드</button>
      					</c:if>
                      </div>
                    </div>
                </div>
				
				
				
				<br>

			</div>
			<div class="block-content block-content-full">
				<h3 class="col-md-30 font-size-h5 font-w600 ">관련 기술</h3>
				<c:forEach items="${project.techList}" var="tech">&nbsp;<span
						class="badge badge-secondary font-size-sm">
						${tech.lan_name} </span>&nbsp;
				</c:forEach>
				<div class="pull-all">
					<br>
					<br>
					<!-- Lines Chart Container -->
				</div>
				
                
				<br>
				<br>
			</div>
			<div align="center">
				<button id="accept" class="btn btn-noborder btn-primary min-width-100 mb-12 " 
				style="overflow: hidden; position: relative; height: 40px">승인</button>
				&nbsp;
				<button id="refuse" class="btn btn-noborder btn-danger min-width-100 mb-12 " 
				style="overflow: hidden; position: relative; height: 40px">거절</button>
				<br><br>
			</div>
			<form id="formRef" action='${pageContext.request.contextPath}/projectMgn/refuProject.do?pr_num=${project.pr_num}' method="post">
				<div id="ref" align="center">
					<hr style="border: dashed 1px gray;"><br>
					<h5>거절 사유</h5>
					<textarea name="pr_ref" id="pr_ref" cols="120" rows="10"></textarea>
					<br><br>
					<button id="sendRef" type="button" class="btn btn-noborder btn-success min-width-100 mb-12 ">
					전송</button>
				</div>
			</form>
			<br><br>
		</div>
	</div>
	<c:if test="${not empty sessionScope.USER_LOGININFO}">
	<c:if test="${sessionScope.USER_LOGININFO.iden_num eq 2}">
	<div class="col-md-2" style="position: fixed; top: 155px; left: 1450px;">
		

	</div>
	</c:if> 
	</c:if> 
	<div class="col-md-2" style="position: fixed; top: 245px; left: 1455px;">
		<div class="block">
			<div class="block-header">
				<h1 class="block-title font-size-lg">
					클라이언트 <small>${client.mem_id }</small>
				</h1>

				<div class="block-options">
					<small> <c:choose>
							<c:when test="${client.mtype_num}=='0'">개인</c:when>
							<c:when test="${client.mtype_num}=='1'">팀</c:when>
							<c:when test="${client.mtype_num}=='2'">개인 사업자</c:when>
							<c:otherwise>법인 사업자</c:otherwise>
						</c:choose>
					</small>
				</div>
			</div>
			<br>
			<c:if test="${client.mem_picture == null }">
			<img style="width: 100px; height: 100px; margin-left: 90px;"
				class="img-avatar img-avatar-thumb"
				src="${pageContext.request.contextPath}/assets/img/avatars/avatar5.jpg"
				alt="">
			</c:if>
			<c:if test="${client.mem_picture != null}">
			<img style="width: 100px; height: 100px; margin-left: 90px;"
				class="img-avatar img-avatar-thumb"
				src="/files/${client.mem_picture}"
				alt="">
			</c:if>
			<div>
				<pre>
				${client.mem_selfinfo }
				</pre>
			</div>
			<hr>

			<div class="block-content bg-white">
				<div class="row items-push">
					<div class="col-10 col-sm-10 text-center text-sm-left">
						<div class="font-size-sm font-w600 text-uppercase text-muted">
							<div class="text-warning"><label style="color: black;">전체 평균평점</label><br>
			                                    <c:if test="${totalAvg eq null}">
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${0.2 >= totalAvg && totalAvg > 0}">
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${0.7 >= totalAvg && totalAvg >= 0.3}">
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${1.2 >= totalAvg && totalAvg >= 0.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${1.7 >= totalAvg && totalAvg >= 1.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${2.2 >= totalAvg && totalAvg >= 1.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${2.7 >= totalAvg && totalAvg >= 2.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${3.2 >= totalAvg && totalAvg >= 2.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${3.7 >= totalAvg && totalAvg >= 3.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${4.2 >= totalAvg && totalAvg >= 3.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${4.7 >= totalAvg && totalAvg >= 4.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                    </c:if>
			                                    <c:if test="${5.0 >= totalAvg && totalAvg >= 4.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                    </c:if><label style="color: black;"><c:if test="${totalAvg eq null}">0</c:if>${totalAvg}</label>
			                           		 </div><br>
							<c:forEach items="${evalList }" var="evalInfo" varStatus="evalStatus">
												<div class="text-warning"><label style="color: black;">${evalInfo.eval}</label>&nbsp;
			                                    <c:if test="${evalInfo.evalVal eq null}">
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${0.2 >= evalInfo.evalVal && evalInfo.evalVal > 0}">
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${0.7 >= evalInfo.evalVal && evalInfo.evalVal >= 0.3}">
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${1.2 >= evalInfo.evalVal && evalInfo.evalVal >= 0.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${1.7 >= evalInfo.evalVal && evalInfo.evalVal >= 1.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${2.2 >= evalInfo.evalVal && evalInfo.evalVal >= 1.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${2.7 >= evalInfo.evalVal && evalInfo.evalVal >= 2.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${3.2 >= evalInfo.evalVal && evalInfo.evalVal >= 2.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${3.7 >= evalInfo.evalVal && evalInfo.evalVal >= 3.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${4.2 >= evalInfo.evalVal && evalInfo.evalVal >= 3.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${4.7 >= evalInfo.evalVal && evalInfo.evalVal >= 4.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                    </c:if>
			                                    <c:if test="${5.0 >= evalInfo.evalVal && evalInfo.evalVal >= 4.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                    </c:if><label style="color: black;"><c:if test="${evalInfo.evalVal eq null}">0.0</c:if>${evalInfo.evalVal}</label><br><br>
			                           		 </div>
		                                    </c:forEach>
					</div>
				</div>
			</div>
			<hr>
			<div class="block-content">
				<p class="font-size-md font-w600 text-uppercase text-muted">등록한 프로젝트   ${countRegis} 건 </p> 
				<p class="font-size-md font-w600 text-uppercase text-muted">계약중 프로젝트 ${countContract} 건 </p>
				<p class="font-size-md font-w600 text-uppercase text-muted">진행중 프로젝트 ${countProjecting} 건 </p>
				<p class="font-size-md font-w600 text-uppercase text-muted">완료한 프로젝트 ${countEnd } 건 </p>
			</div> 
		</div>
	</div>
</body>
</html>