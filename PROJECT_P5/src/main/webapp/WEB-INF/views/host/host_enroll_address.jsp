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
</head>
<body>

    
    
<input type="text" id="sample5_address" placeholder="�ּ�">
<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
<button id="map-set-btn" onclick="mapSet()">�����ϱ�</button>
<button id="map-save-btn" onclick="mapSave()">�����ϱ�</button>
<div id="result"></div>


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
    // ���콺 �巡�׷� ���� �̵� ���ɿ��θ� �����մϴ�
    map.setDraggable(true);  
    var btn = document.getElementById("map-save-btn");
    btn.style.display="inline";
    var btn2 = document.getElementById("map-set-btn");
    btn2.style.display="none";
    var circleShape = document.getElementById("daum-maps-shape-0");
    circleShape.style.display="inline";
 // ������ �̵�, Ȯ��, ��ҷ� ���� �߽���ǥ�� ����Ǹ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
    kakao.maps.event.addListener(map, 'center_changed', function() {
  	  // ���� �߽���ǥ�� ���ɴϴ� 
        var latlng = map.getCenter();
     marker.setPosition(new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()));
  
	
	var resultDiv = document.getElementById('result');   
	resultDiv.innerHTML = message; 
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