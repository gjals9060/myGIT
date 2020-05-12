


	var presentURL = window.document.URL;
	var start = presentURL.indexOf("/p5");
	var end = presentURL.length;
	var urlInfo = presentURL.substring(start, end);


		// 알아서 저장하겠다우~
	$(window).bind("pagehide", function (event) {
		var url = setSaveURL(); // 정보를 처리할 적절한 곳으로 보낸다.
		var params = setParams(); // 저장할 정보를 담은 보따리를 받아서
		$.ajax({
			type : "POST",
			url : url,
			data : params
		});
	});
		// 최신 정보만 보여주게써~
	$(window).bind("pageshow", function (event) {
	//	alert(urlInfo);
		var url = setRefreshURL();
		$.ajax({
			type : "POST",
			url : url,
			success : function(host){
//				alert(JSON.stringify(host)); // 내용 확인
				refresh(host); // 화면 갱신
			},	
			error : function(){
				alert("화면 갱신에 실패..");
			}
		}); // AJAX-END
	});


	
//////////////////////////////// setParams-END ///////////////////////////////////////////
function setParams(){
	
	
//========================= roomType.jsp 값 세팅-END ====================================
	var hostTypeId = $('select[name="hostTypeId"]').val();
	var roomTypeId = $('select[name="roomTypeId"]').val();
//=====================================================================================
	
//========================= roomCount.jsp 값 세팅-END ===================================
	var capacity = $('input[name="capacity"]').val();
	var roomCount = $('input[name="roomCount"]').val();
	var bedCount = $('input[name="bedCount"]').val();
	var bathroomCount = $('input[name="bathroomCount"]').val();
//=====================================================================================
	
//========================= address.jsp 값 세팅-END =====================================
	var address = $('input[name="address"]').val();
	var latitude = $('input[name="latitude"]').val();
	var longitude = $('input[name="longitude"]').val();
//=====================================================================================
	
//========================= facilities.jsp 값 세팅 ======================================
	var isTv = 'N';
	var isWifi = 'N';
	var isAirConditioner = 'N';
	var isAirPurifier = 'N';
	var	isHairDryer = 'N';
	var	isIron = 'N';
		
	var	isKitchen = 'N';
	var	isWashingMachine = 'N';
	var	isElevator = 'N';
	var	isParkingLot = 'N';
		
	if($('input:checkbox[name="isTv"]').is(":checked") == true) {isTv = 'Y';}
	if($('input:checkbox[name="isWifi"]').is(":checked") == true) {isWifi = 'Y';}
	if($('input:checkbox[name="isAirConditioner"]').is(":checked") == true) {isAirConditioner = 'Y';}
	if($('input:checkbox[name="isAirPurifier"]').is(":checked") == true) {isAirPurifier = 'Y';}
	if($('input:checkbox[name="isHairDryer"]').is(":checked") == true) {isHairDryer = 'Y';}
	if($('input:checkbox[name="isIron"]').is(":checked") == true) {isIron = 'Y';}
	
	if($('input:checkbox[name="isKitchen"]').is(":checked") == true) {isKitchen = 'Y';}
	if($('input:checkbox[name="isWashingMachine"]').is(":checked") == true) {isWashingMachine = 'Y';}
	if($('input:checkbox[name="isElevator"]').is(":checked") == true) {isElevator = 'Y';}
	if($('input:checkbox[name="isParkingLot"]').is(":checked") == true) {isParkingLot = 'Y';}
//====================================================================================================


//******************************* params 세팅 *****************************************

	var paramsRoomType = { // roomType.jsp
			hostTypeId : hostTypeId,
			roomTypeId : roomTypeId
	};
	var paramsRoomCount = { //roomCount.jsp
			capacity : capacity,
			roomCount : roomCount,
			bedCount : bedCount,
			bathroomCount : bathroomCount
	};
	var paramsAddress = { // address.jsp
			address : address,
			latitude : latitude,
			longitude : longitude
	};
	var paramsfacilities = { // facilities.jsp
			isTv : isTv,
			isWifi : isWifi,
			isAirConditioner : isAirConditioner,
			isAirPurifier : isAirPurifier,
			isHairDryer : isHairDryer,
			isIron : isIron,
			
			isKitchen : isKitchen,
			isWashingMachine : isWashingMachine,
			isElevator : isElevator,
			isParkingLot : isParkingLot
	};
//****************************** params 세팅-END *****************************************




	if(urlInfo == '/p5/host/registration/roomType'){return paramsRoomType;}
	if(urlInfo == '/p5/host/registration/roomCount'){return paramsRoomCount;}
	if(urlInfo == '/p5/host/registration/address'){return paramsAddress;}
	if(urlInfo == '/p5/host/registration/facilities'){return paramsfacilities;}




}//////////////////////////////////// setParams-END //////////////////////////////////////////





















