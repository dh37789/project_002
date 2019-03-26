<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#joinCl').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/member/clMemberForm.do?');
	})
	$('#joinFr').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/member/frMemberForm.do?');
	})
})
</script>
</head>
<body>
 <div class="content">
    <!-- Modern Design -->
    <h2 class="content-heading"> 회원가입 <small>Client / Freelancer</small></h2>
    <div class="col-md-12 justify-content-center in row">
        <div class="col-md-6 col-xl-4">
            <a class="block block-link-pop block-rounded block-bordered text-center" href="javascript:void(0)">
                <div class="block-header">
                    <h3 class="block-title">클라이언트</h3>
                </div>
                <div class="block-content">
                    <div class="h2 font-w500 mb-10">Client</div>
                </div>
                <img src="${pageContext.request.contextPath}/image/client.png" width="100px" height="105px"></img>
                <div class="block-content block-content-full">
                    <button id="joinCl" class="btn btn-hero btn-sm btn-rounded btn-noborder btn-success">가입하기</button>
                </div>
            </a>
        </div>
        
        
        <div class="col-md-6 col-xl-4">
            <a class="block block-link-pop block-rounded block-bordered text-center" href="javascript:void(0)">
                <div class="block-header">
                    <h3 class="block-title">프리랜서</h3>
                </div>
                <div class="block-content">
                    <div class="h2 font-w500 mb-10">Freelancer</div>
                </div>
                <img src="${pageContext.request.contextPath}/image/freelancer.png" width="100px" height="105px"></img>
                <div class="block-content block-content-full">
                    <button id="joinFr" class="btn btn-hero btn-sm btn-rounded btn-noborder btn-primary">가입하기</button>
                </div>
            </a>
        </div>
    </div>
    </div>
</body>
</html>