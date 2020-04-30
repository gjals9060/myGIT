<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d8461122e464c2883b7e5ce3c5eedf&libraries=services,clusterer,drawing"></script>

</head>
<body>



   지번/도로명 : <input type="text" id="sample5_address" onclick="sample5_execDaumPostcode()" placeholder="주소">
   <!-- <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"> -->
   <br>
   <div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none">
		<button style="background-color: #FFFFFF; width: 33px; height: 35px; margin-right: 2px; position: absolute; top: 105px; right: 0; z-index: 5; border: none; border-radius: 10px;" onclick="panTo()">
	 		<img alt="focus" src="../../img/focus.png" style="width: 100%; height: 100%;">
	 	</button>   
   </div>
   <button id="map-set-btn">조정</button>
   <button id="map-save-btn">완료</button>
   <div id="result"></div>


   <form action="facilities" method="post" name="formAddress">
      <input type="hidden" name="address" />
      <input type="hidden" name="latitude" />
      <input type="hidden" name="longitude" />
   </form>
   
   <div id="addressInfo"></div>
   
   <!--임시 이동  -->
  <!--  <a href="facilities">다음</a> -->
   <a href="roomCount">이전</a>
   <button id="next" onclick="inputAddress();">다음</button>
</body>



<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../../js/jquery-3.4.1.js"></script>

<script>
   var toggle = false;   // 버튼 활성화
   var flag = true;		 // 조정중일때 false => 다음버튼, 주소입력 비활성화
   
   $('#map-set-btn').hide();   // 기본적으로  조정하기 버튼 숨김
   $('#map-save-btn').hide();   // 기본적으로  저장하기 버튼 숨김
   
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div
   mapOption = {
      center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
      level : 1
   // 지도의 확대 레벨
   };

   //지도를 미리 생성
   var map = new daum.maps.Map(mapContainer, mapOption);
   
   // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다(확대/축소 막대)
   var zoomControl = new kakao.maps.ZoomControl();
   map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

   map.setMaxLevel(3);   //최대 줌 레벨
   
   // 주소-좌표 변환 객체를 생성
   var geocoder = new daum.maps.services.Geocoder();
   
	// 검색 주소 마커 미리 생성
   	var imageSrc1 = '../../img/marker2.png', // 마커이미지의 주소입니다    
	    imageSize1 = new kakao.maps.Size(65, 70), // 마커이미지의 크기입니다
	    imageOption1 = {offset: new kakao.maps.Point(30, 60)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize1, imageOption1),
	    markerPosition1 = new kakao.maps.LatLng(37.537187, 127.005476); // 마커가 표시될 위치입니다
	
	// 빨간 마커
	var marker1 = new daum.maps.Marker({
		position : markerPosition1,
		image: markerImage1,
		map : map,
		zIndex: 3
	});
	marker1.setMap(map); // 지도에 올린다.
    
   
	// 이동 마커를 생성합니다
	var imageSrc2 = '../../img/marker3.png', // 마커이미지의 주소입니다    
	    imageSize2 = new kakao.maps.Size(65, 70), // 마커이미지의 크기입니다
	    imageOption2 = {offset: new kakao.maps.Point(30, 60)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2, imageOption2),
	    markerPosition2 = new kakao.maps.LatLng(37.537187, 127.005476); // 마커가 표시될 위치입니다
	
	// 파란 마커
	var marker2 = new daum.maps.Marker({
		position : markerPosition2,
		image: markerImage2,
		map : map,
		zIndex: 4

	});
	marker2.setMap(null); // 지도에 제거.
    
	    
	
   
   map.setDraggable(false);   //드래그 비활성화
   map.setZoomable(false);      //줌 비활성화
   
   // 지도에 표시할 원을 생성합니다
    var circle = new kakao.maps.Circle({
        center : new kakao.maps.LatLng(37.537187, 127.005476),  // 원의 중심좌표 입니다 
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
	  
      new daum.Postcode({
         oncomplete : function(data) {
            
            var addr = data.address; // 최종 주소 변수
            $('#map-set-btn').show();

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample5_address").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
               // 정상적으로 검색이 완료됐으면
               if (status === daum.maps.services.Status.OK) {

                  var result = results[0]; //첫번째 결과의 값을 활용

                  // 해당 주소에 대한 좌표를 받아서
                  var coords = new daum.maps.LatLng(result.y, result.x);
                                    
                  // 지도를 보여준다.
                  mapContainer.style.display = "block";
                  map.relayout();
                  // 지도 중심을 변경한다.
                  map.setCenter(coords);
                  
                  // 마커를 결과값으로 받은 위치로 옮긴다.
                  marker1.setPosition(coords);
                  // 지도에 원을 표시합니다 
                  circle.setPosition(coords);
                  circle.setMap(map);
 
                  $('#addressInfo').empty();
                  $('#addressInfo').append('주소 : <span id="address1">' + result.address.address_name + '</span><br />');
                  $('#addressInfo').append('상세주소 : <input id="address2" type="text" />');
                  $('input[name="latitude"]').val(result.y);
                  $('input[name="longitude"]').val(result.x);
                  
                  // 조정중일때 주소검색시 초기화
                  if(toggle){
	                  $('#map-save-btn').hide();
	                  $('#map-set-btn').show();
	                  toggle = false;
	                  flag = true;
                  }
                  
               }
            });
         }
      }).open();

   }
   
      
   $(document).on('click','#map-set-btn', function() {
      
      $('#map-set-btn').hide();
      $('#map-save-btn').show();
      toggle = true;   // 이벤트 활성화
      flag = false;
      map.setDraggable(true);
      //map.setZoomable(true);
/*       
      // 조정중에 다음 버튼 비활성화
      $('#next').prop("disabled", true);
*/
	  
	  marker2.setMap(map);

      
   });
   
   $(document).on('click','#map-save-btn', function() {
      
      $('#map-save-btn').hide();
      $('#map-set-btn').show();
      toggle = false;
      flag = true;
      map.setDraggable(false);
      //map.setZoomable(false);
      
      // 좌표중심 원 위치 조정
      var latlng = map.getCenter();
      
      circle.setPosition(new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()));
      
      // 좌표중심 마커 변경
      marker1.setPosition(new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()));
      
	  marker1.setMap(map);
      marker2.setMap(null);
      
