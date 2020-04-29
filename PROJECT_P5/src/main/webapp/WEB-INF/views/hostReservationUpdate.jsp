<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 숙소 수정</title>
<style>

#wrap {
	width: 1100px;
	margin: auto;
}

/* 수정항목을 tab을 감싸고 있는 container */
.host-reservation-update-tab-container {
	margin: auto;
	display: grid;
	grid-template-columns: repeat(9, 1fr);
	border: 1px solid;
}

/* 수정항목 tab */
.host-reservation-update-btn {
	font-size: 18px;
	background: white;
	outline: none;
	box-sizing: border-box;
	border: 1px solid;
	cursor: pointer;
}

/* tab hover */
.host-reservation-update-btn:hover {
	border: 1px solid red;
	transition: 0.2s;
}

/* 각 항목별 수정 컨데이너 */
.host-reservation-update-container {
	display: none;
	width: 100%;
	border: 1px solid;
	height: 800px;
	border-top: none;
}

/* 컨테이너 안에 content */
.host-update-content {
	height: 100%;
    margin: 0 30%;
}

/* 큰제목  */
.host-update-title{
	font-size: 25px;
	padding: 20px;
}

/* 작은 제목 */
.host-update-sub-title {
	font-size: 20px;
	padding: 15px;
}

/* 숙소유형 select tag */
.host-update-roomtype-seletc {
	width: 200px;
	font-size: 15px;
	margin-left: 50px;
	height: 30px;
	background: none;
}

/* 수정 버튼  */
.host-update-submit{
	position: relative;
    float: right;
    top: 80px;
}

/* 각 항목 경고창  */
#maximumNuberCountError,
#maximumBedNuberCountError,
#maximumBathRoomNuberCountError,
#maximumRoomNuberCountError {
	height: 20px;
}

.imgs_wrap {

}
	



