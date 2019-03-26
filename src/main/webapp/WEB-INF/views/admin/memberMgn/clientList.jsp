<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.deleteMember').click(function(){
		var mem_id = $(this).parents('tr').find('.tdid').text();
		var iden_num = $(this).parents('tr').find('input[name=mem_iden]').val();

		$(location).attr('href', '${pageContext.request.contextPath}/memberMgn/deleteMember.do?mem_id='+mem_id + '&iden_num='+iden_num);
	});
	
	
// 	$('table tr:gt(0)').click(function(){
// 		var rnum = $(this).find('td:eq(0)').text();
// 		var mem_id = $(this).find('td:eq(2)').text();
// 		$(location).attr('href','${pageContext.request.contextPath}/memberMgn/memberView.do?mem_id='+ mem_id+'&rnum='+rnum);
// 	});

	$('.memberInfo').click(function(){
		var mem_id = $(this).parents('tr').find('.tdid').text();
		var iden_num = $(this).parents('tr').find('input[name=mem_iden]').val();
		var status_num = $(this).parents('tr').find('input[name=status]').val();
		
		
			$(location).attr('href', '${pageContext.request.contextPath}/memberMgn/memberView.do?mem_id='+mem_id + '&iden_num='+iden_num + '&status_num='+status_num);
	});
	
	$('.addBlack').click(function(){
		var mem_id = $(this).parents('tr').find('.tdid').text();
		var iden_num = $(this).parents('tr').find('input[name=mem_iden]').val();
		
		$(location).attr('href', '${pageContext.request.contextPath}/memberMgn/addBlack.do?mem_id='+mem_id + '&iden_num='+iden_num);
	});
	
// 	$('table tr:gt(0)').click(function(){
// 		var rnum = $(this).find('td:eq(0)').text();
// 		var mem_id = $(this).find('td:eq(2)').text();
// 		var location = "clientView.do";
		
// 		if(iden_num = "2") {
// 			location = "freelancerView.do";
// 		}
// 		$(location).attr(
// 				'href','${pageContext.request.contextPath}/memberMgn/'+ location + '?mem_id='+ mem_id + '&rnum=' + rnum);
// 	});
});
</script>
</head>
<body>

<nav class="breadcrumb bg-white push">
	<a class="breadcrumb-item" >회원 관리</a> 
	<span class="breadcrumb-item active">클라이언트</span> 
</nav>

    <h2 class="content-heading">클라이언트 관리 <small>Client</small></h2>
    
                    <div>
						<form action="${pageContext.request.contextPath }/memberMgn/clientMgn.do" method="post" class="form-inline pull-right">
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
						    <button type="submit" class="btn btn-primary form-control">검색</button>
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
                                <c:forEach items="${clientList }" var="client">
                                    <tr>
                                        <input type="hidden" name="mem_iden" value="${client.iden_num }"/>
                                        <td class="text-center" scope="row" name="mem_rnum">${client.rnum }</td>
                                        <td></td>
                                        <td class="tdid">${client.mem_id }</td>
                                        <td>${client.mem_name }</td>
                                        <td>${client.mem_mail }</td>
                                        <td>${client.mem_add1 } ${client.mem_add2 }</td>
                                <!-- 클라이언트 & 일반 -->
                                <c:if test="${client.iden_num == '1' && client.status_num == '0'}">        
                                        <td class="d-none d-sm-table-cell status" >
                                        <input type="hidden" name="status" value="${client.status_num }" >
                                            <span class="badge badge-primary">CLIENT</span>
                                        </td>
                                 </c:if>
                                <!-- 클라이언트 & 탈퇴신청 -->       
                                <c:if test="${client.iden_num == '1' && client.status_num == '1'}">        
                                        <td class="d-none d-sm-table-cell status">
                                        <input type="hidden" name="status" value="${client.status_num }" >
                                       		<span class="badge badge-primary">CLIENT</span>
                                            <span class="badge badge-warning">탈퇴신청</span>
                                        </td>
                                 </c:if>
                                 <!-- 클라이언트 & 블랙리스트 -->   
                                 <c:if test="${client.iden_num == '1' && client.status_num == '2'}">       
                                        <td class="d-none d-sm-table-cell status">
                                        <input type="hidden" name="status" value="${client.status_num }" >
                                            <span class="badge badge-primary">CLIENT</span>
                                            <span class="badge badge-danger">블랙리스트</span>
                                        </td>    
                                 </c:if>
                                 		<td>
											<button type="submit" class="btn btn-secondary memberInfo">
                                    			<i class="fa fa-search " ></i>
                               				</button>		                                 		
                                 		</td>
                                 <!-- 클라이언트 & 일반인 경우 BlackList 등록 토글 생성 -->  
                                 <c:if test="${client.iden_num == '1' && client.status_num == '0' }">  
                                        <td class="text-center btn1" >
                                        <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle" id="btnGroupVerticalDrop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Select</button>
                                                <div class="dropdown-menu addBlack" aria-labelledby="btnGroupVerticalDrop1">
                                                    <a class="dropdown-item">
                                                        <i class="fa fa-check" id="addBlack">&nbsp;&nbsp;</i>BlackList 등록
                                                    </a>
                                                </div>
                                          </div>
                                        </td>
                                  </c:if>
								 <!-- 탈퇴신청자일 경우 deleteMember 토글 생성 -->
                                 <c:if test="${client.status_num == '1' }">  
                                        <td class="text-center btn1" >
                                        <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle" id="btnGroupVerticalDrop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Select</button>
                                                <div class="dropdown-menu deleteMember" aria-labelledby="btnGroupVerticalDrop1">
                                                    <a class="dropdown-item">
                                                        <i class="fa fa-check" id="deleteMember">&nbsp;&nbsp;</i>탈퇴 승인
                                                    </a>
                                          		</div>
                                         </div>
                                        </td>
                                  </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            ${paging }
                        </div>

</body>
</html>