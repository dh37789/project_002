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
 function DivClick(val){
	event.stopPropagation();
	$(location).attr('href','${pageContext.request.contextPath}/project/projectView.do?pr_num='+val);
};


function IconClick(val,flag){
	event.stopPropagation();
	
	if(eval(flag)){
		var pr_numm =val;
			$.ajax({
				type:'POST',
				dataType:'JSON',
				data:{pr_num:pr_numm},
				url:'${pageContext.request.contextPath}/interest/insertProject.do',
				success:function(result){
					if(eval(result.flag)){
						$('i[id='+val+']').attr('class','fa fa-heart text-pulse fa-2x');
						$('i[id='+val+']').attr('onclick','IconClick('+val+',"false");');
						$('i[id='+val+']').find("input[name=inpr_num]").val(result.inpr_num);
					}else{
						swal("", 'insert 아오', "error");
					}
					
				},
				error:function(result){
					swal("", result.status+"|"+result.responseText, "info");
				}
				
					});
		
	}else{
		var pr_numm =val;
		var inpr_numm = $('i[id='+val+']').find("input[name=inpr_num]").val();
		$.ajax({
			type:'POST',
			dataType:'JSON',
			data:{inpr_num:inpr_numm},
			url:'${pageContext.request.contextPath}/interest/deleteProject.do',
			success:function(result){
				if(eval(result.flag)){
					$('i[id='+val+']').attr('class','si si-heart fa-2x');
					$('i[id='+val+']').attr('onclick','IconClick('+val+',"true");');
					
				}else{
					swal("", 'delete 아오', "error");
				}
				
			},
			error:function(result){
				swal("", result.status+"|"+result.responseText, "info");
			}
			
		});
	}
	
};

</script>
<body>  
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item" href="${pageContext.request.contextPath }/project/projectList.do">프로젝트 목록</a> 
</nav>

<h2 class="content-heading">프로젝트 목록 <small>${totalCount}개의 프로젝트를 진행중 입니다.</small></h2>
 <div class="row justify-content-center float-right">
<form class="form-inline" action="${pageContext.request.contextPath}/project/projectList.do" method="post">
			  
            <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search_keyword" name="search_keyword">
            <button type="submit"  class="btn btn-sm btn-secondary"><i class="fa fa-search"></i> Search</button>
        </form>  
</div>      
	<br><br>      
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
	
<c:forEach items="${projectList }" var="projectInfo">
	<div class="col-md-12" onclick="DivClick(${projectInfo.pr_num});" >
		<a class="block block-link-shadow" >
			<div class="block-content block-content-full">
				<div class="font-size-sm font-w600 text-uppercase text-muted">${projectInfo.rnum }</div>
					<div class="row justify-content-center float-right ">
			<input type="hidden" name="pr_numm" value="${projectInfo.pr_num}">


						<div class="col-md-1 iconDiv" style="padding-right: 50px;">
						<c:if test="${not empty sessionScope.USER_LOGININFO }">
						<c:if test="${sessionScope.USER_LOGININFO.iden_num eq 2 }">
							<i id="${projectInfo.pr_num }" class="si si-heart fa-2x" onclick="IconClick(${projectInfo.pr_num},'true');">
							<input type="hidden" name="inpr_num" >
							
							</i>
							</c:if>
							</c:if>
							<c:forEach items="${interestList}" var="interestt">
								<script type="text/javascript" >
									$(document).ready(function(){
										$('input[name=inpr_num]').val('${interestt.inpr_num}');
									});
								</script>
								<c:if test="${interestt.inpr_project == projectInfo.pr_num }">
									<script type="text/javascript"> 
										$(document).ready(function() {
											$('i[id=${projectInfo.pr_num}]').attr('class','fa fa-heart text-pulse fa-2x');
											$('i[id=${projectInfo.pr_num}]').attr('onclick','IconClick(${projectInfo.pr_num},"false");');
											
										}); 
									</script>
								</c:if>
							</c:forEach>  

						</div>
					</div>

					<div class="row">
						<div class="col-md-11 font-size-h4 font-w700 text-primary">${projectInfo.pr_title}</div>
						
					</div>
					<small><i class="fa fa-krw fa-1x" ></i> 예상금액  ${projectInfo.pr_payment }원 </small>  |  <small><i class="fa fa-calendar-check-o fa-1x"></i> 예상기간   ${projectInfo.pr_ex_period }일</small> | <small> <em>등록일자   ${projectInfo.pr_date }</em></small>
					<br>
					<br>
					<div class="row">
					<c:if test="${fn:length(projectInfo.pr_content) < 500 }">
					<div class="col-md-10 ">${projectInfo.pr_content}</div><br>
					</c:if>
					<c:if test="${fn:length(projectInfo.pr_content) > 500 }">
					<div class="col-md-10 ">${fn:substring(projectInfo.pr_content, 0 , 500) } ...</div><br>
					</c:if>
					<div class="col-md-2"><div class="alert alert-secondary alert-dismissable"><i class="si si-clock fa-1x"></i> 마감 ${projectInfo.dday}일 전</div>
					<div class="alert alert-secondary alert-dismissable"><i class=" si si-note fa-1x"></i> 지원자 ${projectInfo.applicant }명</div></div>
					</div>
					<br>
					<div>${projectInfo.category} > ${projectInfo.cate_Detail }  &nbsp;|&nbsp;   관련 기술 <c:forEach items="${projectInfo.techList}" var="tech">&nbsp;<span class="badge badge-secondary"> ${tech.lan_name} </span>&nbsp;</c:forEach> </div>
			</div>
		</a>
	</div>
</c:forEach>

${pagingUtil.getPageHtmls() }
</body>
</html>