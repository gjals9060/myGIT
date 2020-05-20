<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P5 :: 예약하기</title>
<link rel="stylesheet" href="css/reservationPurchase.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
<jsp:include page="./header.jsp" />
<div id="wrap">
<div id="payment-window">
	<h1>확인</h1>
	<div class="titleSub">
	<img src="/p5/img/diamond.png" alt="" /> 이 숙소는 보통예약으로 가득차 있습니다
	</div>
	<div class="contents">
		<hr>
		<img src="img/bedroom.jpg" alt="이미지" /><br>
		<h1>${hostName}</h1>
	
		<div class="date">
			예약 예정일 : ${reservationDate}
		</div>
		<hr>
		<div class="priceNotice">
			인원 : ${booking.guestCount}
		<div class="price-calculation">
			<div class="price">${hostPrice}원  x ${dateCount}박</div> <span class="price-info">\ ${booking.payment}</span>
		</div>
		<hr>
		<div class="totalPay">
		<div class="total-text">총 합계</div>
		<div class="total-price">${booking.payment} 원</div>
		</div>
	</div>
	<hr>
			</div>

<div class="pay-text">
결제방법을 선택해주세요.</div>
<div class="paymentSelect">
<div> </div>
<button class="paymentButton">무통장 입금</button>
<button class="paymentButton">카드</button>
<button class="paymentButton"><img src="/p5/img/kakaopay-icon.png" alt="" class="kakaoPay" /></button>
<div> </div>
</div>
<hr />
<div id="refund-info">
<div class="refund-title">환불 정책</div><br />
<div class="refund-text">5월 19일 12:00 PM 전에 예약을 취소하면 총 숙박 요금의 50% 및 서비스 수수료 전액이 환불됩니다. 자세히 보기<br>호스트가 제공하는 환불 정책이 내게 적합한지 확인하세요. 3월 15일 혹은 그 이후 확정된 예약에는 코로나19 확산 사태에 따른 정상참작이 가능한 상황 정책이 적용되지 않습니다. 자세히 알아보기</div ><br />
</div>
<div class="refund-last">아래 버튼을 선택하면, 숙소 이용규칙, 환불 정책, 및 게스트 환불 정책에 동의하는 것입니다. 또한 숙박세 및 서비스 수수료를 포함하여 표시된 총 금액에 동의합니다.에어비앤비는 이제 이 지역에서 정부가 부과한 숙박세를 징수하여 납부합니다.</div>

<div>	<!-- 임시 결제 버튼 -->
	<form action="reservationFinish" method="post">
		<input type="hidden" id="hostId" name="hostId" value="${booking.hostId}">
		<input type="hidden" id="memberId" name="memberId" value="${booking.memberId}">
		<input type="hidden" id="checkInDate" name="checkInDate" value="${booking.checkInDate}" >
		<input type="hidden" id="checkOutDate" name="checkOutDate" value="${booking.checkOutDate}">
		<input type="hidden" id="guestCount" name="guestCount" value="${booking.guestCount}">
		<input type="hidden" id="payment" name="payment" value="${booking.payment}">
		
		<input type="hidden" id="mobilePhone" name="mobilePhone" value="${user.mobilePhone}">
		<input type="hidden" id="hostName" name="hostName" value="${hostName}">
				
		<input type="submit" value="예 약 요 청">
	</form>
</div>
</div>
</div>
<!-- <a href="roomList.jsp">취소</a> -->
<jsp:include page="./footer.jsp" />
</body>
<script>

$(".paymentButton").click(function() {
	$(".paymentButton").css("background", "#eee");
	$(this).css("background", "darkorange");
});


</script>
</html>