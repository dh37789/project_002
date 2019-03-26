<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(function(){
	
	Codebase.blocks('#check_table', 'close');
	Codebase.blocks('#divCheck', 'close');
	
	$('#btnSave').click(function(){
        location.href = "${pageContext.request.contextPath}/freProfile/techForm.do?mem_id=${USER_LOGININFO.mem_id}";
	})
	
	$('#btnProfile').click(function(){
    	location.href = "${pageContext.request.contextPath}/freProfile/frmyProfileList.do?mem_id=${USER_LOGININFO.mem_id}";
	})
	
	$('#btnIntroduce').click(function(){
		Codebase.blocks('#check_table', 'open');
		Codebase.blocks('#tech_table', 'close');
		Codebase.blocks('#divSave', 'close');
		Codebase.blocks('#divCheck', 'open');
	})
	
	$('#btnRepreCancle').click(function(){
		Codebase.blocks('#check_table', 'close');
		Codebase.blocks('#tech_table', 'open');
		Codebase.blocks('#divSave', 'open');
		Codebase.blocks('#divCheck', 'close');
		
	})
	
		
	
	$('#btnRepreSave').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "대표 보유 기술을 수정하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
					if (result) {
						if($(".chkboxRepre:checked").length > 3){
							swal("경고", "대표 보유 기술은 3개까지 가능합니다.");
							return false;
						}
						
					$.ajax({
				         type:'POST',
				         dataType:'JSON',
				         data:{
				        	 mem_id : '${USER_LOGININFO.mem_id }'
				        	 	},
				         url:'${pageContext.request.contextPath}/freProfile/updateTotalRepre.do',
				         error:function(result){
				            swal("", result.message, "info");
				         },
				         success:function(result){
				            if(eval(result.result.flag)){
				            	location.href = "${pageContext.request.contextPath}/freProfile/techView.do?mem_id=${USER_LOGININFO.mem_id}";
				            	updateCheck();
				            }
				         }
				  		});
						function updateCheck(){
						$(".chkboxRepre:checked").each(function ( ) {
							var tech_num = $(this).val();
							  $.ajax({
					 		         type:'POST',
					 		         dataType:'JSON',
					 		         data:{
					 		        	 mem_id : '${USER_LOGININFO.mem_id }',
					 		        	 tech_num : tech_num },
					 		         url:'${pageContext.request.contextPath}/freProfile/updateRepre.do',
					 		         error:function(result){
					 		            swal("", result.message, "info");
					 		         },
					 		         success:function(result){
					 		            if(eval(result.result.flag)){
					 		            	location.href = "${pageContext.request.contextPath}/freProfile/techView.do?mem_id=${USER_LOGININFO.mem_id}";
					 		            }
					 		         }
					 		  });
							});
						}
	
					}else{
						return;	
					}
			});
	})
	
});
	
</script>
<style>
	#trTech{
		background-color: window;
	}
</style>
<body>
<form class="form-horizontal" action="${pageContext.request.contextPath }/freProfile/insertTech.do" method="post" id="formTech">
	<div class="content">
		<!-- 자기소개 -->
		<h2 class="content-heading">
			<button type="button"
				class="btn btn-sm btn-rounded btn-alt-secondary float-right"
				id="btnProfile" name="btnProfile">내 프로필에서 보기</button>
			<i class="si si-clock mr-5"></i> 보유 기술
		</h2>
		<h2 class="content-heading">
                        <button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnIntroduce" name="btnIntroduce">대표 보유기술 선택</button>
                        <i class=""></i> 보유 기술
        </h2>
		<div class="row items-push">
			<div class="col-md-8 col-xl-12">
				<div class="block-content">
				
					<table class="table table-bordered table-vcenter" id="check_table">
						<thead class="table-primary">
							<tr>
								<th class="text-center" style="width: 50%;"><strong>종류</strong></th>
								<th class="text-center" style="width: 15%;"><strong>숙련도</strong></th>
								<th class="text-center" style="width: 25%;"><strong>경험</strong></th>
								<th class="text-center" style="width: 10%;"><strong></strong></th>
							</tr>
						</thead>
						<tbody id="check_tbody">
							<c:forEach items="${techList }" var="techInfo">
							<tr id="trTech">
								<td><input type="hidden" name="tech_num" class="form-control" value="${techInfo.tech_num }"/>
									<div class="col-md-12">
