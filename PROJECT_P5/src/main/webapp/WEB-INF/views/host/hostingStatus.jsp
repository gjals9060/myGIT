<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스팅 등록상황</title>
<style>
#wrap {
	width: 1100px;
	margin: auto;
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="hosting-status-title">
			등록한 단계에 따라 변함. 
		</div>
		${userId }<br>
		호스트ID = 
		${hostId }
		
		
	</div>
	
<script src="/p5/js/jquery-3.4.1.js"></script>
<script>
	$(window).bind("pageshow", function (event) {
		$.ajax({
			type : "POST",
			url : "registration/reset",
			success : function(){
				alert("newHost세션 초기화");
			},	
			error : function(){
				alert("newHost세션 초기화 실패..");
			}
		}); // AJAX-END
	});
</script>
</body>
</html>