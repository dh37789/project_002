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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
<script>
$(function(){
	Codebase.blocks('#divCareerView', 'close');
	Codebase.blocks('#divCareer', 'close');
	Codebase.blocks('#divAcademic', 'close');
	Codebase.blocks('#divLicense', 'close');
	Codebase.blocks('#divAcademicView', 'close');
	Codebase.blocks('#divLicenseView', 'close');
	
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	$('#btnInsert').click(function(){
    	location.href = "${pageContext.request.contextPath}/freProfile/selfInfoForm.do";
    });
	
	$('#btnProfile').click(function(){
    	location.href = "${pageContext.request.contextPath}/freProfile/frmyProfileList.do?mem_id=${USER_LOGININFO.mem_id}";
    });
	
	$('#btnCareer').click(function(){
		Codebase.blocks('#careerDiv', 'close');
		Codebase.blocks('#divCareer', 'open');
	})
	
	$('#btnAcademic').click(function(){
		Codebase.blocks('#academicDiv', 'close');
		Codebase.blocks('#divAcademic', 'open');
	})
	
	$('#btnLicense').click(function(){
		Codebase.blocks('#licenseDiv', 'close');
		Codebase.blocks('#divLicense', 'open');
	})
	
	$('#btnViewCan1').click(function(){
		Codebase.blocks('#divCareerView', 'close');
	})
	
	$('#btnViewCan2').click(function(){
		Codebase.blocks('#divAcademicView', 'close');

	})
	$('#btnViewCan3').click(function(){
		Codebase.blocks('#divLicenseView', 'close');
	})
	
	
	$('#btnAdd1').click(function(){
		Codebase.blocks('#careerDiv', 'close');
		Codebase.blocks('#divCareerView', 'close');
		Codebase.blocks('#divCareer', 'open');
	})
	
	$('#btnAdd2').click(function(){
		Codebase.blocks('#academicDiv', 'close');
		Codebase.blocks('#divAcademicView', 'close');
		Codebase.blocks('#divAcademic', 'open');
	})
	
	$('#btnAdd3').click(function(){
		Codebase.blocks('#licenseDiv', 'close');
		Codebase.blocks('#divLicenseView', 'close');
		Codebase.blocks('#divLicense', 'open');
	    $('select[name=li_month2]').append(getMonthOptions());
	    var dateVal = new Date($('select[name=li_year2]').val(), $('select[name=li_month2]').val()-1);
	    dateVal = getLastDate(dateVal);
	    var options = "<option selected='selected' value=''>선택하세요</option>";
	    for(var i=1; i<=dateVal; i++){
	       if(i < 10){
	          options += '<option value="0'+i+'">' + '0'+i + '</option>';
	       }else{
	          options += '<option value="'+i+'">' + i + '</option>';
	       }
	    }
	    
	})
	
	$('#btnCancel1').click(function(){
		Codebase.blocks('#divCareer', 'close');
		Codebase.blocks('#careerDiv', 'open');
	})
	
	$('#btnCancel2').click(function(){
		Codebase.blocks('#divAcademic', 'close');
		Codebase.blocks('#academicDiv', 'open');
	})
	
	$('#btnCancel3').click(function(){
		Codebase.blocks('#divLicense', 'close');
		Codebase.blocks('#licenseDiv', 'open');
	})
	
	
   var today = new Date(); 
   $('select[name=li_year]').append(getYearsOptions(today));
   $('select[name=li_year]').on('change', function(){
      $('select[name=li_month] option[value=""]').attr('selected','selected');
      $('select[name=li_month]').append(getMonthOptions());
      $('select[name=li_day] option[value=""]').attr('selected','selected');
   });
   $('select[name=li_month]').on('change', function(){
      $('select[name=li_day] option[value=""]').attr('selected','selected');
      var dateVal = new Date($('select[name=li_year]').val(), $('select[name=li_month]').val()-1);
      dateVal = getLastDate(dateVal);
      var options = "<option selected='selected' value=''>선택하세요</option>";
      for(var i=1; i<=dateVal; i++){
         if(i < 10){
            options += '<option value="0'+i+'">' + '0'+i + '</option>';
         }else{
            options += '<option value="'+i+'">' + i + '</option>';
         }
      }
      $('select[name=li_day]').empty().append(options);
   });   
   
   
   
   var today2 = new Date(); 
   $('select[name=li_year2]').append(getYearsOptions(today2));
   $('select[name=li_year2]').on('change', function(){
      $('select[name=li_month2] option[value=""]').attr('selected','selected');
      $('select[name=li_month2]').append(getMonthOptions());
      $('select[name=li_day2] option[value=""]').attr('selected','selected');
   });
   $('select[name=li_month2]').on('change', function(){
      $('select[name=li_day2] option[value=""]').attr('selected','selected');
      var dateVal = new Date($('select[name=li_year2]').val(), $('select[name=li_month2]').val()-1);
      dateVal = getLastDate(dateVal);
      var options = "<option selected='selected' value=''>선택하세요</option>";
      for(var i=1; i<=dateVal; i++){
         if(i < 10){
            options += '<option value="0'+i+'">' + '0'+i + '</option>';
         }else{
            options += '<option value="'+i+'">' + i + '</option>';
         }
      }
      $('select[name=li_day2]').empty().append(options);
   });   
   
   
   
//    var today = new Date(); 
//    $('#li_year2').append(getYearsOptions(today));
//    $('#li_year2').on('change', function(){
//       $('#li_month2 option[value=""]').attr('selected','selected');
//       $('#li_day2 option[value=""]').attr('selected','selected');
//    });
   
   
//    $('#li_month2').on('change', function(){
//       if ($('#li_year2').val() == "") {
//          return;
//       }
//       var dateVal = new Date($('#li_year2').val(), $('li_month2').val()-1);
//       dateVal = getLastDate(dateVal);
      
//       var options = "<option selected='selected' value=''>선택하세요</option>";
//       for(var i=1; i<=dateVal; i++){
//          if(i < 10){
//             options += '<option value="0'+i+'">' + '0'+i + '</option>';
//          }else{
//             options += '<option value="'+i+'">' + i + '</option>';
//          }
//       }
//       $('#li_day2').empty().append(options);
//    });


   
   


	
	
	
	
	$('#career_table').on("click", "#btnDel1", function(){
		
		var canum = $(this).val();
		
		swal({
	      	  title: "알림",
	      	  text: "경력을 삭제하시겠습니까?",
	      	  icon: "warning",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
					if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/freProfile/deleteCareer.do?mem_id=${USER_LOGININFO.mem_id }&ca_num='+canum);	
					}else{
						return;
					}
				});
	})
	
	
	$('#academic_table').on("click", "#btnDel2", function(){
		
		var acnum = $(this).val();
		
		swal({
	      	  title: "알림",
	      	  text: "학력을 삭제하시겠습니까?",
	      	  icon: "warning",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
					if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/freProfile/deleteAcademic.do?mem_id=${USER_LOGININFO.mem_id }&ac_num='+acnum);	
					}else{
						return;
					}
				});
	})
	
	$('#license_table').on("click", "#btnDel3", function(){
		
		var linum = $(this).val();
		
		swal({
	      	  title: "알림",
	      	  text: "자격증을 삭제하시겠습니까?",
	      	  icon: "warning",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
					if (result) {
						$(location).attr('href','${pageContext.request.contextPath}/freProfile/deleteLicense.do?mem_id=${USER_LOGININFO.mem_id }&li_num='+linum);	
					}else{
						return;
					}
				});
	})
	
	
	
	
	
	$('#career_table').on("click", "#btnEdit1", function(){
		
		Codebase.blocks('#divCareer', 'close');
		var ca_num = $(this).val();
		
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 ca_num : ca_num,
	        	 mem_id : '${USER_LOGININFO.mem_id }'},
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/careerInfo.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
	            	var str = result.careerInfo.ca_in;
	            	var ca_in_year = str.substring(0,4);
	            	var ca_in_month = str.substring(5,7);
	            	var str2 = result.careerInfo.ca_out;
	            	if(str2 != null){
	            	var ca_out_year = str2.substring(0,4);
	            	var ca_out_month = str2.substring(5,7);
	            	}
	            	
	            	Codebase.blocks('#divCareerView', 'open');
	     	        $('#divCareerView').append('<input type="hidden" name="ca_num" value="' + ca_num + '">');
	        	    $('input[name=ca_company]').val(result.careerInfo.ca_company);
	        	    $('input[name=ca_department]').val(result.careerInfo.ca_department);
	        	    $('input[name=ca_position]').val(result.careerInfo.ca_position);
	        	    $('select[name=ca_in_year]').val(ca_in_year);
	        	    $('select[name=ca_in_month]').val(ca_in_month);
	        	    if(str2 != null){
	        	    $('select[name=ca_out_year]').val(ca_out_year);
	        	    $('select[name=ca_out_month]').val(ca_out_month);
	        	    }
	            }
	         }
	      });
		
	})
	
	
	$('#academic_table').on("click", "#btnEdit2", function(){
		
		Codebase.blocks('#divAcademic', 'close');
		var ac_num = $(this).val();
		
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 ac_num : ac_num,
	        	 mem_id : '${USER_LOGININFO.mem_id }'},
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/academicInfo.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
	            	var str = result.academicInfo.ac_in;
	            	var ac_in_year = str.substring(0,4);
	            	var ac_in_month = str.substring(5,7);
	            	var str2 = result.academicInfo.ac_out;
	            	if(str2 != null){
	            	var ac_out_year = str2.substring(0,4);
	            	var ac_out_month = str2.substring(5,7);
	            	}
	            	
	            	Codebase.blocks('#divAcademicView', 'open');
	     	        $('#divAcademicView').append('<input type="hidden" name="ac_num" value="' + ac_num + '">');
	        	    $('select[name=ac_type]').val(result.academicInfo.ac_type);
	        	    $('select[name=ac_final]').val(result.academicInfo.ac_final);
	        	    $('input[name=ac_school]').val(result.academicInfo.ac_school);
	        	    $('input[name=ac_major]').val(result.academicInfo.ac_major);
	        	    $('select[name=ac_in_year]').val(ac_in_year);
	        	    $('select[name=ac_in_month]').val(ac_in_month);
	        	    if(str2 != null){
	        	    $('select[name=ac_out_year]').val(ac_out_year);
	        	    $('select[name=ac_out_month]').val(ac_out_month);
	        	    }
	            }
	         }
	      });
		
	})
	
	
	$('#license_table').on("click", "#btnEdit3", function(){
		
		Codebase.blocks('#divLicense', 'close');
		var li_num = $(this).val();
		
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 li_num : li_num,
	        	 mem_id : '${USER_LOGININFO.mem_id }'},
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/licenseInfo.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
	            	var str = result.licenseInfo.li_date;
	            	var li_year = str.substring(0,4);
	            	var li_month = str.substring(5,7);
	            	var li_day = str.substring(8,10);
	            	
	            	
	            	Codebase.blocks('#divLicenseView', 'open');
	     	        $('#divLicenseView').append('<input type="hidden" name="li_num" value="' + li_num + '">');
	        	    $('input[name=li_name]').val(result.licenseInfo.li_name);
	        	    $('input[name=li_organization]').val(result.licenseInfo.li_organization);
	        	    $('select[name=li_year]').val(li_year);
	        	    $('select[name=li_month]').val(li_month);
	        	    $('#li_day').empty().append(options);
	        	    $('#li_day').val(li_day);
	        	    $('select[name=li_day]').val(li_day);
	        	    var mem_bir = result.licenseInfo.li_date.split('-');
	        	    $('select[name=li_year] option[value=' + mem_bir[0] + ']').attr('selected', true);
	        	    $('select[name=li_month]').append(getMonthOptions());
	        	    var dateVal = new Date($('select[name=li_year]').val(), $('select[name=li_month]').val()-1);
	        	    dateVal = getLastDate(dateVal);
	        	    var options = "<option selected='selected' value=''>선택하세요</option>";
	        	    for(var i=1; i<=dateVal; i++){
	        	       if(i < 10){
	        	          options += '<option value="0'+i+'">' + '0'+i + '</option>';
	        	       }else{
	        	          options += '<option value="'+i+'">' + i + '</option>';
	        	       }
	        	    }
	        	    $('select[name=li_month] option[value=' + mem_bir[1] + ']').attr('selected', true);
	        	    $('select[name=li_day]').empty().append(options);
	        	    $('select[name=li_day] option[value=' + mem_bir[2].substring(0,2) + ']').attr('selected', true);
	            }
	         }
	      });
		
	})
	
	
	
	$('#btnViewEdit').click(function(){
		
		var ca_in = $('select[name=ca_in_year]').val()+'-'+$('select[name=ca_in_month]').val()+ '-01';
		
		if(!$('select[name=ca_out_year]').val()==''){
			var ca_out = $('select[name=ca_out_year]').val()+'-'+$('select[name=ca_out_month]').val()+ '-01';
		}else{
			var ca_out = "";
		}
		var ca_in2 = $('select[name=ca_in_year]').val()+$('select[name=ca_in_month]').val();
		var ca_out2 = $('select[name=ca_out_year]').val()+$('select[name=ca_out_month]').val();
		
		if($('input[name=ca_company]').val() == ''){
			swal("", "회사명을 바르게 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=ca_department]').val() == ''){
			swal("", "근무부서를 바르게 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=ca_position]').val() == ''){
			swal("", "직위를 바르게 입력해주세요", "warning"); return false; 
		}
		
		if($('select[name=ca_in_year]').val() == ''){
			swal("", "입사날짜를 바르게 선택해주세요", "warning"); return false; 
		}
		
		if($('select[name=ca_in_month]').val() == ''){
			swal("", "입사날짜를 바르게 선택해주세요", "warning"); return false; 
		}
		
		if(!$('select[name=ca_out_year]').val()==''){
			if($('select[name=ca_out_month]').val() == ''){
				swal("", "퇴사날짜를 바르게 선택해주세요", "warning"); return false; 
			}
			if(ca_in2>ca_out2){
				swal("", '퇴사일이 입사일보다 빠를 수 없습니다', "warning"); return false;
			}
		}
		
		var ca_num = $('input[name=ca_num]').val();
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 ca_num : ca_num,
	        	 mem_id : '${USER_LOGININFO.mem_id }',
	        	 ca_company : $('input[name=ca_company]').val(),
	        	 ca_department : $('input[name=ca_department]').val(),
	        	 ca_position : $('input[name=ca_position]').val(),
	        	 ca_in : ca_in,
	        	 ca_out : ca_out },
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/updateCareer.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
//	            	Codebase.blocks('#divCareer', 'close');
	            	location.href = "${pageContext.request.contextPath}/freProfile/specForm.do?mem_id=${USER_LOGININFO.mem_id}";
	            }
	         }
	      });
	})
	
	
	
	$('#btnViewEdit2').click(function(){
		
		var ac_in = $('select[name=ac_in_year]').val()+'-'+$('select[name=ac_in_month]').val()+ '-01';
		if(!$('select[name=ac_out_year]').val()==''){
			var ac_out = $('select[name=ac_out_year]').val()+'-'+$('select[name=ac_out_month]').val()+ '-01';
		}else{
			var ac_out = "";
		}
		
		var ac_in2 = $('select[name=ac_in_year]').val()+$('select[name=ac_in_month]').val();
		var ac_out2 = $('select[name=ac_out_year]').val()+$('select[name=ac_out_month]').val();
		
		if($('select[name=ac_type]').val() == ''){
			swal("", "분류값을 선택해주세요", "warning"); return false; 
		}
		
		if($('select[name=ac_final').val() == ''){
			swal("", "상태값을 선택해주세요", "warning"); return false; 
		}
		
		if($('input[name=ac_school]').val() == ''){
			swal("", "학교명을 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=ac_major]').val() == ''){
			swal("", "전공을 입력해주세요", "warning"); return false; 
		}
		
		if($('select[name=ac_in_year]').val() == ''){
			swal("", "입학날짜를 바르게 선택해주세요", "warning"); return false; 
		}
		
		if($('select[name=ac_in_month]').val() == ''){
			swal("", "입학날짜를 바르게 선택해주세요", "warning"); return false; 
		}
		
		if(!$('select[name=ac_out_year]').val()==''){
			if($('select[name=ac_out_month]').val() == ''){
				swal("", "졸업날짜를 바르게 선택해주세요", "warning"); return false; 
			}
			if(ac_in2>ac_out2){
				swal("", '퇴사일이 입사일보다 빠를 수 없습니다', "warning"); return false;
			}
		}
		
		var ac_num = $('input[name=ac_num]').val();
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 ac_num : ac_num,
	        	 mem_id : '${USER_LOGININFO.mem_id }',
	        	 ac_type : $('select[name=ac_type]').val(),
	        	 ac_final : $('select[name=ac_final]').val(),
	        	 ac_school : $('input[name=ac_school]').val(),
	        	 ac_major : $('input[name=ac_major]').val(),
	        	 ac_in : ac_in,
	        	 ac_out : ac_out },
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/updateAcademic.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
//	            	Codebase.blocks('#divCareer', 'close');
	            	location.href = "${pageContext.request.contextPath}/freProfile/specForm.do?mem_id=${USER_LOGININFO.mem_id}";
	            }
	         }
	      });
	})
	
	
	$('#btnViewEdit3').click(function(){
		
		var li_date = $('select[name=li_year]').val()+'-'+$('select[name=li_month]').val()+'-'+$('select[name=li_day]').val();
		
		
		if($('input[name=li_name]').val() == ''){
			swal("", "자격증명을 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=li_organization]').val() == ''){
			swal("", "발급기관을 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=li_year]').val() == ''){
			swal("", "발급 년도를 선택해주세요", "warning"); return false; 
		}
		
		if($('input[name=li_month]').val() == ''){
			swal("", "발급 월을 선택해주세요", "warning"); return false; 
		}
		
		if($('select[name=li_day]').val() == ''){
			swal("", "발급 일을 선택해주세요", "warning"); return false; 
		}
		
		var li_num = $('input[name=li_num]').val();
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 li_num : li_num,
	        	 mem_id : '${USER_LOGININFO.mem_id }',
	        	 li_name : $('input[name=li_name]').val(),
	        	 li_organization : $('input[name=li_organization]').val(),
	        	 li_date : li_date },
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/updateLicense.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
//	            	Codebase.blocks('#divCareer', 'close');
	            	location.href = "${pageContext.request.contextPath}/freProfile/specForm.do?mem_id=${USER_LOGININFO.mem_id}";
	            }
	         }
	      });
	})
	
	
	
	
	$('#btnSave1').click(function(){
		
		var ca_in = $('select[name=ca_in_year1]').val()+'-'+$('select[name=ca_in_month1]').val()+ '-01';
		if(!$('select[name=ca_out_year1]').val()==''){
			var ca_out = $('select[name=ca_out_year1]').val()+'-'+$('select[name=ca_out_month1]').val()+ '-01';
		}else{
			var ca_out = "";
		}
		
		var ca_in2 = $('select[name=ca_in_year1]').val()+$('select[name=ca_in_month1]').val();
		var ca_out2 = $('select[name=ca_out_year1]').val()+$('select[name=ca_out_month1]').val();
		
		if($('input[name=ca_company1]').val() == ''){
			swal("", "회사명을 바르게 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=ca_department1').val() == ''){
			swal("", "근무부서를 바르게 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=ca_position1]').val() == ''){
			swal("", "직위를 바르게 입력해주세요", "warning"); return false; 
		}
		
		if($('select[name=ca_in_year1]').val() == ''){
			swal("", "입사날짜를 바르게 선택해주세요", "warning"); return false; 
		}
		
		if($('select[name=ca_in_month1]').val() == ''){
			swal("", "입사날짜를 바르게 선택해주세요", "warning"); return false; 
		}

		if(!$('select[name=ca_out_year1]').val()==''){
			if($('select[name=ca_out_month1]').val() == ''){
				swal("", "퇴사날짜를 바르게 선택해주세요", "warning"); return false; 
			}
			if(ca_in2>ca_out2){
				swal("", '퇴사일이 입사일보다 빠를 수 없습니다', "warning"); return false;
			}
		}
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 mem_id : '${USER_LOGININFO.mem_id }',
	        	 ca_company : $('input[name=ca_company1]').val(),
	        	 ca_department : $('input[name=ca_department1]').val(),
	        	 ca_position : $('input[name=ca_position1]').val(),
	        	 ca_in : ca_in,
	        	 ca_out : ca_out },
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/insertCareer.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
// 	            	Codebase.blocks('#divCareer', 'close');
	            	location.href = "${pageContext.request.contextPath}/freProfile/specForm.do?mem_id=${USER_LOGININFO.mem_id}";
	            }
	         }
	      });
	})
	
	$('#btnSave2').click(function(){
		
		var ac_in = $('select[name=ac_in_year2]').val()+'-'+$('select[name=ac_in_month2]').val()+ '-01';
		if(!$('select[name=ac_out_year2]').val()==''){
			var ac_out = $('select[name=ac_out_year2]').val()+'-'+$('select[name=ac_out_month2]').val()+ '-01';
		}else{
			var ac_out = "";
		}
		
		var ac_in2 = $('select[name=ac_in_year2]').val()+$('select[name=ac_in_month2]').val();
		var ac_out2 = $('select[name=ac_out_year2]').val()+$('select[name=ac_out_month2]').val();
		
		if($('select[name=ac_type2]').val() == ''){
			swal("", "분류값을 선택해주세요", "warning"); return false; 
		}
		
		if($('select[name=ac_final2]').val() == ''){
			swal("", "상태값을 선택해주세요", "warning"); return false; 
		}
		
		if($('input[name=ac_school2]').val() == ''){
			swal("", "학교명을 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=ac_major2]').val() == ''){
			swal("", "전공을 입력해주세요", "warning"); return false; 
		}
		
		if($('select[name=ac_in_year2').val() == ''){
			swal("", "입학날짜를 선택해주세요", "warning"); return false; 
		}
		
		if($('select[name=ac_in_month2').val() == ''){
			swal("", "입학날짜를 선택해주세요", "warning"); return false; 
		}
		
		if(!$('select[name=ac_out_year2]').val()==''){
			if($('select[name=ac_out_month2]').val() == ''){
				swal("", "졸업날짜를 바르게 선택해주세요", "warning"); return false; 
			}
			if(ac_in2>ac_out2){
				swal("", '퇴사일이 입사일보다 빠를 수 없습니다', "warning"); return false;
			}
		}
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 mem_id : '${USER_LOGININFO.mem_id }',
	        	 ac_type : $('select[name=ac_type2]').val(),
	        	 ac_final : $('select[name=ac_final2]').val(),
	        	 ac_school : $('input[name=ac_school2]').val(),
	        	 ac_major : $('input[name=ac_major2]').val(),
	        	 ac_in : ac_in,
	        	 ac_out : ac_out },
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/insertAcademic.do',
	         error:function(result){
	            swal("", result.message, "infp");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
//	            	Codebase.blocks('#divCareer', 'close');
	            	location.href = "${pageContext.request.contextPath}/freProfile/specForm.do?mem_id=${USER_LOGININFO.mem_id}";
	            }
	         }
	      });
	
	})
	
	
	$('#btnSave3').click(function(){
		
	var li_date = $('select[name=li_year2]').val()+'-'+$('select[name=li_month2]').val()+'-'+$('select[name=li_day2]').val();
		
		
		if($('input[name=li_name2]').val() == ''){
			swal("", "자격증명을 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=li_organization2]').val() == ''){
			swal("", "발급기관을 입력해주세요", "warning"); return false; 
		}
		
		if($('input[name=li_year2]').val() == ''){
			swal("", "발급 년도를 선택해주세요", "warning"); return false; 
		}
		
		if($('input[name=li_month2]').val() == ''){
			swal("", "발급 월을 선택해주세요", "warning"); return false; 
		}
		
		if($('select[name=li_day2]').val() == ''){
			swal("", "발급 일을 선택해주세요", "warning"); return false; 
		}
		
		
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         data:{
	        	 mem_id : '${USER_LOGININFO.mem_id }',
	        	 li_name : $('input[name=li_name2]').val(),
	        	 li_organization : $('input[name=li_organization2]').val(),
	        	 li_date : li_date },
	        	 
	         url:'${pageContext.request.contextPath}/freProfile/insertLicense.do',
	         error:function(result){
	            swal("", result.message, "info");
	         },
	         success:function(result){
	            if(eval(result.result.flag)){
//	            	Codebase.blocks('#divCareer', 'close');
	            	location.href = "${pageContext.request.contextPath}/freProfile/specForm.do?mem_id=${USER_LOGININFO.mem_id}";
	            }
	         }
	      });
	});
});
</script>
<body>
<div class="content">
                    <!-- 자기소개 -->
                    <h2 class="content-heading"><img src="${pageContext.request.contextPath}/image/4.png" width="25px">
                        <button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnProfile" name="btnProfile">내 프로필에서 보기</button>
							&nbsp; 경력ㆍ학력ㆍ자격증
					</h2>
                    
                    
                    
                    <div class="block" id="divCareerView">
                        <div class="block-header block-header-default">
                                </div>
                                <div class="block-content">
                                    <form action="#" method="post" onsubmit="return false;">
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-email">회사명</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" id="ca_company" name="ca_company">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">근무부서</label>
                                            <div class="col-4">
                                                <input type="text" class="form-control" id="ca_department" name="ca_department">
                                            </div>
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">직위</label>
                                            <div class="col-4">
                                                <input type="text" class="form-control" id="ca_position" name="ca_position">
                                            </div>
                                        </div>
										 <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">입사일</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ca_in_year" name="ca_in_year">
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
                                            <div class="col-2">
		                                        <select class="form-control" id="ca_in_month" name="ca_in_month">
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
                                            
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">퇴사일</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ca_out_year" name="ca_out_year">
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
                                            <div class="col-2">
		                                        <select class="form-control" id="ca_out_month" name="ca_out_month">
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
                                            
										</form>
                                </div>
                                
                                
                                
                           		<div class="form-group">
                           		&nbsp;&nbsp;
                                       <button type="button" class="btn btn-secondary" id="btnViewCan1" name="btnViewCan1">취소</button>
                                       <button type="button" class="btn btn-alt-primary" id="btnViewEdit" name="btnViewEdit">수정 완료</button>
                                </div>
                                <br><br>
                        		</div>
                    
                    
                    
                    
                    <div class="block" id="divCareer">
                        <div class="block-header block-header-default">
                                </div>
                                <div class="block-content">
                                    <form action="#" method="post" onsubmit="return false;">
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-email">회사명</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" id="ca_company1" name="ca_company1">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">근무부서</label>
                                            <div class="col-4">
                                                <input type="text" class="form-control" id="ca_department1" name="ca_department1">
                                            </div>
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">직위</label>
                                            <div class="col-4">
                                                <input type="text" class="form-control" id="ca_position1" name="ca_position1">
                                            </div>
                                        </div>
										 <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">입사일</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ca_in_year1" name="ca_in_year1">
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
                                            <div class="col-2">
		                                        <select class="form-control" id="ca_in_month1" name="ca_in_month1">
		                                                    <option selected="selected" value="">월</option>
		                                                    <option value="1">1</option>
		                                                    <option value="2">2</option>
		                                                    <option value="3">3</option>
		                                                    <option value="4">4</option>
		                                                    <option value="5">5</option>
		                                                    <option value="6">6</option>
		                                                    <option value="7">7</option>
		                                                    <option value="8">8</option>
		                                                    <option value="9">9</option>
		                                                    <option value="10">10</option>
		                                                    <option value="11">11</option>
		                                                    <option value="12">12</option>
		                                        </select>
                                            </div>
                                            
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">퇴사일</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ca_out_year1" name="ca_out_year1">
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
                                            <div class="col-2">
		                                        <select class="form-control" id="ca_out_month1" name="ca_out_month1">
		                                                     <option selected="selected" value="">월</option>
   		                                                    <option value="1">1</option>
   		                                                    <option value="2">2</option>
   		                                                    <option value="3">3</option>
   		                                                    <option value="4">4</option>
   		                                                    <option value="5">5</option>
   		                                                    <option value="6">6</option>
   		                                                    <option value="7">7</option>
   		                                                    <option value="8">8</option>
   		                                                    <option value="9">9</option>
   		                                                    <option value="10">10</option>
   		                                                    <option value="11">11</option>
   		                                                    <option value="12">12</option>
		                                                   
		                                        </select>
                                            </div>
                                        </div>
                                            
										</form>
                                </div>
                                
                                
                                
                           		<div class="form-group">
                           		&nbsp;&nbsp;
                                       <button type="button" class="btn btn-secondary" id="btnCancel1" name="btnCancel1">취소</button>
                                       <button type="button" class="btn btn-alt-primary" id="btnSave1" name="btnSave1">등록 완료</button>
                                </div>
                                <br><br>
                        		</div>
                        <br>
                    
                    
                    <c:if test="${empty careerList}">
                    	<div class="row items-push">
                        <div class="col-md-8 col-xl-12" id="careerDiv">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center"><br>
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/career.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'경력'</strong>이 없습니다.
									</p>
                                    <button type="button" class="btn btn-sm btn-alt-primary min-width-150" id="btnCareer" name="btnCareer">경력 등록하기</button>
                            </div>
                        </div>
                        </div>
                     </c:if>
                        
                   		 	
                   		 	<c:if test="${not empty careerList }">
                   		 	<div class="block-content" id="careerTable">
                   		 	<button type="button" class="btn btn-rounded btn-alt-primary min-width-125 float-right" id="btnAdd1" name="btnAdd1">경력 추가 하기</button>
                   		 	<br><br>
							<table class="table table-bordered table-vcenter" id="career_table">
								<thead class="table-warning">
									<tr>
										<th class="text-center" style="width: 25%;"><strong>회사명</strong></th>
										<th class="text-center" style="width: 25%;"><strong>근무부서</strong></th>
										<th class="text-center" style="width: 25%;"><strong>직위</strong></th>
										<th class="text-center" style="width: 15%;"><strong>근무기간</strong></th>
										<th class="text-center" style="width: 10%;"><strong>도구</strong></th>
									</tr>
								</thead>
								<tbody id="career_tbody" style="background-color: window;">
									<c:forEach items="${careerList }" var="careerInfo">
									<tr>
										<td><input type="hidden" id="career_num" name="career_num" class="form-control" value="${careerInfo.ca_num }"/>
											<div class="col-md-12">
													${careerInfo.ca_company }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${careerInfo.ca_department } 
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${careerInfo.ca_position }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${fn:substring(careerInfo.ca_in, 0, 7)} ~
													<br>
													<c:if test="${empty careerInfo.ca_out}">현재</c:if>
													${fn:substring(careerInfo.ca_out, 0, 7)}
											</div>
										</td>
										
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-sm btn-secondary mr-5 mb-5" id="btnEdit1" name="btnEdit1"
													data-toggle="tooltip" title="Edit" value="${careerInfo.ca_num }">수정
												</button>
												<button type="button" class="btn btn-sm btn-primary mr-5 mb-5" id="btnDel1" name="btnDel1"
													data-toggle="tooltip" title="Delete" value="${careerInfo.ca_num }">삭제
												</button>
											</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							</c:if>
                        
                        
                        
                        
                        
                        
                        
                        
                       
                        
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                        
                        
                        
                        <div class="block" id="divAcademicView">
                        <div class="block-header block-header-default">
                                </div>
                                <div class="block-content">
                                    <form action="#" method="post" onsubmit="return false;">
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">분류</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ac_type" name="ac_type">
                                                	<option selected="selected" value="">분류</option>
                                                    <option value="고등학교">고등학교</option>
                                                    <option value="전문대">전문대</option>
                                                    <option value="대학교">대학교</option>
                                                    <option value="대학원">대학원</option>
                                                    <option value="박사과정">박사과정</option>
		                                        </select>
                                            </div>
                                            
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">상태</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ac_final" name="ac_final">
                                                            <option selected="selected" value="">상태</option>  
                                                            <option value="재학">재학</option>                
                                                            <option value="휴학">휴학</option>                
                                                            <option value="졸업">졸업</option>                
                                                            <option value="자퇴">자퇴</option>                
		                                        </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">학교명</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" id="ac_school" name="ac_school">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">전공</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" id="ac_major" name="ac_major">
                                            </div>
                                        </div>
										 <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">입학일</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ac_in_year" name="ac_in_year">
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
                                            <div class="col-2">
		                                        <select class="form-control" id="ac_in_month" name="ac_in_month">
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
                                            
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">졸업일</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ac_out_year" name="ac_out_year">
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
                                            <div class="col-2">
		                                        <select class="form-control" id="ac_out_month" name="ac_out_month">
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
                                            
										</form>
                                </div>
                                
                                
                                
                           		<div class="form-group">
                           		&nbsp;&nbsp;
                                       <button type="button" class="btn btn-secondary" id="btnViewCan2" name="btnViewCan2">취소</button>
                                       <button type="button" class="btn btn-alt-primary" id="btnViewEdit2" name="btnViewEdit2">수정 완료</button>
                                </div>
                                <br><br>
                        		</div>
                        
                        
                        
                        
                        
                        
                        
                        <div class="block" id="divAcademic">
                        <div class="block-header block-header-default">
                                </div>
                                <div class="block-content">
                                    <form action="#" method="post" onsubmit="return false;">
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">분류</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ac_type2" name="ac_type2">
                                                	<option selected="selected" value="">분류</option>
                                                    <option value="고등학교">고등학교</option>
                                                    <option value="전문대">전문대</option>
                                                    <option value="대학교">대학교</option>
                                                    <option value="대학원">대학원</option>
                                                    <option value="박사과정">박사과정</option>
		                                        </select>
                                            </div>
                                            
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">상태</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ac_final2" name="ac_final2">
                                                            <option selected="selected" value="">상태</option>  
                                                            <option value="재학">재학</option>                
                                                            <option value="휴학">휴학</option>                
                                                            <option value="졸업">졸업</option>                
                                                            <option value="자퇴">자퇴</option>                
		                                        </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">학교명</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" id="ac_school2" name="ac_school2">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">전공</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" id="ac_major2" name="ac_major2">
                                            </div>
                                        </div>
										 <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">입학일</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ac_in_year2" name="ac_in_year2">
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
                                            <div class="col-2">
		                                        <select class="form-control" id="ac_in_month2" name="ac_in_month2">
		                                                    <option selected="selected" value="">월</option>
		                                                    <option value="1">1</option>
		                                                    <option value="2">2</option>
		                                                    <option value="3">3</option>
		                                                    <option value="4">4</option>
		                                                    <option value="5">5</option>
		                                                    <option value="6">6</option>
		                                                    <option value="7">7</option>
		                                                    <option value="8">8</option>
		                                                    <option value="9">9</option>
		                                                    <option value="10">10</option>
		                                                    <option value="11">11</option>
		                                                    <option value="12">12</option>
		                                        </select>
                                            </div>
                                            
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">졸업일</label>
                                            <div class="col-2">
                                                <select class="form-control" id="ac_out_year2" name="ac_out_year2">
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
                                            <div class="col-2">
		                                        <select class="form-control" id="ac_out_month2" name="ac_out_month2">
		                                                     <option selected="selected" value="">월</option>
   		                                                    <option value="1">1</option>
   		                                                    <option value="2">2</option>
   		                                                    <option value="3">3</option>
   		                                                    <option value="4">4</option>
   		                                                    <option value="5">5</option>
   		                                                    <option value="6">6</option>
   		                                                    <option value="7">7</option>
   		                                                    <option value="8">8</option>
   		                                                    <option value="9">9</option>
   		                                                    <option value="10">10</option>
   		                                                    <option value="11">11</option>
   		                                                    <option value="12">12</option>
		                                                   
		                                        </select>
                                            </div>
                                        </div>
                                            
										</form>
                                </div>
                                
                                
                                
                           		<div class="form-group">
                           		&nbsp;&nbsp;
                                       <button type="button" class="btn btn-secondary" id="btnCancel2" name="btnCancel2">취소</button>
                                       <button type="button" class="btn btn-alt-primary" id="btnSave2" name="btnSave2">등록 완료</button>
                                </div>
                                <br><br>
                        		</div>
                        <br>


                        <c:if test="${empty academicList}">
                        <div class="row items-push">
                        <div class="col-md-8 col-xl-12" id="academicDiv">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center"><br>
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/mortarboard.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'학력'</strong>이 없습니다.
									</p>
									<button type="button" class="btn btn-alt-primary" id="btnAcademic" name="btnAcademic">학력 등록하기</button>
                            </div>
                            <br>
                   		</div>
                   		</div>
                   		</c:if>
                   		
		
						<c:if test="${not empty academicList }">
                   		 	<div class="block-content" id="academicTable">
                   		 	<button type="button" class="btn btn-rounded btn-alt-primary min-width-125 float-right" id="btnAdd2" name="btnAdd2">학력 추가 하기</button>
                   		 	<br><br>
							<table class="table table-bordered table-vcenter" id="academic_table">
								<thead class="table-danger">
									<tr>
										<th class="text-center" style="width: 11%;"><strong>분류</strong></th>
										<th class="text-center" style="width: 9%;"><strong>상태</strong></th>
										<th class="text-center" style="width: 25%;"><strong>학교명</strong></th>
										<th class="text-center" style="width: 30%;"><strong>전공</strong></th>
										<th class="text-center" style="width: 15%;"><strong>기간</strong></th>
										<th class="text-center" style="width: 10%;"><strong>도구</strong></th>
									</tr>
								</thead>
								<tbody id="academic_tbody" style="background-color: window;">
									<c:forEach items="${academicList }" var="academicInfo">
									<tr>
										<td><input type="hidden" id="academic_num" name="academic_num" class="form-control" value="${academicInfo.ac_num }"/>
											<div class="col-md-12">
													${academicInfo.ac_type }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${academicInfo.ac_final } 
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${academicInfo.ac_school }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${academicInfo.ac_major }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${fn:substring(academicInfo.ac_in, 0, 7)} ~
													<br>
													<c:if test="${empty academicInfo.ac_out}">현재</c:if>
													${fn:substring(academicInfo.ac_out, 0, 7)}
											</div>
										</td>
										
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-sm btn-secondary mr-5 mb-5" id="btnEdit2" name="btnEdit2"
													data-toggle="tooltip" title="Edit" value="${academicInfo.ac_num }">수정
												</button>
												<button type="button" class="btn btn-sm btn-primary mr-5 mb-5" id="btnDel2" name="btnDel2"
													data-toggle="tooltip" title="Delete" value="${academicInfo.ac_num }">삭제
												</button>
											</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							</c:if>
							
                        		
                        		
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                        		
                        		
                        		
                        <div class="block" id="divLicenseView">
                        <div class="block-header block-header-default">
                                </div>
                                <div class="block-content">
                                    <form action="#" method="post" onsubmit="return false;">
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-email">자격증명</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" id="li_name" name="li_name">
                                            </div>
                                        </div>
										 <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">발급기관</label>
                                            <div class="col-2">
                                                <input type="text" class="form-control" id="li_organization" name="li_organization">
                                            </div>
                                         
                                            
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">발행일자</label>
                                            <div class="col-2">
                                                <select class="form-control" id="li_year" name="li_year">
                                                            <option selected="selected" value="">연도</option>  
