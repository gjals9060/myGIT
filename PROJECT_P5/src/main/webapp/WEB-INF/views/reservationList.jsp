<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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

<link rel="stylesheet" href="css/daterangepicker.css" />
<style>
button {
	display: inline;
}
</style>
<style type="text/css">
	.buttonMap{background: white; width: 230px; height: 40px; border-radius: 10px;}
    .toggleBG{background: #53FF4C; width: 70px; height: 30px; border: 1px solid #53FF4C; border-radius: 15px;}
    .toggleFG{background: #FFFFFF; width: 30px; height: 30px; border: none; border-radius: 15px; position: relative; left: 0px;}
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
	
		<!--<div id="map" style="width:100%;height:350px;"></div>-->
		<div id="mapWrapper" style="float: right; width: 570px; height: 570px; position:fixed; top: 110px; right:0; z-index: 3; border: 2px solid;">
				<!--     	
				<input type="button" id="plusLevel" value="확대">
	    		<input type="button" id="minusLevel" value="축소">
	    		-->
			<div id="map" style="width: 100%; height: 100%;" ></div>
	    </div>
	    
	    <div id="button1" class='toggleBG' style="float: right; position:fixed; top: 120px; right:450px; z-index: 5;">
	   		<button class='toggleFG'></button>
		</div>
		
		<button id="button1" class="buttonMap" style="vertical-align:middle; text-align: right; float: right; position:fixed; top: 116px; right:300px; z-index: 4;">    
	   		<strong><font size="2"> 지도를 움직이며 검색 &nbsp; </font></strong>
		</button>
		
		<button id="button2" class="buttonMap" style="vertical-align:middle; text-align: center; float: right; position:fixed; top: 116px; right:300px; z-index: 4;">    
	   		<strong><font size="2"> 이 지역 검색 &nbsp; </font></strong>
		</button>
		
		<div id="loading" class="buttonMap" style="vertical-align:middle; text-align: center; float: right; position:fixed; top: 116px; right:300px; z-index: 6;">    
	   		<img alt="loading" src="img/loading.gif" style="width: 35px; height: 35px;">
		</div>
		
		
		
	
	<!-- 	<h1>지도 좌표 정보</h1> -->
		<div id="info"></div>
		
		<h1>리스트</h1>
		<div id="list"></div>
	
		<script type="text/javascript">
				var toggle = true;
				$('#button2').hide();
				$('#loading').hide();
				
				
				$(document).on('click', '#button1', function () {
				    var toggleBG = $('.toggleBG');
				    var toggleFG = $('.toggleBG').find('.toggleFG');
				    var left = toggleFG.css('left');
		
				    
				    if(left == '0px') {
				    	
				        toggleBG.css('background', '#CCCCCC');
				        toggleActionStart(toggleFG, 'TO_RIGHT');
				        console.log("스위치 꺼짐");
				        toggle = false;
				        
				    }else if(left == '40px') {
				    	
				        toggleBG.css('background', '#53FF4C');
				        toggleActionStart(toggleFG, 'TO_LEFT');
						console.log("스위치 켜짐");
						toggle = true;
				    }
				});
				 
				// 토글 버튼 이동 모션 함수
				function toggleActionStart(toggleBtn, LR) {
				    // 0.01초 단위로 실행
				    var intervalID = setInterval(
				        function() {
				            // 버튼 이동
				            var left = parseInt(toggleBtn.css('left'));
				            left += (LR == 'TO_RIGHT') ? 5 : -5;
				            if(left >= 0 && left <= 40) {
				                left += 'px';
				                toggleBtn.css('left', left);
				            }
				        }, 10);
				    setTimeout(function(){
				        clearInterval(intervalID);
				    }, 201);
				}
	
		</script>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6252091adcb28726fdb95ebdf0b78361&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.240910457871784, 131.86707687050958), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({
				zIndex : 1
			});
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
	
			$(document).ready(searchPlace);	// 페이지 로드시 검색결과 기본맵정보 가져옴
			
			$(document).ready(mapInfo);	// 페이지 로드시 검색내에 DB맵정보 가져옴
					
			kakao.maps.event.addListener(map,'idle', mapInfo);	
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
				geocoder.addressSearch(keyword, function(result, status) {
	
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
						ps.keywordSearch(keyword, placesSearchCB);
	
						// 키워드 검색 완료 시 호출되는 콜백함수 입니다
						function placesSearchCB(data, status, pagination) {
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
							var marker = new kakao.maps.Marker({
								map : map,
								position : new kakao.maps.LatLng(
										place.y, place.x)
							});
	
							// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker,'click',function() {
								// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
								infowindow.setContent('<div style="padding:5px;font-size:12px;">'
												+ place.place_name
												+ '</div>');
								infowindow.open(map,marker);
							});
							
						}
						
					}
					
				});	//end-addressSearch
				
			}	//end-searchPlace
			
			function gogo(id) {	//postPage로
				var checkInDatecheckOutDate = $('#checkInDatecheckOutDate').val();
				var guestCount = $('#guestCount').val();
				var startDate = "${startDate}";
				var endDate = "${endDate}";
				var address = "${address}";
				
				
				location.href = "postPage?id=" + id + "&address=" + address + "&startDate=" + startDate + "&endDate=" + endDate + "&guestCount=" + guestCount;
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
					message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';
		
				var message = '<p>영역좌표는 <br>남서쪽 위도, 경도는  '
							+ swLatlng.toString() + '이고 <br>';
					message += '북동쪽 위도, 경도는  ' + neLatlng.toString()
							+ '이고 <br>';
					message += '<p>지도 레벨은 ' + level + ' 이고</p>';
				    message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';
		
				/*
				var resultDiv = document.getElementById('result');   
				resultDiv.innerHTML = message; 
				*/
				/* 
				$('#info').empty();
				$('#info').append(message);
				*/
				if(!toggle) {
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
				if(toggle){
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
		
					$.ajax({
						type : 'POST',
						url : 'ajax/Hosts',
						data : JSON.stringify(searchInputDTO),
						dataType : 'json',
						contentType: "application/json",
						success : function(result) {
						
									$('#list').empty();								
									
										$.each(result, function(index, item) {
											
											var ss = '';
								
											ss += '=================================================='
												+ '<article onclick="gogo(' + item.id + ')" id="place'+ index +'">'
												+ '<div>'
													+ '<table border="1">'
												+ 	'<tr>'
												+ 		'<td rowspan="4" align = "center">'
												+ 			'<img alt="home" src="./img/room1.jpg" style="width: 150px; height: 100px;">'
												+ 		'</td>'
												+ 	'</tr>'
												+ 	'<tr>'
												+ 		'<td>'
												+ 			'TYPE : ' + item.type + ' guests : ' + item.capacity
												+ 		'</td>'
												+ 		'<td>'
												+ 			'&nbsp; address :' + item.address
												+ 		'</td>'
												+ 	'</tr>'
												+ 	'<tr>'
												+ 		'<td>'
												+ 			'<h3>' + item.name + '</h3>'
												+ 		'</td>'
												+ 		'<td>'
												+ 			' room ' + item.roomCount + ' bed ' + item.bedCount + ' bathroom ' + item.bathroomCount
												+ 		'</td>'
												+ 	'</tr>'
												+ 	'<tr>'
												+ 		'<td>'
												+ 			'room : ' + item.description
												+ 		'</td>'
												+ 		'<td>'
												+ 			'guests :' + item.descriptionEtc
												+ 		'</td>'
												+ 	'</tr>'
												+ '</table>'
												+ '</div>'
												+ '</article>'
												+ '=================================================='
												+ '<br>';
													
											//console.log(ss);
											
											//마커 추가
											var imageSrc1 = './img/marker3.png', // 마커이미지의 주소입니다    
											    imageSize1 = new kakao.maps.Size(45, 50), // 마커이미지의 크기입니다
											    imageOption1 = {offset: new kakao.maps.Point(20, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
											
											// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
											var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize1, imageOption1),
											    markerPosition1 = new kakao.maps.LatLng(item.latitude, item.longitude); // 마커가 표시될 위치입니다
											// 기본 마커를 생성합니다
											var marker = new kakao.maps.Marker({
												position: markerPosition1,
												image: markerImage1, // 마커이미지 설정
												title: item.name
				
											});
				
											// 이벤트 마커 이미지
											//마커 추가
											var imageSrc2 = './img/marker2.png', // 마커이미지의 주소입니다    
											    imageSize2 = new kakao.maps.Size(65, 70), // 마커이미지의 크기입니다
											    imageOption2 = {offset: new kakao.maps.Point(30, 60)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
											
											var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2, imageOption2),
											    markerPosition2 = new kakao.maps.LatLng(item.latitude, item.longitude); // 마커가 표시될 위치입니다
											    
											// 마커를 생성합니다
											var marker0 = new kakao.maps.Marker({
												position: markerPosition2,
												image: markerImage2, // 마커이미지 설정
												title: item.name,
												zIndex: 4
				
											});
											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);
				
											// 마커에 클릭이벤트를 등록합니다
											kakao.maps.event.addListener(marker,'click',function() {
												// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
												infowindow.setContent('<div style="padding:6px;font-size:13px;">'
																+ item.name
																+ '</div>');
												infowindow.open(map, marker);
											});
											// 마커에 마우스 커서를 올리면 발생한다.
											kakao.maps.event.addListener(marker, 'mouseover', function() {
												$('#place'+index).css("color", "red");
												marker.setMap(null);
												marker0.setMap(map);
											});
											
											// 마우스 커서가 마커에서 벗어나면 발생한다.
											kakao.maps.event.addListener(marker0, 'mouseout', function() {
												$('#place'+index).css("color", "black");
												marker0.setMap(null);
												marker.setMap(map);
											});
											
											$('#list').append(ss);
											
											$('#place'+index).hover(function() {
												$(this).css("color", "red");
												marker.setMap(null);
												marker0.setMap(map);
													
											}, function(){
												$(this).css("color", "black");
												marker0.setMap(null);
												marker.setMap(map);
											});
											
										});
										
										if(result == ''){
											
											$('#list').empty();
											console.log("조건에 맞는 데이터 없음");
											
											$('#list').append(
												'<br> <h2> 조회하신 조건에 맞는 숙소가 존재하지 않습니다. </h2>'		
											);
										}
									
			
						}, beforeSend: function () {
							
							$("#loading").show();
	
						}, complete: function () {
				    	   
							$("#loading").hide();
				                     
			       		}, error : function() {
							alert("통신 실패");
						}
						
					})	// end-ajax
					
				}	// end-ajaxAction
			 
			};	// end-mapInfo
			
		</script> 
	</div>
</body>
</html>