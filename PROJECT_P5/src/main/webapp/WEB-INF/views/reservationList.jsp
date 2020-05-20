<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메인</title>
<link rel="stylesheet" href="css/reset.css" />
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> -->
<script type="text/javascript" src="js/daterangepicker.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="stylesheet" href="css/daterangepicker.css" />
<style>
table {
	width: 729px;
	height: 222px;
}

.info-modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 100; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.info-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 568px;
	height: 432px;
	z-index: 10;
} /* The Close Button */
.info-close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.info-tip {
	font-size: 24px;
	font-weight: bold;
	margin-top: 50px;
}

.info-first {
    margin-left: 25px;
    margin-top: 30px;
    color: #484848;
    font-size: 18px;
    font-weight: bold;
}
.info-last {
    /* margin-top: 30px; */
    color: #484848;
    /* font-size: 18px; */
    /* font-weight: bold; */
}
.info-second {
	margin-left: 20px;
	font-size: 18px;
	color: #484848;
	font-weight: bold;
}

.info-third {
	margin-left: 20px;
	font-size: 18px;
	color: #484848;
	font-weight: bold;
}

.second {
    position: relative;
    top: 22px;
    left: -10px;
}

.third {
    position: relative;
    top: 24px;
    left: -7px;
    background-color: black;
    width: 24px;
    
}
.info-img-first {
    position: relative;
    top: 39px;
    /* left: -7px; */
    float: left;
    left: -5px;
}

#complete {
	color: white;
	background-color: #008489;
	width: 80px;
	height: 48px;
	border: none;
	margin-top: 20px;
	border-radius: 10px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
.description{
margin: -20px;
}
</style>

<style>
#wrap {
	overflow: auto;
}

button {
	display: inline;
}

.map-btn {
	display: none;
}

#mapWrapper {
	float: right;
	width: 570px;
	height: 570px;
	top: 110px;
	right: 0;
	z-index: -15;
	border: 2px solid;
}

.close-btn {
	display: none;
}

#button1 {
	vertical-align: middle;
	text-align: right;
	float: right;
	/* top: 116px; */
	left: 300px;
	z-index: 4;
	position: relative;
}
/* 리스트 */
.list-img {
	width: 300px;
	height: 200px;
}

table {
	border-collapse: collapse;
}

th, td {
	padding: 0;
}

@media all and (max-width:768px) {
	.map-btn {
		display: block;
	}
	#mapWrapper {
		visibility: hidden;
		width: 100%;
		height: 100%;
		float: right;
		width: 100%;
		height: 100%;
		position: fixed;
		top: 110px;
		right: 0px;
		z-index: 3;
		border: 2px solid;
	}
	.buttonMap {
		visibility: hidden;
		vertical-align: middle;
		text-align: right;
		float: right;
		position: fixed;
		top: 116px;
		right: 25%;
		z-index: 4;
	}
	.toggleBG {
		visibility: hidden;
		background: #53FF4C;
		width: 70px;
		height: 30px;
		border: 1px solid #53FF4C;
		border-radius: 15px;
	}
	.close-btn {
		width: 10%;
		height: 5%;
		float: right;
		position: fixed;
		top: 10.5%;
		z-index: 5;
		display: inline-block;
		right: 0;
		visibility: hidden;
	}
}

@media all and (max-width:480px) {
	.map-btn {
		display: block;
	}
	#mapWrapper {
		visibility: hidden;
		width: 100%;
		height: 100%;
		float: right;
		width: 100%;
		height: 100%;
		position: fixed;
		top: 110px;
		right: 0px;
		z-index: 3;
		border: 2px solid;
	}
	button#button1.buttonMap {
		visibility: hidden;
		vertical-align: middle;
		text-align: right;
		float: right;
		position: fixed;
		top: 116px;
		right: 25%;
		z-index: 4;
	}
	.toggleBG {
		visibility: hidden;
		background: #53FF4C;
		width: 70px;
		height: 30px;
		border: 1px solid #53FF4C;
		border-radius: 15px;
		right: 55%;
	}
	.close-btn {
		visibility: hidden;
		width: 10%;
		height: 5%;
		float: left;
		position: fixed;
		top: 10.5%;
		z-index: 5;
		display: inline-block;
	}
}
</style>
<style type="text/css">
.buttonMap {
	background: white;
	width: 230px;
	height: 40px;
	border-radius: 10px;
}