<!--                                                             <option value="1970">1970</option>                 -->
<!--                                                             <option value="1971">1971</option>                 -->
<!--                                                             <option value="1972">1972</option>                 -->
<!--                                                             <option value="1973">1973</option>                 -->
<!--                                                             <option value="1974">1974</option>                 -->
<!--                                                             <option value="1975">1975</option>                 -->
<!--                                                             <option value="1976">1976</option>                 -->
<!--                                                             <option value="1977">1977</option>                 -->
<!--                                                             <option value="1978">1978</option>                 -->
<!--                                                             <option value="1979">1979</option>                 -->
<!--                                                             <option value="1980">1980</option>                 -->
<!--                                                             <option value="1981">1981</option>                 -->
<!--                                                             <option value="1982">1982</option>                 -->
<!--                                                             <option value="1983">1983</option>                 -->
<!--                                                             <option value="1984">1984</option>                 -->
<!--                                                             <option value="1985">1985</option>                 -->
<!--                                                             <option value="1986">1986</option>                 -->
<!--                                                             <option value="1987">1987</option>                 -->
<!--                                                             <option value="1988">1988</option>                 -->
<!--                                                             <option value="1989">1989</option>                 -->
<!--                                                             <option value="1990">1990</option>                 -->
<!--                                                             <option value="1991">1991</option>                 -->
<!--                                                             <option value="1992">1992</option>                 -->
<!--                                                             <option value="1993">1993</option>                 -->
<!--                                                             <option value="1994">1994</option>                 -->
<!--                                                             <option value="1995">1995</option>                 -->
<!--                                                             <option value="1996">1996</option>                 -->
<!--                                                             <option value="1997">1997</option>                 -->
<!--                                                             <option value="1998">1998</option>                 -->
<!--                                                             <option value="1999">1999</option>                 -->
<!--                                                             <option value="2001">2001</option>                 -->
<!--                                                             <option value="2002">2002</option>                 -->
<!--                                                             <option value="2003">2003</option>                 -->
<!--                                                             <option value="2004">2004</option>                 -->
<!--                                                             <option value="2005">2005</option>                 -->
<!--                                                             <option value="2006">2006</option>                 -->
<!--                                                             <option value="2007">2007</option>                 -->
<!--                                                             <option value="2008">2008</option>                 -->
<!--                                                             <option value="2009">2009</option>                 -->
<!--                                                             <option value="2010">2010</option>                 -->
<!--                                                             <option value="2011">2011</option>                 -->
<!--                                                             <option value="2012">2012</option>                 -->
<!--                                                             <option value="2013">2013</option>                 -->
<!--                                                             <option value="2014">2014</option>                 -->
<!--                                                             <option value="2015">2015</option>                 -->
<!--                                                             <option value="2016">2016</option>                 -->
<!--                                                             <option value="2017">2017</option>                 -->
<!--                                                             <option value="2018">2018</option>                 -->
<!--                                                             <option value="2019">2019</option>                 -->
		                                        </select>
                                            </div>
                                            <div class="col-2">
		                                        <select class="form-control" id="li_month" name="li_month">
		                                                     <option selected="selected" value="">월</option>
