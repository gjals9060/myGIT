<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 예약 리스트</title>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>


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
	grid-gap: 1px;
}

.resercation-list-block:hover {
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
.reservation-list-guestCount {
	
}

/* 예약한 날짜 */
.reservation-list-date {
	
}

/* 결제일 */
.reservation-list-buy-date {
	
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
	<jsp:include page="./header.jsp"></jsp:include>	

	<div id="wrap">
		<!-- 예약 container -->
		<div class="reservation-list-main-title">예약하신 숙소리스트 입니다.</div>
		<div class="reservation-list-container">
			<!-- 예약 리스트 블럭 (1개의 예약상태) 반복문을 돌려서 리스트 처리-->
<!-- 
			<div class="resercation-list-block">
				<div class="reservation-list-num">
					<p>12345</p>
				</div>
				<div class="reservation-list-img">
					<img src="./img/어린왕자.jpg" alt="" />
				</div>
				<div class="reservaion-list-value">
					숙소 정보 
					<div class="reservation-list-title">경복궁</div>
					<div class="reservation-list-guestCount">아파트 침대 1 욕실 1</div>
					<div class="reservation-list-date">2020.04.02 ~ 2020.04.05</div>
					<div class="reservation-list-buy-date">2020.04.01</div>
					<div class="reservation-list-price">50000 원</div>
				</div>
				<div class="reservation-list-refund">
					<button class="reservation-list-refund-btn">후기등록</button>
					<button class="reservation-list-refund-btn">환불</button>
				</div>
			</div>
-->

			<c:forEach var="index" begin="0" end="${fn:length(bookingList)-1}">
			
				<c:set var="booking" value="${bookingList[index]}" />

				<div class="resercation-list-block">
					<!-- <div class="reservation-list-num">
						<p>12345</p>
					</div> -->
					<div class="reservation-list-img">
						<img src="${RepresentativePhotoList[index].path}" alt="${RepresentativePhotoList[index].originalName}" />
					</div>
					<div id="reservaion-value_${index}" class="reservaion-list-value">
						<!-- 숙소 정보  -->
						<div class="reservation-list-title">${hostList[index].name}</div>
						<div id="inDate_${index}" class="reservation-list-date">체크 인 : ${booking.getCheckInDate()}</div>
						<div id="outDate_${index}" class="reservation-list-date">체크 아웃 : ${booking.getCheckOutDate()}</div>
						<div id="bookingDate_${index}" class="reservation-list-buy-date">예약일 : ${booking.bookingDate}</div>
						<div class="reservation-list-price">결제금액 : ${booking.payment}원</div>
						<div class="reservation-list-guestCount"> 예약인원 : ${booking.guestCount}</div>
					</div>
					<div class="reservation-list-refund">
						
						<button id="reply_${index}" class="reservation-list-refund-btn" onclick="">후기등록</button>
						<button id="refund_${index}" class="reservation-list-refund-btn" onclick="return refund('${booking.id}','${booking.hostId}','${booking.checkInDate}','${booking.checkOutDate}','${booking.payment}');">예약취소</button>						
					</div>
					<div class="reservation-list-refund" id="state_${index}"></div>
					
						<script>
					
							function getFormatDate(date){	// Date -> YYYY.MM.DD형태로(String)
								var year = date.getFullYear();              //yyyy
								var month = (1 + date.getMonth());          //M
								month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
								var day = date.getDate();                   //d
								day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
								return  year + '.' + month + '.' + day;
							}
							
							function parse(str) {	// String -> Date 파싱
							    var y = str.substr(0, 4);
							    var m = str.substr(5, 2);
							    var d = str.substr(8, 2);
							    return new Date(y,m-1,d);
							}
							
							function formatS1(str) {	// String(YYYY.MM.DD HH:mm:ss.sss) -> String (YYYY.MM.DD)
								var y = str.substr(0, 4);
							    var m = str.substr(5, 2);
							    var d = str.substr(8, 2);
								return y + "." + m-1 + "." + d;
							}
							
							function formatS2(str) {	// String(YYYY MM DD HH:mm:ss.sss) -> String (YYYY.MM.DD(HH:mm:ss))
								var y = str.substr(0, 4);
							    var m = str.substr(5, 2);
							    var d = str.substr(8, 2);
							    var t = str.substr(11, 8);
								return y + "." + m-1 + "." + d +"("+ t +")";
							}
							
						
							// 날짜 값 세팅
							$('#reservaion-value_${index}').ready(function(){
								var checkInDate = formatS1("${booking.checkInDate}");
								var checkOutDate = formatS1("${booking.checkOutDate}");
								var bookingDate = formatS2("${booking.bookingDate}");
								
								$('#inDate_${index}').empty();
								$('#inDate_${index}').append("체크 인 : " + checkInDate);
								
								$('#outDate_${index}').empty();
								$('#outDate_${index}').append("체크아웃 : " + checkOutDate);

								$('#bookingDate_${index}').empty();
								$('#bookingDate_${index}').append("예약날짜 : " + bookingDate);
							});
							
							// 상태 : 예약취소, 예약완료, 이용완료
							$('#state_${index}').ready(function() {
								
								var sCheckOutDate = "${booking.checkOutDate}";
								var sCancellationDate = "${booking.cancellationDate}";
								var cancellationDate = formatS2(sCancellationDate);
								var today = new Date();
								var sToday = getFormatDate(today);
								
								today = parse(sToday);
								console.log("s체크아웃 : " + sCheckOutDate + "취소날짜 : " + sCancellationDate + "sToday : " + sToday);
								
								//var checkOutDate = parse("테스트 날짜!");
								var checkOutDate = parse(sCheckOutDate);
								
								console.log("체크아웃 : " + checkOutDate + "오늘 날짜 : " + today);
								
								var dateCount = parseInt(today - checkOutDate);
								console.log("dateCount : " + dateCount);	
								
								//$('#state_'+index)
								if(sCancellationDate != ""){
									
									$('#state_${index}').empty();
									$('#state_${index}').append("예약 취소<br>취소날짜 : " + cancellationDate);
									
									$('#reply_${index}').hide();
									$('#refund_${index}').hide();
									
								}else if(dateCount < 0) {
									
									$('#state_${index}').empty();
									$('#state_${index}').append("예약 완료");
									
									$('#reply_${index}').hide();
									
								}else{
									
									$('#state_${index}').empty();
									$('#state_${index}').append("이용 완료");
									
									$('#refund_${index}').hide();
									
								}
								
							});

						</script>
				</div>

			</c:forEach>

		</div>
	</div>
</body>

<script type="text/javascript">


/* function countState(sCheckOutDate, sCancellationDate) {
	
	var today = new Date();
	
	function getFormatDate(date){	// Date -> YYYY.MM.DD형태로(String)
		var year = date.getFullYear();              //yyyy
		var month = (1 + date.getMonth());          //M
		month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		var day = date.getDate();                   //d
		day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		return  year + '.' + month + '.' + day;
	}
	
	
	function parse(str) {	// String -> Date 파싱
	    var y = str.substr(0, 4);
	    var m = str.substr(5, 2);
	    var d = str.substr(8, 2);
	    return new Date(y,m-1,d);
	}
	
	
	var sToday = getFormatDate(today);
	
	today = parse(sToday);
	console.log("s체크아웃 : " + sCheckOutDate + "취소 : " + sCancellationDate + "sToday : " + sToday);
	
	//var checkOutDate = parse("테스트 날짜!");
	var checkOutDate = parse(sCheckOutDate);
	
	console.log("체크아웃 : " + checkOutDate + "오늘 날짜 : " + today);
	
	var dateCount = parseInt(today - checkOutDate);
	console.log("dateCount : " + dateCount);	
	
	if(sCancellationDate == null){
		
		alert("예약취소한 건은 후기등록이 불가능합니다.");
		return false;
		
	}else if(dateCount < 0){
		alert("체크아웃날짜 이후부터 후기등록이 가능합니다.");
		return false;
		
	}else{
		
		alert("후기등록 gogo!");
		return true;
		
	}
	
	
}//end countState(); */

function refund(sBookingId, hostId, checkInDate, checkOutDate, payment) {
	
	console.log("bookingId : " + sBookingId + "hostId : " + hostId + ", checkInDate : " + checkInDate + ", checkOutDate : " + checkOutDate + ", payment : " + payment);
	var con_test = confirm("예약을 취소하고 환불하시겠습니까?");
	
	if(con_test == true){
		
		var bookingId = parseInt(sBookingId, 10);
			
		

		$.ajax({
			type : "POST",
			url : "ajax/refund",
			data : {"bookingId" : bookingId, "hostId" : hostId, "checkInDate" : checkInDate, "checkOutDate" : checkOutDate, "payment" : payment},
			//data : JSON.stringify( bookingEntity ),
			/* dataType : 'json',
			contentType: "application/json", */
			async : false,
			success : function(result) {
				
				if(result){
					alert("예약취소 성공 : True");
					refresh(); // 화면 갱신

				}else{
					alert("예약취소 실패 : False");
				}
				
			}, error : function() {
				alert("통신 실패");
			}
			
		});
		
		
	}else{
		return false;
	}
	
	
}

</script>

</html>





