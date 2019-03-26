<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.mem_all').click(function(){
		var iden_num;
		$(location).attr('href', '${pageContext.request.contextPath}/memberMgn/blackMgn.do');
	});
	$('.mem_client').click(function(){
		var iden_num = '1';
		$(location).attr('href', '${pageContext.request.contextPath}/memberMgn/blackMgn.do?iden_num='+iden_num);
	});
	$('.mem_freelancer').click(function(){
		var iden_num = '2';
		$(location).attr('href', '${pageContext.request.contextPath}/memberMgn/blackMgn.do?iden_num='+iden_num);
	});
	
	$('.memberInfo').click(function(){
		var mem_id = $(this).parents('tr').find('.tdid').text();
		var iden_num = $(this).parents('tr').find('input[name=mem_iden]').val();
		var status_num = $(this).parents('tr').find('input[name=status]').val();
		
			$(location).attr('href', '${pageContext.request.contextPath}/memberMgn/blackListView.do?mem_id='+mem_id + '&iden_num='+iden_num + '&status_num='+status_num);
	});
	
	$('.removeBlack').click(function(){
		var mem_id = $(this).parents('tr').find('.tdid').text();
		
		iden_num = $(this).parents('tr').find('input[name=mem_iden]').val();
		
		$(location).attr('href', '${pageContext.request.contextPath}/memberMgn/removeBlack.do?mem_id='+mem_id + '&iden_num='+iden_num);
	});
	
});
</script>
</head>
<body>

<nav class="breadcrumb bg-white push">
	<a class="breadcrumb-item" >회원 관리</a> 
	<span class="breadcrumb-item active">블랙리스트</span> 
</nav>

<!-- Main Container -->
 <!-- Page Content -->
    <h2 class="content-heading">블랙리스트 관리 <small>Blacklist</small></h2>
    <br>
    
		    	<div class="col-sm-2 col-xl-5 float-left">
		        	<button type="button" class="btn btn-rounded btn-noborder btn-black min-width-50 mb-10 mem_all" id="mem_client" name="mem_all">전체</button>
		        	<button type="button" class="btn btn-rounded btn-noborder btn-primary min-width-50 mb-10 mem_client" id="mem_client" name="mem_client">CLIENT</button>
		        	<button type="button" class="btn btn-rounded btn-noborder btn-success min-width-50 mb-10 mem_freelancer" id="mem_freelancer" name="mem_freelancer">FREELANCER</button>
		        </div>
		        
                    <div>
						<form action="${pageContext.request.contextPath }/memberMgn/search.do" method="post" class="form-inline pull-right">
						<input type="hidden" name="iden_num"/>
							<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
							<select class="form-control" name="search_keycode" >
								<option value="null">검색조건</option>
								<option value="TOTAL">전체</option>
								<option value="ID">아이디</option>
								<option value="NAME">이름</option>
								<option value="MAIL">이메일</option>
								<option value="ADDRESS1">주소</option>
								<option value="ADDRESS2">상세주소</option>
							</select>
						    <button type="submit" value="iden_num" class="btn btn-primary form-control mem_search">검색</button>
						</form>
                    </div>
                    <br><br>  
    
    <div class="block-content">
                            <table class="table table-hover table-vcenter" style="background-color: white;">
                                <thead class="thead-light">
                                    <tr>
                                        <th class="text-center" style="width: 50px;">#</th>
                                        <th></th>
                                        <th>아이디</th>
                                        <th>이름</th>
                                        <th>이메일</th>
                                        <th>주소</th>
                                        <th class="d-none d-sm-table-cell" style="width: 15%;">회원 분류</th>
                                        <th>상세 정보</th>
                                        <th class="text-center" style="width: 100px;">상태 변경</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${blackList }" var="black">
                                    <tr>
                                        <input type="hidden" name="mem_iden" value="${black.iden_num }"/>
                                        <th class="text-center" scope="row">${black.rnum }</th>
                                        <td></td>
                                        <td class="tdid">${black.mem_id }</td>
                                        <td>${black.mem_name }</td>
                                        <td>${black.mem_mail }</td>
                                        <td>${black.mem_add1 } ${black.mem_add2 }</td>
                                 <!-- 클라이언트 & 블랙리스트 -->     
                                 <c:if test="${black.iden_num == '1' && black.status_num == '2' }">       
                                        <td class="d-none d-sm-table-cell status">
                                        <input type="hidden" name="status" value="${black.status_num }" >
                                            <span class="badge badge-primary">CLIENT</span>
                                            <span class="badge badge-danger">블랙리스트</span>
                                        </td>    
                                 </c:if>
                                 <!-- 클라이언트 & 일반 -->
                                 <c:if test="${black.iden_num == '1' && black.status_num == '0' }">       
                                        <td class="d-none d-sm-table-cell">
										<input type="hidden" name="status" value="${black.status_num }" >                                        
                                            <span class="badge badge-primary">CLIENT</span>
                                        </td>
                                 </c:if>
                                 <!-- 프리랜서 & 블랙리스트 -->
                                 <c:if test="${black.iden_num == '2' && black.status_num == '2' }">       
                                        <td class="d-none d-sm-table-cell">    
                                        <input type="hidden" name="status" value="${black.status_num }" >
                                            <span class="badge badge-success">FREELANCER</span>
                                            <span class="badge badge-danger">블랙리스트</span>
                                        </td>
                                 </c:if>
                                 <!-- 프리랜서 & 일반 -->
                                 <c:if test="${black.iden_num == '2' && black.status_num == '0' }">       
                                        <td class="d-none d-sm-table-cell">     
                                            <span class="badge badge-success">FREELANCER</span>
                                        </td>
                                 </c:if>
                                 <!-- 프리랜서 & 탈퇴신청 -->
                                 <c:if test="${black.iden_num == '1' && black.status_num == '1' }">       
                                        <td class="d-none d-sm-table-cell">     
                                            <span class="badge badge-primary">CLIENT</span>
<!--                                             <span class="badge badge-warning">탈퇴신청</span> -->
                                        </td>
                                 </c:if>
                                 <!-- 프리랜서 & 블랙리스트 -->
                                 <c:if test="${black.iden_num == '2' && black.status_num == '1' }">       
                                        <td class="d-none d-sm-table-cell">     
                                            <span class="badge badge-success">FREELANCER</span>
<!--                                             <span class="badge badge-warning">탈퇴신청</span> -->
                                        </td>
                                 </c:if>
                                 		<td>
											<button type="submit" class="btn btn-secondary memberInfo">
                                    			<i class="fa fa-search " ></i>
                               				</button>		                                 		
                                 		</td>                                 
                                 <!-- 블랙리스트일 경우 BlackList 제거 토글 생성 -->
                                 <c:if test="${black.status_num == '2'}">  
                                        <td class="text-center">
                                        <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle" id="btnGroupVerticalDrop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Select</button>
                                                <div class="dropdown-menu removeBlack" aria-labelledby="btnGroupVerticalDrop1" id="removeBlack">
                                                    <a class="dropdown-item">
                                                        <i class="fa fa-check" id="removeBlack">&nbsp;&nbsp;</i>BlackList 제거
                                                    </a>
                                                </div>
                                          </div>
                                        </td>
                                  </c:if>
                                    </tr>
                                </c:forEach>    
                                </tbody>
                            </table>
							${paging}                       
                    </div>
                    <!-- END Table Head Default -->
 <!-- END Page Content -->
</body>
</html>