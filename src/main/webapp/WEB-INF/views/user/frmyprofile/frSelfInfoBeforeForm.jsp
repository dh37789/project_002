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
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	$('#btnInsert').click(function(){
    	location.href = "${pageContext.request.contextPath}/freProfile/selfInfoForm.do";
    });
	
	$('#btnProfile').click(function(){
    	location.href = "${pageContext.request.contextPath}/freProfile/frmyProfileList.do?mem_id=${USER_LOGININFO.mem_id}";
    });
	
})
</script>
<body>
<div class="content">
                    <!-- 자기소개 -->
                    <h2 class="content-heading">
                        <button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnProfile" name="btnProfile">내 프로필에서 보기</button>
                        <i class="si si-briefcase mr-5"></i> 자기소개
                    </h2>
                    <div class="row items-push">
                        <div class="col-md-8 col-xl-12">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center">
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/reunion.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'자기소개'</strong>가 없습니다.
									</p>
									<button type="button" class="btn btn-alt-primary" id="btnInsert" name="btnInsert">자기 소개 등록하기</button>
                            </div>
                        </div>
                    </div>
              </div>
</body>
</html>


