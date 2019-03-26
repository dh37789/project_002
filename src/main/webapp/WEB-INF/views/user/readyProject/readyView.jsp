<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('tr').click(function(){
		var mem_id = $(this).find('td:eq(0) input:eq(0)').val();
		var pr_num = $(this).find('td:eq(0) input:eq(1)').val();
		if (pr_num == null) {
			return;
		}
		$(location).attr('href','${pageContext.request.contextPath}/readyProject/readyCon.do?mem_id='+mem_id + '&pr_num=' + pr_num )
	})
	$('#payment').click(function(){
		var pr_num = $('table').find('td:eq(0) input:eq(1)').val();
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{pr_num : pr_num},
	         url:'${pageContext.request.contextPath}/readyProject/contractPay.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
				$('#modal_payment').modal('show');
				$('#pay').text('결제 금액 : ' + result.totalMoney + '원')
				$('#money').val(result.totalMoney);
	         }
	      });
	});
	$('#payOk').click(function(){
		var pr_num = $('table').find('td:eq(0) input:eq(1)').val();
		$(location).attr('href','${pageContext.request.contextPath}/readyProject/payOk.do?pr_num=' + pr_num )
	});
});
</script>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/readyProject/projectList.do">준비중인 프로젝트</a> 
	</span> 
	<span class="breadcrumb-item active"> 
		<a">계약정보</a> 
	</span> 
</nav>

<div class="block">
	<div class="block-header block-header-default">
		<h3 class="block-title">※ 계약 주의 사항 ※</h3>
	</div>
	<div class="block-content">
		<p>계약금 결제는 모든 계약이 종료된 후에 진행해주세요.</p>
		<div class="text-center">
		</div>
	</div>
</div>
<h2 class="content-heading font-w400">${projectInfo.pr_title }<small> ${fn:length(conList) }명이 계약중 입니다.</small>
<c:if test="${fn:length(conList) ne conChk }">
<button id="payment" class="btn btn-alt-primary pull-right" data-toggle="click-ripple" value="${conInfo.cons_num}" disabled="disabled">계약금 결제</button>
</c:if>
<c:if test="${fn:length(conList) eq conChk }">
<c:if test="${empty projectInfo.pr_check }">
<button id="payment" class="btn btn-alt-primary pull-right" data-toggle="click-ripple" value="${conInfo.cons_num}">계약금 결제</button>
</c:if>
<c:if test="${not empty projectInfo.pr_check }">
<button id="payment" class="btn btn-alt-danger pull-right" data-toggle="click-ripple" value="${conInfo.cons_num}" disabled="disabled">대금 결제 완료</button>
</c:if>
</c:if>
</h2>
<div class="col-md-12 row">
<div class="col-md-1">
</div>
<div class="col-md-10">
<c:forEach items="${conList }" var="conInfo">
 <table class="table bg-white " height="auto" style="border: 1px dotted #d2e7f5" >
   <tbody>
	<tr>
	<td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
	<input type="hidden" value="${conInfo.MEM_ID }">
	<input type="hidden" value="${conInfo.AP_PROJECT }">
		<div class="mb-10">
			<a href="#"> 
			<c:choose>
					<c:when test="${conInfo.MEM_PICTURE eq null }">
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:when>
					<c:otherwise>
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/files/${conInfo.MEM_PICTURE }" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:otherwise>
				</c:choose>
			</a>
		</div> 
		${conInfo.MEM_ID }
		<br>
		<small>
			<c:choose>
				<c:when test="${conInfo.FTYPE_NUM == '0' }">
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
				<c:when test="${conInfo.MTYPE_NUM=='0' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_0.png" width="25px">
					개인
				</c:when>
				<c:when test="${conInfo.MTYPE_NUM=='1' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_1.png" width="25px">
					팀
				</c:when>
				<c:when test="${conInfo.MTYPE_NUM=='2' }">
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
		<br>
		<p class="font-size-md">
		<img src="${pageContext.request.contextPath}/image/coin.png" width="25px">
		지원금액 : <span class="badge badge-primary">${conInfo.AP_PAYMENT }원</span>
		<c:if test="${conInfo.CONS_STATUS eq '0' }">
		<button class="btn btn-hero btn-alt-primary text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">계약 정보 입력 중</button>
		</c:if>
		<c:if test="${conInfo.CONS_STATUS eq '1' }">
		<button class="btn btn-hero btn-alt-warning text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">프리랜서 날인</button>
		</c:if>
		<c:if test="${conInfo.CONS_STATUS eq '2' }">
		<button class="btn btn-hero btn-alt-warning text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">클라이언트 날인</button>
		</c:if>
		<c:if test="${conInfo.CONS_STATUS eq 'y' }">
		<button class="btn btn-hero btn-alt-success text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">계약 완료</button>
		</c:if>
		</p>
		<hr>
		<p class="font-size-sm text-muted" style="width: 90%;">${conInfo.AP_CONTENT }</p>
	</td>
	</tr>
 </tbody>
 </table>
