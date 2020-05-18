<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 인증</title>
<style>
#phoneCetificationNumberInputBlock {
	display: none;
}
</style>
</head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<body onload="window.focus();">
	<h1> 휴대폰 인증</h1>
	
	전화번호 :
	<input type="text" name=mobileNumber value="${user.mobilePhone }" />
	<button id="phoneCetificationNumberBtn" onclick='sendCerificationNumberMail()'>인증하기</button>
	
	<div id="phoneCetificationNumberInputBlock">
		인증번호 :
		<input type="text" id="mobileInputCode" />
		<input type="hidden" id="mobileAuthenticationCode" />
		<button onclick='completeMobileAuthentication()'>완료</button>
	</div>
	
	
<script>
$(document).ready(function(){
//	var parentUrl = window.opener.document.URL;
//	alert(parentUrl);
})

function sendCerificationNumberMail(){
	$('#phoneCetificationNumberBtn').remove();
	$.ajax({
		   type: "POST",
		   url: "ajax/sendMobileAuthenticationCode",
		   data: 'mobileNumber=' + $('input[name=mobileNumber]').val(),
		   success:function(data){
			   if(!data){
		 		   alert("인증문자 발송에 실패했습니다.");
		 	   } else{
		 		   $("#mobileAuthenticationCode").val(data); // 새로운 인증번호 값 적용
		 		  $('#phoneCetificationNumberInputBlock').css("display","block");
		 	   }
		   },
		   error: function() {
		        alert("통신 실패..");
		   }
	});
}
	
	
function completeMobileAuthentication(){
	var params = {
			mobilePhone : $('input[name=mobileNumber]').val(),
			inputCode : $('#mobileInputCode').val(),
			authenticationCode : $('#mobileAuthenticationCode').val()
	}
	$.ajax({
		   type: "POST",
		   url: "ajax/completeMobileAuthentication",
		   data: params,
		   success:function(result){
				 if(result == 0){ // 인증번호 불일치
						alert("인증번호가 일치하지 않습니다.");
				} else if(result == 1){ // 인증번호 일치 , DB에 저장 성공
						alert("휴대전화 인증을 완료했습니다.");
				
					/* **
					** 부모창이 회원정보 페이지면 새로고침
					** */
						var parentUrl = window.opener.document.URL;
						var start = parentUrl.indexOf("/p5");
						var end = parentUrl.length;
						var urlInfo = parentUrl.substring(start, end);
						if(urlInfo.indexOf('/p5/userInfoUpdate') !== -1	){
							window.opener.location.reload(); // 부모창 새로고침
						}
						window.close(); // 팝업창 닫기
				} else if(result == 2){ // 인증번호 일치, DB에 적용 실패
						alert("휴대전화 인증을 정상적으로 완료하지 못했습니다.");
				}
		   },
		   error: function() {
		        alert("통신 실패..");
		   }
	});
}
	
	
	
	
</script>
</body>
</html>