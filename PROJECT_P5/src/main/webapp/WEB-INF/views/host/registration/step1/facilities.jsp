<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편의시설</title>
</head>
<body>
	<input type="hidden" id="hostId" value="${hostId }" />
	<%@include file="../hostHeader.jsp" %>
	<script>
		$('#progressBar').val('80');
		$('#tabFacilities').css('background','#bbb');
	</script>
	<!-- <form action="photo" method="post"> -->
	<h1>편의시설이 어떤게 있나요?</h1>
	<input type="checkbox" name="isTv" value="Y" />TV
	<br>
	<input type="checkbox" name="isWifi" value="Y" />WiFi
	<br>
	<input type="checkbox" name="isAirConditioner" value="Y" />에어컨
	<br>
	<input type="checkbox" name="isAirPurifier" value="Y" />공기청정기
	<br>
	<input type="checkbox" name="isHairDryer" value="Y" />헤어드라이기
	<br>
	<input type="checkbox" name="isIron" value="Y" />다리미
	<br>
	<hr>
	<h1>이용가능한 시설</h1>
	<input type="checkbox" name="isKitchen" value="Y" />주방
	<br>
	<input type="checkbox" name="isWashingMachine" value="Y" />세탁기
	<br>
	<input type="checkbox" name="isElevator" value="Y" />앨리베이터
	<br>
	<input type="checkbox" name="isParkingLot" value="Y" />주차
	<br>

	<!-- <input type="submit" value="다음" /> -->
	<!-- </form> -->
	<a class="registration" href="./address">이전</a>
	<button class="registration" onclick="completeStep1()">다음</button>
	<a class="modification" href="./address?hostId=${hostId }">이전</a>
	<a class="modification" href="../hostingStatus?hostId=${hostId }">다음</a>


	
	<script>
		function completeStep1() {
			var params = setParams();
			$.ajax({
				type : "POST",
				url : "step1/complete",
				data : params,
				success : function(hostId) {
					location.href = "../hostingStatus?hostId=" + hostId;
				},
				error : function() {
					alert("통신 오류..");
				}
			}); // AJAX-END
		}
	</script>
	<script src="/p5/js/host.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>