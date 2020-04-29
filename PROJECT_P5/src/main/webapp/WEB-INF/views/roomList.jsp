<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 정보 얻어오기</title>
<link rel="stylesheet" href="reset.css" />
<style>
/*방리스트  */
.room-list-title{
vertical-align: middle;
}
.room-list-convenience{
position: relative;
top:-30px;
}
/*맵 */
.map-img{
width:150px;
height:100px;
}
</style>

</head>
<body>


	<div id="map" style="float: right; width: 500px; height: 500px;"></div>

	<script src="jquery-3.4.1.js"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d8461122e464c2883b7e5ce3c5eedf"></script>
	<script>
	// 마커를 담을 배열입니다
	var markers = [];
	/*실행시 그영역안의 정보 출력  */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.571, 126.992), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 지도 영역정보를 얻어옵니다 
		var bounds = map.getBounds();

		// 영역정보의 남서쪽 정보를 얻어옵니다 
		var swLatlng = bounds.getSouthWest();

		// 영역정보의 북동쪽 정보를 얻어옵니다 
		var neLatlng = bounds.getNorthEast();

		// 지도 중심좌표를 얻어옵니다 
		var latlng = map.getCenter();

		var message = '<p>영역좌표는 <br>남서쪽 위도, 경도는  '
				+ swLatlng.toString() + '이고 <br>';
		message += '북동쪽 위도, 경도는  ' + neLatlng.toString()
				+ '이고 <br>';
		message += '중심좌표는  ' + latlng.toString()
				+ '입니다 </p>';

		/*
		var resultDiv = document.getElementById('result');   
		resultDiv.innerHTML = message; 
		 */

		$('#info').empty();
		$('#info').append(message);

		//////////////////////////////
		// ajax로 요청
		$.ajax({
			type : 'post',
			url : 'ajax.board',
			data : {
				"swLatlng" : swLatlng.toString(),
				"neLatlng" : neLatlng.toString()
			},
			dataType : 'json',
			/* async : false, */
			success : function(result) {
			
						$('#list').empty();

						$.each(
						result, function(index, item) {
							var ss = '';
							ss += /* index */'<table border="0"><tr><td rowspan="2"><img src="bedroom.jpg" width=200px height:300px "></td>'
									+ ' <td class="room-list-title"><h3> '
									+ item.title
									+ '</h3></td><tr>'
									+ '<td class="room-list-convenience">인원 1명 침실 1개 침대 3개공동 사용 욕실 1개'
									
									+'</td></tr></table><hr>';
							console.log(ss);
	
							//마커 추가
							// 마커 이미지의 이미지 주소입니다
							var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
							// 마커 이미지의 이미지 크기 입니다
							var imageSize = new kakao.maps.Size(24, 35);
	
							// 마커 이미지를 생성합니다    
							var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	
							// 마커를 생성합니다
							// 마커가 표시될 위치입니다 
							var markerPosition  = new kakao.maps.LatLng(item.latitude, item.longitude); 
	
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								
						        map: map, // 마커를 표시할 지도
							    position: markerPosition,
								title: item.title

							});
	
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
							var iwContent = '<img src="bedroom.jpg" class="map-img" "><br>'
								+ item.title; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
						    content : iwContent,
						    removable : iwRemoveable
						});

						// 마커에 클릭이벤트를 등록합니다
						kakao.maps.event.addListener(marker, 'click', function() {
						      // 마커 위에 인포윈도우를 표시합니다
						      infowindow.open(map, marker);  
						});
							$('#list').append(
								
									ss
									
							);
	
						});
						


			},
			error : function() {
				alert("통신 실패");
			}
		})

		/* 

		 // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		 var mapTypeControl = new kakao.maps.MapTypeControl();

		 // 지도 타입 컨트롤을 지도에 표시합니다
		 map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		 function getInfo() {
		 // 지도의 현재 중심좌표를 얻어옵니다 
		 var center = map.getCenter(); 
		 console.log(center);

		 // 지도의 현재 레벨을 얻어옵니다
		 var level = map.getLevel();
		
		 // 지도타입을 얻어옵니다
		 var mapTypeId = map.getMapTypeId(); 
		
		 // 지도의 현재 영역을 얻어옵니다 
		 var bounds = map.getBounds();
		
		 // 영역의 남서쪽 좌표를 얻어옵니다 
		 var swLatLng = bounds.getSouthWest(); 
		
		 // 영역의 북동쪽 좌표를 얻어옵니다 
		 var neLatLng = bounds.getNorthEast(); 
		
		 // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
		 var boundsStr = bounds.toString();
		
		
		 var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
		 message += '경도 ' + center.getLng() + ' 이고 <br>';
		 message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
		 message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
		 message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
		 message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
		
		 // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
		 // ex) console.log(message);
		
		 } */
		/* 
		 // 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		 kakao.maps.event.addListener(map, 'dragend'||'zoom_changed', function() {        
		
		 // 지도 중심좌표를 얻어옵니다 
		 var latlng = map.getCenter(); 
		
		 // 지도의 현재 영역을 얻어옵니다 
		 var bounds = map.getBounds();
		
		 // 영역의 남서쪽 좌표를 얻어옵니다 
		 var swLatLng = bounds.getSouthWest(); 
		
		 // 영역의 북동쪽 좌표를 얻어옵니다 
		 var neLatLng = bounds.getNorthEast();
		
		
		 var message = '변경된 지도 남서쪽 좌표는' + swLatLng + ' 이고, ';
		 message += '북동쪽 좌표는 ' + neLatLng + ' 입니다';
		
		 $('#info').empty();
		 $('#info').append(message);
		
		
		
		 });
		 */

		kakao.maps.event.addListener(map,'dragend',function() {

			// 지도 영역정보를 얻어옵니다 
			var bounds = map.getBounds();
	
			// 영역정보의 남서쪽 정보를 얻어옵니다 
			var swLatlng = bounds.getSouthWest();
	
			// 영역정보의 북동쪽 정보를 얻어옵니다 
			var neLatlng = bounds.getNorthEast();
	
			// 지도 중심좌표를 얻어옵니다 
			var latlng = map.getCenter();
	
			var message = '<p>영역좌표는 <br>남서쪽 위도, 경도는  '
					+ swLatlng.toString() + '이고 <br>';
			message += '북동쪽 위도, 경도는  ' + neLatlng.toString()
					+ '이고 <br>';
			message += '중심좌표는  ' + latlng.toString()
					+ '입니다 </p>';
	
			/*
			var resultDiv = document.getElementById('result');   
			resultDiv.innerHTML = message; 
			 */
	
			$('#info').empty();
			$('#info').append(message);
	
			//////////////////////////////
			// ajax로 요청
			$.ajax({
				type : 'post',
				url : 'ajax.board',
				data : {
					"swLatlng" : swLatlng.toString(),
					"neLatlng" : neLatlng.toString()
				},
				dataType : 'json',
				/* async : false, */
				success : function(result) {
				
							$('#list').empty();

							$.each(
							result, function(index, item) {
								var ss = '';
								ss += /* index */'<table border="0"><tr><td rowspan="2"><img src="bedroom.jpg" width=200px height:300px "></td>'
									+ ' <td class="room-list-title"><h3> '
									+ item.title
									+ '</h3></td><tr>'
									+ '<td class="room-list-convenience">인원 1명 침실 1개 침대 3개공동 사용 욕실 1개'
									
									+'</td></tr></table><hr>';
							console.log(ss);
		
								//마커 추가
								// 마커 이미지의 이미지 주소입니다
								var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		
								// 마커 이미지의 이미지 크기 입니다
								var imageSize = new kakao.maps.Size(24, 35);
		
								// 마커 이미지를 생성합니다    
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
								// 마커를 생성합니다
								// 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(item.latitude, item.longitude); 
		
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									
							        map: map, // 마커를 표시할 지도
								    position: markerPosition,
									title: item.title

								});
		
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
								var iwContent = '<img src="bedroom.jpg" class="map-img" "><br>'
									+ item.title; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
							    content : iwContent,
							    removable : iwRemoveable
							});

							// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
							      // 마커 위에 인포윈도우를 표시합니다
							      infowindow.open(map, marker);  
							});

								$('#list').append(
									
										ss
										
								);
		
							});
							

	
				},
				error : function() {
					alert("통신 실패");
				}
			})
	
		});
