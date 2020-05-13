<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6252091adcb28726fdb95ebdf0b78361&libraries=services"></script>

</head>
<body>



	도로명/지번 :
	<input type="text" id="sample5_address"
		onclick="sample5_execDaumPostcode()" placeholder="주소 검색하기" readonly>
	<!-- <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"> -->
	<br>
	<div id="map"
		style="width: 300px; height: 300px; margin-top: 10px; display: none">
		<button id="focusbtn"
			style="background-color: #FFFFFF; width: 33px; height: 35px; margin-right: 2px; position: absolute; top: 105px; right: 0; z-index: 5; border: none; border-radius: 10px;"
			onclick="panTo()">
			<img alt="focus" src="../../img/focus.png"
				style="width: 100%; height: 100%;">
		</button>
	</div>
	<button id="map-set-btn">조정하기</button>
	<button id="map-save-btn">저장하기</button>
	<div id="result"></div>


	<!--  <form action="facilities" method="post" name="formAddress"> -->
	<input type="text" name="address" readonly="readonly" />
	<input type="text" name="latitude" readonly="readonly" />
	<input type="text" name="longitude" readonly="readonly" />
	<!-- </form> -->

	<div id="addressInfo"></div>


	<!--임시 이동  -->
	<a href="roomCount">이전</a>
	<a href="facilities">다음</a>

	<!-- <button id="next" onclick="inputAddress();">다음</button> -->
</body>



<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/p5/js/jquery-3.4.1.js"></script>

<!-- 1. 지도 기본 구성 -->
<script type="text/javascript">
	/* 1. 지도 기본 구성 */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.240910457871784, 131.86707687050958), // 지도의 중심좌표(디폴트 : 독도좌표)
		level : 1
	// 지도의 확대 레벨
	};
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다(확대/축소 막대)
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	map.setZoomable(false); //줌 비활성화

	//최대 줌 레벨
	map.setMaxLevel(3);

	// 주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();

	// 빨간(확정) 마커 미리 생성
	var imageSrc1 = '../../img/marker2.png', // 마커이미지의 주소입니다    
	imageSize1 = new kakao.maps.Size(65, 70), // 마커이미지의 크기입니다
	imageOption1 = {
		offset : new kakao.maps.Point(30, 60)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize1,
			imageOption1), markerPosition1 = new kakao.maps.LatLng(
			37.240910457871784, 131.86707687050958); // 마커가 표시될 위치입니다

	// 빨간 마커
	var marker1 = new daum.maps.Marker({
		position : markerPosition1,
		image : markerImage1,
		map : map,
		zIndex : 3
	});

	// 파란(이동) 마커를 생성합니다
	var imageSrc2 = '../../img/marker3.png', // 마커이미지의 주소입니다    
	imageSize2 = new kakao.maps.Size(65, 70), // 마커이미지의 크기입니다
	imageOption2 = {
		offset : new kakao.maps.Point(30, 60)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2,
			imageOption2), markerPosition2 = new kakao.maps.LatLng(
			37.240910457871784, 131.86707687050958); // 마커가 표시될 위치입니다

	// 파란 마커
	var marker2 = new daum.maps.Marker({
		position : markerPosition2,
		image : markerImage2,
		map : map,
		zIndex : 4

	});
	// 서클
	var circle = new kakao.maps.Circle({
		center : new kakao.maps.LatLng(37.240910457871784, 131.86707687050958), // 원의 중심좌표 입니다 
		radius : 20, // 미터 단위의 원의 반지름입니다 
		strokeWeight : 5, // 선의 두께입니다 
		strokeColor : '#75B8FA', // 선의 색깔입니다
		strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle : 'dashed', // 선의 스타일 입니다
		fillColor : '#CFE7FF', // 채우기 색깔입니다
		fillOpacity : 0.7
	// 채우기 불투명도 입니다   
	});

	// 일단 마커,서클 숨김
	marker1.setMap(null);
	marker2.setMap(null);
	circle.setMap(null);
</script>

