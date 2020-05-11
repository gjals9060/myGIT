
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>숙소명</h3>
<!--2단계마지막  -->
<form action="">
<input type="text" name="name" placeholder="숙소 이름" id="inputText"/>
<input type="submit" value="다음" />
</form>
</body>
<!-- <script>
$(document).on('keydown', '#inputText', function() {

	$.ajax({
	    type: "POST",
	    url: "",
	    data : 'name=' + $('#inputText').val(),
	    success:function(data){
	 	   if(!data){
	 		   alert("값을 입력해주세요");
	 	   } else{
	 		   $("#inputText").val(data); // 새로운 인증번호 값 적용
	 	   }
	    },
	    error: function() {
	         alert("통신 실패..");
	    }
	});
});



</script> -->
</html>