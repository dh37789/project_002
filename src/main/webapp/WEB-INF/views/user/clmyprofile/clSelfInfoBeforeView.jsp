<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(function(){
	$('#btnProfile').click(function(){
    	location.href = "${pageContext.request.contextPath}/clProfile/clMyProfileList.do?mem_id=${USER_LOGININFO.mem_id}";
    });
	$('#btnEdit').click(function(){
    	location.href = "${pageContext.request.contextPath}/clProfile/selfInfoView.do?mem_id=${USER_LOGININFO.mem_id}";
    });
	
})
</script>
<body>
<div class="content">
                    <!-- 자기소개 -->
                    <h2 class="content-heading"><img src="${pageContext.request.contextPath}/image/1.png" width="25px">
					<button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnProfile" name="btnProfile">내 프로필에서 보기</button>
						&nbsp; 클라이언트 정보
					</h2>
                    <div class="row items-push">
                        <div class="col-md-12">
                            <div class="block block-themed">
                                <div class="block-content">
                                <p><a class="badge badge-warning">자기 소개</a>&nbsp ${memberInfo.mem_selfinfo}</p>
                            <p><a class="badge badge-warning">홈페이지</a>&nbsp ${memberInfo.mem_url}</p>
                            </div>
                            <div class="btn-wrapper pull-right">
								<br><button type="button" class="btn btn-primary min-width-125" id="btnEdit" name="btnEdit">수정</button>
							</div>
                        </div>
                    </div>
                    </div>
              </div>
</body>
</html>

