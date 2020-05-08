<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
header {
	width: 100%;
	display: inline;
	top: 0px;
}

header * {
	display: inline;
}

.step1-status-btn {
	float: right;
	margin-right: 20px;
}

nav {
	display: grid;
    grid-template-columns: repeat(4,1fr);
    text-align: center;
    margin-top: 20px;
}

.step1-tab {
	border: 1px solid #008489;
	padding: 10px;
	color: black;
	text-decoration: none;
}

.step1-tab:visited,
.step1-tab:focus,
.step1-tab:visited  {
	color: black;
}

.step1-tab:hover {
	background: #bbb;
}
</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
</head>
<body>
<header>
	<div class="step1-header">
		<div class="logo" >
			<img src="" alt="로고" />
		</div>
		<div class="step1-description">
			1단계 : 기본사항을 입력하세요 
		</div>
		
		<div class="step1-status-btn">
			<button id="statusSave">저장 후 나가기</button>
		</div>
	</div>
	
	<nav>
		<a  class="step1-tab" href="" id="tabRoomType">숙소형태</a>
		<a class="step1-tab" href="" id="tabRoomCount">인원</a>
		<a class="step1-tab" href="" id="tabAddress">위치</a>
		<a class="step1-tab" href="" id="tabFacilities">편의시설</a>
	</nav>
	
</header>


</body>
</html>