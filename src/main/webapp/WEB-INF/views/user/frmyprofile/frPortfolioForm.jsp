<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	$('#btnCancel').click(function(){
		location.href = "${pageContext.request.contextPath}/freProfile/portfolioBeforeForm.do?mem_id=${USER_LOGININFO.mem_id }";
	})
	
	$('#po_cate').on('change', function () {
// 		$('#po_cate_num option[value=""]').attr('selected','selected');
		if($("#po_cate option:selected").val() == 1){
			var	option1 ="<option value='1'>웹</option>"+
			"<option value='2'>어플리케이션</option>"+
			"<option value='3'>워드프레스</option>"+
			"<option value='4'>퍼블리싱</option>"+
			"<option value='5'>일반 소프트웨어</optio"+
			"<option value='6'>커머스, 쇼핑몰</option"+
			"<option value='7'>게임</option>"+
			"<option value='8'>임베디드</option>"+
			"<option value='9'>기타</option>";

			$('#po_cate_num').empty().append(option1);
			
		}else{
			
			var option2 ="<option value='10'>웹</option>"+
						"<option value='11'>어플리케이션</option>"+    
						"<option value='12'>제품</option>"+
						"<option value='13'>프레젠테이션</option>"+    
						"<option value='14'>인쇄물</option"+ 
						"<option value='15'>커머스, 쇼핑몰</optio"+    
						"<option value='16'>로고</option>"+
						"<option value='17'>그래픽</option>"+ 
						"<option value='18'>영상</option>"+
						"<option value='19'>게임</option>"+
						"<option value='21'>임베디드</option>"+  
						"<option value='20'>기타</option>";
		
	 					$('#po_cate_num').empty().append(option2);	
			
		  }
	});
	
	var languages = ["PhotoShop", "CSS", "hybridapp",
				"HTML", "Android", "JSP",
				"ORACLE", "SQL", "DB",
				"C", "C++", "C#",
				"Visual Basic", "Java", "JavaScript",
				"Python", "R", "PHP", "어셈블리어",
				"CoffeeScript", "ABAP", "D",
				"Prolog", "Ruby", "Rust",
				"Scala", "파스칼", "Perl",
				"Objective-C", "Go", "Forth",
				"기타", "firmware", "HW설계", "IOS",
				"Unity", "OpenCV"];

	$("#lang_tech").autocomplete({
	         		
		source: languages,
// 		matchContains: true,
// 		selectFirst : ture
	         	
	});

	
	
	
	
	
	$('#btnSave').click(function(){
		var po_start = $('select[name=po_start_year]').val()+'-'+$('select[name=po_start_month]').val()+ '-01';
		var po_end = $('select[name=po_end_year]').val()+'-'+$('select[name=po_end_month]').val()+ '-01';
		var po_start2 = $('select[name=po_start_year]').val()+$('select[name=po_start_month]').val();
		var po_end2 = $('select[name=po_end_year]').val()+$('select[name=po_end_month]').val();
		
		if($('input[name=po_title]').val() ==''){
			swal("경고","제목을 입력해주세요.", "error");
			return;
		}
		
		if($('select[name=po_cate]').val() ==''){
			swal("경고","카테고리를 선택해주세요.", "error");
			return;
		}
		
		if($('select[name=po_cate_num]').val() ==''){
			swal("경고","세부 카테고리를 선택해주세요.", "error");
			return;
		}
		
		if($('textarea[name=po_content]').val() ==''){
			swal("경고","설명을 입력해주세요.", "error");
			return;
		}
		
		if($('select[name=po_start_year]').val() ==''){
			swal("경고","참여 시작일 연도를 선택해주세요.", "error");
			return;
		}
		
		if($('select[name=po_start_month]').val() ==''){
			swal("경고","참여 시작일 월을 선택해주세요.", "error");
			return;
		}
		
		if($('select[name=po_end_year]').val() ==''){
			swal("경고","참여 종료일 연도를 선택해주세요.", "error");
			return;
		}
		
		if($('select[name=po_end_month]').val() ==''){
			swal("경고","참여 종료일 월을 선택해주세요.", "error");
			return;
		}
		
		if($('input[name=po_percent]').val() ==''){
			swal("경고","참여율을 입력해주세요.", "error");
			return;
		}
		
		if($('select[name=part_num]').val() ==''){
			swal("경고","역할을 선택해주세요.", "error");
			return;
		}
		
		if($('input[name=portFile]').val() ==''){
			swal("경고","첨부할 이미지 파일을 선택해주세요.", "error");
			return;
		}
		
		if($('input[name=lang_tech]').val() ==''){
			swal("경고","관련 기술을 입력해주세요.", "error");
			return;
		}
		
		if(po_start2>po_end2){
			swal("경고","퇴사일이 입사일보다 빠를수 없습니다.", "error"); 
			return;
		}
		
		
		
		swal({
	      	  title: "알림",
	      	  text: "포트폴리오를 작성하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){
					if (result){
						
						
						$('#portFolioForm').append('<input type="hidden" name="po_start" value="' + po_start + '">');
						$('#portFolioForm').append('<input type="hidden" name="po_end" value="' + po_end + '">');
						$('#portFolioForm').submit();
						
					}else{
						return;
					}
			});
		
	});
		
		
		
	
});
function chk_file_type(obj) {
	 var file_kind = obj.value.lastIndexOf('.');
	 var file_name = obj.value.substring(file_kind+1,obj.length);
	 var file_type = file_name.toLowerCase();

	 var check_file_type = ['jpg','gif','png','jpeg','bmp'];
	 
	 if(check_file_type.indexOf(file_type)==-1){
		 swal("경고","이미지파일만 업로드 할 수 있습니다.", "error");
	  $("input[name=portFile]").val("");
	  var parent_Obj=obj.parentNode
	  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
	  return false;
	 }
	}
