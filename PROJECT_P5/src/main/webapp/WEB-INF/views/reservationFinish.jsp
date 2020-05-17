<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="css/reservationFinish.css" />
</head>
<body>
<h1>에약이 완료되었습니다</h1>
<div id="wrap">
<div class="img">
<img src="img/bedroom.jpg" alt="사진" />
</div>
<div class="description">
	<div class="text">${host.htName} / ${host.rtName}</div>
	<div class="title">${host.name}</div>
	<div class="date">${booking.checkInDate} ~ ${booking.checkOutDate}</div>
	<div class="guestCount">${booking.guestCount}명</div>
</div>
<div class="finish-img">
<img src="img/reservationFinsh.png" alt="" />

</div>


<div class="message">즐거운 여행 되세요!</div>
<a href="/p5" class="move">확인</a>

</div>
</body>
</html>