<!--    		                                                    <option value="01">1</option> -->
<!--    		                                                    <option value="02">2</option> -->
<!--    		                                                    <option value="03">3</option> -->
<!--    		                                                    <option value="04">4</option> -->
<!--    		                                                    <option value="05">5</option> -->
<!--    		                                                    <option value="06">6</option> -->
<!--    		                                                    <option value="07">7</option> -->
<!--    		                                                    <option value="08">8</option> -->
<!--    		                                                    <option value="09">9</option> -->
<!--    		                                                    <option value="10">10</option> -->
<!--    		                                                    <option value="11">11</option> -->
<!--    		                                                    <option value="12">12</option> -->
		                                                   
		                                        </select>
                                            </div>
                                            
                                             <div class="col-2">
		                                        <select class="form-control" id="li_day" name="li_day">
		                                                    <option selected="selected" value="">일</option>
<!-- 		                                                    <option value="01">1</option> -->
<!-- 		                                                    <option value="02">2</option> -->
<!-- 		                                                    <option value="03">3</option> -->
<!-- 		                                                    <option value="04">4</option> -->
<!-- 		                                                    <option value="05">5</option> -->
<!-- 		                                                    <option value="06">6</option> -->
<!-- 		                                                    <option value="07">7</option> -->
<!-- 		                                                    <option value="08">8</option> -->
<!-- 		                                                    <option value="09">9</option> -->
<!-- 		                                                    <option value="10">10</option> -->
<!-- 		                                                    <option value="11">11</option> -->
<!-- 		                                                    <option value="12">12</option> -->
<!-- 		                                                    <option value="13">13</option> -->
<!-- 		                                                    <option value="14">14</option> -->
<!-- 		                                                    <option value="15">15</option> -->
<!-- 		                                                    <option value="16">16</option> -->
<!-- 		                                                    <option value="17">17</option> -->
<!-- 		                                                    <option value="18">18</option> -->
<!-- 		                                                    <option value="19">19</option> -->
<!-- 		                                                    <option value="20">20</option> -->
<!-- 		                                                    <option value="21">21</option> -->
<!-- 		                                                    <option value="22">22</option> -->
<!-- 		                                                    <option value="23">23</option> -->
<!-- 		                                                    <option value="24">24</option> -->
<!-- 		                                                    <option value="25">25</option> -->
<!-- 		                                                    <option value="26">26</option> -->
<!-- 		                                                    <option value="27">27</option> -->
<!-- 		                                                    <option value="28">28</option> -->
<!-- 		                                                    <option value="29">29</option> -->
<!-- 		                                                    <option value="30">30</option> -->
<!-- 		                                                    <option value="31">31</option> -->
		                                        </select>
                                            </div>
                                        </div>
                                            
										</form>
                                </div>
                                
                           		<div class="form-group">
                           		&nbsp;&nbsp;
                                       <button type="button" class="btn btn-secondary" id="btnViewCan3" name="btnViewCan3">취소</button>
                                       <button type="button" class="btn btn-alt-primary" id="btnViewEdit3" name="btnViewEdit3">수정 완료</button>
                                </div>
                                <br><br>
                        		</div>
                        
                        
                        
                        
                        
                        
                        <div class="block" id="divLicense">
                        <div class="block-header block-header-default">
                                </div>
                                <div class="block-content">
                                    <form action="#" method="post" onsubmit="return false;">
                                        <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-email">자격증명</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" id="li_name2" name="li_name2">
                                            </div>
                                        </div>
										 <div class="form-group row">
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">발급기관</label>
                                            <div class="col-2">
                                                <input type="text" class="form-control" id="li_organization2" name="li_organization2">
                                            </div>
                                         
                                            
                                            <label class="col-lg-1 col-form-label" for="example-hf-password">발행일자</label>
                                            <div class="col-2">
                                                <select class="form-control" id="li_year2" name="li_year2">
                                                            <option selected="selected" value="">연도</option>  
