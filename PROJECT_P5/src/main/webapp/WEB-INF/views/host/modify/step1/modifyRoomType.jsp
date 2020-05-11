<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1단계-숙소수정</title>

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet" href="./modifyRoomType.css" /> <!--  -->
<link rel="stylesheet" href="css/reset.css" />
</head>

<body>

	<%@include file="../headerStep.jsp" %>

	<div id="wrap">
		<h1>등록하실 숙소의 종류는 무엇인가요?</h1>
		<h2>숙소종류를 등록해봐요</h2>
		<!--숙소 종류 value를 0부터 2까지 설정 0이면 아파트 1이면 주택 2이면 팬션 -->
		<select name="type" id="hostUpdateType">
			<option value="0">아파트</option>
			<option value="1">주택</option>
			<option value="2">팬션</option>
		</select>
		<!--숙소 유형 value를 0부터 2까지 설정 0이면 전체 1이면 개인실 2이면 다인실 -->
		<h2>숙소유형을 등록해봐요</h2>
		<select name="roomType" id="hostUpdateRoomType">
			<option value="0">전체</option>
			<option value="1">개인실</option>
			<option value="2">다인실</option>
		</select>

		<div class="btn-block">
			<a href="hostStatus.jsp">이전</a>
			<button id="roomTypeNextBtn">다음</button>
		</div>

	</div>
</body>

<script>
	$("#tabRoomType").css('background', "#bbb");

	$(function(){
		/////// onload 될때 ajax로 db에 저장된 값을 가져옴
	});
	
	
	///////////////// 저장후 나가기 버튼 ///////////
	$("#statusSave").on('click', function() {
		var hostUpdateTypeValue = $("#hostUpdateType").val(); ///// 숙소의 종류
		var hostUpdateRoomTypeValue = $("#hostUpdateRoomType").val();

		
		$.ajax({
			url : "roomTypeUpdate", //// 숙소 형태 변경 url
			type : "POST",
			dataType : "json",
			data : {
				type : hostUpdateTypeValue,
				roomType : hostUpdateRoomTypeValue
			},
			success : function(result) {
				alert("확인");
				//// 성공시 페이지 이동.
				/* location.herf */
			},

			error : function(result) {
				alert("통신에러");
				location.href="../../hostingStatus.jsp"

			}

		});
		
	})


	/////숙소형태 - 버튼 클릭시 /////
	$("#roomTypeNextBtn").on("click", function() {
		var hostUpdateTypeValue = $("#hostUpdateType").val(); ///// 숙소의 종류
		var hostUpdateRoomTypeValue = $("#hostUpdateRoomType").val();

		alert(hostUpdateTypeValue); 
		alert(hostUpdateRoomTypeValue);

		$.ajax({
			url : "roomTypeUpdate", //// 숙소 형태 변경 url
			type : "POST",
			dataType : "json",
			data : {
				hostTypeId : hostUpdateTypeValue,
				roomTypeId : hostUpdateRoomTypeValue
			},
			success : function(result) {
				alert("확인");
				//// 성공시 페이지 이동.
				/* location.herf */
			},

			error : function(result) {
				alert("통신에러");

			}

		});

	});
</script>

</html>