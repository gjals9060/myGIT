<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="">
<h1>편의시설이 어떤게 있나요?</h1>
<input type="checkbox" name="facilities" value="isTv" />TV<br>
<input type="checkbox" name="facilities" value="isWifi" />Wifi<br>
<input type="checkbox" name="facilities" value="isAirConditioner" />에어컨<br>
<input type="checkbox" name="facilities" value="isHairDryer" />헤어드라이기<br>
<input type="checkbox" name="facilities" value="isIron" />다리미<br>
<hr>
<h1>이용가능한 시설</h1>
<input type="checkbox" name="availableFacilities" value="isKitchen" />주방<br>
<input type="checkbox" name="availableFacilities" value="isWashingMachine" />세탁기<br>
<input type="checkbox" name="availableFacilities" value="isElevator" />앨리베이터<br>
<input type="checkbox" name="availableFacilities" value="isParkingLot" />주차<br>

<input type="submit" value="다음" />
</form>
<a href="enrollAddress.jsp">이전</a>
<a href="enrollPhoto.jsp">다음</a>
</body>
</html>