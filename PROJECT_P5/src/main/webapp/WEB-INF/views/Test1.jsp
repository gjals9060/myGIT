<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- services�� clusterer, drawing ���̺귯�� �ҷ����� -->
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d8461122e464c2883b7e5ce3c5eedf&libraries=services"></script>
</head>
<body>

    
    
<input type="text" id="sample5_address" placeholder="�ּ�">
<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
<button id="map-set-btn" onclick="mapSet()">�����ϱ�</button>
<button id="map-save-btn" onclick="mapSave()">�����ϱ�</button>
<div id="result"></div>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span class="title">�����߽ɱ��� ������ �ּ�����</span>
        <span id="centerAddr"></span>
    </div>
</div>

	 <form action="">  
	 <input type="submit" value="����" /><input type="hidden" name="langtitude" /><input type="hidden" name="longtitude" />
	 </form>   
<!--�ӽ� �̵�  -->
<a href="host_enroll_facilities.jsp">����</a>
<a href="host_enroll_room_count.jsp">����</a>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="jquery-3.4.1.js"></script>

<script>
    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };
   
    //������ �̸� ����
    var map = new daum.maps.Map(mapContainer, mapOption);
    //�ּ�-��ǥ ��ȯ ��ü�� ����
    var geocoder = new daum.maps.services.Geocoder();
    //��Ŀ�� �̸� ����
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

	 

 // ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
     searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
         if (status === kakao.maps.services.Status.OK) {
             var detailAddr = !!result[0].road_address ? '<div>���θ��ּ� : ' + result[0].road_address.address_name + '</div>' : '';
             detailAddr += '<div>���� �ּ� : ' + result[0].address.address_name + '</div>';
             
             var content = '<div class="bAddr">' +
                             '<span class="title">������ �ּ�����</span>' + 
                             detailAddr + 
                         '</div>';

             // ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
              marker.setPosition(mouseEvent.latLng);
             marker.setMap(map);
 
             // ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
             infowindow.setContent(content);
             infowindow.open(map, marker);
         }   
     });
 });

 // �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
 kakao.maps.event.addListener(map, 'idle', function() {
     searchAddrFromCoords(map.getCenter(), displayCenterInfo);
 });

 function searchAddrFromCoords(coords, callback) {
     // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
     geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
 }

 function searchDetailAddrFromCoords(coords, callback) {
     // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
     geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
 }

 // ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
 function displayCenterInfo(result, status) {
     if (status === kakao.maps.services.Status.OK) {
         var infoDiv = document.getElementById('centerAddr');

         for(var i = 0; i < result.length; i++) {
             // �������� region_type ���� 'H' �̹Ƿ�
             if (result[i].region_type === 'H') {
                 infoDiv.innerHTML = result[i].address_name;
                 break;
             }
         }
     }    
 }

 // ������ ǥ���� ���� �����մϴ�
    var circle = new kakao.maps.Circle({
        center : new kakao.maps.LatLng(37.537187, 127.005476),  // ���� �߽���ǥ �Դϴ� 
        radius: 500, // ���� ������ ���� �������Դϴ� 
        strokeWeight: 5, // ���� �β��Դϴ� 
        strokeColor: '#75B8FA', // ���� �����Դϴ�
        strokeOpacity: 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
        strokeStyle: 'dashed', // ���� ��Ÿ�� �Դϴ�
        fillColor: '#CFE7FF', // ä��� �����Դϴ�
        fillOpacity: 0.7  // ä��� ������ �Դϴ�   
    }); 
 circle.setMap(map);
 infowindow = new kakao.maps.InfoWindow({zindex:1}); // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�

//���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // ���� �ּ� ����
                var btn = document.getElementById("map-set-btn");
btn.style.display="inline";

                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("sample5_address").value = addr;
                // �ּҷ� �� ������ �˻�
                geocoder.addressSearch(data.address, function(results, status) {
                    // ���������� �˻��� �Ϸ������
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //ù��° ����� ���� Ȱ��

                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // ������ �����ش�.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ���� �߽��� �����Ѵ�.
                        map.setCenter(coords);
                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                        marker.setPosition(coords)
                     // ������ ���� ǥ���մϴ� 
     // ������ ���� ǥ���մϴ� 
        circle.setPosition(coords);  
               
                        infowindow.setContent(content);
                        infowindow.open(map, marker);
                    }
                });
            }
        }).open();
     
    }
function mapSet(){
	   var latlng = map.getCenter(); 
    // ���콺 �巡�׷� ���� �̵� ���ɿ��θ� �����մϴ�
    map.setDraggable(true);  
    var btn = document.getElementById("map-save-btn");
    btn.style.display="inline";
    var btn2 = document.getElementById("map-set-btn");
    btn2.style.display="none";
    var circleShape = document.getElementById("daum-maps-shape-0");
    circleShape.style.display="inline";
 // ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
	 kakao.maps.event.addListener(map, 'dragend', function(mouseEvent) {
	     searchDetailAddrFromCoords(latlng.latLng, function(result, status) {
	         if (status === kakao.maps.services.Status.OK) {
	             var detailAddr = !!result[0].road_address ? '<div>���θ��ּ� : ' + result[0].road_address.address_name + '</div>' : '';
	             detailAddr += '<div>���� �ּ� : ' + result[0].address.address_name + '</div>';
	             
	             var content = '<div class="bAddr">' +
	                             '<span class="title">������ �ּ�����</span>' + 
	                             detailAddr + 
	                         '</div>';

	             // ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
	             marker.setPosition(mouseEvent.latLng);
	             marker.setMap(map);

	             // ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
	             infowindow.setContent(content);
	             infowindow.open(map, marker);
	         }   
	     });
	 });
 // ������ �̵�, Ȯ��, ��ҷ� ���� �߽���ǥ�� ����Ǹ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
    kakao.maps.event.addListener(map, 'center_changed', function() {
  	  // ���� �߽���ǥ�� ���ɴϴ� 
    
     marker.setPosition(new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()));
  
	
	
    });
 // ���콺 �巡�׷� ���� �̵��� �Ϸ�Ǿ��� �� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
    kakao.maps.event.addListener(map, 'dragend', function() {        
        
        // ���� �߽���ǥ�� ���ɴϴ� 
        var latlng = map.getCenter(); 
        
        marker.setPosition(new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()));
    /*     circle.setPosition(new kakao.maps.LatLng(latlng.getLat(),latlng.getLng())); */ 
 
    });
   
}
function mapSave(){
	  var btn = document.getElementById("map-save-btn");
btn.style.display="none";
var latlng = map.getCenter();
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