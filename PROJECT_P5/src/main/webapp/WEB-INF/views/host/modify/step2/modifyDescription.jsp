<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2단계-숙소설명</title>

</head>
<body>
	<%@include file="../headerStep.jsp"%>

	<div id="wrap">
		<h1>숙소설명을 수정합니다</h1>
	
		<h3>숙소 설명</h3>
		<textarea name="description" rows="10" cols="50"></textarea>
		<h3>기타사항(선택)</h3>
		<textarea name="descriptionEtc" rows="10" cols="50"></textarea>

		<div class="btn-block">
			<a href="">이전</a>
			<button>다음</button>
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
	
	// 숙소 설명 탭에 색추가 
	$('#tabDescription').css('background','#bbb');
	
	
</script>
</html>