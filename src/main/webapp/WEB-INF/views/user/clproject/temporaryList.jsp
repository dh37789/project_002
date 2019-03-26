<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function() {

	});
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">검수중인 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/project/temporaryList.do">임시저장</a> 
	</span> 
</nav>

	<div class="content">
		<div class="my-50 text-center">
			<h2 class="font-w700 text-black mb-10">임시 저장된 프로젝트</h2>
			<h3 class="h5 text-muted mb-0">All great, keep it up!</h3>
		</div>
		<div class="row">
		<c:forEach items="${projectList}" var="project">
			<div class="col-lg-6 col-xl-4">
				<div class="block block-fx-shadow text-center">
				<input type="hidden" name="pr_num" value="${project.PR_NUM }">
					<a class="d-block bg-primary font-w600 text-uppercase py-5"
						href="javascript:void(0)" data-toggle="modal"
						data-target="#modal-crypto-wallet-btc"> <span
						class="text-white">${project.PR_TITLE }</span>
					</a>
					<div class="block-content block-content-full">
						<div class="pt-20 pb-30">
							<div class="font-size-sm font-w400">
							${fn:substring(project.PR_CONTENT, 0 , 30) } . . .
							</div>
							<div class="font-size-sm font-w600 text-uppercase text-muted">작성일 : 
								${fn:substring(project.PR_DATE,0,10) }</div>
						</div>
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/project/projectForm2.do?pr_num=${project.PR_NUM}"> <i
							class="fa fa-pencil-square-o mr-5"></i> 작성하기
						</a> <a class="btn btn-secondary" href="${pageContext.request.contextPath}/project/deleteProject.do?pr_num=${project.PR_NUM}"> <i
							class="fa fa-trash-o mr-5"></i> 삭제하기
						</a>
					</div>
				</div>
			</div>
			</c:forEach>
			<div class="col-lg-6 col-xl-4">
				<a class="block block-link-shadow" href="${pageContext.request.contextPath}/project/projectForm.do">
					<div class="bg-primary pt-5"></div>
					<div class="block-content block-content-full text-center">
						<div class="pt-10 pb-10">
							<i class="fa fa-plus-circle fa-3x text-primary"></i>
						</div>
						<div class="font-w600 text-uppercase">New Project</div>
					</div>
				</a>
			</div>
		</div>
	</div>

</body>
</html>