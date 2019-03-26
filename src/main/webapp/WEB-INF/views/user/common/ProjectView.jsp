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

/* #insert { */
/* 	margin-bottom : 75px; */
/* 	margin-left: 10px; */
/* } */

#secret {
	margin-left: 10px;
	margin-bottom: 20px;
}

#insertre {
	margin-left: 10px;
	margin-bottom: 40px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#listBtn').click(function() {
			location.href = "${pageContext.request.contextPath}/project/projectList.do";
		});
		// 	$('button[name=replyBtn]').click(function(){
		// 		location.href="${pageContext.request.contextPath}/project/insertReply.do";
		// 	});

		$('#addInterest').click(function() {
			var pr_num = "${project.pr_num}";
			$.ajax({
				type : 'POST',
				dataType : 'JSON',
				data : {
					pr_num : pr_num
				},
				url : '${pageContext.request.contextPath}/interest/checkProject.do',
				success : function(result) {
					if (eval(result.flag)) {
						location.href = "${pageContext.request.contextPath}/interest/insertProject2.do?pr_num="+pr_num;
					} else {
						swal("", '이미 관심 프로젝트입니다.', "info");
					}
				},
				error : function(result) {
					swal("", result.status + "|"+ result.responseText, "info");
				}

			});
	});

		$('#apply').click(function() {
			var pr_num = "${project.pr_num}";
			$.ajax({
				type : 'POST',
				dataType : 'JSON',
				data : {
					pr_num : pr_num
				},
				url : '${pageContext.request.contextPath}/apply/checkApply.do',
				success : function(result) {
					if (eval(result.flag)) {
						location.href="${pageContext.request.contextPath}/apply/applyView.do?pr_num=${project.pr_num}";
					} else {
						swal("", '이미 지원한 프로젝트입니다.',"info");
					}
				},
				error : function(result) {
					swal("", result.status + "|"+ result.responseText, "info");
				}

			});
			
			

		});
		
		$('#insert').click(function(){
			var content = $('#area').val();
			var mem_id = '${USER_LOGININFO.mem_id}';
			
			if($('#area').val().trim().length == 0) {
				swal("경고", "내용을 입력하세요.", "warning");
				return;
			}else{
				if($('input[type=checkbox]').is(':checked')) {
					$('input[name=prre_pass]').val(mem_id);
				} else {
					$('input[name=prre_pass]').val(null);
				}
				var prre_pass = $('input[name=prre_pass]').val();
				$(location).attr('href','${pageContext.request.contextPath}/prre/insertPrre.do?pr_num=${project.pr_num}&mem_id=${USER_LOGININFO.mem_id}&prre_content='+content + '&prre_pass='+prre_pass);
			}
		});
		
		$('.can').on("click",function(){
			$('#qq').remove();
			$('#qw').remove();	
			$('.can').hide();
			$('.prre').show();
		});
		$('.can').hide();
		
		$('.prre').on("click",function(){	
			$('.can').hide();
			$('.prre').show();
			if(	$(this).parent().find('td:eq(7)').val() != null){
				$(this).parent().find('td:eq(7)').show();
				$(this).parent().find('td:eq(6)').hide();		
			}else if($(this).parent().find('td:eq(6)').val() != null){
				$(this).parent().find('td:eq(6)').show();
				$(this).parent().find('td:eq(5)').hide();					
			}else if($(this).parent().find('td:eq(6)').val() == null){
				$(this).parent().find('td:eq(4)').show();
				$(this).parent().find('td:eq(3)').hide();					
			}
			$('#qq').remove();
			$('#qw').remove();
			$('.con').show();
			var prrere = $(this).parent().find('input[name=prre_num]').val();
			var prseq = $(this).parent().find('input[name=prre_seq]').val();
			var prdepth = $(this).parent().find('input[name=prre_depth]').val();
			var prgroup = $(this).parent().find('input[name=prre_group]').val();
			var hi=$("<tr id='qw'><td><textarea id='re' style='width: 770px;'></textarea><button type='button' id='insertre' class='btn btn-secondary' style='height: 50px;'>답글</button><hr></td></tr>"+
					"<script>$('#insertre').click(function(){"+
					"var concon = $('#re').val();"+
					"var mem ='${USER_LOGININFO.mem_id}';"+
					"swal({"+
				      	  "title: '답글',"+
				      	  "text: '답글을 입력하시겠습니까?',"+
				      	  "icon: 'info',"+
				      	 " buttons: true,"+
				      	"})"+
					    ".then(function(result){"+ 
							"if (result) {"+
							"	$(location).attr('href','${pageContext.request.contextPath}/prre/insertPrreReply.do?prre_num="+prrere+"&pr_num=${project.pr_num}&prre_content='+concon+'&mem_id='+mem+'&prre_seq="+prseq+"&prre_depth="+prdepth+"&prre_group="+prgroup+"');"+
							"}else{"+
								"return;"+
							"}"+
						"});"+
			"	})</"+
			"script>");
			$(this).parent().next().after(hi);
		});
		
		$('.del').on("click",function(){
			var a = $(this).parent().find('input[name=prre_num]').val();
			swal({
		      	  title: "삭제",
		      	  text: "댓글을 삭제하시겠습니까?",
		      	  icon: "warning",
		      	  buttons: true,
		      	})
			    .then(function(result){ 
					if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/prre/prreDelete.do?prre_num='+a+'&pr_num=${project.pr_num}');
					}else{
						return;
					}
				});
		});
		
		$('.up').on("click",function(){
			$('.can').hide();
			$('.prre').show();
			$('#qq').remove();
			$('#qw').remove();
			$('.con').show();
			var sleep = $(this).parent().find('input[name=prre_num]').val();
			var b = $(this).parent().next().find('td:eq(0) input').val();
			$(this).parent().next().find('td:eq(0)').hide();
			var bye=("<td id='qq'><textarea style='width: 800px;' id='uparea'>"+b+"</textarea><button id='insertup' class='btn btn-secondary mr-5 mb-5 pull-right' style='height: 50px;'>수정</button></td>"+
			"<script>$('#insertup').click(function(){"+
			"var con = $('#uparea').val();"+
			"swal({"+
		      	  "title: '수정',"+
		      	  "text: '댓글을 수정하시겠습니까?',"+
		      	  "icon: 'info',"+
		      	 " buttons: true,"+
		      	"})"+
			    ".then(function(result){"+ 
					"if (result) {"+
					"	$(location).attr('href','${pageContext.request.contextPath}/prre/prreUpdate.do?prre_num="+sleep+"+&pr_num=${project.pr_num}&prre_content='+con);"+
					"}else{"+
						"return;"+
					"}"+
				"});"+
			"})</"+
			"script>");
			$(this).parent().next().find('td:eq(0)').after(bye);	
		});

	});
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item" href="${pageContext.request.contextPath }/project/projectList.do">프로젝트 목록</a> 
	<span class="breadcrumb-item active"> 
		<a>상세보기</a> 
	</span> 