</c:forEach>
</div>
<div class="col-md-1">
</div>
</div>
<!-- Fade In Modal -->
<div class="modal fade" id="modal_payment" tabindex="-1" role="dialog" aria-labelledby="modal-fadein" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="block block-themed block-transparent mb-0">
                <div class="block-header bg-primary-dark">
                    <h3 class="block-title">Papillon 프로젝트 결제창</h3>
                    <div class="block-options">
                        <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                            <i class="si si-close"></i>
                        </button>
                    </div>
                </div>
                <div class="block-content">
                	<div class="block">
<!-- 						<div class="block-header block-header-default"> -->
<!-- 							<h3 class="block-title">※ 계약 주의 사항 ※</h3> -->
<!-- 						</div> -->
						<div class="block-content" style="background-color: #e6f0ff;">
						<ul class="list-unstyled">
							<li>판매자 : Papillon(주)</li>
							<li id="pay">결제 금액 : 원</li>
						</ul>
							<div class="text-center">
							</div>
						</div>
					</div>
					<!-- Normal Form -->
                    <form action="#" method="post" onsubmit="return false;">
                        <div class="form-group">
                            <label for="example-nf-password">결제 금액</label>
                            <input type="text" id="money" class="form-control" disabled="disabled">
                        </div>
                        <div class="form-group">
                            <label for="example-nf-password">결제 은행</label>
                            <select class="form-control">
                            <option value="">은행 선택</option>
                            <option value="0">NH농협은행</option>
                            <option value="1">신한은행</option>
                            <option value="2">우리은행</option>
                            <option value="3">하나은행</option>
                            <option value="4">IBK기업은행</option>
                            <option value="5">KB국민은행</option>
                            <option value="6">KEB외환은행</option>
                            </select>
                        </div>
                        <label for="example-nf-email">카드 번호</label>
                        <div class="form-group row">
                            <div class="col-3">
                                <input type="text" class="form-control">
                            </div>
                            <div class="col-3">
                                <input type="text" class="form-control">
                            </div>
                            <div class="col-3">
                                <input type="password" class="form-control">
                            </div>
                            <div class="col-3">
                                <input type="password" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="example-nf-password">카드 비밀번호</label>
                            <input type="password" class="form-control">
                        </div>
                    </form>
                    <!-- END Normal Form -->
<!-- 						<ul class="list-unstyled" style="vertical-align: top;"> -->
<!-- 							<li>카드 번호 : <input type="text" style="width: 50px; height: 25px;">-<input type="text" style="width: 50px; height: 25px;">-<input type="text" style="width: 50px; height: 25px;">-<input type="text" style="width: 50px; height: 25px;"></li> -->
<!-- 							<li id="pay">결제 금액 : 원</li> -->
<!-- 						</ul> -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-alt-success" data-dismiss="modal" id="payOk">
                    <i class="fa fa-check"></i> 결제 완료
                </button>
            </div>
        </div>
    </div>
</div>
<!-- END Fade In Modal -->
</body>
</html>