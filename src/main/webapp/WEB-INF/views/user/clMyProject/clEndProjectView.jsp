<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	$('#listBtn').click(function() {
		location.href = "${pageContext.request.contextPath}/clMyProject/clEndPrList.do";
	});
})
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<c:if test="${sessionScope.USER_LOGININFO.iden_num =='1' }">
			<a href="${pageContext.request.contextPath }/clMyProject/clEndPrList.do">완료된 프로젝트</a>
		</c:if> 
		<c:if test="${sessionScope.USER_LOGININFO.iden_num =='2' }">
			<a>상세보기</a>
		</c:if> 
	</span> 
	<span class="breadcrumb-item active"> 
		<a>상세보기</a> 
	</span> 
</nav>

	<div class="col-md-9">
		<div class="block">
			<div class="block-header">
				<div>
				<br>
					<h2 class="col-md-30 font-size-h4 font-w700 ">${clEndProject.pr_title }</h2>
					<div class="col-md-30 font-size-sm ">${clEndProject.category}
						${clEndProject.cate_Detail }</div>
				</div>
				<div class="block-options">
				</div>

			</div>
			<hr>
			<br>
			<div class="col-md-12 justify-content-center in row">
				<div
					class="col-md-9 text-center alert alert-secondary alert-dismissable ">
					<i class="fa fa-krw fa-1x"></i> 예상금액 ${clEndProject.pr_payment }원
					&nbsp;&nbsp; <i class="fa fa-calendar-check-o fa-1x"></i> 예상기간
					${clEndProject.pr_ex_period }일 &nbsp;&nbsp;<i class=" si si-note fa-1x"></i>
					모집마감일 ${clEndProject.pr_end }
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
									<c:when test="${clEndProject.pr_type}=='0'">아이디어만</c:when>
									<c:when test="${clEndProject.pr_type}=='1'">필요 내용 정리</c:when>
									<c:otherwise>상세한 문서 존재</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>
								<c:choose>
									<c:when test="${clEndProject.pr_support}=='n'">X</c:when>
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
							<p>${clEndProject.pr_date }</p>
						</div>
					</div>
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>${clEndProject.pr_start }</p>
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
									<c:when test="${clEndProject.pr_meeting}=='0'">온라인 미팅</c:when>
									<c:otherwise>오프라인 미팅</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
					<div class="block mb-0">
						<div id="divv" class="block-content">
							<p>${clEndProject.pr_add }</p>
						</div>
					</div>
				</div>
			</div>

			<div class="block-content">
				<br>
				<h3 class="col-md-30 font-size-h5 font-w600 ">프로젝트 내용</h3>
				<pre>
${clEndProject.pr_content }
</pre>
				<br>
				<br>
				<br>

			</div>
			<div class="block-content block-content-full">
				<h3 class="col-md-30 font-size-h5 font-w600 ">관련 기술</h3>
				<c:forEach items="${clEndProject.techList}" var="tech">&nbsp;<span
						class="badge badge-secondary font-size-sm">
						${tech.lan_name} </span>&nbsp;</c:forEach>
				<div class="pull-all">
					<br>
					<br>
					<!-- Lines Chart Container -->
				</div>
			</div>

		</div>
	</div>
</body>
</html>