</nav>
<c:if test="${USER_LOGININFO.iden_num eq '2' && signCnt eq '0' }">
<p class="p-10 bg-danger text-white"><strong>날인을 등록해야 지원 가능합니다.</strong></p>
</c:if>

	<div class="col-md-9">
		<div class="block">
			<div class="block-header">
				<div>
					<h2 class="col-md-30 font-size-h4 font-w700 "><label>${project.pr_title }</label></h2>
					<div class="col-md-30 font-size-sm ">${project.category}>
						${project.cate_Detail }</div>
				</div>
				<div class="block-options">
					<span class="badge badge-primary">마감 ${project.dday}일 전</span><br>
					<i class=" si si-note fa-1x"></i> 총 ${project.applicant }명 지원
				</div>

			</div>
			<hr>
			<br>
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

			<div class="block-content">
				<br>
				<h3 class="col-md-30 font-size-h5 font-w600 ">프로젝트 내용</h3>
				<pre>
${project.pr_content }
</pre>
				<br>
				<br>
				<br>

			</div>
			<div class="block-content block-content-full">
				<h3 class="col-md-30 font-size-h5 font-w600 ">관련 기술</h3>
				<c:forEach items="${project.techList}" var="tech">&nbsp;<span
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
	
	<div class="col-md-9">
		<div class="block ">
			<div class="block-header">
				<div class="project-register-content">
					<p class="btn btn-large btn-partners btn-project-application btn-block project-register-btn text-left" style="font-weight: bold">
						프로젝트 문의
					</p> <br>
					
		<div id="replyForm">
         <table id="table" class="col-md-12">
            <tbody>
            <c:forEach items="${prreList }" var="prre">
            <tr>
               <c:if test="${prre.pr_num eq project.pr_num && prre.prre_status eq 'y' || prre.prre_status == 'n' }">
	               <c:set var="aa" value="0"></c:set>
	               <c:set var="bb" value="0"></c:set>
	               <c:if test="${prre.prre_status == 'n' }">
	                  <c:forEach items="${prreList }" var="prreInfo">
	                     <c:if test="${prre.prre_group == prreInfo.prre_group && prreInfo.prre_status == 'y' && aa <= 0 && prre.prre_depth == 0}">
	                        <c:set var="aa" value="${aa + 1}"></c:set>
	                     <td style="width: 300px">   삭제된 댓글입니다.<hr></td>
	                     </c:if>
	                  </c:forEach>
	               </c:if>
	               <c:if test="${prre.prre_status == 'n' && prre.prre_depth >= 1}">
	                  <c:forEach items="${prreList }" var="prreInfo">
	                     <c:if test="${prre.prre_group == prreInfo.prre_group && prreInfo.prre_status == 'y' && bb <= 0 && prreInfo.prre_depth > prre.prre_depth && prreInfo.prre_seq eq prre.prre_seq+1 }">
	                        <c:set var="bb" value="${bb + 1}"></c:set>
	                     <td style="width: 300px">   
	                     <c:forEach begin="1" end="${prre.prre_depth }" varStatus="stat">
	                        &nbsp;&nbsp;&nbsp;
	                        <c:if test="${stat.last }">
	                           <i class="fa fa-angle-right "></i>
	                        </c:if>
	                     </c:forEach> &nbsp
	                          	삭제된 댓글입니다.<hr></td>
	                     </c:if>
	                  </c:forEach>
	               </c:if>
	               <c:if test="${prre.prre_status == 'y'}">
		               <td id="userId" style="width: 100px;"><input type="hidden" name="mem_id" value="${prre.mem_id }"/>
		                  <c:forEach begin="1" end="${prre.prre_depth }" varStatus="stat">
		                     &nbsp;&nbsp;&nbsp;
		                     <c:if test="${stat.last }">
		                        <i class="fa fa-angle-right "></i>
		                     </c:if>
		                  </c:forEach>
		                  
		               <c:forEach items="${reMember}" var="reMember"> 
			               <c:if test="${prre.mem_id eq reMember.mem_id && reMember.iden_num == '1' }">
			               	&nbsp&nbsp <a style="font-weight: bold;">${prre.mem_id }</a> &nbsp <span class="badge badge-primary">CLIENT</span> &nbsp ${prre.prre_date }
			               </c:if>
			               <c:if test="${prre.mem_id eq reMember.mem_id &&reMember.iden_num == '2' }">
			               	&nbsp&nbsp <a style="font-weight: bold;">${prre.mem_id }</a> &nbsp <span class="badge badge-success">FREELANCER</span> &nbsp ${prre.prre_date }
			               </c:if>
		               </c:forEach>
		               
		               </td>
		               <input type="hidden" name="prre_num" value="${prre.prre_num }"/>
		            	 <c:if test="${prre.mem_id eq USER_LOGININFO.mem_id }">
							 <td class="up"style="width: 50px;"><a class="btn">수정</a></td>
							 <td class="del"style="width: 50px;"><a class="btn">삭제</a></td>
						</c:if>
						<c:if test="${not empty sessionScope.USER_LOGININFO }">
							<td class="prre"style="width: 50px;"><a class="btn">답글</a></td>
							<td class="can"style="width: 70px;"><a class="btn">답글 취소</a></td>
						</c:if>
			               <input type="hidden" value="${prre.prre_status }"/>
			               <input type="hidden" name="prre_group" value="${prre.prre_group}"/>
			               <input type="hidden" name="prre_seq" value="${prre.prre_seq}"/>
			               <input type="hidden" name="prre_depth" value="${prre.prre_depth}"/>
		               </tr>
		               <tr id="co">
		               <td id="cont"class="con" style="width: 1000px;"><input type="hidden" name="prre_content" value="${prre.prre_content }"/>
		                  <c:forEach begin="1" end="${prre.prre_depth }" varStatus="stat">
		                     &nbsp;&nbsp;&nbsp;
		                     <c:if test="${stat.last }">
		                     </c:if>
		                  </c:forEach>
		                  <c:if test="${prre.prre_pass != null && (prre.mem_id eq USER_LOGININFO.mem_id || USER_LOGININFO.mem_id eq client.mem_id)}">
		                      &nbsp&nbsp&nbsp&nbsp <a style="font-weight: bold; color: red;">[나의 비밀 댓글 입니다.]</a> <br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${prre.prre_content }
		                  </c:if>
		                  <c:if test="${prre.prre_pass eq null}">
		                      &nbsp&nbsp&nbsp&nbsp ${prre.prre_content }
		                  </c:if>
		                  <c:if test="${prre.prre_pass != null && prre.mem_id != USER_LOGININFO.mem_id && USER_LOGININFO.mem_id != client.mem_id}">
		                  	  <a style="font-weight: bold; color: red;">&nbsp&nbsp&nbsp&nbsp [비밀 댓글 입니다.]</a>
		                  </c:if>
		               <hr></td>
               	 </c:if>
               </c:if>
            </tr>
            </c:forEach>
            </tbody>
         </table>
          <div>
          <br>
			<c:if test="${not empty sessionScope.USER_LOGININFO }">

			<div>
				<span>
					<textarea id="area" rows="3" cols="130"></textarea>
				</span>
				<div id="secret" style="float: right;">
			      	<label  class="css-control css-control-sm css-control-secondary css-checkbox" style="font-weight: bold;" >
	                      <input type="checkbox" class="css-control-input">
	                      <input type="hidden" name="prre_pass">
	                      <span class="css-control-indicator"></span>&nbsp<i class="si si-lock"> 비밀글</i>
	                  </label><br>
				<span>
					<button type="button" id="insert" class="btn btn-alt-primary min-width-100 min-height-30 js-click-ripple-enabled" name="int">댓글등록</button>
				</span>
				</div>	
			</div>	
				
			</c:if>
			</div>
         
         </div>
         
				</div>
			</div>
		</div>
	</div>
	
	

         
         
	
	<c:if test="${not empty sessionScope.USER_LOGININFO}">
	<input type="hidden" id="mem_id" name="mem_id" value="${USER_LOGININFO.mem_id }">
	<c:if test="${sessionScope.USER_LOGININFO.iden_num eq 2}">
	<div class="col-md-2" style="position: fixed; top: 155px; left: 1450px;">
			<button type="button" id="addInterest"
				class="btn btn-square btn-alt-warning min-width-300 mb-10">관심 프로젝트 추가하기</button>
			<br>
			<c:if test="${signCnt eq 0 }">
			<button type="button" id="apply"
				class="btn btn-square btn-alt-primary min-width-300 mb-20" disabled="disabled">프로젝트 지원하기</button>
			</c:if>
			<c:if test="${signCnt ne 0 }">
			<button type="button" id="apply"
				class="btn btn-square btn-alt-primary min-width-300 mb-20">프로젝트 지원하기</button>
			</c:if>
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