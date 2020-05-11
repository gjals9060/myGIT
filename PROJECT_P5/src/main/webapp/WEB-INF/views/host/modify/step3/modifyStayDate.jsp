<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3단계-숙박일지정</title>
</head>
<body>
	<%@include file="../headerStep.jsp"%>
	
	<div id="wrap">
		<h1>최대,최소 숙박일을 정해주세요</h1>
		최소 숙박 <input type="number" name="minimumStay"
			class="minimum-date" readonly value="1" />
		<button id="minimum-date-increase-quantity">▲</button>
		<button id="minimum-date-decrease-quantity">▼</button>
		<br>
		<div id="minium-warning"></div>

		최대 숙박 <input type="number" name="maximumStay"
			class="maximum-date" readonly value="1" />
		<button id="maximum-date-increase-quantity">▲</button>
		<button id="maximum-date-decrease-quantity">▼</button>
		<br>
		<div id="maximum-warning"></div>

		<div class="btn-block">
			<a href="">이전</a>
			<button>다음</button>
		</div>
	</div>
</body>

<script>
	// 3단계의 헤더 내용을 변경한다. 

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
	
	// 숙박일 tab에 배경 추가 
	$('#tabStayDate').css('background','#bbb');
	
	
	////////////////////////////////////////////////////////
	
	/*최소숙박 */
	$(function() {
		$('#minimum-date-decrease-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.minimum-date').val();
			var num = parseInt(stat, 10);
			num--;
			var a = $(".maximum-date").val();
			var num2 = parseInt(a, 10);
		/*최소숙박일이 더크면 경고창 띄운다  */
			  if (num>num2) {
			       
					$('#minium-warning').html("최소 숙박이 최대숙박보다 높으면 안됩니다");
				$('#maximum-warning').html("최대 숙박이 최소 숙박보다 낮으면 안됩니다 ");		
			  }
						  else{
							  
								$('#minium-warning').html("");
								$('#maximum-warning').html("");
								
						  }
			if (num <= 0) {
				/* 	alert("더이상 줄일수 없습니다") */
				num = 1;

			}
			$('.minimum-date').val(num);
		});
		$('#minimum-date-increase-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.minimum-date').val();
			var num = parseInt(stat, 10);
			num++;
			var a = $(".maximum-date").val();
			var num2 = parseInt(a, 10);
		
			  if (num>num2) {
				  
					$('#minium-warning').html("최소 숙박이 최대숙박보다 높으면 안됩니다");
				$('#maximum-warning').html("최대 숙박이 최소 숙박보다 낮으면 안됩니다 ");		

			  }
			  else{
				  
					$('#minium-warning').html("");
					$('#maxmium-warning').html("");
			  }
			$('.minimum-date').val(num);
		});
	});
	/*최대숙박 */
	$(function() {
		$('#maximum-date-decrease-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.maximum-date').val();
			var num = parseInt(stat, 10);
			num--;
			var b=$('.minimum-date').val();
			var num2= parseInt(b, 10);
			  if (num<num2) {
				  
					$('#minium-warning').html("최소 숙박이 최대숙박보다 높으면 안됩니다");
				$('#maximum-warning').html("최대 숙박이 최소 숙박보다 낮으면 안됩니다 ");		
		
						  }
						  else{
							  
								$('#minium-warning').html("");
								$('#maxmium-warning').html("");
						  }
			if (num <= 0) {
				/* 	alert("더이상 줄일수 없습니다") */
				num = 1;

			}
			$('.maximum-date').val(num);
		});
		$('#maximum-date-increase-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.maximum-date').val();
			var num = parseInt(stat, 10);
			num++;
			var b=$('.minimum-date').val();
			var num2= parseInt(b, 10);
			  if (num<num2) {
			       
				  
					$('#minium-warning').html("최소 숙박이 최대숙박보다 높으면 안됩니다");
				$('#maximum-warning').html("최대 숙박이 최소 숙박보다 낮으면 안됩니다 ");		
						  }
						  else{
							  
								$('#minium-warning').html("");
								$('#maximum-warning').html("");
						  }

			$('.maximum-date').val(num);
		});
	});
</script>


</html>