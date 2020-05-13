<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2단계-사진등록</title>
</head>
<body>
<input type="hidden" id="hostId" value="${hostId }" />
	<%@include file="../headerStep.jsp"%>
	
	<!-- 사진이미지는 월요일에 정정  -->
	<div id="wrap">
	
	
	
	
		<div class="btn-block">
			<a href="../hostingStatus?hostId=${hostId }">이전</a>
			<a href="./description?hostId=${hostId }">다음</a>
		</div>
	</div>



</body>

<script>

	// 2단계의 헤더 내용을 변경한다. 
	
	//2단계를 설명하는 설명문을 넣음. 
	var stepDescription = $('.step1-description');
	stepDescription.empty(); // 값을 지우고
	stepDescription.text('2단계 : 상세정보를 입력하세요'); // 값을 넣고

	/// nav안에 있는 내용을 지움
	$('nav *').remove();

	//nav grid를 다시 설정
	var nav = $('nav');

	//3칸씩 전체 넓이에 맞춰서 균등분할
	nav.css('grid-template-columns', 'repeat(3,1fr)');

	//nav의 내용에 2단계 tab을 추가
	nav.append(
		'<a  class="step1-tab" href="./modifyPhoto.jsp" id="tabPhoto">사진등록</a>'
		+ '<a  class="step1-tab" href="./modifyDescription.jsp" id="tabDescription">숙소설명</a>'
		+ '<a  class="step1-tab" href="./modifyTitle.jsp" id="tabTitle">숙소명</a>'
	);
	
	// 사진등록 페이지라면 
	$('#tabPhoto').css('background','#bbb');
	
	
</script>
</html>