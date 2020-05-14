<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소설명</title>
<script src="/p5/js/jquery-3.4.1.js"></script>
</head>
<body>

	<input type="hidden" id="hostId" value="${hostId }" />
	<%@include file="./hostHeaderStep2.jsp" %>

	<script>
		$('.hosting-step').empty();
		$('.hosting-step').text("2단계:상세정보를 입력하세요");
		$('nav').css('grid-template-columns' ,'repeat(3, 1fr)');
		$('#progressBar').val('50');
		
		$('#tabDescription').css('background','#bbb');
	</script>
	
	<!-- <form action="title" method="post"> -->
	<h1>숙소설명을 적어주세요!</h1>

	<h3>숙소 설명</h3>
	<textarea name="description" rows="10" cols="50"></textarea>
	<h3>기타사항(선택)</h3>
	<textarea name="descriptionEtc" rows="10" cols="50"></textarea>
	<!-- </form> -->
	<a href="./photo?hostId=${hostId }">이전</a>
	<a href="./name?hostId=${hostId }">다음</a>




	
	<script src="/p5/js/host.js?v=<%=System.currentTimeMillis()%>"></script>
</body>

</html>