<!-- 										<input type="text" class="form-control" id="selectType" -->
<!-- 											name="textType"> -->
											<c:if test="${techInfo.tech_type eq '22'}">PhotoShop</c:if>
											<c:if test="${techInfo.tech_type eq '23'}">CSS</c:if>
											<c:if test="${techInfo.tech_type eq '24'}">hybridapp</c:if>
											<c:if test="${techInfo.tech_type eq '25'}">HTML</c:if>
											<c:if test="${techInfo.tech_type eq '26'}">Android</c:if>
											<c:if test="${techInfo.tech_type eq '27'}">JSP</c:if>
											<c:if test="${techInfo.tech_type eq '28'}">ORACLE</c:if>
											<c:if test="${techInfo.tech_type eq '29'}">SQL</c:if>
											<c:if test="${techInfo.tech_type eq '30'}">DB</c:if>
											<c:if test="${techInfo.tech_type eq '0'}">C</c:if>
											<c:if test="${techInfo.tech_type eq '1'}">C++</c:if>
											<c:if test="${techInfo.tech_type eq '2'}">C#</c:if>
											<c:if test="${techInfo.tech_type eq '3'}">Visual Basic</c:if>
											<c:if test="${techInfo.tech_type eq '4'}">Java</c:if>
											<c:if test="${techInfo.tech_type eq '5'}">JavaScript</c:if>
											<c:if test="${techInfo.tech_type eq '6'}">Python</c:if>
											<c:if test="${techInfo.tech_type eq '7'}">R</c:if>
											<c:if test="${techInfo.tech_type eq '8'}">PHP</c:if>
											<c:if test="${techInfo.tech_type eq '9'}">어셈블리어</c:if>
											<c:if test="${techInfo.tech_type eq '10'}">CoffeeScript</c:if>
											<c:if test="${techInfo.tech_type eq '11'}">ABAP</c:if>
											<c:if test="${techInfo.tech_type eq '12'}">D</c:if>
											<c:if test="${techInfo.tech_type eq '13'}">Prolog</c:if>
											<c:if test="${techInfo.tech_type eq '14'}">Ruby</c:if>
											<c:if test="${techInfo.tech_type eq '15'}">Rust</c:if>
											<c:if test="${techInfo.tech_type eq '16'}">Scala</c:if>
											<c:if test="${techInfo.tech_type eq '17'}">파스칼</c:if>
											<c:if test="${techInfo.tech_type eq '18'}">Perl</c:if>
											<c:if test="${techInfo.tech_type eq '19'}">Objective-C</c:if>
											<c:if test="${techInfo.tech_type eq '20'}">Go</c:if>
											<c:if test="${techInfo.tech_type eq '21'}">Forth</c:if>
											<c:if test="${techInfo.tech_type eq '100'}">기타</c:if>
											<c:if test="${techInfo.tech_type eq '31'}">firmware</c:if>
											<c:if test="${techInfo.tech_type eq '32'}">HW설계</c:if>
											<c:if test="${techInfo.tech_type eq '33'}">IOS</c:if>
											<c:if test="${techInfo.tech_type eq '34'}">Unity</c:if>
											<c:if test="${techInfo.tech_type eq '35'}">OpenCV</c:if> <c:if test="${techInfo.tech_repre eq '0'}"><a class="badge badge-warning">대표 보유 기술</a></c:if>
									</div>
								</td>
								
								<td>
									<div class="col-md-12">
											<c:if test="${techInfo.tech_fluent == 0}">초급</c:if> 
			 								<c:if test="${techInfo.tech_fluent == 1}">중급</c:if> 
											<c:if test="${techInfo.tech_fluent == 2}">고급</c:if> 
									</div>
								</td>
								
								<td>
									<div class="col-md-12">
										${techInfo.tech_period}
									</div>
								</td>
								
								<td>
									<div class="custom-control custom-checkbox mb-5 center">
                                     <input type="checkbox" name="chkboxRepre" id="chkboxRepre" class="chkboxRepre" style="width: 20px;height: 20px;" value="${techInfo.tech_num }" <c:if test="${techInfo.tech_repre eq '0'}"> checked="checked"</c:if>>
                                    </div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					
					
					<table class="table table-bordered table-vcenter" id="tech_table">
						<thead class="table-primary">
							<tr>
								<th class="text-center" style="width: 50%;"><strong>종류</strong></th>
								<th class="text-center" style="width: 15%;"><strong>숙련도</strong></th>
								<th class="text-center" style="width: 35%;"><strong>경험</strong></th>
							</tr>
						</thead>
						<tbody id="tech_tbody">
							<c:forEach items="${techList }" var="techInfo">
							<tr id="trTech">
								<td><input type="hidden" name="tech_num" class="form-control" value="${techInfo.tech_num }"/>
									<div class="col-md-12">