<!--                                                             <option value="1970">1970</option>                 -->
<!--                                                             <option value="1971">1971</option>                 -->
<!--                                                             <option value="1972">1972</option>                 -->
<!--                                                             <option value="1973">1973</option>                 -->
<!--                                                             <option value="1974">1974</option>                 -->
<!--                                                             <option value="1975">1975</option>                 -->
<!--                                                             <option value="1976">1976</option>                 -->
<!--                                                             <option value="1977">1977</option>                 -->
<!--                                                             <option value="1978">1978</option>                 -->
<!--                                                             <option value="1979">1979</option>                 -->
<!--                                                             <option value="1980">1980</option>                 -->
<!--                                                             <option value="1981">1981</option>                 -->
<!--                                                             <option value="1982">1982</option>                 -->
<!--                                                             <option value="1983">1983</option>                 -->
<!--                                                             <option value="1984">1984</option>                 -->
<!--                                                             <option value="1985">1985</option>                 -->
<!--                                                             <option value="1986">1986</option>                 -->
<!--                                                             <option value="1987">1987</option>                 -->
<!--                                                             <option value="1988">1988</option>                 -->
<!--                                                             <option value="1989">1989</option>                 -->
<!--                                                             <option value="1990">1990</option>                 -->
<!--                                                             <option value="1991">1991</option>                 -->
<!--                                                             <option value="1992">1992</option>                 -->
<!--                                                             <option value="1993">1993</option>                 -->
<!--                                                             <option value="1994">1994</option>                 -->
<!--                                                             <option value="1995">1995</option>                 -->
<!--                                                             <option value="1996">1996</option>                 -->
<!--                                                             <option value="1997">1997</option>                 -->
<!--                                                             <option value="1998">1998</option>                 -->
<!--                                                             <option value="1999">1999</option>                 -->
<!--                                                             <option value="2001">2001</option>                 -->
<!--                                                             <option value="2002">2002</option>                 -->
<!--                                                             <option value="2003">2003</option>                 -->
<!--                                                             <option value="2004">2004</option>                 -->
<!--                                                             <option value="2005">2005</option>                 -->
<!--                                                             <option value="2006">2006</option>                 -->
<!--                                                             <option value="2007">2007</option>                 -->
<!--                                                             <option value="2008">2008</option>                 -->
<!--                                                             <option value="2009">2009</option>                 -->
<!--                                                             <option value="2010">2010</option>                 -->
<!--                                                             <option value="2011">2011</option>                 -->
<!--                                                             <option value="2012">2012</option>                 -->
<!--                                                             <option value="2013">2013</option>                 -->
<!--                                                             <option value="2014">2014</option>                 -->
<!--                                                             <option value="2015">2015</option>                 -->
<!--                                                             <option value="2016">2016</option>                 -->
<!--                                                             <option value="2017">2017</option>                 -->
<!--                                                             <option value="2018">2018</option>                 -->
<!--                                                             <option value="2019">2019</option>                 -->
		                                        </select>
                                            </div>
                                            <div class="col-2">
		                                        <select class="form-control" id="li_month2" name="li_month2">
		                                                     <option selected="selected" value="">월</option>
