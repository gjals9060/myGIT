<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/enrollType.css" />
</head>
<body>
<form action="roomCount" method="post">
<h4>기본사항을 입력하세요</h4>
<progress value="10" max="100" ></progress>
<div id="wrap">
<h1>숙소 등록을 시작해볼까요?</h1>
<h2>숙소종류를 등록해봐요</h2>
<!--숙소 종류 
value를 0부터 2까지 설정 0이면 아파트 1이면 주택 2이면 팬션 -->
<select name="type" id="">
<option value="0">아파트</option>
<option value="1">주택</option>
<option value="2">팬션</option>
</select>
<!--숙소 유형 
value를 0부터 2까지 설정 0이면 전체 1이면 개인실 2이면 다인실 -->
<h2>숙소유형을 등록해봐요</h2>
<select name="roomType" id="">
<option value="0">전체</option>
<option value="1">개인실</option>
<option value="2">다인실</option>
</select>
<input type="submit" value="다음" />
</form>
<!--페이지 넘어가기(임시방안)  -->
<!-- <a href="roomCount">다음</a> -->
</div>
</body>
</html>