<!-- 										<input type="text" class="form-control" id="selectType" -->
<!-- 											name="textType"> -->
											<c:if test="${techInfo.tech_type eq '22'}">PhotoShop</c:if> 
											<c:if test="${techInfo.tech_type eq '23'}">CSS</c:if>       
											<c:if test="${techInfo.tech_type eq '24'}">hybridapp</c:if>         
											<c:if test="${techInfo.tech_type eq '25'}">HTML</c:if>              
											<c:if test="${techInfo.tech_type eq '26'}">Android</c:if>           
											<c:if test="${techInfo.tech_type eq '27'}">JSP</c:if>               
											<c:if test="${techInfo.tech_type eq '28'}">ORACLE</c:if>            
											<c:if test="${techInfo.tech_type eq '29'}">SQL</c:if>               
											<c:if test="${techInfo.tech_type eq '30'}">DB</c:if>                
											<c:if test="${techInfo.tech_type eq '0'}">C</c:if>                  
											<c:if test="${techInfo.tech_type eq '1'}">C++</c:if>                
											<c:if test="${techInfo.tech_type eq '2'}">C#</c:if>                 
											<c:if test="${techInfo.tech_type eq '3'}">Visual Basic</c:if>       
											<c:if test="${techInfo.tech_type eq '4'}">Java</c:if>               
											<c:if test="${techInfo.tech_type eq '5'}">JavaScript</c:if>         
											<c:if test="${techInfo.tech_type eq '6'}">Python</c:if>             
											<c:if test="${techInfo.tech_type eq '7'}">R</c:if>                  
											<c:if test="${techInfo.tech_type eq '8'}">PHP</c:if>                
											<c:if test="${techInfo.tech_type eq '9'}">어셈블리어</c:if>       
											<c:if test="${techInfo.tech_type eq '10'}">CoffeeScript</c:if>      
											<c:if test="${techInfo.tech_type eq '11'}">ABAP</c:if>              
											<c:if test="${techInfo.tech_type eq '12'}">D</c:if>                 
											<c:if test="${techInfo.tech_type eq '13'}">Prolog</c:if>            
											<c:if test="${techInfo.tech_type eq '14'}">Ruby</c:if>              
											<c:if test="${techInfo.tech_type eq '15'}">Rust</c:if>              
											<c:if test="${techInfo.tech_type eq '16'}">Scala</c:if>             
											<c:if test="${techInfo.tech_type eq '17'}">파스칼</c:if>          
											<c:if test="${techInfo.tech_type eq '18'}">Perl</c:if>              
											<c:if test="${techInfo.tech_type eq '19'}">Objective-C</c:if>       
											<c:if test="${techInfo.tech_type eq '20'}">Go</c:if>                
											<c:if test="${techInfo.tech_type eq '21'}">Forth</c:if>             
											<c:if test="${techInfo.tech_type eq '100'}">기타</c:if>          
											<c:if test="${techInfo.tech_type eq '31'}">firmware</c:if>          
											<c:if test="${techInfo.tech_type eq '32'}">HW설계</c:if>           
											<c:if test="${techInfo.tech_type eq '33'}">IOS</c:if>               
											<c:if test="${techInfo.tech_type eq '34'}">Unity</c:if>             
											<c:if test="${techInfo.tech_type eq '35'}">OpenCV</c:if>      <c:if test="${techInfo.tech_repre eq '0'}"><a class="badge badge-warning">대표 보유 기술</a></c:if>      
									</div>
								</td>
								
								<td>
									<div class="col-md-12">
											<c:if test="${techInfo.tech_fluent == 0}">초급</c:if> 
			 								<c:if test="${techInfo.tech_fluent == 1}">중급</c:if> 
											<c:if test="${techInfo.tech_fluent == 2}">고급</c:if> 
									</div>
								</td>
								
								<td>
									<div class="col-md-12">
										${techInfo.tech_period}
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				<div id="divSave" class="form-group p5-form-group p5-profile-manage-btn-group">
						<div class="btn-wrapper pull-right">
							<button type="button" class="btn btn-primary min-width-125" id="btnSave" name="btnSave">수정</button>
						</div>
				</div>
				<div id="divCheck" class="form-group p5-form-group p5-profile-manage-btn-group">
						<div class="btn-wrapper pull-right">
						    <button type="button" class="btn btn-secondary" id="btnRepreCancle" name="btnRepreCancle">취소</button>
                            <button type="button" class="btn btn-alt-primary" id="btnRepreSave" name="btnRepreSave">수정 완료</button>
						</div>
				</div>
				
				</div>
				
			</div>
		</div>
	</div>

</form>
</body>
</html>