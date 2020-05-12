<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li{
list-style: none;
}
img{
margin-right:10px;
width:200px;
}
</style>
</head>
<body>		
<!-- <form action=""> -->
<div id="wrap">
새로운 숙소 진행을 시작해볼까요?
<div id="list">
<ul>
<li><input type="radio" name="hostId" value="0" /><img src="room1.jpg" alt="사진" />새로운 숙소 등록하기</li><br>
숙소 등록중
<li><input type="radio" name="hostId" value="3456" /><img src="room1.jpg" alt="사진" />개인실</li>
</ul>
</div>
</div>
<!-- </form> -->
<!-- <input type="submit" value="다음" /> -->
<button onclick="next()">다음</button>

<script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script>



function next(){
		// 체크 여부
	var isChecked = $('input[name="hostId"]:checked').length;
		// 선택 호스팅의 호스트ID
	var hostId = $('input[name="hostId"]:checked').val();
		
	if(!isChecked){ // 체크하지 않았으면
		alert("선택해라..");
	} else{ // 체크했으면
		location.href="hostingStatus?hostId=" + hostId;
	}
	
} // next-END

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