</style>
<!-- multiCalendar -->
<link href="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.css" rel="stylesheet"/>
<link href="https://code.jquery.com/ui/1.12.1/themes/pepper-grinder/jquery-ui.css" rel="stylesheet"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- 카카오맵 -->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d8461122e464c2883b7e5ce3c5eedf&libraries=services,clusterer,drawing"></script>
<!--다음 지도 검색 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<div id="wrap">
		<!-- tab block -->
		<div class="host-reservation-update-tab-container">
			<button class="host-reservation-update-btn" id="hostUpdateRoomTypeTab">숙소형태</button>
			<button class="host-reservation-update-btn" id="hostUpdateRoomCountTab">수용인원</button>
			<button class="host-reservation-update-btn" id="hostUpdateAddressTab">지역</button>
			<button class="host-reservation-update-btn" id="hostUpdateFacilitiesTab">편의시설</button>
			<button class="host-reservation-update-btn" id="hostUpdatePhotoTab">사진등록</button>
			<button class="host-reservation-update-btn" id="hostUpdateDescriptionTab">제목/설명</button>
			<button class="host-reservation-update-btn" id="hostUpdateStayDateTab">숙박일</button>
			<button class="host-reservation-update-btn" id="hostUpdateCalendarTab">예약불가날짜</button>
			<button class="host-reservation-update-btn" id="hostUpdatePriceTab">동일기본요금</button>
		</div>
		
		
		<!-- 숙소형태 -->
		<div class="host-reservation-update-container" id="hostUpdateRoomTypeCon">
			<div class="host-update-content">
				<div class="host-update-title"> 숙소형태를 수정합니다.</div>
				
				
				<!-- 값을 db에서 가져와야함. -->
					<div class="host-update-sub-title">숙소종류</div>
					<select name="type" id="hostUpdateType" class="host-update-roomtype-seletc">
						<option value="0">아파트</option>
						<option value="1">주택</option>
						<option value="2">팬션</option>
					</select>
					
					<div class="host-update-sub-title">숙소형태</div>
					<select name="roomType" id="hostUpdateRoomType" class="host-update-roomtype-seletc">
						<option value="0">전체</option>
						<option value="1">개인실</option>
						<option value="2">다인실</option>
					</select>
					
					<div class="host-update-submit">
						<input type="button" value="수정" id="hostUpdateRoomTypeBtn" />
					</div>
			</div>
		</div>
		
		
		<!-- 수용인원  -->
		<div class="host-reservation-update-container" id="hostUpdateRoomCountCon">
			<div class="host-update-content">
				<div class="host-update-title"> 수용인원를 수정합니다.</div>
					<div class="host-update-sub-title">최대 숙박 인원 </div>
					<div class="host-update-room-count-block">
						<!-- 이 부분만 넘겨서 ajax 처리.  -->
						
						<!-- value는 db에서 값을 가져와서 처리  -->
						<input type="text" value="1" disabled="disabled" id="maximumNumberGuest"/>
						<button class="host-update-roomcount-btn" id="maximumNumberIncrease">▲</button>
						<button class="host-update-roomcount-btn" id="maximumNumberDecrease">▼</button>
					</div>
					<div id="maximumNuberCountError"></div>
					
					<div class="host-update-sub-title">방 갯수 </div>
					<div class="host-update-room-count-block">
					
						<input type="text" value="0" disabled="disabled" id="maximumNumberRoom"/>
						<button class="host-update-roomcount-btn" id="maximumRoomNumberIncrease">▲</button>
					
						<button class="host-update-roomcount-btn" id="maximumRoomNumberDecrease">▼</button>
					</div>
					<div id="maximumRoomNuberCountError"></div>
					
					<!-- 침대 수  -->
					<div class="host-update-sub-title">침대 갯수</div>
					<div class="host-update-room-count-block">
						<!-- 이 부분만 넘겨서 ajax 처리.  -->
						<input type="text" value="0" disabled="disabled" id="maximumNumberBed"/>
						
						<button class="host-update-roomcount-btn" id="maximumBedNumberIncrease">▲</button>
					
						<button class="host-update-roomcount-btn" id="maximumBedNumberDecrease">▼</button>
					</div>
					<div id="maximumBedNuberCountError"></div>
					
					<!-- 욕실 수 -->
					<div class="host-update-sub-title">욕실 수 </div>
					<div class="host-update-room-count-block">
						<!-- 이 부분만 넘겨서 ajax 처리.  -->
						<input type="text" value="1" disabled="disabled" id="maximumNumberBathRoom"/>
						<button class="host-update-roomcount-btn" id="maximumBathRoomNumberIncrease">▲</button>
					
						<button class="host-update-roomcount-btn" id="maximumBathRoomNumberDecrease">▼</button>
					</div>
					<div id="maximumBathRoomNuberCountError"></div>
					
					
				<div class="host-update-submit">
					<input type="button" value="수정" id="hostUpdateRoomCountBtn" />
				</div>
			</div>
		</div>
		
		
		<!-- 지역  -->
		<div class="host-reservation-update-container" id="hostUpdateAddressCon">
			<div class="host-update-content">
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
			   
			</div>
			
		</div>
		
		<!-- 편의시설  -->
		<div class="host-reservation-update-container" id="hostUpdateFacilitiesCon">
			<div class="host-update-content">
			<div class="host-update-title"> 편의시설을 수정합니다.</div>
			
			<div class="host-update-sub-title">변경할 편의시설을 선택해주세요. </div>
				<input type="checkbox" name="facilities" value="isTv" />TV<br>
				<input type="checkbox" name="facilities" value="isWifi" />Wifi<br>
				<input type="checkbox" name="facilities" value="isAirConditioner" />에어컨<br>
				<input type="checkbox" name="facilities" value="isHairDryer" />헤어드라이기<br>
				<input type="checkbox" name="facilities" value="isIron" />다리미<br>
				<hr>
				
				<div class="host-update-sub-title">변경할 이용가능시설을 선택해주세요. </div>
				<input type="checkbox" name="availableFacilities" value="isKitchen" />주방<br>
				<input type="checkbox" name="availableFacilities" value="isWashingMachine" />세탁기<br>
				<input type="checkbox" name="availableFacilities" value="isElevator" />앨리베이터<br>
				<input type="checkbox" name="availableFacilities" value="isParkingLot" />주차<br>
				<div class="host-update-submit">
					<input type="button" value="수정" id="hostUpdateFacilitiesBtn" />
				</div>
			</div>
		</div>
		
		<!-- 사진등록  -->
		<div class="host-reservation-update-container" id="hostUpdatePhotoCon">
			<div class="host-update-content">
				<div class="host-update-title"> 사진을 수정합니다.</div>
				    
               <div class="upload_List_Block">
                  	<!-- host가 설정한 이미지를 가져옴, 거기에 onclick="fileUploadAction();" -->
                  
                  <div class="upload_List_Input">
                     <div class="input_wrap">
                        <div class="imgs_wrap">
                           <img id="img" />
                        <input type="file" id="picture" multiple="multiple"/>
                        </div>
                        <a href="javascript:" onclick="fileUploadAction();" class="my_button"></a>  
                        <div class="host-update-img-grid">
                        </div>
                     </div>
                  </div>
               </div>
				
			
			</div>
			
		</div>
		
		<!-- 제목/설명  -->
		<div class="host-reservation-update-container" id="hostUpdateDescriptionCon">
			<div class="host-update-content">
				<div class="host-update-title"> 제목/설명을 수정합니다.</div>
				<h3>숙소명</h3>
				<input type="text" name="name" id="updateTitle"  />
				<h3>숙소 설명</h3>
				<textarea name="description"  rows="10" cols="50" id="updateDescription"></textarea>
				<h3>기타사항(선택)</h3>
				<textarea name="description_etc" rows="10" cols="50"  id="updateSubDescription"></textarea>
				<input type="button" value="수정" id="hostUpdateDescriptionBtn" />
			</div>
		</div>
		
		<!-- 숙박일  -->
		<div class="host-reservation-update-container" id="hostUpdateStayDateCon">
			<div class="host-update-content">
				<div class="host-update-title"> 숙박일수를 수정합니다.</div>
				최소 숙박
				<input type="number" name="minimumStay" id="minimumDate"  disabled value="1" />
				<button id="minimumDateIncreaseQuantity">▲</button>
				<button id="minimumDateDecreaseQuantity">▼</button>
				<br>
				<div id="minium-warning"></div>
				
				최대 숙박
				<input type="number" name="maximumStay" id="maximumDate" disabled value="1" />
				<button id="maximumDateIncreaseQuantity">▲</button>
				<button id="maximumDateDecreaseQuantity">▼</button>
				<br>
				<div id="maximum-warning"></div>
				<div class="host-update-submit">
					<input type="button" value="수정" id="hostUpdateStayDateBtn" />
				</div>
			</div>
		</div>
		
		<!-- 예약불가날짜 -->
		<div class="host-reservation-update-container" id="hostUpdateCalendarCon">
			<div class="host-update-content">
			<div class="host-update-title"> 예약불가날짜를 수정합니다.</div>
				<div id="mdp-demo"></div>    	
				
						<!-- host기 예약불가설정을 한 날짜가 들어감 -->
    			<input type="hidden" id="altField" value="">
			</div>
		</div>


		<!-- 동일기본요금  -->
		<div class="host-reservation-update-container" id="hostUpdatePriceCon">
			<div class="host-update-content">
				<div class="host-update-title"> 기본요금을 수정합니다.</div>
				<!--0부터 9까지 숫자를 입력하지않으면 ""로 replace됨  --><!--value값은 사용자가 입력한 숙소요금  -->
				
			    금액 <input type="text" id="updatePrice" value="10000" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>  
			      
				<div class="host-update-submit">
					<input type="button" value="수정" id="hostUpdatePriceBtn" />
				</div>
			</div>
		</div>
	
	</div><!--wrap div  -->	
		
		
	
	
	
	
	