</script>
<body>
	<div class="content">
		<!-- Bootstrap Forms Validation -->
		<h2 class="content-heading">포트폴리오 작성</h2>
		<div class="block">
			<div class="block-content">
				<div class="row justify-content-center py-20">
					<div class="col-xl-7">
						<!-- jQuery Validation (.js-validation-bootstrap class is initialized in js/pages/be_forms_validation.js) -->
						<!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->
						<form id="portFolioForm" class="js-validation-bootstrap" action='${pageContext.request.contextPath }/freProfile/insertPortfolio.do' method="post" enctype="multipart/form-data">
							<div id="idVal" class="form-group row">
								<label class="col-lg-2 col-form-label" for="val-userid">제목
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="po_title"
										name="po_title" >
								</div>
							</div>
							
							<div class="form-group row" id="select_div">
								<label class="col-lg-2 col-form-label" for="val-password">카테고리
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-5">
                                                <select class="form-control" id="po_cate" name="po_cate" onchange="po_cate">
                                                	<option selected="selected" value="">카테고리</option>
                                                	<option value='0'>개발</option>
	 				 								<option value='1'>디자인</option>
		                                        </select>
                                            </div>
                                            <div class="col-lg-5">
		                                        <select class="form-control" id="po_cate_num" name="po_cate_num">
		                                          <option selected="selected" value="">세부 카테고리</option>
		                                        </select>
                                            </div>
							</div>
							
							<div class="form-group row">
                                <label class="col-lg-2 col-form-label" for="val-password">설명
									<span class="text-danger">*</span>
								</label>
	                            <div class="col-lg-10">
	                                <textarea class="form-control" id="po_content" name="po_content" rows="6" ></textarea>
	                            </div>
                            </div>
							
							
							<div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="val-username">참여 시작일
												<span class="text-danger">*</span>
											</label>
                                            <div class="col-lg-5">
                                                <select class="form-control" id="po_start_year" name="po_start_year">
                                                	<option selected="selected" value="">연도</option>
                                                    <option value="1970">1970</option>
                                                    <option value="1971">1971</option>
                                                    <option value="1972">1972</option>
                                                    <option value="1973">1973</option>
                                                    <option value="1974">1974</option>
                                                    <option value="1975">1975</option>
                                                    <option value="1976">1976</option>
                                                    <option value="1977">1977</option>
                                                    <option value="1978">1978</option>
                                                    <option value="1979">1979</option>
                                                    <option value="1980">1980</option>
                                                    <option value="1981">1981</option>
                                                    <option value="1982">1982</option>
                                                    <option value="1983">1983</option>
                                                    <option value="1984">1984</option>
                                                    <option value="1985">1985</option>
                                                    <option value="1986">1986</option>
                                                    <option value="1987">1987</option>
                                                    <option value="1988">1988</option>
                                                    <option value="1989">1989</option>
                                                    <option value="1990">1990</option>
                                                    <option value="1991">1991</option>
                                                    <option value="1992">1992</option>
                                                    <option value="1993">1993</option>
                                                    <option value="1994">1994</option>
                                                    <option value="1995">1995</option>
                                                    <option value="1996">1996</option>
                                                    <option value="1997">1997</option>
                                                    <option value="1998">1998</option>
                                                    <option value="1999">1999</option>
                                                    <option value="2001">2001</option>
                                                    <option value="2002">2002</option>
                                                    <option value="2003">2003</option>
                                                    <option value="2004">2004</option>
                                                    <option value="2005">2005</option>
                                                    <option value="2006">2006</option>
                                                    <option value="2007">2007</option>
                                                    <option value="2008">2008</option>
                                                    <option value="2009">2009</option>
                                                    <option value="2010">2010</option>
                                                    <option value="2011">2011</option>
                                                    <option value="2012">2012</option>
                                                    <option value="2013">2013</option>
                                                    <option value="2014">2014</option>
                                                    <option value="2015">2015</option>
                                                    <option value="2016">2016</option>
                                                    <option value="2017">2017</option>
                                                    <option value="2018">2018</option>
                                                    <option value="2019">2019</option>
		                                        </select>
                                            </div>
                                            <div class="col-lg-5">
		                                        <select class="form-control" id="po_start_month" name="po_start_month">
		                                                    <option selected="selected" value="">월</option>
		                                                    <option value="01">1</option>
		                                                    <option value="02">2</option>
		                                                    <option value="03">3</option>
		                                                    <option value="04">4</option>
		                                                    <option value="05">5</option>
		                                                    <option value="06">6</option>
		                                                    <option value="07">7</option>
		                                                    <option value="08">8</option>
		                                                    <option value="09">9</option>
		                                                    <option value="10">10</option>
		                                                    <option value="11">11</option>
		                                                    <option value="12">12</option>
		                                        </select>
                                            </div>
                            </div>
                            
							<div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="val-username">참여 종료일
												<span class="text-danger">*</span>
											</label>
                                            <div class="col-lg-5">
                                                <select class="form-control" id="po_end_year" name="po_end_year">
                                                	<option selected="selected" value="">연도</option>
                                                    <option value="1970">1970</option>
                                                    <option value="1971">1971</option>
                                                    <option value="1972">1972</option>
                                                    <option value="1973">1973</option>
                                                    <option value="1974">1974</option>
                                                    <option value="1975">1975</option>
                                                    <option value="1976">1976</option>
                                                    <option value="1977">1977</option>
                                                    <option value="1978">1978</option>
                                                    <option value="1979">1979</option>
                                                    <option value="1980">1980</option>
                                                    <option value="1981">1981</option>
                                                    <option value="1982">1982</option>
                                                    <option value="1983">1983</option>
                                                    <option value="1984">1984</option>
                                                    <option value="1985">1985</option>
                                                    <option value="1986">1986</option>
                                                    <option value="1987">1987</option>
                                                    <option value="1988">1988</option>
                                                    <option value="1989">1989</option>
                                                    <option value="1990">1990</option>
                                                    <option value="1991">1991</option>
                                                    <option value="1992">1992</option>
                                                    <option value="1993">1993</option>
                                                    <option value="1994">1994</option>
                                                    <option value="1995">1995</option>
                                                    <option value="1996">1996</option>
                                                    <option value="1997">1997</option>
                                                    <option value="1998">1998</option>
                                                    <option value="1999">1999</option>
                                                    <option value="2001">2001</option>
                                                    <option value="2002">2002</option>
                                                    <option value="2003">2003</option>
                                                    <option value="2004">2004</option>
                                                    <option value="2005">2005</option>
                                                    <option value="2006">2006</option>
                                                    <option value="2007">2007</option>
                                                    <option value="2008">2008</option>
                                                    <option value="2009">2009</option>
                                                    <option value="2010">2010</option>
                                                    <option value="2011">2011</option>
                                                    <option value="2012">2012</option>
                                                    <option value="2013">2013</option>
                                                    <option value="2014">2014</option>
                                                    <option value="2015">2015</option>
                                                    <option value="2016">2016</option>
                                                    <option value="2017">2017</option>
                                                    <option value="2018">2018</option>
                                                    <option value="2019">2019</option>
		                                        </select>
                                            </div>
                                            <div class="col-lg-5">
		                                        <select class="form-control" id="po_end_month" name="po_end_month">
		                                                    <option selected="selected" value="">월</option>
		                                                    <option value="01">1</option>
		                                                    <option value="02">2</option>
		                                                    <option value="03">3</option>
		                                                    <option value="04">4</option>
		                                                    <option value="05">5</option>
		                                                    <option value="06">6</option>
		                                                    <option value="07">7</option>
		                                                    <option value="08">8</option>
		                                                    <option value="09">9</option>
		                                                    <option value="10">10</option>
		                                                    <option value="11">11</option>
		                                                    <option value="12">12</option>
		                                        </select>
                                            </div>
                            </div>
                            
                            <div id="idVal" class="form-group row">
								<label class="col-lg-2 col-form-label" for="val-userid">참여율
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" id="po_percent" name="po_percent">
								</div>
								<div align="center">
								%
								</div>
							</div><span class="p5-portfolio-information validation-check-caption" id="participation_rate_information">참여율은 1에서 100까지 정수로 입력할 수 있습니다.</span>
                            <br><br>
                            
                            <div id="idVal" class="form-group row">
								<label class="col-lg-2 col-form-label" for="val-userid">역할
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-3">
                                                <select class="form-control" id="part_num" name="part_num">
                                                	<option selected="selected" value="">역할</option>
                                                    <option value="0">PM</option>
                                                    <option value="1">PL</option>
                                                    <option value="2">TA</option>
                                                    <option value="3">DA</option>
                                                    <option value="4">AA</option>
                                                    <option value="5">BA</option>
                                                    <option value="6">UA</option>
		                                        </select>
                                            </div>
							</div>
                            
							<div class="form-group row">
                                <label class="col-lg-2 col-form-label" for="val-userid">이미지
                                	<span class="text-danger">*</span>
                                </label>
                                <div class="col-6">
                                
                                <div id="fileForm" class="custom-file">
				                    <input type="file" accept='image/jpeg,image/gif,image/png' name="portFile" onchange='chk_file_type(this)'>
                                </div>
                                
                                </div>
                            </div>
                            
                            
							<div id="idVal" class="form-group row">
								<label class="col-lg-2 col-form-label" for="val-userid">한줄 설명
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="po_explainfile" name="po_explainfile" >
									<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id }">
								</div>
							</div>
							