.toggleBG {
	background: #53FF4C;
	width: 70px;
	height: 30px;
	border: 1px solid #53FF4C;
	border-radius: 15px;
}

.toggleFG {
	background: #FFFFFF;
	width: 30px;
	height: 30px;
	border: none;
	border-radius: 15px;
	position: relative;
	left: 0px;
}
</style>

</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>

	<%-- 	
		<form action="reservationList" method="post">
		<!--지역 입력  -->
		지역 <input type="text" name="address" id="address" style="width:200px;" value="${address}" />
		<!--달력에 필요할 jquery plugin  -->

		<!--  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /> -->
		날짜 <input type="text" name="checkInDatecheckOutDate" id="checkInDatecheckOutDate" value="${checkInDatecheckOutDate}" />

		<script type="text/javascript">
		var date = new Date();
		var date2 = new Date();
		date2.setMonth(date.getMonth() + 3);	
		$(function() {
				
				$('input[name="checkInDatecheckOutDate"]').daterangepicker(
						{
							"autoApply" : true,
							"startDate" : "${startDate}",
							"endDate" : "${endDate}",
							"minDate" : date,
							"maxDate" : date2
						},
						function(start, end, label) {
							console.log('New date range selected: '
									+ start.format('YYYY-MM-DD') + ' to '
									+ end.format('YYYY-MM-DD')
									+ ' (predefined range: ' + label + ')');
						});
			});
		</script>
		<!--인원  -->

		인원 <input type='text' name='guestCount' id="guestCount" class="guestCount_input" value="${guestCount}">

		<button id="increaseQuantity">▲</button>
		<button id="decreaseQuantity">▼</button>
		<!--인원 카운트 다운 0미만은 줄일수 없게함  -->

		<script>
			$(function() {
				$('#decreaseQuantity').click(function(e) {
					e.preventDefault();
					var stat = $('.guestCount_input').val();
					var num = parseInt(stat, 10);
					num--;
					if (num < 0) {
						alert('더이상 줄일수 없습니다.');
						num = 0;
					}
					$('.guestCount_input').val(num);
				});
				$('#increaseQuantity').click(function(e) {
					e.preventDefault();
					var stat = $('.guestCount_input').val();
					var num = parseInt(stat, 10);
					num++;

					$('.guestCount_input').val(num);
				});
			});
		</script>

		<input type="submit" id="searchKeyword" name="searchKeyword" value="검색" />

	</form>
--%>
	<div id="wrap">
		<h1>장기숙박</h1>
		<span class="tip">여행 날짜와 게스트 인원수를 입력하면 1박당 총 요금을 확인할 수 있습니다.</span>
		<hr />
		<span class="tip2">내 집 같은 편안한 공간한 달 이상 숙박하고 숙박비를 절약해보세요.
			<button id="info">자세히 알아보기</button>
		</span>

		<div id="infoContent" class="info-modal">


			<div class="info-content">
				<span class="info-close">&times;</span>
				<h1>장기 숙박</h1>
				<span class="description">4주 이상의 편안한 숙박</span> <img src="/p5/img/reservation-info1.png" alt=""
					class="info-img-first" />
				<p class="info-first">내 집 같은 편안함 </p>
				<p class="info-first-tip">주방, 와이파이 등 한 달 이상의 장기 숙박에 필요한
					각종 편의시설이 완비되어 있습니다.</p>
				<br> <img src="/p5/img/reservation-info2.png" alt="" class="second" />
				<p class="info-second">유연하게 머물 수 있는 숙소</p>
				<p class="info-second-tip">임대 기간에 대한 계약 의무 없이 필요한 기간만 숙박하실 수 있습니다. 한 달 이상 숙박하면 숙박비를 절약할
					수 있습니다.</p>
				<br> <img src="/p5/img/p5info.jpg" alt="" class="third" />
				<p class="info-third">P5의 장점</p>
				<br />
				<p class="info-last">연중무휴 지원이 제공되는 에어비앤비에서 실제로 숙박한 게스트가 남긴 후기를 읽고 숙소를 안심하고 예약하세요</p>
				<button id="complete">완료</button>
			</div>

		</div>

		<!-- <!-- The Modal -->
		<!-- <div id="myModal" class="modal">

  Modal content
  <div class="modal-content">
    <span class="close">&times;</span>
  <h1>장기 숙박</h1>
