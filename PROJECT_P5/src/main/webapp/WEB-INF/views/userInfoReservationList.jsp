<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P5 :: 예약 리스트</title>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet" href="/p5/css/reset.css" />
<link rel="stylesheet" href="/p5/css/userInfoReservationList.css" />
</head>
<body>
	<jsp:include page="./header.jsp" />
	<div id="wrap">
		<!-- 예약 container -->
		<div class="reservation-list-main-title">예약 숙소 리스트</div>
		<div class="refundNotice">예약 취소에 따른 환불 금액은 <a onclick="alert('환불정책')">환불 정책</a>에 따릅니다.</div>

		<div class="reservation-list-container">
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
						<div class="reservation-list-title">${hostList[index].name} [예약번호 : ${booking.id}]</div>
						<br>
						<div id="inDate_${index}" class="reservation-list-date">체크 인 : ${booking.getCheckInDate()}</div>
						<div id="outDate_${index}" class="reservation-list-date">체크 아웃 : ${booking.getCheckOutDate()}</div>
						<div id="bookingDate_${index}" class="reservation-list-buy-date">예약일 : ${booking.bookingDate}</div>
						<div id="cancleDate_${index}" class="reservation-list-buy-cancle"></div>
						<br>
						<div class="reservation-list-price">결제 금액 : ${booking.payment}원</div>
						<div id="person_${index}" class="reservation-list-guestCount"> 예약 인원 : ${booking.guestCount}인</div>
					</div>
					<div class="reservation-list-refund">
						
						<button id="reply_${index}" class="reservation-list-refund-btn reply" onclick="">후기등록</button>
						<button id="refund_${index}" class="reservation-list-refund-btn" onclick="return refund('${user.mobilePhone}','${booking.id}','${booking.hostId}','${booking.checkInDate}','${booking.checkOutDate}','${booking.payment}');">예약취소</button>						
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
								return y + "." + m-1 + "." + d +" <span class='dateText2'>("+ t +")</span>";
							}
							
						
							// 날짜 값 세팅
							$('#reservaion-value_${index}').ready(function(){
								var checkInDate = formatS1(/"${booking.checkInDate}");
								var checkOutDate = formatS1("${booking.checkOutDate}");
								var bookingDate = formatS2("${booking.bookingDate}");
								
								$('#inDate_${index}').empty();
								$('#inDate_${index}').append("체크 인 : " + checkInDate);
								
								$('#outDate_${index}').empty();
								$('#outDate_${index}').append("체크아웃 : " + checkOutDate);

								$('#bookingDate_${index}').empty();
								$('#bookingDate_${index}').append("예약일 : " + bookingDate);
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
								
								//var checkOutDate = parse("테스트날짜");
								var checkOutDate = parse(sCheckOutDate);
								
								console.log("체크아웃 : " + checkOutDate + "오늘 날짜 : " + today);
								
								var dateCount = parseInt(today - checkOutDate);
								console.log("dateCount : " + dateCount);	
								
								//$('#state_'+index)
								if(sCancellationDate != ""){
									
									$('#state_${index}').empty();
									$('#state_${index}').append("예약<br>취소");
									$('#cancleDate_${index}').append("취소일 : " + cancellationDate);
									
									$('#cancleDate_${index}').css("display", "block");
									$('#inDate_${index}').css("display", "none");
									$('#outDate_${index}').css("display", "none");
									$('#person_${index}').css("display", "none");
									
									$('#reply_${index}').hide();
									$('#refund_${index}').hide();
									
									$('#state_${index}').prev().prev().prev().css("opacity", "0.5");
									$('#state_${index}').parent().css("color", "#bbb");
									
									
								}else if(dateCount < 0) {
									
									$('#state_${index}').empty();
									$('#state_${index}').append("예약<br>완료");
									
									$('#reply_${index}').hide();

								}else{
									
									$('#state_${index}').empty();
									$('#state_${index}').append("이용<br>완료");
									
									$('#refund_${index}').hide();
									
									$('#state_${index}').parent().css("background", "#ddd");
								}
								
							});
							
							$('#reply_${index}').on('click', function() {
								
								alert("후기 등록으로 이동");
								
								var userId = "${user.id}";
								
								var bookingId = "${booking.id}";
								var hostName = "${hostList[index].name}";
								var checkInDate = "${booking.getCheckInDate()}";
								var checkOutDate = "${booking.getCheckOutDate()}";
								var hostPhotoPath = "${RepresentativePhotoList[index].path}";
								var hostPhotoName = "${RepresentativePhotoList[index].originalName}";
								
								/*jQuery form 전송 방식*/
								// create element(form)
								var newForm = $('<form><form>');
								
								// set attribute(form)
								newForm.attr("name","newForm");
								newForm.attr("method","POST");
								newForm.attr("action","moveReview");
								newForm.attr("target","popup_window");
								
								// create element & set attribute (input)
								newForm.append($('<input/>', {type: 'hidden', name: 'memberId', value: userId}));
								newForm.append($('<input/>', {type: 'hidden', name: 'bookingId', value: bookingId}));
								newForm.append($('<input/>', {type: 'hidden', name: 'hostName', value: hostName}));
								newForm.append($('<input/>', {type: 'hidden', name: 'checkInDate', value: checkInDate}));
								newForm.append($('<input/>', {type: 'hidden', name: 'checkOutDate', value: checkOutDate}));
								newForm.append($('<input/>', {type: 'hidden', name: 'hostPhotoPath', value: hostPhotoPath}));
								newForm.append($('<input/>', {type: 'hidden', name: 'hostPhotoName', value: hostPhotoName}));
								

								// append form(to body)	
								newForm.appendTo('body');
								
								window.open("", "popup_window", "width=500, height=450, scrollbars=no, toolbar=no, menubar=no, location=no : 주소창 표시안함, status=no");
								
								newForm.submit();
								
								$("#reply_${index}").text("등록완료");
								$('#reply_${index}').css("background", "#bbb");
																
							});
						</script>
				</div>

			</c:forEach>

		</div>
	</div>
	<jsp:include page="./footer.jsp" />
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

function refund(mobilePhone, sBookingId, hostId, checkInDate, checkOutDate, payment) {
	
	console.log("mobilePhone : " + mobilePhone + "bookingId : " + sBookingId + ", hostId : " + hostId + ", checkInDate : " + checkInDate + ", checkOutDate : " + checkOutDate + ", payment : " + payment);
	var con_test = confirm("예약을 취소하고 환불하시겠습니까?");
	
	if(con_test == true){
		
		var bookingId = parseInt(sBookingId, 10);
			
		

		$.ajax({
			type : "POST",
			url : "ajax/refund",
			data : {"mobilePhone" : mobilePhone, "bookingId" : bookingId, "hostId" : hostId, "checkInDate" : checkInDate, "checkOutDate" : checkOutDate, "payment" : payment},
			//data : JSON.stringify( bookingEntity ),
			/* dataType : 'json',
			contentType: "application/json", */
			async : false,
			success : function(result) {
				
				if(result){
					alert("예약이 취소되었습니다.");
					location.reload();

				}else{
					alert("예약 취소가 실패했습니다. 다시 시도해주세요.");
				}
				
			}, error : function() {
				alert("통신 실패");
			}
			
		});
		
		
	}else{
		return false;
	}
	
	
}

/* 후기 등록이 완료되면 부분에 아래 추가해주기
 
$("#reply_${index}").text("등록완료");
$('reply_${index}').css("background", "#bbb");
 
 */


</script>

</html>





