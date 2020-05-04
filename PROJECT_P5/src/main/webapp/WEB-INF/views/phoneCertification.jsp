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
		<input type="text" /> <button >인증</button>
	</div>
	
	<script>
		function sendCerificationNumberMail(){
			$('#phoneCetificationNumberInputBlock').css("display","block");
		}
	</script>
</body>
</html>