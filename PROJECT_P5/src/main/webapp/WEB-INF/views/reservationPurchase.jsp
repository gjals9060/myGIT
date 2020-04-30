<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reservationPurchase.css" />
</head>
<body>

<div id="payment-window">
<div class="contents">
<img src="img/bedroom.jpg" alt="이미지" /><br>
<h1>${hostName}</h1> 
<div class="personnel">
게스트 :${personnel}
</div>
<div class="date">
${checkInDatecheckOutDate}
<hr>
</div>
<div class="price-calculation">
${hostPrice} x ${dateCount}박 <div class="price">${hostPrice}원</div><hr></div>
<div class="total-text">총합계</div> <div class="total-price">${payment}원</div>
</div>
</div>
<div class="pay-text">
결제방법을 선택해주세요
</div>

무통장 입금 <div class="kakaopay"><img src="img/payment_text.png" alt="" /></div>
<br>
<a href="roomList.jsp">취소</a>
</body>
</html>