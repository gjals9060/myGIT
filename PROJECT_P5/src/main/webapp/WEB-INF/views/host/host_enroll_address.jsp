<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d8461122e464c2883b7e5ce3c5eedf&libraries=services,clusterer,drawing"></script>
<style>
#map-set-btn{
display:none;
}
#map-save-btn{
display:none;
}
#map-set2-btn{
display:none;
}
#daum-maps-shape-0{
display:none;
}
</style>
</head>
<body>

    
    
<input type="text" id="sample5_address" placeholder="주소">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
<button id="map-set-btn" onclick="mapSet()">조정하기</button>
<button id="map-save-btn" onclick="mapSave()">저장하기</button>
<div id="result"></div>


	 <form action="">  
	 <input type="submit" value="다음" /><input type="hidden" name="langtitude" /><input type="hidden" name="longtitude" />
	 </form>   
<!--임시 이동  -->
<a href="host_enroll_facilities.jsp">다음</a>
<a href="host_enroll_room_count.jsp">이전</a>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="jquery-3.4.1.js"></script>

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

	 


 // 지도에 표시할 원을 생성합니다
    var circle = new kakao.maps.Circle({
        center : new kakao.maps.LatLng(37.537187, 127.005476),  // 원의 중심좌표 입니다 
        radius: 500, // 미터 단위의 원의 반지름입니다 
        strokeWeight: 5, // 선의 두께입니다 
        strokeColor: '#75B8FA', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'dashed', // 선의 스타일 입니다
        fillColor: '#CFE7FF', // 채우기 색깔입니다
        fillOpacity: 0.7  // 채우기 불투명도 입니다   
    }); 
 circle.setMap(map);
 infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

//현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                var btn = document.getElementById("map-set-btn");
btn.style.display="inline";

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
                        marker.setPosition(coords)
                     // 지도에 원을 표시합니다 
     // 지도에 원을 표시합니다 
        circle.setPosition(coords);  
               
                        infowindow.setContent(content);
                        infowindow.open(map, marker);
                    }
                });
            }
        }).open();
     
    }
function mapSet(){
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(true);  
    var btn = document.getElementById("map-save-btn");
    btn.style.display="inline";
    var btn2 = document.getElementById("map-set-btn");
    btn2.style.display="none";
    var circleShape = document.getElementById("daum-maps-shape-0");
    circleShape.style.display="inline";
 // 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'center_changed', function() {
  	  // 지도 중심좌표를 얻어옵니다 
        var latlng = map.getCenter();
     marker.setPosition(new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()));
  
	
	var resultDiv = document.getElementById('result');   
	resultDiv.innerHTML = message; 
    });
 // 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'dragend', function() {        
        
        // 지도 중심좌표를 얻어옵니다 
        var latlng = map.getCenter(); 
        
        marker.setPosition(new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()));
    /*     circle.setPosition(new kakao.maps.LatLng(latlng.getLat(),latlng.getLng())); */ 
 
    });
   
}
function mapSave(){
	  var btn = document.getElementById("map-save-btn");
btn.style.display="none";
	    	 
	  var btn = document.getElementById("map-set-btn");
btn.style.display="inline";
var circleShape = document.getElementById("daum-maps-shape-0");
circleShape.style.display="none";
	
	 map.setDraggable(false);    
	      var latlng = map.getCenter(); 
	    
	        marker.setPosition(latlng.getLat(),latlng.getLng());
	  	
}

    
</script>
</html>