<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<title>P5 :: 예약 완료</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/p5/css/reset.css" />
<!-- <link rel="stylesheet" href="/p5/css/reservationFinish.css" /> -->
</head>

<body>
<jsp:include page="./header.jsp" />
	<div id="wrap">
		<div id="reservationFinish">
			<h1>에약이 완료되었습니다</h1>
			<div class="finishImg">
				<img src="img/bedroom.jpg" alt="사진" />
			</div>
			<div class="description">
				<div class="text">${host.htName}/${host.rtName}</div>
				<div class="title">${host.name}</div>
				<div class="date">${booking.checkInDate}~
					${booking.checkOutDate}</div>
				<div class="guestCount">${booking.guestCount}명</div>
			</div>
			<div class="finish-img">
				<img src="img/reservationFinsh.png" alt="" />
			</div>
			<div class="message">즐거운 여행 되세요!</div>
			<button class="revervFinishButton" onclick="">확인</button>
		</div>
	</div>

<jsp:include page="./footer.jsp" />
</body>

<script>
	$(".revervFinishButton").click(function() {
		window.location.replace("/p5/")
	})
</script>

</html>

