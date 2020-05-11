<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1단계-인원</title>


<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet" href="./modifyRoomCount.css" />
</head>
<body>
	<%@include file="../headerStep.jsp"%>

	<div id="wrap">

		<h3>최대 숙박인원</h3>
		<input type="text" name="capacity" class="maximum-stay" readonly
			value="1" />
		<button class="room-count-btn" id="maximum-increase-quantity">▲</button>
		<button class="room-count-btn" id="maximum-decrease-quantity">▼</button>
		<br>

		<h3>방 갯수를 입력해볼까요?</h3>
		<input type="text" name="roomCount" class="room-count" readonly
			value="1" />
		<button class="room-count-btn" id="count-increase-quantity">▲</button>
		<button class="room-count-btn" id="count-decrease-quantity">▼</button>
		<br>

		<h3>게스트가 사용할 수 있는 침대가 몇 개 인가요?</h3>
		<input type="text" name="bedCount" class="bed-count" readonly
			value="0" />
		<button class="room-count-btn" id="bed-increase-quantity">▲</button>
		<button class="room-count-btn" id="bed-decrease-quantity">▼</button>
		<br>

		<h3>게스트가 사용할 수 있는 욕실은요?</h3>
		<input type="text" name="bathroomCount" class="bathroom-count"
			readonly value="1" />
		<button class="room-count-btn" id="bathroom-increase-quantity">▲</button>
		<button class="room-count-btn" id="bathroom-decrease-quantity">▼</button>
		<!--index.jsp랑 똑같음  침대개수는 0이 낮은값 나머지는 1이 낮은값 그이상을줄일수 없음 -->

		<div class="btn-block">
			<a href="hostStatus.jsp">이전</a>
			<button id="roomCountNextBtn">다음</button>
		</div>
	</div>

</body>

<script>
	/////// 인원탭에 css 적용
	$("#tabRoomCount").css('background', "#bbb");
	
	
	
	///////////// 버튼 관리 ////////////
	////////*최대 숙박인원  */////////
	$(function() {
		$('#maximum-decrease-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.maximum-stay').val();
			var num = parseInt(stat, 10);
			num--;
			if (num <= 0) {
				/* 	alert("더이상 줄일수 없습니다") */
				num = 1;
			}
			$('.maximum-stay').val(num);
		});
		$('#maximum-increase-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.maximum-stay').val();
			var num = parseInt(stat, 10);
			num++;

			$('.maximum-stay').val(num);
		});
	});

	/*방갯수  */
	$(function() {
		$('#count-decrease-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.room-count').val();
			var num = parseInt(stat, 10);
			num--;
			if (num <= 0) {
				/* 	alert("더이상 줄일수 없습니다") */
				num = 1;

			}
			$('.room-count').val(num);
		});
		$('#count-increase-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.room-count').val();
			var num = parseInt(stat, 10);
			num++;

			$('.room-count').val(num);
		});
	});
	
	/*게스트가 사용할 침대개수  */
	$(function() {
		$('#bed-decrease-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.bed-count').val();
			var num = parseInt(stat, 10);
			num--;
			if (num < 0) {
				/* 	alert("더이상 줄일수 없습니다") */
				num = 0;

			}
			$('.bed-count').val(num);
		});
		$('#bed-increase-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.bed-count').val();
			var num = parseInt(stat, 10);
			num++;

			$('.bed-count').val(num);
		});
	});
	
	/*욕실  */
	$(function() {
		$('#bathroom-decrease-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.bathroom-count').val();
			var num = parseInt(stat, 10);
			num--;
			if (num <= 0) {
				/* 	alert("더이상 줄일수 없습니다") */
				num = 1;

			}
			$('.bathroom-count').val(num);
		});
		$('#bathroom-increase-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.bathroom-count').val();
			var num = parseInt(stat, 10);
			num++;

			$('.bathroom-count').val(num);
		});
	});
	
	/////////////////// 버튼관리 end ////////////////////////
	
	
	
	
	////// 다시 인원 탭을 돌아왔을 때 ajax로 값 가져오기
	$(function(){
		
	});
	
	
	///// 다음 버튼을 눌렀을 때 ajax
	$("#roomCountNextBtn").on('click', function() {
		
		var capacity = $('input[name=capacity]').val();
		var roomCount = $('input[name=roomCount]').val();
		var bedCount = $('input[name=bedCount]').val();
		var bathroomCount = $('input[name=bathroomCount]').val();
		
		alert(capacity+" "+roomCount+" "+bedCount+" "+bathroomCount); 
		
		//////// 전달할 데이터 ( 변수명은 변경후 입력)
		var param = {
				"capacity": capacity,
				"roomCount" : roomCount,
				"bedCount":bedCount,
				"bathroomCount":bathroomCount
		};
		
		$.ajax({
			url: "",
			data: param,
			type: "POST",
			success: function(){
				alert("통신성공");
			},
			error:function(){
				alert("통신실패");
			}
		});
	});
	
	
</script>
</html>