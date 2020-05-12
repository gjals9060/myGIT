<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <form action="photo" method="post"> -->
<h1>편의시설이 어떤게 있나요?</h1>
<input type="checkbox" name="isTv" value="Y" />TV<br>
<input type="checkbox" name="isWifi" value="Y" />WiFi<br>
<input type="checkbox" name="isAirConditioner" value="Y" />에어컨<br>
<input type="checkbox" name="isAirPurifier" value="Y" />공기청정기<br>
<input type="checkbox" name="isHairDryer" value="Y" />헤어드라이기<br>
<input type="checkbox" name="isIron" value="Y" />다리미<br>
<hr>
<h1>이용가능한 시설</h1>
<input type="checkbox" name="isKitchen" value="Y" />주방<br>
<input type="checkbox" name="isWashingMachine" value="Y" />세탁기<br>
<input type="checkbox" name="isElevator" value="Y" />앨리베이터<br>
<input type="checkbox" name="isParkingLot" value="Y" />주차<br>

<!-- <input type="submit" value="다음" /> -->
<!-- </form> -->
<a href="address">이전</a>
<a href="step1/complete">다음</a>


<script src="/p5/js/jquery-3.4.1.js"></script>
<script src="/p5/js/host.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>