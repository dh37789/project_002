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
$(function() {
	$('button[name=contentBtn]').click(function(){
	      var pr_num = $(this).val();
	      $.ajax({
	            type:'POST',
	            dataType:'JSON',
	            data:{pr_num : pr_num},
	            url:'${pageContext.request.contextPath}/project/ajaxContent.do',
	            error:function(result){
	               swal("", result.message, "info");
	            },
	            success:function(result){
		            $('#modal-large').modal('show');
		            $('#content').text(result.project.pr_content);
	            }
	         });
	   });
});
</script>
<body>  
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">검수중인 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/project/refuseList.do">등록 실패</a> 
	</span> 
</nav>

<h2 class="content-heading">등록 실패한 프로젝트</h2>
 <div class="row justify-content-center float-right">

</div>      
	<br>    
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
	<div class="col-md-12" onclick="DivClick(${projectInfo.PR_NUM});" >
		<a class="block block-link-shadow" >
			<div class="block-content block-content-full">
					<div class="row justify-content-center float-right ">
			<input type="hidden" name="pr_numm" value="${projectInfo.PR_NUM}">


					</div>

					<div class="row">
						<div class="col-md-11 font-size-h4 font-w700 text-primary">${projectInfo.PR_TITLE}</div>
						
					</div>
					<small><i class="fa fa-krw fa-1x" ></i> 예상금액  ${projectInfo.PR_PAYMENT }원 </small>  |  <small><i class="fa fa-calendar-check-o fa-1x"></i> 예상기간   ${projectInfo.PR_EX_PERIOD }일</small> | <small> <em>등록일자   ${fn:substring(projectInfo.PR_DATE,0,10 )}</em></small>
					<br>
					
					<div class="row">
						<div class="col-md-8 btn btn-alt-warning" style="margin: 10px; height: auto;">
						<div class="font-size-sm font-w400 text-left" >&lt; 거절 사유 &gt;</div>
						${projectInfo.PR_REF }
						</div>
						<div class="col-md-2"></div>
						<div class="col-md-1">
							<div class="block">
								
								<div class="block-content block-content-full">
									<button type="button" name="contentBtn"  value="${projectInfo.PR_NUM }" class="btn btn-alt-info"
										>내용 보기</button>
								</div>
							</div>
						</div>
					</div>
			</div>
		</a>
	</div>
</c:forEach>
<div class="modal" id="modal-large" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="block block-themed block-transparent mb-0">
                        <div class="block-header bg-primary-dark">
                            <h3 class="block-title">프로젝트 내용 보기</h3>
                            <div class="block-options">
                                <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                    <i class="si si-close"></i>
                                </button>
                            </div>
                        </div>
                        <div class="block-content"><pre id="content">
</pre>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>