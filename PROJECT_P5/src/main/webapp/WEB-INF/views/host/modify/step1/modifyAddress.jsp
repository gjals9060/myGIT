<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1단계-위치</title>
<link rel="stylesheet" href="./modifyAddress.css" />
<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c57fda7695336028646dd43a52736a17&libraries=services"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@include file="../headerStep.jsp"%>
	<div id="wrap">
		<div class="host-update-title"> 지역을 수정합니다.</div>
			<input type="hidden" id="sample5_address" placeholder="주소">
			<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
			<br>
			<div id="addressInfo"></div>
			<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
			<button id="map-set-btn">조정하기</button>
			<button id="map-save-btn">저장하기</button>
			<div id="result"></div>
			
			<input type="text" name="hostUpdateAdress" id="hostUpdateAdress"  />
			      
			      
			   <!-- 위도 경도 히든, ajax로 값 전송 -->
			   <input type="text" id="hostlatitude" />
			   <input type="text" id="hostlongitude" />
			      
			<div class="host-update-submit">
				<input type="button" value="수정" id="hostUpdateAddressBtn" />
			</div>
			
			<div class="btn-block">
				<a href="">이전</a>
				<button>다음</button>
			</div>
	</div>
</body>

<script>
	
	///header tab
	$('#tabAddress').css('background', '#bbb');
	
	$(function(){
		var MapContainer = $('#map');
		/// tab을 눌렀을 때 지도가 보이도록
		mapContainer.style.display = "block";
		map.relayout(); 	
/* 		
		$.ajax({
			url: '',
			type: 'POST',
			success: function(data){
				/// 위도랑 경도, 주소 받아오기 
			},
			error: function(data){
				/// 통신이 되지 않았을 경우
			}
		}); 
*/
	});		
	
	/// 지도를 보여줌 
		
	var toggle = false;   //버튼 활성화
	
	
	/// el로 값 적용.
	var lat123 = 37.570695628909476;
	var lon123 = 126.9918696665976;
		
	$('#map-set-btn').show();   // 기본적으로  조정하기 버튼 숨김
	$('#map-save-btn').hide();   // 기본적으로  저장하기 버튼 숨김
	

	/// 지도 생성
	mapOption = {
			center : new daum.maps.LatLng(lat123, lon123), // 지도의 중심좌표 /// 중심좌표를 호스트가 등록한 좌표로
	   		level : 2	// 지도의 확대 레벨
	  	}; 
	
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div /// div에서 Container설정 해놓음.
	  
	var map = new daum.maps.Map(mapContainer, mapOption);
	   
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다(확대/축소 막대)
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	map.setMaxLevel(3);   //최대 줌 레벨
	   
 	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	   
	// 마커 미리 생성
	var marker = new daum.maps.Marker({
	    position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});
	   
	map.setDraggable(false);   //드래그 비활성화
	map.setZoomable(false);      //줌 비활성화
	
	// 지도에 표시할 원을 생성합니다
	var circle = new kakao.maps.Circle({
		
		center : new kakao.maps.LatLng(lat123, lon123),  // 원의 중심좌표 입니다  //// 초기의 좌표로
	    radius: 30, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 5, // 선의 두께입니다 
	    strokeColor: '#75B8FA', // 선의 색깔입니다
	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'dashed', // 선의 스타일 입니다
	    fillColor: '#CFE7FF', // 채우기 색깔입니다
	    fillOpacity: 0.7  // 채우기 불투명도 입니다   
	});
	
	
	
	 
	// 주소검색
	   function sample5_execDaumPostcode() {
		console.log("버튼이 눌림");
	      new daum.Postcode({
	         oncomplete : function(data) {
	        	 
	            var addr = data.address; // 최종 주소 변수

	            // 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("sample5_address").value = addr;
	            alert($('#sample5_address').val());
	            // 주소로 상세 정보를 검색
	            geocoder.addressSearch(data.address, function(results, status) {
	               // 정상적으로 검색이 완료됐으면
	               if (status === daum.maps.services.Status.OK) {

	                  var result = results[0]; //첫번째 결과의 값을 활용

	                  // 해당 주소에 대한 좌표를 받아서
	                  var coords = new daum.maps.LatLng(result.y, result.x);
	                  
	                  /// 검색한 주소의 정보 (위도, 경도, 주소)를 입력
	                  $("#hostlatitude").val(result.y);
		              $("#hostlongitude").val(result.x);
		              $('#hostUpdateAdress').val(result.road_address.address_name);
	                  
	                  // 지도를 보여준다.
	                  mapContainer.style.display = "block";
	                  map.relayout();
	                  // 지도 중심을 변경한다.
	                  map.setCenter(coords);
	                  // 마커를 결과값으로 받은 위치로 옮긴다.
	                  marker.setPosition(coords)
	                  // 지도에 원을 표시합니다 
	                  circle.setPosition(coords);
	                  circle.setMap(map);
	 
	                  $('#addressInfo').empty();
	                  $('#addressInfo').append('<div>도로명주소 : ' + result.road_address.address_name + '</div>');
	                  
	                     
	               }
	            });
	         }
	      }).open();

	   }
	   
	      
	   $(document).on('click','#map-set-btn', function() {
	      $('#map-set-btn').hide();
	      $('#map-save-btn').show();
	      toggle = true;   // 이벤트 활성화
	      map.setDraggable(true);
	      //map.setZoomable(true);
	      
	   });
	   
	   $(document).on('click','#map-save-btn', function() {
	      
	      $('#map-save-btn').hide();
	      $('#map-set-btn').show();
	      toggle = false;
	      map.setDraggable(false);
	      //map.setZoomable(false);
	      
	      // 좌표중심 원 위치 조정
	      var latlng = map.getCenter();
	      circle.setPosition(new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()));

	   });
	   
	   kakao.maps.event.addListener(map, 'center_changed', function() {
	      // 지도 중심좌표를 얻어옵니다 
	      var latlng = map.getCenter();
	         marker.setPosition(new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()));

	         $('input[name="langtitude"]').val(latlng.getLat()+','+latlng.getLng());
	   });
	   

	   
	   // 지도 드래그시 주소출력 변경
	    kakao.maps.event.addListener(map, 'dragend', function() {
	       
	        if(toggle){

	          // 드래그 이동시 ( 마커 - 부동/ 맵 - 이동 )
	          // 중심좌표값 받아서 주소값 가져옴(+ 좌표값도 가져옴)
	          
	         var latlng = map.getCenter();
	                 
	         var geocoder0 = new kakao.maps.services.Geocoder();

	         var coord = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
	         
	         var callback = function(result, status) {
	             if (status === kakao.maps.services.Status.OK) {
	                 console.log('도로명 : ' + result[0].address.address_name);
	                 
	                 // 위도 경도 받기
	                 $("#hostlatitude").val(latlng.getLat());
	                 $("#hostlongitude").val(latlng.getLng());
	                 
	               	$('#addressInfo').empty();
	               	$('#addressInfo').append('도로명주소 : ' + result[0].address.address_name);
	               
	                 /// 도로명 주소 받아오기
	                 $('#hostUpdateAdress').val(result[0].address.address_name);
	             }
	         };

	         geocoder0.coord2Address(coord.getLng(), coord.getLat(), callback);

	          
	       }
	   });
</script>


</html>