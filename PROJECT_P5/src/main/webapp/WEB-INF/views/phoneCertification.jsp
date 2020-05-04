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
<body>
	<h1> 휴대폰 인증</h1>
	
	전화번호<input type="text" />
	<button id="phoneCetificationNumberBtn" onclick='sendCerificationNumberMail()'>인증번호전송</button>
	
	<div id="phoneCetificationNumberInputBlock">
		<input type="text" name="mobileNumber" value="${user.mobilePhone }" />
		<button onlick="">인증</button>
	</div>
	
<script>
	function sendCerificationNumberMail(){
		$('#phoneCetificationNumberInputBlock').css("display","block");
	}
	
	function sendMobileCode(){
		$.ajax({
			   type: "POST",
			   url: "ajax/completeSignUp",
			   data: params,
			   success:function(result){
					 if(result == 0){ // 인증번호 불일치
							alert("인증번호가 일치하지 않습니다.");
					} else if(result == 1){ // 인증번호 일치 , DB에 저장 성공
							alert("회원가입을 완료했습니다.");
							logInModalOn(); // 로그인 modal 전환
					} else if(result == 2){ // 인증번호 일치, DB에 저장 실패
							alert("회원가입을 정상적으로 완료하지 못했습니다.");
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