<!--    		                                                    <option value="01">1</option> -->
<!--    		                                                    <option value="02">2</option> -->
<!--    		                                                    <option value="03">3</option> -->
<!--    		                                                    <option value="04">4</option> -->
<!--    		                                                    <option value="05">5</option> -->
<!--    		                                                    <option value="06">6</option> -->
<!--    		                                                    <option value="07">7</option> -->
<!--    		                                                    <option value="08">8</option> -->
<!--    		                                                    <option value="09">9</option> -->
<!--    		                                                    <option value="10">10</option> -->
<!--    		                                                    <option value="11">11</option> -->
<!--    		                                                    <option value="12">12</option> -->
		                                                   
		                                        </select>
                                            </div>
                                            
                                             <div class="col-2">
		                                        <select class="form-control" id="li_day2" name="li_day2">
		                                                    <option selected="selected" value="">일</option>
<!-- 		                                                    <option value="01">1</option> -->
<!-- 		                                                    <option value="02">2</option> -->
<!-- 		                                                    <option value="03">3</option> -->
<!-- 		                                                    <option value="04">4</option> -->
<!-- 		                                                    <option value="05">5</option> -->
<!-- 		                                                    <option value="06">6</option> -->
<!-- 		                                                    <option value="07">7</option> -->
<!-- 		                                                    <option value="08">8</option> -->
<!-- 		                                                    <option value="09">9</option> -->
<!-- 		                                                    <option value="10">10</option> -->
<!-- 		                                                    <option value="11">11</option> -->
<!-- 		                                                    <option value="12">12</option> -->
<!-- 		                                                    <option value="13">13</option> -->
<!-- 		                                                    <option value="14">14</option> -->
<!-- 		                                                    <option value="15">15</option> -->
<!-- 		                                                    <option value="16">16</option> -->
<!-- 		                                                    <option value="17">17</option> -->
<!-- 		                                                    <option value="18">18</option> -->
<!-- 		                                                    <option value="19">19</option> -->
<!-- 		                                                    <option value="20">20</option> -->
<!-- 		                                                    <option value="21">21</option> -->
<!-- 		                                                    <option value="22">22</option> -->
<!-- 		                                                    <option value="23">23</option> -->
<!-- 		                                                    <option value="24">24</option> -->
<!-- 		                                                    <option value="25">25</option> -->
<!-- 		                                                    <option value="26">26</option> -->
<!-- 		                                                    <option value="27">27</option> -->
<!-- 		                                                    <option value="28">28</option> -->
<!-- 		                                                    <option value="29">29</option> -->
<!-- 		                                                    <option value="30">30</option> -->
<!-- 		                                                    <option value="31">31</option> -->
		                                        </select>
                                            </div>
                                        </div>
                                            
										</form>
                                </div>
                                
                                
                                
                           		<div class="form-group">
                           		&nbsp;&nbsp;
                                       <button type="button" class="btn btn-secondary" id="btnCancel3" name="btnCancel3">취소</button>
                                       <button type="button" class="btn btn-alt-primary" id="btnSave3" name="btnSave3">등록 완료</button>
                                </div>
                                <br><br>
                        		</div>
                        
                        <br>
                        
                        
                        		
                        
                   		<c:if test="${empty licenseList}">
                   		<div class="row items-push">
                        <div class="col-md-8 col-xl-12" id="licenseDiv">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center"><br>
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/diploma.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'자격증'</strong>이 없습니다.
									</p>
									<button type="button" class="btn btn-alt-primary" id="btnLicense" name="btnLicense">자격증 등록하기</button>
                            </div>
                            <br>
                   		</div>
                   		</div>
	                   	</c:if>
                   		
                   		<c:if test="${not empty licenseList }">
                   		 	<div class="block-content" id="academicTable">
                   		 	<button type="button" class="btn btn-rounded btn-alt-primary min-width-125 float-right" id="btnAdd3" name="btnAdd3">자격증 추가 하기</button>
                   		 	<br><br>
							<table class="table table-bordered table-vcenter" id="license_table">
								<thead class="table-success">
									<tr>
										<th class="text-center" style="width: 35%;"><strong>자격증명</strong></th>
										<th class="text-center" style="width: 30%;"><strong>발급기관</strong></th>
										<th class="text-center" style="width: 25%;"><strong>발행일자</strong></th>
										<th class="text-center" style="width: 10%;"><strong>도구</strong></th>
									</tr>
								</thead>
								<tbody id="academic_tbody" style="background-color: window;">
									<c:forEach items="${licenseList }" var="licenseInfo">
									<tr>
										<td><input type="hidden" id="license_num" name="license_num" class="form-control" value="${licenseInfo.li_num }"/>
											<div class="col-md-12">
													${licenseInfo.li_name }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${licenseInfo.li_organization } 
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${fn:substring(licenseInfo.li_date, 0, 10)}
											</div>
										</td>
										
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-sm btn-secondary mr-5 mb-5" id="btnEdit3" name="btnEdit3"
													data-toggle="tooltip" title="Edit" value="${licenseInfo.li_num }">수정
												</button>
												<button type="button" class="btn btn-sm btn-primary mr-5 mb-5" id="btnDel3" name="btnDel3"
													data-toggle="tooltip" title="Delete" value="${licenseInfo.li_num }">삭제
												</button>
											</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							</c:if>
                   		
                    </div>
              
</body>
</html>