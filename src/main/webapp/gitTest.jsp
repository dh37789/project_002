<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	
var username = 'jns37789@naver.com';
  var password = 'vkvldyd!1';
  var name = 'repoTestdditorkrsss';
  var description = 'repoTestdditorkrsss';
  
 	    auth = btoa(username+':'+password);

 	    $("#results").text("인증 중입니다.");
	$('#btn1').click(function(){
 		$.ajax({ 
 		    url: 'https://api.github.com/authorizations',
 		    type: 'GET',
 		    beforeSend: function(xhr) { 
 		        xhr.setRequestHeader("Authorization", "Basic " + auth); 
 		    },
 		    data: '{"scopes":["repo"],"note":"Create Repo with Ajax"}',
 		    error:function(result){
 		    	$("#results").text("Authorization Failed. Check console log.");
 	 		    console.log(result);
	         },
	         success:function(response){
	        	authid = response[0].id;
	        	console.log(response[0].id);
 	 			deleteGit(authid);
	         }
	});
	});
 		function postrepo(name,description){

 		 	$("#results").text("Creating GitHub Repository.");

 		 	var postdata = '{"name":"'+name+'","description":"'+description+'","auto_init":true}';

 		 	$.ajax({ 
 		 		url: 'https://api.github.com/user/repos',
 		 		type: 'POST',
 		 		beforeSend: function(xhr) { 
 		 			xhr.setRequestHeader("Authorization", "token " + token); 
 		 		},
 		 		data: postdata,
 		 		success:function(response){
 		 			curl = response.contents_url;
 		 	 		repourl = response.html_url;
 		 	 		console.log(curl);
 		 	 		console.log(repourl);
 		 	 		$("#results").text("Created Repository.");
 		 	 		setTimeout(deleteId(authid), 3000);
 		 		},
 		 		error:function(result){
 		 			$("#results").text("Repo Creation Failed. Check console log.");
 		 	 		console.log(result);
 		     }
 		 	});
 		}
 		
 		
 		function deleteGit(authid){
 			$.ajax({ 
    			url: 'https://api.github.com/authorizations/' + authid,
    			type: 'DELETE',
    			beforeSend: function(xhr) { 
    				xhr.setRequestHeader("Authorization", "Basic " + auth); 
    			}
    		});
 		}
 		$('#btn2').click(function(){
 			var authid = $(this).val();
 		})
});
</script>
</head>
<body>
<label id="result"></label>
<button id="btn1">정보 얻기</button>
<button id="btn2" value="271827441">정보 얻기</button>
</body>
</html>