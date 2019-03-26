<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	$('tr').click(function(){
		var mem_id = $(this).find('td:eq(1) p:eq(0)').text();
		$(location).attr('href','${pageContext.request.contextPath}/freelancer/freelancerView.do?mem_id='+mem_id)
	})
})

function IconClick(mem_id){
	event.stopPropagation();
	location.href="${pageContext.request.contextPath}/interest/deleteFree2.do?mem_id="+mem_id;
};
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item" href="${pageContext.request.contextPath }/interest/freeList.do">관심 프리랜서</a> 
</nav>

	<h2 class="content-heading">관심 프리랜서 리스트</h2>
	
<div class="col-md-12 row">
<div class="col-md-1">  
</div>
<div class="col-md-10">
<c:if test="${not empty noFree}">  
            
<nav class="breadcrumb bg-white push">  
		<div class="col-md-12">  
			<div class="block-content block-content-full">
				<div class="row py-20 font-size-h3 font-w600">
					<i class="fa fa-close fa-2x text-body-bg-dark"></i>&nbsp; ${noFree }
					<div class=" col-6 text-right border-r"></div>  
				</div>  
			</div>    
		</div>
		</nav>
		<br>    
	</c:if>    
<c:forEach items="${freeList }" var="free">
 <table class="table bg-white block-content block-content-full tablel" height="220px" style="border: 1px dotted #d2e7f5" >
   <tbody>
	<tr>
	<td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
<div class="font-size-sm font-w600 text-uppercase text-muted  float-left">${free.RNUM }</div>
		<div class="mb-10">
			<a href="#"> 
			<c:choose>
					<c:when test="${free.MEM_PICTURE==null }">
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:when>
					<c:otherwise>
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath }/files/${free.MEM_PICTURE }" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:otherwise>
				</c:choose>
			</a>
		</div> 
		<small>
			<c:choose>
				<c:when test="${free.FTYPE_NUM=='0' }">
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
				<c:when test="${free.MTYPE_NUM=='0' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_0.png" width="25px">
					개인
				</c:when>
				<c:when test="${free.MTYPE_NUM=='1' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_1.png" width="25px">
					팀
				</c:when>
				<c:when test="${free.MTYPE_NUM=='2' }">
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
		<div class="col-md-10">
		<p class="font-size-xl" >${free.MEM_ID }</p>
		</div>
		<div class=" col-md-1 justify-content-right float-right " style="padding-left: 75px; padding-top: 10px;">
						<div class="col-md-1 iconDiv">
							<i id="${free.MEM_ID }"  class="fa fa-heart text-pulse fa-2x" onclick="IconClick('${free.MEM_ID }');">
							</i>
						</div>
					</div>
	</div>
		<hr>
		<p class="font-size-sm text-muted" style="width: 90%;">${free.MEM_SELFINFO }</p>
	</td>
	</tr>
 </tbody>
 </table>
 <br>
</c:forEach>
</div>
<div class="col-md-1">
</div>
</div>
 <br>
${pagingUtil}

</body>
</html>