/* 
      // 다음 버튼 활성화
      	  $('#next').prop("disabled", false);
*/
		
});
   
   
   
   kakao.maps.event.addListener(map, 'center_changed', function() {
      // 지도 중심좌표를 얻어옵니다 
      var latlng = map.getCenter();
         marker2.setPosition(new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()));

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
                 //console.log('도로명 : ' + result[0].address.address_name);
               $('#addressInfo').empty();
               $('#addressInfo').append('주소 : <span id="address1">' + result[0].address.address_name + '</span><br />');
               $('#addressInfo').append('상세주소 : <input id="address2" type="text" />');
               $('input[name="latitude"]').val(latlng.getLat());
               $('input[name="longitude"]').val(latlng.getLng());
             }
         };
         
         geocoder0.coord2Address(coord.getLng(), coord.getLat(), callback);

          
       }
   });
   
   function inputAddress(){
	   if(flag){
		   var address2 = $('#address2').val().trim();
		   if(!address2){ // 상세주소가 없으면
			   $('input[name="address"]').val($('#address1').text()); // 입력된 도로명 주소만
		   } else{ // 있으면
			   $('input[name="address"]').val($('#address1').text() + " " + address2); // 그 뒤에 붙여서
		   } // input hidden에 넣어주고
		   
		   $('form[name="formAddress"]').submit() // 폼 제출 
	   }else{
			  alert("주소 조정이 끝났으면 '완료'를 눌러주세요!");
	   }
   }
	
   function panTo() {
	    // 이동할 위도 경도 위치를 생성합니다 -> 마커 위치로
	    var moveLatLon = marker1.getPosition();
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}


</script>
</html>