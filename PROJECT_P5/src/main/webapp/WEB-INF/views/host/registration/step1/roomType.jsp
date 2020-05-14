<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소형태</title>
<link rel="stylesheet" href="/p5/css/roomType.css" />
</head>
<body>
	<input type="hidden" id="hostId" value="${hostId }" />
	
	<%@include file="../hostHeader.jsp" %>
	
	<!-- 페이지별 헤더 변경사항 -->
	<script>
		$('#tabRoomType').css('background','#bbb'); // 숙소형태 tab
	
	</script>
	

	
	
	<div id="wrap">
		<h1>숙소 등록을 시작해볼까요?</h1>
		<h2>숙소종류를 등록해봐요</h2>
	
		<!--숙소 종류 value를 0부터 2까지 설정 0이면 아파트 1이면 주택 2이면 팬션 -->
		<select class="registration" name="hostTypeId" id="">
			<option value="">선택</option>
			<option value="A1">아파트</option>
			<option value="B2">주택</option>
			<option value="C3">팬션</option>
		</select> <select class="modification" name="hostTypeId" id="">
			<option value="A1">아파트</option>
			<option value="B2">주택</option>
			<option value="C3">팬션</option>
		</select>
		<!--숙소 유형 value를 0부터 2까지 설정 0이면 전체 1이면 개인실 2이면 다인실 -->
		<h2>숙소유형을 등록해봐요</h2>
		<select class="registration" name="roomTypeId" id="">
			<option value="">선택</option>
			<option value="A1">집 전체</option>
			<option value="B2">개인실</option>
			<option value="C3">다인실</option>
		</select> <select class="modification" name="roomTypeId" id="">
			<option value="A1">집 전체</option>
			<option value="B2">개인실</option>
			<option value="C3">다인실</option>
		</select>
		<!-- <input type="submit" value="다음" /> -->
		<!-- </form> -->
		<!--페이지 넘어가기(임시방안)  -->
		<a class="registration" href="../hostingList">이전</a> <a
			class="registration" href="./roomCount">다음</a> <a
			class="modification" href="../hostingStatus?hostId=${hostId }">이전</a>
		<a class="modification" href="./roomCount?hostId=${hostId }">다음</a>
	</div>




	<script src="/p5/js/host.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>