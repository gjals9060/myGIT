<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소설명</title>
<script src="/p5/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="/p5/css/description.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

</style>
</head>
<body>

	<input type="hidden" id="hostId" value="${hostId }" />
		
	<%@include file="./hostHeaderStep2.jsp" %>

	<script>
	//	$('.hosting-step').empty();
	//	$('.hosting-step').text("2단계:상세정보를 입력하세요");
		$('nav').css('grid-template-columns' ,'repeat(3, 1fr)');
		$('#progressBar').val('50');
		
		$('#tabDescription').css('background','#bbb');
	</script>
	<div id="wrap">
		<div id="container">
		
				<h1>게스트에게 숙소에 대해 설명해주세요.</h1>
				<h4>숙소에 대해 간략히 설명해주세요. 숙소와 주변 지역에 대한 정보에서 시작해 게스트와 어떻게 소통하고 싶은지 등의 내용을 적어주세요.</h4>

				<textarea id="countDescription" name="description" rows="10" cols="50" onkeyup="countWords()"></textarea>
				<span id="descriptionWord">500</span>
				<div class="warning"></div>
				<h1>정보를 추가하시겠어요? (선택사항)</h1>
				<h3>자세한 내용을 공유하려면 아래 추가 필드를 사용하세요.</h3>
				<textarea id="countEtc" name="descriptionEtc" rows="10" cols="50"></textarea>
	<a href="./photo?hostId=${hostId }" class="previous-link"><span class="previous">이전</span></a>
	<a onclick="check()" class="next-link"><span class="next">다음</span></a>

</div>
		<div id="left"></div>
	</div>


	
	<script src="/p5/js/host.js?v=<%=System.currentTimeMillis()%>"></script>
	
</body>
<script>
	function check() {
		var content = $("#countDescription").val();

		if (content.length == 0) {
			alert("설명을 입력해주세요");
			$('#countDescription').focus();
			return;
		}
		if (content.length > 500) {
			$('#countDescription').focus();
			return;
		} else {
			location.href="./name?hostId=${hostId }";
		}

	}
	/*글자수 구하기  */
	function countWords() {
		var content = $("#countDescription").val();
		if (content.length > 500) {
			$('.warning').html("제목을 500자 이하로 줄여주세요.");
			$('.warning').show();

			$('#countDescription').css("outline-color", "red");

		} else {
			$('.warning').hide();
			$('#countDescription').css("outline-color", "#008489");
		}

		$("#descriptionWord").html(500 - content.length);

	}
</script>
</html>