</body>

<script>


// container class 
	var hostReservationUpdateContainer=$(".host-reservation-update-container");
// tab
	var hostReservatoonUpdateBtn=$(".host-reservation-update-btn");
	
	//////////////////// 숙소 형태 tab 클릭/////////////////
	$("#hostUpdateRoomTypeTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdateRoomTypeCon").css("display", "block");
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdateRoomTypeTab").css("border", "1px solid red");
	});
	
	/////숙소형태 - 버튼 클릭시 /////
	$("#hostUpdateRoomTypeBtn").on("click", function() {
		var hostUpdateTypeValue= $("#hostUpdateType").val();
		var hostUpdateRoomTypeValue= $("#hostUpdateRoomType").val();
	
		$("#hostUpdateRoomTypeCon").css("display", "block");
		$("#hostUpdateRoomTypeTab").css("border", "1px solid red");
		
		alert(hostUpdateTypeValue);
		alert(hostUpdateRoomTypeValue);
		
		$.ajax({
			url: "roomTypeUpdate",  //// 숙소 형태 변경 url
			type: "POST",
			dataType: "json",
			data: {
				type : hostUpdateTypeValue, 
				roomType : hostUpdateRoomTypeValue
			},
			success : function(result){
				alert("확인");
			},
			
			error: function(result){
				alert("통신에러");
			
			}
			
		}); 

	});
	
	
	
	
	
	
	/////////////////// 수용인원  tab 클릭///////////////
	$("#hostUpdateRoomCountTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdateRoomCountCon").css("display","block");
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdateRoomCountTab").css("border", "1px solid red");
	});
	
	// 수용인원 - 최대숙박인원
	// 올림버튼
	$("#maximumNumberIncrease").on("click", function() {
		var num = parseInt($("#maximumNumberGuest").val(), 10);
		num++;
		$("#maximumNumberGuest").val(num);
		$("#maximumNuberCountError").html('<div id="maximumNuberCountError"></div>');
	});
	
	// 내림버튼
	$("#maximumNumberDecrease").on("click", function() {
		var num = parseInt($("#maximumNumberGuest").val(), 10);
		num--;
		if(num>=1){
			$("#maximumNumberGuest").val(num);
			$("#maximumNuberCountError").html('<div id="maximumNuberCountError"></div>');
		}else{
			$("#maximumNuberCountError").css("color", "red");
			$("#maximumNuberCountError").html('<div id="maximumNuberCountError"> 1보다 커야합니다. </div>');
		}
	});
	
	
	//수용인원 - 방 갯수
	$("#maximumRoomNumberIncrease").on("click", function() {
		var num = parseInt($("#maximumNumberRoom").val(), 10);
		num++;
		$("#maximumNumberRoom").val(num);
		$("#maximumRoomNuberCountError").html('<div id="maximumRoomNuberCountError"></div>');
	});
	
	// 내림버튼
	$("#maximumRoomNumberDecrease").on("click", function() {
		var num = parseInt($("#maximumNumberRoom").val(), 10);
		num--;
		if(num>=0){
			$("#maximumNumberRoom").val(num);
			$("#maximumRoomNuberCountError").html('<div id="maximumRoomNuberCountError"></div>');
		}else{
			$("#maximumRoomNuberCountError").css("color", "red");
			$("#maximumRoomNuberCountError").html('<div id="maximumRoomNuberCountError"> 0보다 커야합니다. </div>');
		}
	});
	
	// 수용인원 - 침대수
	// 올림버튼
	$("#maximumBedNumberIncrease").on("click", function() {
		var num = parseInt($("#maximumNumberBed").val(), 10);
		num++;
		$("#maximumNumberBed").val(num);
		$("#maximumBedNuberCountError").html('<div id="maximumNuberCountError"></div>');
	});
	
	// 내림버튼
	$("#maximumBedNumberDecrease").on("click", function() {
		var num = parseInt($("#maximumNumberBed").val(), 10);
		num--;
		if(num>=0){
			$("#maximumNumberBed").val(num);
			$("#maximumBedNuberCountError").html('<div id="maximumBedNuberCountError"></div>');
		}else{
			$("#maximumBedNuberCountError").css("color", "red");
			$("#maximumBedNuberCountError").html('<div id="maximumBedNuberCountError"> 0보다 커야합니다. </div>');
		}
	});
	
	// 수용인원 - 욕실수
	// 올림버튼
	$("#maximumBathRoomNumberIncrease").on("click", function() {
		var num = parseInt($("#maximumNumberBathRoom").val(), 10);
		num++;
		$("#maximumNumberBathRoom").val(num);
		$("#maximumBathRoomNuberCountError").html('<div id="maximumNuberCountError"></div>');
	});
	
	// 내림버튼
	$("#maximumBathRoomNumberDecrease").on("click", function() {
		var num = parseInt($("#maximumNumberBathRoom").val(), 10);
		num--;
		if(num>=1){
			$("#maximumNumberBathRoom").val(num);
			$("#maximumBathRoomNuberCountError").html('<div id="maximumBathRoomNuberCountError"></div>');
		}else{
			$("#maximumBathRoomNuberCountError").css("color", "red");
			$("#maximumBathRoomNuberCountError").css("transition", "0.2s ease-out");
			$("#maximumBathRoomNuberCountError").html('<div id="maximumBathRoomNuberCountError"> 1보다 커야합니다. </div>');
		}
	});
	
	
	
