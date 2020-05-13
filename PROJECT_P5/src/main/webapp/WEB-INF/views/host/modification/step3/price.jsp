<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3단계-금액</title>
</head>
<body>
<input type="hidden" id="hostId" value="${hostId }" />
	<%@include file="../headerStep.jsp" %>
	
	<div id="wrap">
		<h1>날짜마다 동일한 금액을 정해주세요!</h1>
		<!--0부터 9까지 숫자를 입력하지않으면 ""로 replace됨  -->
		금액 <input type="text" name="price"
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
		<div id="warning"></div>


		<div class="btn-block">
			<a href="./calendar?hostId=${hostId }">이전</a>
			<a href="../hostingStatus?hostId=${hostId }">다음</a>
		</div>
	</div>
	
	
	<script src="/p5/js/host.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
<script>
	//3단계의 헤더 내용을 변경한다. 
	
	// 3단계를 설명하는 설명문을 넣음. 
	var stepDescription = $('.step1-description');
	stepDescription.empty(); // 값을 지우고
	stepDescription.text('3단계 : 게스트를 맞이할 준비를 하세요'); // 값을 넣고
	
	/// nav안에 있는 내용을 지움
	$('nav *').remove();
	
	//nav grid를 다시 설정
	var nav = $('nav');
	
	//3칸씩 전체 넓이에 맞춰서 균등분할
	nav.css('grid-template-columns', 'repeat(3,1fr)');
	
	//nav의 내용에 3단계 tab을 추가
	nav.append(
		'<a  class="step1-tab" href="./modifyStayDate.jsp" id="tabStayDate">숙박일</a>'
		+ '<a  class="step1-tab" href="./modifyCalender.jsp" id="tabCalender">예약불가날짜</a>'
		+ '<a  class="step1-tab" href="./modifyPrice.jsp" id="tabPrice">금액</a>'
	);
	
	// 금액 tab에 배경추가
	$('#tabPrice').css('background','#bbb');

</script>
</html>