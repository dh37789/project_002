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
// 	$('#btnInsert').click(function(){
//     	location.href = "${pageContext.request.contextPath}/freProfile/selfInfoForm.do";
//     });
	
	$('#btnProfile').click(function(){
    	location.href = "${pageContext.request.contextPath}/freProfile/frmyProfileList.do?mem_id=${USER_LOGININFO.mem_id}";
    });
	
	
	$('#btnAdd').click(function(){
		var rowItem = "<tr>";
			rowItem += "<td> <div class='col-md-12'> <select class='form-control' id='selectType' name='selectType'>"+
			        "<option selected='selected' value=''>종류</option>"+
					"<option value='22'>PhotoShop</option>"+
					"<option value='23'>CSS</option>"+
					"<option value='24'>hybridapp</option>"+
					"<option value='25'>HTML</option>"+
					"<option value='26'>Android</option>"+
					"<option value='27'>JSP</option>"+
					"<option value='28'>ORACLE</option>"+
					"<option value='29'>SQL</option>"+
					"<option value='30'>DB</option>"+
					"<option value='0'>C</option>"+
					"<option value='1'>C++</option>"+
					"<option value='2'>C#</option>"+
					"<option value='3'>Visual Basic</option>"+
					"<option value='4'>Java</option>"+
					"<option value='5'>JavaScript</option>"+
					"<option value='6'>Python</option>"+
					"<option value='7'>R</option>"+
					"<option value='8'>PHP</option>"+
					"<option value='9'>어셈블리어</option>"+
					"<option value='10'>CoffeeScript</option>"+
					"<option value='11'>ABAP</option>"+
					"<option value='12'>D</option>"+
					"<option value='13'>Prolog</option>"+
					"<option value='14'>Ruby</option>"+
					"<option value='15'>Rust</option>"+
					"<option value='16'>Scala</option>"+
					"<option value='17'>파스칼</option>"+
					"<option value='18'>Perl</option>"+
					"<option value='19'>Objective-C</option>"+
					"<option value='20'>Go</option>"+
					"<option value='21'>Forth</option>"+
					"<option value='100'>기타</option>"+
					"<option value='31'>firmware</option>"+
					"<option value='32'>HW설계</option>"+
					"<option value='33'>IOS</option>"+
					"<option value='34'>Unity</option>"+
					"<option value='35'>OpenCV</option> </select> </div> </td>";
			
			rowItem += "<td> <div class='col-md-12'> <select class='form-control' id='selectLevel' name='selectLevel'>"+
				"<option selected='selected' value=''>숙련도</option>"+
				"<option value='0'>초급</option>"+
				"<option value='1'>중급</option>"+
				"<option value='2'>고급</option> </select> </div> </td>";
			rowItem += "<td><div class='col-md-12'> <select class='form-control' id='selectPeriod' name='selectPeriod'>"+
				"<option selected='selected' value=''>경험</option>"+
				"<option value='1년 미만'>1년 미만</option>"+
				"<option value='1년 이상 3년 미만'>1년 이상 3년 미만</option>"+
				"<option value='3년 이상 5년 미만'>3년 이상 5년 미만</option>"+
				"<option value='5년 이상 10년 미만'>5년 이상 10년 미만</option>"+
				"<option value='10년 이상'>10년 이상</option> </select> </div> </td>";
			rowItem += "<td class='text-center'> <div class='btn-group'> <button type='button' class='btn btn-sm btn-secondary' id='btnDel' name='btnDel' data-toggle='tooltip' title='Delete'>"+
				"<i class='fa fa-trash-o'></i> </button> </div> </td>";
			rowItem += "</tr>";
			
		$('#tech_table').append(rowItem);
		
	});
	
	$('#btnCancel').click(function(){
		
        location.href = "${pageContext.request.contextPath}/freProfile/calcenDeleteTech.do?mem_id=${USER_LOGININFO.mem_id}";
        
	});
	
	
