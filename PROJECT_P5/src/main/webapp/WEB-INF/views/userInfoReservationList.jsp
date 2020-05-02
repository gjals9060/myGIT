<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 예약 리스트</title>
<style>
#wrap {
	width: 1100px;
	margin: auto;
}

.reservation-list-main-title {
	font-size: 30px;
    margin-bottom: 30px;
}

/* 예약 컨테이너 */
.reservation-list-container {
	width: 100%;
	height: 500px;
	border: 1px solid;
	border-radius: 5px;
	overflow-y: auto;
}

/* 예약리스트 블럭 (게시물 하나) */
.resercation-list-block {
	display: grid;
	grid-template-columns: 10% 30% 40% 20%;
	height: 33%;
	width: 80%;
	border: 1px solid;
	border-radius: 5px;
	margin: 5px auto;
	box-sizing: border-box;
	grid-gap:1px;
}

.resercation-list-block:hover  {
	border: 1px solid red;
}

/* 예약번호 */
.reservation-list-num {
	margin: auto;
}

.reservation-list-img {
	margin: auto;
}

/* 예약한 게시물에 대한 이미지 */
.reservation-list-img>img {
	padding: 0 5px;
	width: 97%;
}

/* 예약한 게시물에 대한 정보 */
.reservaion-list-value {
	padding: 5px;
}




/* 예약한 게시물 제목 */
.reservation-list-title {
	font-size: 20px;
	font-weight: bold;
	width: 30%;
	height: 50px;
	overflow: hidden;
}


/* 편의사항 */
.reservation-list-facilities {

}

/* 예약한 날짜 */
.reservation-list-date {

}

/* 결제일 */
.reservation-list-buy-date{ 

}

/* 총 가격 */
.reservation-list-price {

}

/* 예약한 게시물 환불 */
.reservation-list-refund {
	margin: auto;
}

/* 예약한 게시물 환불 버튼 */
.reservation-list-refund-btn {

}

</style>

</head>
<body>
	<div id="wrap">
	<!-- 예약 container -->
		<div class="reservation-list-main-title">예약하신 숙소리스트 입니다.</div>
		<div class="reservation-list-container">
		<!-- 예약 리스트 블럭 (1개의 예약상태) 반복문을 돌려서 리스트 처리-->
			<div class="resercation-list-block">
				<div class="reservation-list-num">
					<p>12345</p>
				</div>
				<div class="reservation-list-img">
					<img src="./img/어린왕자.jpg" alt="" />
				</div>
				<div class="reservaion-list-value">
					<!-- 숙소 정보  -->
					<div class="reservation-list-title">경복궁</div>
					<div class="reservation-list-facilities"> 아파트 침대 1 욕실 1</div>
					<div class="reservation-list-date">2020.04.02 ~ 2020.04.05</div>
					<div class="reservation-list-buy-date">2020.04.01</div>
					<div class="reservation-list-price">50000 원</div>
				</div>
				<div class="reservation-list-refund">
					<button class="reservation-list-refund-btn">후기등록</button>
					<button class="reservation-list-refund-btn">환불</button>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>