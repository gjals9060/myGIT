
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="hostId" value="${hostId }" />
<h3>숙소명</h3>
<!--2단계마지막  -->
<input type="text" name="name" placeholder="숙소 이름" id="inputText"/>
<input type="submit" value="다음" />
 <a href="description?hostId=${hostId }">이전</a>
 <a href="../hostingStatus?hostId=${hostId }">다음</a>
 
<script src="/p5/js/jquery-3.4.1.js"></script>
<script src="/p5/js/host.js?v=<%=System.currentTimeMillis() %>"></script>
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