//////////////////////////////////////// setSaveURL /////////////////////////////////////////////
function setSaveURL(){

//******************* 등록 1단계에서 보낼 URL(newHost 세션 사용) ****************************
	if(urlInfo == '/p5/host/registration/roomType'){return "save/newHost";}
	if(urlInfo == '/p5/host/registration/roomCount'){return "save/newHost";}
	if(urlInfo == '/p5/host/registration/address'){return "save/newHost";}
	if(urlInfo == '/p5/host/registration/facilities'){return "save/newHost";}
//***************** 등록 1단계에서 보낼 URL(newHost 세션 사용)-END ****************************	
	
	
}//////////////////////////////////// setSaveURL-END /////////////////////////////////////////////


/////////////////////////////////////setRefreshURL /////////////////////////////////////////////
function setRefreshURL(){
	
//******************* 등록 1단계에서 보낼 URL(newHost 세션 사용) ****************************
	if(urlInfo == '/p5/host/registration/roomType'){return "refresh/newHost";}
	if(urlInfo == '/p5/host/registration/roomCount'){return "refresh/newHost";}
	if(urlInfo == '/p5/host/registration/address'){return "refresh/newHost";}
	if(urlInfo == '/p5/host/registration/facilities'){return "refresh/newHost";}
//***************** 등록 1단계에서 보낼 URL(newHost 세션 사용)-END ****************************	
	
	
}////////////////////////////////// setRefreshURL-END /////////////////////////////////////////////








///////////////////////////////////// refresh /////////////////////////////////////////////////
function refresh(host){
if(urlInfo == '/p5/host/registration/facilities' && !host.address){
	alert("등록 완료했자너 왜 뒤루 와~");
}
	
//************************************ 1 단계 **********************************************
	$('select[name="hostTypeId"]').val(host.hostTypeId);
	$('select[name="roomTypeId"]').val(host.roomTypeId);
	
	$('input[name="capacity"]').val(host.capacity);
	$('input[name="roomCount"]').val(host.roomCount);
	$('input[name="bedCount"]').val(host.bedCount);
	$('input[name="bathroomCount"]').val(host.bathroomCount);
	
	$('input[name="address"]').val(host.address);
	$('input[name="latitude"]').val(host.latitude);
	$('input[name="longitude"]').val(host.longitude);
	
	if(host.isTv == 'Y'){$('input:checkbox[name="isTv"]').prop("checked", true);}
	if(host.isWifi == 'Y'){$('input:checkbox[name="isWifi"]').prop("checked", true);}
	if(host.isAirConditioner == 'Y'){$('input:checkbox[name="isAirConditioner"]').prop("checked", true);}
	if(host.isAirPurifier == 'Y'){$('input:checkbox[name="isAirPurifier"]').prop("checked", true);}
	if(host.isHairDryer == 'Y'){$('input:checkbox[name="isHairDryer"]').prop("checked", true);}
	if(host.isIron == 'Y'){$('input:checkbox[name="isIron"]').prop("checked", true);}
	
	if(host.isKitchen == 'Y'){$('input:checkbox[name="isKitchen"]').prop("checked", true);}
	if(host.isWashingMachine == 'Y'){$('input:checkbox[name="isWashingMachine"]').prop("checked", true);}
	if(host.isElevator == 'Y'){$('input:checkbox[name="isElevator"]').prop("checked", true);}
	if(host.isParkingLot == 'Y'){$('input:checkbox[name="isParkingLot"]').prop("checked", true);}
//************************************ 1 단계-END **********************************************
	
	
	
	
	
	
	
	
	
}///////////////////////////////////// refresh-END //////////////////////////////////////////////








 