/////수용인원 - 수정버튼 ajax
	$("#hostUpdateRoomCountBtn").on('click',function(){
	
		var inputCapacity = $("#maximumNumberGuest").val();
		var inputRoomCount = $('#maximumNumberRoom').val();
		var inputBedCount = $('#maximumNumberBed').val();
		var inputBathCount = $('#maximumNumberBathRoom').val();
		
	 	$.ajax({
			url:"updateRoomCount",
			type: "POST",
			data : {
				capacity :  inputCapacity,
				roomCount : inputRoomCount,
				bedCount : inputBedCount,
				bathroomCount : inputBathCount
			},
			success: function(result){
				alert("성공했습니다.");
				///// 그 후 로직....
				// 기존에 있던 값 지우고 다시 입력한 값 가져오기				
				
			},
			error : function(result){
				alert("통신실패");
			}
		}); 
	});
	
	



	
	/////////////////////지역  tab 클릭/////////////////////
	$("#hostUpdateAddressTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdateAddressCon").css("display","block");
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdateAddressTab").css("border", "1px solid red");
		
		/// tab을 눌렀을 때 지도가 보이도록
		mapContainer.style.display = "block";
		map.relayout(); 
		/* map.setDraggable(true); ////지도 드래그/ tab을 눌렀을때 보여주는 지도에서 드래그를 사욯하고 싶다면*/
		
		
		////el로 받아오기 
		$("#hostlatitude").val('37.570695628909476'); 
        $("#hostlongitude").val('126.9918696665976');
        $('#hostUpdateAdress').val(); // 주소
		
	});
	
	
	
	
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
	   
	   
	   $('#hostUpdateAddressBtn').on("click",function(){
		   
			var hostLatitude =  $("#hostlatitude").val(); ///위도
			var hostLongitude =  $("#hostlongitude").val(); /// 경도
			var addressInfo = $('#hostUpdateAdress').val(); /// 도로명 주소 

			alert(hostLatitude + ' / '+ hostLongitude+' / '+addressInfo);
			
			$.ajax({
				url: "updateAddress",
				type: "POST",
				dateType : "json",
				date : {
					address : addressInfo,
					latitude : hostLatitude,
					longitude : hostLongitude
				},
				succuess : function(result){
					alert("성공하였습니다.");
					// 성공 후, 지도에 뿌리기
					
					
				},
				error : function(result){
					alert("실패하였습니다.")
				}
			});
				
	   });

	   ///////////////////////
	   
	   
	   
	   
	   
	   

	
	/////////////////////// 편의시설  tab 클릭 //////////////////////////
	$("#hostUpdateFacilitiesTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdateFacilitiesCon").css("display","block");
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdateFacilitiesTab").css("border", "1px solid red");
	});
	   
	  
	$("#hostUpdateFacilitiesBtn").on("click",function(){
		
		alert("변경");
		
		$.ajax({
			url: "updateFacilities",
			type : "POST",
			data:{
				
				
			},
			dataType: "json",
			success : function(){
				alert("서버 통신" );
			},
			error: function(){
				alert("연결 실패")
			}
		});
		
	});
	
	
	   
	   
	   
	
	
	
	
	/////////////////// 사진등록  tab 클릭 /////////////////////////
	$("#hostUpdatePhotoTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdatePhotoCon").css("display","block");
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdatePhotoTab").css("border", "1px solid red");
	});
	
	//이미지 정보들을 담을 배열   
	var sel_files = [];   

	$(document).ready(function() {   
	    $("#picture").on("change", handleImgFileSelect);   
	});    

	function fileUploadAction() {   
	    console.log("fileUploadAction");   
	    $("#picture").trigger('click');   
	}   

	function handleImgFileSelect(e) {   
	    // 이미지 정보들을 초기화   
	    sel_files = [];   
	/*     $(".imgs_wrap").empty();   */ 
	    var files = e.target.files;   
	    var filesArr = Array.prototype.slice.call(files);   
	    var index = 0;   
	    
	    filesArr.forEach(function(f) {   
	        if(!f.type.match("image.*")) {   
	            alert("확장자는 이미지 확장자만 가능합니다.");   
	            return;   
	        }   

	        sel_files.push(f);   

	        var reader = new FileReader();   
	        reader.onload = function(e) {   
	            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' width=\"150px\" ></a>";   
	              
	            $(".imgs_wrap").append(html);   

	            index++;   

	        }   

	        reader.readAsDataURL(f);   

	    });   

	}   

	function deleteImageAction(index) {   
	    console.log("index : "+index);   
	    console.log("sel length : "+sel_files.length);   

	    sel_files.splice(index, 1);   

	    var img_id = "#img_id_"+index;   

	    $(img_id).remove();    
	}   



	function fileUploadAction() {   
	    console.log("fileUploadAction");   
	    $("#picture").trigger('click');   
	}   



	function submitAction() {   

	    console.log("업로드 파일 갯수 : "+sel_files.length);   

	    var data = new FormData();   



	    for(var i=0, len=sel_files.length; i<len; i++) {   

	        var name = "image_"+i;   

	        data.append(name, sel_files[i]);   

	    }   

	    data.append("image_count", sel_files.length);   

	    if(sel_files.length < 1) {   

	        alert("한개이상의 파일을 선택해주세요.");   

	        return;   

	    }              

	    var xhr = new XMLHttpRequest();   

	    xhr.open("POST","./register4.jsp");   

	    xhr.onload = function(e) {   

	        if(this.status == 200) {   

	            console.log("Result : "+e.currentTarget.responseText);   

	        }   

	    }   

	    xhr.send(data);   

	}
	
	

	
	///////////////////// 제목/설명  tab 클릭 ///////////////////
	$("#hostUpdateDescriptionTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdateDescriptionCon").css("display","block");
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdateDescriptionTab").css("border", "1px solid red");
	});
	
	$("#hostUpdateDescriptionBtn").on("click", function() {
		var inputDescription = $("#updateDescription").val();
		var inputDescriptionEtc= $("#updateSubDescription").val();
		var inputTitle = $("#updateTitle").val(); 
		
		$.ajax({
			url: 'updatDesciptionBtn',
			type: "POST",
			dataType: "json",
			data:{
				name : inputTitle,
				description: inputDescription,
				descriptionEtc:inputDescriptionEtc
			},
			succuess: function(){
				alert("연결성공");
			},
			error: function(){
				alert("연결실패");
			}
			
			
		});
	});
	
	
	
	

	
	
	
	///////////////////// 숙박일  tab 클릭  ///////////////////
	$("#hostUpdateStayDateTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdateStayDateCon").css("display","block");
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdateStayDateTab").css("border", "1px solid red");
	});
	
	// 최소숙박 - 올림
	$("#minimumDateIncreaseQuantity").on("click", function() {
		var num = $('#minimumDate').val();
		num++;
		$('#minimumDate').val(num);
	});
	
	// 최소숙박 - 내림 
	$('#minimumDateDecreaseQuantity').on('click',function(){
		var num = $('#minimumDate').val();
		num--;
		$('#minimumDate').val(num);
	});
	
	
	//최대 숙박 - 올림
	
	$("#maximumDateIncreaseQuantity").on("click", function() {
		var num = $('#maximumDate').val();
		num++;
		$('#maximumDate').val(num);
	});
	//최대 숙박 - 내림
	
	$('#maximumDateDecreaseQuantity').on('click',function(){
		var num = $('#maximumDate').val();
		num--;
		$('#maximumDate').val(num);
	});
	
	
	///// 수정 버튼을 눌렀을 경우
	
	$('#hostUpdateStayDateBtn').on('click',function(){
		var minimumStay = $('#minimumDate').val();
		var maximumStay = $('#maximumDate').val();
		
		$.ajax({
			url : "",
			type: "POST",
			dataType: "json",
			data : {
				minimumStay : minimumStay,
				maximumStay : maximumStay
			},
			succuess : function(){
				alert("성공");
				/// 그 후 로직
				
				
			},
			error: function(){
				alert("실패");
			}
		});
		
	});
	
	
	
	
	
	
	
	
	
	
	
	///////////////////// 예약불가날짜  tab 클릭 ///////////////////
	$("#hostUpdateCalendarTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdateCalendarCon").css("display","block");
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdateCalendarTab").css("border", "1px solid red");
	});
	
	
	/////////// jQuery UI - MultiDatesPicker
	var dates = $('#mdp-demo').multiDatesPicker('value');
	$("#check").val(dates);

	$('#mdp-demo').multiDatesPicker({
		altField: '#altField',
     	minDate: 0, // today
      	maxDate: 60, // +30 days from today
  	 });
	
	
	///////////////////// 동일기본요금  tab 클릭 ///////////////////
	$("#hostUpdatePriceTab").on("click", function() {
		hostReservationUpdateContainer.css("display","none");
		$("#hostUpdatePriceCon").css("display","block"); 
		hostReservatoonUpdateBtn.css("border","1px solid");
		$("#hostUpdatePriceTab").css("border", "1px solid red");
	});
	
	
	$('#hostUpdatePriceBtn').on('click',function(){
		var price = $("#updatePrice").val();	
		$.ajax({
			url: "updatePrice",
			type: "POST",
			data: "price="+price,
			succuess: function(){
				alert("성공");
			},
			error: function(){
				alert("실패");
				
			}
		});
		
	});
	
	
	
	
	
	
	
	

</script>
</html>