<!-- 							<div class="form-group row"> -->
<!--                                 <label class="col-lg-2 col-form-label" for="val-userid">대표 이미지</label> -->
<!--                                 <div class="col-6"> -->
<!--                                     <div class="custom-file"> -->
<!--                                         <input type="file" class="custom-file-input" id="file02" name="fileitems"> -->
<!--                                         <label class="custom-file-label" for="example-file-input-custom">Choose file</label> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!-- 							<div id="idVal" class="form-group row"> -->
<!-- 								<label class="col-lg-2 col-form-label" for="val-userid">한줄 설명 -->
<!-- 								</label> -->
<!-- 								<div class="col-lg-10"> -->
<!-- 									<input type="text" class="form-control" id="val-userid" -->
<!-- 										name="val-userid" > -->
<!-- 									<input type="hidden" name="mem_id"> -->
<!-- 								</div> -->
<!-- 							</div> -->
								<div id="idVal" class="form-group row">
									<label class="col-lg-2 col-form-label" for="val-userid">관련 기술
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="lang_tech"
											name="lang_tech" >
									프로젝트와 관련된 기술을 입력해주세요.<br> 예) Photoshop, Android, HTML5, Python, Django
									</div>
								</div>
                                            
                            <br>
                            <div class="form-group">
                                       <button type="button" class="btn btn-secondary" id="btnCancel" name="btnCancel">취소</button>
                                       <button type="button" class="btn btn-alt-primary" id="btnSave" name="btnSave">등록 완료</button>
                   			</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
		<!-- Bootstrap Forms Validation -->

	</div>

</body>
</html>