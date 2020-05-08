<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1단계-편의시설</title>

<style>
#wrap {
	width: 1100px;
	margin: auto;
}

.facilities-btn-block {
	position: fixed;
	bottom:20%;
}
</style>
</head>
<body>

	<%@include file="../headerStep.jsp" %>
	<div id="wrap">
		<h1>편의시설이 어떤게 있나요?</h1>
		<input type="checkbox" name="isTv" value="Y" />TV<br> 
		<input type="checkbox" name="isWifi" value="Y" />WIFI<br> 
		<input type="checkbox" name="isAirConditioner" value="Y" />에어컨<br> 
		<input type="checkbox" name="isAirPurifier" value="Y" />공기청정기<br> 
		<input type="checkbox" name="isHairDryer" value="Y" />헤어드라이기<br> 
		<input type="checkbox" name="isIron" value="Y" />다리미<br> 

		
		<h1>이용가능한 시설</h1>
		<input type="checkbox" name="isKitchen" value="Y" />주방<br> 
		<input type="checkbox" name="isWashingMachine" value="Y" />세탁기<br> 
		<input type="checkbox" name="isElevator" value="Y" />앨리베이터<br> 
		<input type="checkbox" name="isParkingLot" value="Y" />주차<br> 
	
		<div class="facilities-btn-block">
			<a href="hostStatus.jsp">이전</a>
			<button id="facilitiesNextBtn">다음</button>
		</div>
		
	</div>
	<!-- <a href="photo">다음</a> -->
</body>
<script>
	
	var isTv,isWifi,isAirConditioner,isAirPurifier,isHairDryer,isIron,isKitchen,isWashingMachine,isElevator,isParkingLot =null;
	

	/////// 페이지가 load되면서 ajax로서 등록된 값 가져오기
	$(function(){
		// ajax로 값을 가져와서 각 변수에 넣어주고 그 변수에 따라 체크박스 체크를 해줌
		
		$.ajax({
			url:"",
			type:"POST",
			success: function(){
				/////// 변수에 Y,N값을 넣고
				
				////// Y라면 check
				
				$('input[name=isTv]').prop("checked", true);
			},
			error: function(){
				alert("안됌");
			}
		});
		
	}); 

	/// checkbox에 값이 Y 라면 표시, 아니라면 checke안함.

	$('#facilitiesNextBtn').on('click', function() {
	
		
		///편의시설
		isTv = ($('input[name=isTv]:checked').val()===undefined) ? 'N' : 'Y';
		isWifi = ($('input[name=isWifi]:checked').val()===undefined) ? 'N' : 'Y';
		isAirConditioner = ($('input[name=isAirConditioner]').val()===undefined) ? 'N' : 'Y';
		isAirPurifier = ($('input[name=isAirPurifier]').val()===undefined) ? 'N' : 'Y';
		isHairDryer = ($('input[name=isHairDryer]').val()===undefined) ? 'N' : 'Y';
		isIron = ($('input[name=isIron]').val()===undefined) ? 'N' : 'Y';
		
		
		/// 이용시설
		isKitchen = ($('input[name=isKitchen]').val()===undefined) ? 'N' : 'Y';
		isWashingMachine = ($('input[name=isWashingMachine]').val()===undefined) ? 'N' : 'Y';
		isElevator = ($('input[name=isElevator]').val()===undefined) ? 'N' : 'Y';
		isParkingLot = ($('input[name=isParkingLot]').val()===undefined) ? 'N' : 'Y';
		
		var param = {
				"isTv":isTv,
				"isWifi":isWifi,
				"isAirConditioner":isAirConditioner,
				"isAirPurifier":isAirPurifier,
				"isHairDryer":isHairDryer,
				"isIron":isIron,
				"isKitchen":isKitchen,
				"isWashingMachine":isWashingMachine,
				"isElevator":isElevator,
				"isParkingLot":isParkingLot
		};
		
		$.ajax({
			url:'',
			type: 'POST',
			data : param,
			success: function(){
				alert("성공");
			},
			error: function(){
				alert("실패");
			}
		});
		
				
	
	})
</script>



</html>