<!-- 2. 페이지 실행시 기본 구성 -->
<script type="text/javascript">
 
	// ### 버튼 ###
	$('#map-set-btn').hide(); // 기본적으로  조정하기 버튼 숨김
	$('#map-save-btn').hide(); // 기본적으로  저장하기 버튼 숨김
	
	// ### 변수 ###
	var checkMemoryToggle = false;	// host.js에서 넘어온 값. 유:T, 무:F(default) 
	var toggleButton = true;		// set 클릭시 : T or save 클릭시 : F
	
	// ### 이벤트 ###
	$(document).on('click','#map-set-btn', state);	// 조정하기 클릭시 조정중
	$(document).on('click','#map-save-btn', state);	// 저장하기 클릭시 저장됨
	
	// ### 메서드 ###
	function valueInMap(latitude, longitude) {
	// 지도 세팅 메서드

		// host.js에서 넘어온 값이 있어서 주소검색없이도 조정중 상태, 완료 버튼 출력
		$('#map-save-btn').show();

		// 받은 좌표로 지도 중심 설정
		var LatLng = new daum.maps.LatLng(latitude, longitude);

		// 지도를 보여준다.
		mapContainer.style.display = "block";
		map.relayout();
		// 지도 중심을 변경한다.
		map.setCenter(LatLng);

		// 마커,원을 결과값으로 받은 위치로 옮긴다.
		marker1.setPosition(LatLng); //빨간마커
		marker2.setPosition(LatLng); //파란마커
		circle.setPosition(LatLng);

		// 지도에  표시합니다 
		marker1.setMap(map);
		marker2.setMap(map);
		circle.setMap(map);

	}	//end - valueInMap()
	
	function state() {
		
		// toggle 버튼 클릭시 toggleButton 상태
		console.log("처리전 toggle 상태 : " + toggleButton);
		// 포커스 버튼 활성/비활성 여부
		$("#focusbtn").prop("disabled", !toggleButton);
		
		// 드래그 활성/비활성 여부
		map.setDraggable(toggleButton);
		
		if(toggleButton){
			// 조정하기
			$('#map-set-btn').hide();
			$('#map-save-btn').show();
			
			// 마커 조정
			marker1.setMap(null);
			marker2.setMap(map);
						
			settingAddress();
			
		}else{
			// 저장하기
			$('#map-set-btn').hide();
			$('#map-save-btn').show();
			
			// 마커 조정
			marker1.setMap(map);
			marker2.setMap(null);
			
			savingAddress();
			
		}
		
		//상태 전환
		toggleButton = !toggleButton;
		
		// 처리 후 toggleButton 상태
		console.log("처리후 toggle 상태 : " + toggleButton);

		
	}	// end - state
	
	function settingAddress() {	// 조정 클릭시 실행
		
		$('input[name="address"]').val(""); // 초기화
      
	}//end - settingAddress()
	
	function savingAddress(){	// 저장 클릭시 실행
		
	}//end - savingAddress()
	
	
</script>

<!-- 3. 주소/좌표 input값 확인 및  host.js에서 넘어온 값 확인 -->
<script type="text/javascript">
	var memoryAddress; // host.js로 부터 받아오는 값 담을 변수
	var memoryLatitude; // host.js로 부터 받아오는 값 담을 변수
	var memoryLongitude; // host.js로 부터 받아오는 값 담을 변수

	var checkValue = setInterval(
			function() {
				//실행할 스크립트 
				memoryAddress = $('input[name="address"]').val();
				memoryLatitude = $('input[name="latitude"]').val();
				memoryLongitude = $('input[name="longitude"]').val();

				if (memoryAddress != "" && memoryLatitude != 0 && memoryLongitude != 0) {
					
					checkMemoryToggle = true;
					console.log("메모리 값 있음" + memoryAddress + "/" + memoryLatitude + "/" + memoryLongitude);
					// host.js에서 넘어온 값이 있으면 넘어온 값들 넣어줌 
					// 지도 세팅
					valueInMap(memoryLatitude, memoryLongitude);
				}
				clearInterval(checkValue); //host.js에서 넘어온 값 확인되면 checkValue 종료

			}, 1000);
	
</script>

<!-- 4. 주소검색 기본구성 -->
<script type="text/javascript">
	//주소 검색 해서 지도 세팅
	function sample5_execDaumPostcode() {

		new daum.Postcode({
			oncomplete : 
				function(data) {

					var addr = data.address; // 최종 주소 변수
					$('#map-save-btn').show();
		
					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results, status) {
						
							// 정상적으로 검색이 완료됐으면
							if (status === daum.maps.services.Status.OK) {
								map.setLevel(1);
	
								var result = results[0]; //첫번째 결과의 값을 활용
	
								// 해당 주소에 대한 좌표를 받아서
								var LatLng = new daum.maps.LatLng(result.y, result.x);
								
								// 지도 세팅
								valueInMap(result.y,result.x);
								
								// 선택 , 상세 주소
								$('#addressInfo').empty();
								$('#addressInfo').append(
									' 선택 주소 : <span id="address1">'+ result.address.address_name + '</span><br />');
								$('#addressInfo').append(
									' 상세 주소 : <input id="address2" type="text" placeholder="선택 사항" />');
	
								$('input[name="latitude"]').val(result.y);
								$('input[name="longitude"]').val(result.x);
	
	
							}
						});
					}
			}).open();

	}
</script>







<!-- host.js에서 값을 받아옴 -->
<script src="/p5/js/host.js"></script>

</html>