// 	$('table tr:gt(0)').on("click", "button", function(){
	
	$('#tech_table').on("click", "button", function(){
		var tech_num = $(this).val();
   	 	$(this).closest("tr").remove();
   	 	
		   	 $.ajax({
		         type:'POST',
		         dataType:'JSON',
		         data:{
		        	 mem_id : '${USER_LOGININFO.mem_id }',
		        	 tech_num : tech_num },
		         url:'${pageContext.request.contextPath}/freProfile/waitDeleteTech.do',
		         error:function(result){
		            alert(result.message);
		         },
		         async: false,
		         success:function(result){
		            if(eval(result.result.flag)){
		            }
		         }
		      });
	});
	
	
	$('#btnSave').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "대표 보유 기술을 수정하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
					if (result) {
						
						var leng = 0;
						if(($('#tech_tbody tr').length)==0){
							$.ajax({
					               type:'POST',
					               dataType:'JSON',
					               data:{
					                  mem_id : '${USER_LOGININFO.mem_id }'
					                    },
					               url:'${pageContext.request.contextPath}/freProfile/deleteTech.do',
					               error:function(result){
					                  swal("", result.message, "info");
					               },
					               async: false,
					               success:function(result){
					                  if(eval(result.result.flag)){
					                     location.href = "${pageContext.request.contextPath}/freProfile/techView.do?mem_id=${USER_LOGININFO.mem_id}";
					                     
					                  }
					               }
					            });
					      }else{
		
		
		
							$('#tech_tbody tr').each(function ( ) {
								var inputItem = $(this).find(":input")
								var selectItem = $(this).find("option:selected")
								var tech_num = inputItem.eq(0).val();
								var tech_type = selectItem.eq(0).val();
								var tech_fluent = selectItem.eq(1).val();
								var tech_period = selectItem.eq(2).val();
								
							    var temp = [];
							    var obj = $('select[name="selectType"]');
							    var obj2 = $('select[name="selectLevel"]');
							    var obj3 = $('select[name="selectPeriod"]');
							 	var x = 0;
							 	var y = 0;
							 	var v = 0;
							 	var z = 0;
							    
							    $(obj).each(function(i) {
										y = 0;
											if($(this).val()==""){
												y++;
											}
							            	temp[i] = $(this).val();
							        });
							 
							    $(obj2).each(function(i){
							    	v = 0;
							    	if($(this).val()==""){
											v++;
										}
							    	
							    });
							    
							    $(obj3).each(function(i){
							    	z = 0;
							    	if($(this).val()==""){
											z++;
										}
							    	
							    });
							    
							    
							    
							    $(temp).each(function(i) { 
							    		x = 0;
							    		
					 			            $(obj).each(function() {		                     
							                if( temp[i] == $(this).val()) {
							                    x++;
							                }
							            });
							    });
							    
							    if(x > 1){
							    	swal("경고", "동일한 기술이 존재합니다."); return false;
							    }
					            
							    if(y > 0){
							    	swal("경고", "기술을 선택해 주세요."); return false;
							    }
							    if(v > 0){
							    	swal("경고", "숙련도를 선택해 주세요."); return false;
							    }
							    if(z > 0){
							    	swal("경고", "경험기간을 선택해 주세요."); return false;
							    }
							    			
							    
					
								$.ajax({
							         type:'POST',
							         dataType:'JSON',
							         data:{tech_type : tech_type,
							        	 tech_fluent : tech_fluent,
							        	 tech_period : tech_period,
							        	 mem_id : '${USER_LOGININFO.mem_id }',
							        	 tech_num : tech_num },
							         url:'${pageContext.request.contextPath}/freProfile/insertTech.do',
							         error:function(result){
							            alert(result.message);
							         },
							         async: false,
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
<body>
<form class="form-horizontal" action="${pageContext.request.contextPath }/freProfile/insertTech.do" method="post" id="formTech" name="formTech">
	<div class="content">
		<!-- 자기소개 -->
		<h2 class="content-heading">
			<button type="button"
				class="btn btn-sm btn-rounded btn-alt-secondary float-right"
				id="btnProfile" name="btnProfile">내 프로필에서 보기</button>
			<i class="si si-clock mr-5"></i> 보유기술
		</h2>
		<div class="row items-push">
			<div class="col-md-8 col-xl-12">
				<div class="block-header block-header-default">
					<div class="process-guide-box" style="margin-bottom: 15px;">
						<p class="process-guide-text" style="margin-bottom: 0px;">
							<strong>[ 보유 기술 입력 가이드 ]</strong>
						</p>
						<p class="process-guide-text" style="margin-top: 0px;">보유 기술은
							한 가지씩 입력해 주세요. Ex) C#, Javascript, Android, Photoshop 등</p>
					</div>

					<div class="block-options">
						<div class="block-options-item"></div>
					</div>
				</div>
				<div class="block-content">
					<table class="table table-bordered table-vcenter" id="tech_table">
						<thead>
							<tr>
								<th class="text-center" style="width: 50%;"><strong>종류</strong></th>
								<th class="text-center" style="width: 15%;"><strong>숙련도</strong></th>
								<th class="text-center" style="width: 30%;"><strong>경험</strong></th>
								<th class="text-center" style="width: 5%;"><strong>도구</strong></th>
							</tr>
						</thead>
						<tbody id="tech_tbody">
						<c:if test="${empty techList}">
							<tr>
								<td>
									<div class="col-md-12">
										<select class="form-control" id="selectType"
											name="selectType">
											<option selected="selected" value="">종류</option>
											<option value='22'>PhotoShop</option>
											<option value='23'>CSS</option>
											<option value='24'>hybridapp</option>
											<option value='25'>HTML</option>
											<option value='26'>Android</option>
											<option value='27'>JSP</option>
											<option value='28'>ORACLE</option>
											<option value='29'>SQL</option>
											<option value='30'>DB</option>
											<option value='0'>C</option>
											<option value='1'>C++</option>
											<option value='2'>C#</option>
											<option value='3'>Visual Basic</option>
											<option value='4'>Java</option>
											<option value='5'>JavaScript</option>
											<option value='6'>Python</option>
											<option value='7'>R</option>
											<option value='8'>PHP</option>
											<option value='9'>어셈블리어</option>
											<option value='10'>CoffeeScript</option>
											<option value='11'>ABAP</option>
											<option value='12'>D</option>
											<option value='13'>Prolog</option>
											<option value='14'>Ruby</option>
											<option value='15'>Rust</option>
											<option value='16'>Scala</option>
											<option value='17'>파스칼</option>
											<option value='18'>Perl</option>
											<option value='19'>Objective-C</option>
											<option value='20'>Go</option>
											<option value='21'>Forth</option>
											<option value='100'>기타</option>
											<option value='31'>firmware</option>
											<option value='32'>HW설계</option>
											<option value='33'>IOS</option>
											<option value='34'>Unity</option>
											<option value='35'>OpenCV</option>
										</select>
									</div>
								</td>
								<td>
									<div class="col-md-12">
										<select class="form-control" id="selectLevel"
											name="selectLevel">
											<option selected="selected" value="">숙련도</option>
											<option value="0">초급</option>
											<option value="1">중급</option>
											<option value="2">고급</option>
										</select>
									</div>
								</td>
								<td>
									<div class="col-md-12">
										<select class="form-control" id="selectPeriod"
											name="selectPeriod">
											<option selected="selected" value="">경험</option>
											<option value="1년 미만">1년 미만</option>
											<option value="1년 이상 3년 미만">1년 이상 3년 미만</option>
											<option value="3년 이상 5년 미만">3년 이상 5년 미만</option>
											<option value="5년 이상 10년 미만">5년 이상 10년 미만</option>
											<option value="10년 이상">10년 이상</option> 
										</select>
									</div>
								</td>
								<td class="text-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-secondary" id="btnDel" name="btnDel"
											data-toggle="tooltip" title="Delete">
											<i class="fa fa-trash-o"></i>
										</button>
									</div>
								</td>
							</tr>
							</c:if>
							
							<c:forEach items="${techList }" var="techInfo">
								<td><input type="hidden" name="tech_num" class="form-control" value="${techInfo.tech_num }"/>
									<div class="col-md-12">
										<select class="form-control" id="selectType"
											name="selectType">
											<option selected="selected" value="">종류</option>
											<option value='22'<c:if test="${techInfo.tech_type eq '22'}"> selected</c:if>>PhotoShop</option>
											<option value='23'<c:if test="${techInfo.tech_type eq '23'}"> selected</c:if>>CSS</option>
											<option value='24'<c:if test="${techInfo.tech_type eq '24'}"> selected</c:if>>hybridapp</option>
											<option value='25'<c:if test="${techInfo.tech_type eq '25'}"> selected</c:if>>HTML</option>
											<option value='26'<c:if test="${techInfo.tech_type eq '26'}"> selected</c:if>>Android</option>
											<option value='27'<c:if test="${techInfo.tech_type eq '27'}"> selected</c:if>>JSP</option>
											<option value='28'<c:if test="${techInfo.tech_type eq '28'}"> selected</c:if>>ORACLE</option>
											<option value='29'<c:if test="${techInfo.tech_type eq '29'}"> selected</c:if>>SQL</option>
											<option value='30'<c:if test="${techInfo.tech_type eq '30'}"> selected</c:if>>DB</option>
											<option value='0' <c:if test="${techInfo.tech_type eq '0'}"> selected</c:if>>C</option>
											<option value='1' <c:if test="${techInfo.tech_type eq '1'}"> selected</c:if>>C++</option>
											<option value='2' <c:if test="${techInfo.tech_type eq '2'}"> selected</c:if>>C#</option>
											<option value='3' <c:if test="${techInfo.tech_type eq '3'}"> selected</c:if>>Visual Basic</option>
											<option value='4' <c:if test="${techInfo.tech_type eq '4'}"> selected</c:if>>Java</option>
											<option value='5' <c:if test="${techInfo.tech_type eq '5'}"> selected</c:if>>JavaScript</option>
											<option value='6' <c:if test="${techInfo.tech_type eq '6'}"> selected</c:if>>Python</option>
											<option value='7' <c:if test="${techInfo.tech_type eq '7'}"> selected</c:if>>R</option>
											<option value='8' <c:if test="${techInfo.tech_type eq '8'}"> selected</c:if>>PHP</option>
											<option value='9' <c:if test="${techInfo.tech_type eq '9'}"> selected</c:if>>어셈블리어</option>
											<option value='10'<c:if test="${techInfo.tech_type eq '10'}"> selected</c:if>>CoffeeScript</option>
											<option value='11'<c:if test="${techInfo.tech_type eq '11'}"> selected</c:if>>ABAP</option>
											<option value='12'<c:if test="${techInfo.tech_type eq '12'}"> selected</c:if>>D</option>
											<option value='13'<c:if test="${techInfo.tech_type eq '13'}"> selected</c:if>>Prolog</option>
											<option value='14'<c:if test="${techInfo.tech_type eq '14'}"> selected</c:if>>Ruby</option>
											<option value='15'<c:if test="${techInfo.tech_type eq '15'}"> selected</c:if>>Rust</option>
											<option value='16'<c:if test="${techInfo.tech_type eq '16'}"> selected</c:if>>Scala</option>
											<option value='17'<c:if test="${techInfo.tech_type eq '17'}"> selected</c:if>>파스칼</option>
											<option value='18'<c:if test="${techInfo.tech_type eq '18'}"> selected</c:if>>Perl</option>
											<option value='19'<c:if test="${techInfo.tech_type eq '19'}"> selected</c:if>>Objective-C</option>
											<option value='20'<c:if test="${techInfo.tech_type eq '20'}"> selected</c:if>>Go</option>
											<option value='21'<c:if test="${techInfo.tech_type eq '21'}"> selected</c:if>>Forth</option>
											<option value='100'<c:if test="${techInfo.tech_type eq '100'}"> selected</c:if>>기타</option>
											<option value='31'<c:if test="${techInfo.tech_type eq '31'}"> selected</c:if>>firmware</option>
											<option value='32'<c:if test="${techInfo.tech_type eq '32'}"> selected</c:if>>HW설계</option>
											<option value='33'<c:if test="${techInfo.tech_type eq '33'}"> selected</c:if>>IOS</option>
											<option value='34'<c:if test="${techInfo.tech_type eq '34'}"> selected</c:if>>Unity</option>
											<option value='35'<c:if test="${techInfo.tech_type eq '35'}"> selected</c:if>>OpenCV</option>
										</select>
									</div>
								</td>
								
								<td>
									<div class="col-md-12">
										<select class="form-control" id="selectLevel"
											name="selectLevel">
											<option value="0" <c:if test="${techInfo.tech_fluent == 0}"> selected</c:if>>초급</option>
			 								<option value="1" <c:if test="${techInfo.tech_fluent == 1}"> selected</c:if>>중급</option>
											<option value="2" <c:if test="${techInfo.tech_fluent == 2}"> selected</c:if>>고급</option>
										</select>
									</div>
								</td>
								
								<td>
									<div class="col-md-12">
										<select class="form-control" id="selectPeriod"
											name="selectPeriod">
											<option selected="selected" value="">경험</option>
											<option value="1년 미만" <c:if test="${techInfo.tech_period eq '1년 미만'}"> selected</c:if>>1년 미만</option>
											<option value="1년 이상 3년 미만" <c:if test="${techInfo.tech_period eq '1년 이상 3년 미만'}"> selected</c:if>>1년 이상 3년 미만</option>
											<option value="3년 이상 5년 미만" <c:if test="${techInfo.tech_period eq '3년 이상 5년 미만'}"> selected</c:if>>3년 이상 5년 미만</option>
											<option value="5년 이상 10년 미만" <c:if test="${techInfo.tech_period eq '5년 이상 10년 미만'}"> selected</c:if>>5년 이상 10년 미만</option>
											<option value="10년 이상" <c:if test="${techInfo.tech_period eq '10년 이상'}"> selected</c:if>>10년 이상</option>
										</select>
									</div>
								</td>
								<td class="text-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-secondary" id="btnDel" name="btnDel"
											data-toggle="tooltip" title="Delete" value="${techInfo.tech_num }">
											<i class="fa fa-trash-o"></i>
										</button>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<button type="button" class="btn btn-alt-primary" id="btnAdd"
						name="btnAdd">보유기술 추가</button>
				<div class="form-group p5-form-group p5-profile-manage-btn-group">
						<div class="btn-wrapper pull-right">
							<button type="button" class="btn btn-secondary min-width-125" id="btnCancel" name="btnCancel">취소</button>
							<button type="button" class="btn btn-primary min-width-125" id="btnSave" name="btnSave">등록 완료</button>
						</div>
				</div>
			</div>
		</div>
	</div>

</form>
</body>
</html>