/* 줌했을때 */
 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'zoom_changed', function() {        
    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();

	// 지도 영역정보를 얻어옵니다 
	var bounds = map.getBounds();

	// 영역정보의 남서쪽 정보를 얻어옵니다 
	var swLatlng = bounds.getSouthWest();

	// 영역정보의 북동쪽 정보를 얻어옵니다 
	var neLatlng = bounds.getNorthEast();

	// 지도 중심좌표를 얻어옵니다 
	var latlng = map.getCenter();

	var message = '<p>영역좌표는 <br>남서쪽 위도, 경도는  '
			+ swLatlng.toString() + '이고 <br>';
	message += '북동쪽 위도, 경도는  ' + neLatlng.toString()
			+ '이고 <br>';
	message += '중심좌표는  ' + latlng.toString()
			+ '입니다 </p>';

	/*
	var resultDiv = document.getElementById('result');   
	resultDiv.innerHTML = message; 
	 */

	$('#info').empty();
	$('#info').append(message);

	//////////////////////////////
	// ajax로 요청
	$.ajax({
		type : 'post',
		url : 'ajax.board',
		data : {
			"swLatlng" : swLatlng.toString(),
			"neLatlng" : neLatlng.toString()
		},
		dataType : 'json',
		/* async : false, */
		success : function(result) {
		
					$('#list').empty();

					$.each(
					result, function(index, item) {
						var ss = '';
						ss += /* index */'<table border="0"><tr><td rowspan="2"><img src="bedroom.jpg" width=200px height:300px "></td>'
							+ ' <td class="room-list-title"><h3> '
							+ item.title
							+ '</h3></td><tr>'
							+ '<td class="room-list-convenience">인원 1명 침실 1개 침대 3개공동 사용 욕실 1개'
							
							+'</td></tr></table><hr>';
					console.log(ss);

						//마커 추가
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

						// 마커 이미지의 이미지 크기 입니다
						var imageSize = new kakao.maps.Size(24, 35);

						// 마커 이미지를 생성합니다    
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

						// 마커를 생성합니다
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(item.latitude, item.longitude); 

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							
					        map: map, // 마커를 표시할 지도
						    position: markerPosition,
							title: item.title

						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						var iwContent = '<img src="bedroom.jpg" class="map-img" "><br>'
							+ item.title; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    content : iwContent,
					    removable : iwRemoveable
					});

					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
					      // 마커 위에 인포윈도우를 표시합니다
					      infowindow.open(map, marker);  
					});

						$('#list').append(
							
								ss
								
						);

					});
					


		},
		error : function() {
			alert("통신 실패");
		}
	})

    /* var message = '현재 지도 레벨은 ' + level + ' 입니다';
    var resultDiv = document.getElementById('result');  
    resultDiv.innerHTML = message; */
    
});
		/* 
		 //마커를 표시할 위치와 title 객체 배열입니다 
		 var positions = [
		 {
		 title : 'KG아이티뱅크',
		 latlng : new kakao.maps.LatLng(37.5709682246245,
		 126.99254598808358)
		 },
		 {
		 title : 'CGV피카디리',
		 latlng : new kakao.maps.LatLng(37.57095012306847,
		 126.99134893359613)
		 },
		 {
		 title : '종각역',
		 latlng : new kakao.maps.LatLng(37.570212661438305,
		 126.98306309395612)
		 },
		 {
		 title : '탑골공원',
		 latlng : new kakao.maps.LatLng(37.571226914733366,
		 126.98828408654653)
		 } ];

		 // 마커 이미지의 이미지 주소입니다
		 var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		 for (var i = 0; i < positions.length; i++) {

		 // 마커 이미지의 이미지 크기 입니다
		 var imageSize = new kakao.maps.Size(24, 35);

		 // 마커 이미지를 생성합니다    
		 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({
		 map : map, // 마커를 표시할 지도
		 position : positions[i].latlng, // 마커를 표시할 위치
		 title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		 image : markerImage
		 // 마커 이미지 
		 });
		

		 //커스텀 오버레이에 표시할 컨텐츠 입니다
		 //커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		 //별도의 이벤트 메소드를 제공하지 않습니다 
		 var content = '<div class="overlaybox">'
		 + '    <div class="info">'
		 + '        <div class="title">'
		 + '            카카오 스페이스닷원'
		 + '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
		 + '        </div>'
		 + '        <div class="body">'
		 + '            <div class="img">'
		 + '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
		 + '           </div>'
		 + '            <div class="desc">'
		 + '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>'
		 + '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'
		 + '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>'
		 + '            </div>' + '        </div>' + '    </div>'
		 + '</div>';

		 //마커 위에 커스텀오버레이를 표시합니다
		 //마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		 var overlay = new kakao.maps.CustomOverlay({
		 content : content,
		 map : map,
		 position : marker.getPosition()
		 });
		

		 //마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		 kakao.maps.event.addListener(marker, 'click', function() {
		 overlay.setMap(map);
		 });

		 //커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		 function closeOverlay() {
		 overlay.setMap(null);
		 } 			
		
		 }
		 */
	</script>
	<h1>지도 좌표 정보</h1>
	<div id="info"></div>
	
	
	
	<h1>리스트</h1>
	
	<div id="list"></div>



</body>
</html>