<span>4주 이상의 편안한 숙박</span>

<p>내 집 같은 편안함</p>
<p>주방, 와이파이 등 한 달 이상의 장기 숙박에 필요한 각종 편의시설이 완비되어 있습니다.</p>


<p>유연하게 머물 수 있는 숙소</p>
<p>임대 기간에 대한 계약 의무 없이 필요한 기간만 숙박하실 수 있습니다. 한 달 이상 숙박하면 숙박비를 절약할 수 있습니다.</p>


<p>에어비앤비의 장점</p>
<p>연중무휴 지원이 제공되는 에어비앤비에서 실제로 숙박한 게스트가 남긴 후기를 읽고 숙소를 안심하고 예약하세요.</p>

   
  </div>

</div> -->
		-->

		<!--<div id="map" style="width:100%;height:350px;"></div>-->
		<div id="mapWrapper">
			<!--     	
				<input type="button" id="plusLevel" value="확대">
	    		<input type="button" id="minusLevel" value="축소">
	    		-->
			<div id="map" style="width: 100%; height: 100%;"></div>
		</div>
		<button class="close-btn">&times;</button>

		<div id="button1" class='toggleBG'
			style="float: right; /* position: fixed; */ /* top: 120px; */ position: relative; left: 80px; z-index: 5; top: 5px;">
			<button class='toggleFG'></button>
		</div>

		<button id="button1" class="buttonMap">
			<strong><font size="2"> 지도를 움직이며 검색 &nbsp; </font></strong>
		</button>

		<button id="button2" class="buttonMap"
			style="vertical-align: middle; text-align: center; float: right; position: fixed; top: 116px; right: 300px; z-index: 4;">
			<strong><font size="2"> 이 지역 검색 &nbsp; </font></strong>
		</button>

		<div id="loading" class="buttonMap"
			style="vertical-align: middle; text-align: center; float: right; position: fixed; top: 116px; right: 300px; z-index: 6;">
			<img alt="loading" src="img/loading.gif"
				style="width: 35px; height: 35px;">
		</div>




		<!-- 	<h1>지도 좌표 정보</h1> -->
		<div id="info"></div>

		<h1>리스트</h1>
		<div id="list"></div>
		<!--테블릿,모바일버전 지도보이기 아이콘  -->
		<button class="map-btn">지도보이기</button>

		<script type="text/javascript">
			var toggle = true;
			$('#button2').hide();
			$('#loading').hide();

			$(document).on('click', '#button1', function() {
				var toggleBG = $('.toggleBG');
				var toggleFG = $('.toggleBG').find('.toggleFG');
				var left = toggleFG.css('left');

				if (left == '0px') {

					toggleBG.css('background', '#CCCCCC');
					toggleActionStart(toggleFG, 'TO_RIGHT');
					console.log("스위치 꺼짐");
					toggle = false;

				} else if (left == '40px') {

					toggleBG.css('background', '#53FF4C');
					toggleActionStart(toggleFG, 'TO_LEFT');
					console.log("스위치 켜짐");
					toggle = true;
				}
			});

			// 토글 버튼 이동 모션 함수
			function toggleActionStart(toggleBtn, LR) {
				// 0.01초 단위로 실행
				var intervalID = setInterval(function() {
					// 버튼 이동
					var left = parseInt(toggleBtn.css('left'));
					left += (LR == 'TO_RIGHT') ? 5 : -5;
					if (left >= 0 && left <= 40) {
						left += 'px';
						toggleBtn.css('left', left);
					}
				}, 10);
				setTimeout(function() {
					clearInterval(intervalID);
				}, 201);
			}
		</script>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6252091adcb28726fdb95ebdf0b78361&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.240910457871784,
						131.86707687050958), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({
				zIndex : 1
			});

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			$(document).ready(searchPlace); // 페이지 로드시 검색결과 기본맵정보 가져옴

			$(document).ready(mapInfo); // 페이지 로드시 검색내에 DB맵정보 가져옴

			kakao.maps.event.addListener(map, 'idle', mapInfo);
			// 지도 중심 좌표나 확대 수준이 변경되면 발생한다. 단, 애니메이션 도중에는 발생하지 않는다.

			function searchPlace() {

				var keyword = $('#address').val();

				/* 
				$('#info').empty();
				$("#info").append(keyword);
				 */

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								keyword,
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);

									} else { //주소검색 실패 => 키워드검색

										// 장소 검색 객체를 생성합니다
										var ps = new kakao.maps.services.Places();

										// 키워드로 장소를 검색합니다
										ps.keywordSearch(keyword,
												placesSearchCB);

										// 키워드 검색 완료 시 호출되는 콜백함수 입니다
										function placesSearchCB(data, status,
												pagination) {
											if (status === kakao.maps.services.Status.OK) {

												// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
												// LatLngBounds 객체에 좌표를 추가합니다
												var bounds = new kakao.maps.LatLngBounds();

												for (var i = 0; i < data.length; i++) {
													displayMarker(data[i]);
													bounds
															.extend(new kakao.maps.LatLng(
																	data[i].y,
																	data[i].x));
												}

												// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
												map.setBounds(bounds);
											}
										}

										// 지도에 마커를 표시하는 함수입니다
										function displayMarker(place) {

											// 마커를 생성하고 지도에 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : new kakao.maps.LatLng(
																place.y,
																place.x)
													});

											// 마커에 클릭이벤트를 등록합니다
											kakao.maps.event
													.addListener(
															marker,
															'click',
															function() {
																// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
																infowindow
																		.setContent('<div style="padding:5px;font-size:12px;">'
																				+ place.place_name
																				+ '</div>');
																infowindow
																		.open(
																				map,
																				marker);
															});

										}

									}

								}); //end-addressSearch

			} //end-searchPlace

			function gogo(id) { //postPage로
				var checkInDatecheckOutDate = $('#checkInDatecheckOutDate')
						.val();
				var guestCount = $('#guestCount').val();
				var startDate = "${startDate}";
				var endDate = "${endDate}";
				var address = "${address}";

				location.href = "postPage?id=" + id + "&address=" + address
						+ "&startDate=" + startDate + "&endDate=" + endDate
						+ "&guestCount=" + guestCount;
			}

			function mapInfo() {

				// 지도 영역정보를 얻어옵니다 
				var bounds = map.getBounds();

				// 영역정보의 남서쪽 정보를 얻어옵니다 
				var swLatlng = bounds.getSouthWest();

				// 영역정보의 북동쪽 정보를 얻어옵니다 
				var neLatlng = bounds.getNorthEast();

				// 지도 중심좌표를 얻어옵니다 
				var latlng = map.getCenter();

				// 지도의  레벨을 얻어옵니다
				var level = map.getLevel();

				var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
				message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 '
						+ latlng.getLng() + '입니다</p>';

				var message = '<p>영역좌표는 <br>남서쪽 위도, 경도는  '
						+ swLatlng.toString() + '이고 <br>';
				message += '북동쪽 위도, 경도는  ' + neLatlng.toString() + '이고 <br>';
				message += '<p>지도 레벨은 ' + level + ' 이고</p>';
				message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 '
						+ latlng.getLng() + '입니다</p>';

				/*
				var resultDiv = document.getElementById('result');   
				resultDiv.innerHTML = message; 
				 */
				/* 
				$('#info').empty();
				$('#info').append(message);
				 */
				if (!toggle) {
					$('#button1').hide();
					$('#button2').show();

					$('#button2').on('click', function() {

						console.log("button2 입력");
						ajaxAction();

						$('#button1').show();
						$('#button2').hide();

					});
				}

				// ajax로 요청
				if (toggle) {
					ajaxAction();
				}

				function ajaxAction() {

					var searchInputDTO = {
						"swLatlng" : swLatlng.toString(),
						"neLatlng" : neLatlng.toString(),
						"guestCount" : "${guestCount}",
						"startDate" : "${startDate}",
						"endDate" : "${endDate}"
					};

					$
							.ajax({
								type : 'POST',
								url : 'ajax/Hosts',
								data : JSON.stringify(searchInputDTO),
								dataType : 'json',
								contentType : "application/json",
								success : function(result) {

									$('#list').empty();

									$
											.each(
													result,
													function(index, item) {

														var ss = '';

														ss += '<hr>'
																+ '<article onclick="gogo('
																+ item.id
																+ ')" id="place'
																+ index
																+ '">'
																+ '<div>'
																+ '<table border="1">'
																+ '<tr>'
																+ '<td rowspan="4" align = "center">'
																+ '<img class="list-img" alt="' + item.originalName + '" src="' + item.path  + '"  style="width: 300px; height: 200px;"  >'
																+ '</td>'
																+ '</tr>'
																+ '<tr>'
																+ '<td>'
																+ 'TYPE : '
																+ item.htName
																+ '/ '
																+ item.rtName
																+ "</td>"
																+ '</tr>'
																+ '<tr>'
																+ '<td>'
																+ '<h3>'
																+ item.name
																+ '</h3>'

																+ '</td>'
																/* + '<td>'
																+ '&nbsp; address :'
																+ item.address
																+ '</td>' */
																+ '</tr>'
																+ '<tr>'
																+ '<td class="capacity">'
																+ '&nbsp;guests : '
																+ item.capacity
																+ '</td>'
																+ '<td  class="count">'
																+ ' room '
																+ item.roomCount
																+ ' bed '
																+ item.bedCount
																+ ' bathroom '
																+ item.bathroomCount
																+ '</td>'
																+ '</tr>'
																+ '<tr>'
																/* + '<td>'
																+ 'room : '
																+ item.description
																+ '</td>'
																+ '<td>'
																+ 'guests :'
																+ item.descriptionEtc
																+ '</td>' */
																+ '</tr>'
																+ '</table>'
																+ '</div>'
																+ '</article>'
																+ '<hr>'
																+ '<br>';

														//console.log(ss);

														//마커 추가
														var imageSrc1 = './img/markerBlue.png', // 마커이미지의 주소입니다    
														imageSize1 = new kakao.maps.Size(
																45, 50), // 마커이미지의 크기입니다
														imageOption1 = {
															offset : new kakao.maps.Point(
																	20, 50)
														}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

														// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
														var markerImage1 = new kakao.maps.MarkerImage(
																imageSrc1,
																imageSize1,
																imageOption1), markerPosition1 = new kakao.maps.LatLng(
																item.latitude,
																item.longitude); // 마커가 표시될 위치입니다
														// 기본 마커를 생성합니다
														var marker = new kakao.maps.Marker(
																{
																	position : markerPosition1,
																	image : markerImage1, // 마커이미지 설정
																	title : item.name

																});

														// 이벤트 마커 이미지
														//마커 추가
														var imageSrc2 = './img/markerRed.png', // 마커이미지의 주소입니다    
														imageSize2 = new kakao.maps.Size(
																65, 70), // 마커이미지의 크기입니다
														imageOption2 = {
															offset : new kakao.maps.Point(
																	30, 60)
														}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

														var markerImage2 = new kakao.maps.MarkerImage(
																imageSrc2,
																imageSize2,
																imageOption2), markerPosition2 = new kakao.maps.LatLng(
																item.latitude,
																item.longitude); // 마커가 표시될 위치입니다

														// 마커를 생성합니다
														var marker0 = new kakao.maps.Marker(
																{
																	position : markerPosition2,
																	image : markerImage2, // 마커이미지 설정
																	title : item.name,
																	zIndex : 4

																});
														// 마커가 지도 위에 표시되도록 설정합니다
														marker.setMap(map);

														// 마커에 클릭이벤트를 등록합니다
														kakao.maps.event
																.addListener(
																		marker,
																		'click',
																		function() {
																			// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
																			infowindow
																					.setContent('<div style="padding:6px;font-size:13px;">'
																							+ item.name
																							+ '</div>');
																			infowindow
																					.open(
																							map,
																							marker);
																		});
														// 마커에 마우스 커서를 올리면 발생한다.
														kakao.maps.event
																.addListener(
																		marker,
																		'mouseover',
																		function() {
																			$(
																					'#place'
																							+ index)
																					.css(
																							"color",
																							"red");
																			marker
																					.setMap(null);
																			marker0
																					.setMap(map);
																		});

														// 마우스 커서가 마커에서 벗어나면 발생한다.
														kakao.maps.event
																.addListener(
																		marker0,
																		'mouseout',
																		function() {
																			$(
																					'#place'
																							+ index)
																					.css(
																							"color",
																							"black");
																			marker0
																					.setMap(null);
																			marker
																					.setMap(map);
																		});

														$('#list').append(ss);

														$('#place' + index)
																.hover(
																		function() {
																			$(
																					this)
																					.css(
																							"color",
																							"red");
																			marker
																					.setMap(null);
																			marker0
																					.setMap(map);

																		},
																		function() {
																			$(
																					this)
																					.css(
																							"color",
																							"black");
																			marker0
																					.setMap(null);
																			marker
																					.setMap(map);
																		});

													});

									if (result == '') {

										$('#list').empty();
										console.log("조건에 맞는 데이터 없음");

										$('#list')
												.append(
														'<br> <h2> 조회하신 조건에 맞는 숙소가 존재하지 않습니다. </h2>');
									}

								},
								beforeSend : function() {

									$("#loading").show();

								},
								complete : function() {

									$("#loading").hide();

								},
								error : function() {
									alert("통신 실패");
								}

							}) // end-ajax

				} // end-ajaxAction

			}; // end-mapInfo

			/*지도 보이기  */
			$('.map-btn').click(function(e) {
				$('#mapWrapper').css("visibility", "visible");
				$('.buttonMap').css("visibility", "visible");
				$('.toggleBG').css("visibility", "visible");
				$('.close-btn').css("visibility", "visible");
			});
			$('.close-btn').click(function(e) {
				$('#mapWrapper').css("visibility", "hidden");
				$('.buttonMap').css("visibility", "hidden");
				$('.toggleBG').css("visibility", "hidden");
				$('.close-btn').css("visibility", "hidden");
			});
			/* 			/*정보  */

			// Get the modal
			/* var modal = document.getElementById("myModal");

			 // Get the button that opens the modal
			 var btn = document.getElementById("myBtn");

			 // Get the <span> element that closes the modal
			 var span = document.getElementsByClassName("close")[0];

			 // When the user clicks the button, open the modal 
			 btn.onclick = function() {
			 modal.style.display = "block";
			 }

			 // When the user clicks on <span> (x), close the modal
			 span.onclick = function() {
			 modal.style.display = "none";
			 }

			 // When the user clicks anywhere outside of the modal, close it
			 window.onclick = function(event) {
			 if (event.target == modal) {
			 modal.style.display = "none";
			 }
			 }/*지도 보이기  */
			/* $('.close').click(function(e) {
			
			 $('.modal').hide();

			 }); */

			// Get the modal
			var modal = document.getElementById("infoContent");

			// Get the button that opens the modal
			var btn = document.getElementById("info");

			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("info-close")[0];
			var btn2 = document.getElementById("complete")
			var btn3 = document.getElementById("map")

			// When the user clicks the button, open the modal 
			btn.onclick = function() {
				modal.style.display = "block";

			}

			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal.style.display = "none";
			}
			btn2.onclick = function() {
				modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";

				}
			}
			$('.close').click(function(e) {

				$('#map').css("visibility", "visible");
				$('.buttonMap').css("visibility", "visible");

			});
			$('#info').click(function(e) {

				$('#map').css("visibility", "visible");
				$('.buttonMap').css("visibility", "visible");

			});
		</script>


	</div>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>