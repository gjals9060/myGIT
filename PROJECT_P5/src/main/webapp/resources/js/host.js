	// 알아서 저장하겠다우~
$(window).bind("pagehide", function (event) {
	var params = setParams(); // 저장할 정보를 담은 보따리를 받아서
	var url = setSaveURL(); // 정보를 처리할 적절한 곳으로 보낸다.
	$.ajax({
		type : "POST",
		url : url,
		data : params
	});
});
	// 최신 정보만 보여주게써~
$(window).bind("pageshow", function (event) {
	var url = setRefreshURL();
	$.ajax({
		type : "POST",
		url : url,
		success : function(host){
			refresh(host); // 화면 갱신
		},	
		error : function(){
			alert("화면 갱신에 실패..");
		}
	}); // AJAX-END
});


	
//////////////////////////////// setParams-END ///////////////////////////////////////////
function setParams(){
	
	
//************************* roomType.jsp 값 세팅-END *************************************
	var hostTypeId = $('select[name="hostTypeId"]').val();
	var roomTypeId = $('select[name="roomTypeId"]').val();
//************************* facilities.jsp 값 세팅-END *************************************
	
	
	
//************************* roomCount.jsp 값 세팅-END *************************************
	var capacity = $('input[name="capacity"]').val();
	var roomCount = $('input[name="roomCount"]').val();
	var bedCount = $('input[name="bedCount"]').val();
	var bathroomCount = $('input[name="bathroomCount"]').val();
//************************* facilities.jsp 값 세팅-END *************************************
	
	
	
//************************* address.jsp 값 세팅-END *************************************
	var address;
	var address2 = $('#address2').val().trim();
	   if(!address2){ // 상세주소가 없으면
		   address = $('#address1').text(); // 입력된 도로명 주소만
	   } else{ // 있으면
		   address = $('#address1').text() + " " + address2; // 그 뒤에 붙여서
	   }
	var latitude = $('input[name="latitude"]').val();
	var longitude = $('input[name="longitude"]').val();
//************************* address.jsp 값 세팅-END *************************************	
	
	
	
//************************* facilities.jsp 값 세팅 *************************************
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

//************************* facilities.jsp 값 세팅-END *************************************





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


	// 이탈하는 페이지(정보 저장)의 URL
var presentURL = window.document.URL;

	// AJAX로 보내줄 파라미터 보따리
var params;




	// 보따리에 이탈 페이지에서 저장할 정보를 담아준다 - URL로 구분
if(presentURL == 'http://localhost:8081/p5/host/registration/roomType'){
	params = paramsRoomType;
}
if(presentURL == 'http://localhost:8081/p5/host/registration/roomCount'){
	params = paramsRoomCount;
}
if(presentURL == 'http://localhost:8081/p5/host/registration/address'){
	params = paramsAddress;
}
if(presentURL == 'http://localhost:8081/p5/host/registration/facilities'){
	params = paramsfacilities;
}

//****************************** params 세팅-END *****************************************

return params; // 세팅을 마치고 알맞은 정보를 담은 보따리를 return.

}
//////////////////////////////////// setParams-END //////////////////////////////////////////




//////////////////////////////////////// setSaveURL /////////////////////////////////////////////
function setSaveURL(){
	
	// 이탈하는 페이지(정보 저장)의 URL
	var presentURL = window.document.URL;
	
	// AJAX로 보낼 URL
	var ajaxSaveURL;



		// AJAX URL을 설정한다
	if(presentURL == 'http://localhost:8081/p5/host/registration/roomType'){
		ajaxSaveURL = "save/newHost"; // 등록 1단계에서 보낼 URL(newHost 세션 사용)
	}
	if(presentURL == 'http://localhost:8081/p5/host/registration/roomCount'){
		ajaxSaveURL = "save/newHost"; // 등록 1단계에서 보낼 URL(newHost 세션 사용)
	}
	if(presentURL == 'http://localhost:8081/p5/host/registration/address'){
		ajaxSaveURL = "save/newHost"; // 등록 1단계에서 보낼 URL(newHost 세션 사용)
	}
	if(presentURL == 'http://localhost:8081/p5/host/registration/facilities'){
		ajaxSaveURL = "save/newHost"; // 등록 1단계에서 보낼 URL(newHost 세션 사용)
	}
	
	
	
	return ajaxSaveURL; // 설정한 URL을 return.
}
////////////////////////////////////// setSaveURL-END /////////////////////////////////////////////



/////////////////////////////////////setRefreshURL /////////////////////////////////////////////
function setRefreshURL(){
	
	// 갱신할 페이지의 URL
	var presentURL = window.document.URL;
	
	// AJAX로 보낼 URL
	var ajaxRefreshURL;



		// AJAX URL을 설정한다
	if(presentURL == 'http://localhost:8081/p5/host/registration/roomType'){
		ajaxRefreshURL = "refresh/newHost"; // 등록 1단계에서 보낼 URL(newHost 세션 사용)
	}
	if(presentURL == 'http://localhost:8081/p5/host/registration/roomCount'){
		ajaxRefreshURL = "refresh/newHost"; // 등록 1단계에서 보낼 URL(newHost 세션 사용)
	}
	if(presentURL == 'http://localhost:8081/p5/host/registration/address'){
		ajaxRefreshURL = "refresh/newHost"; // 등록 1단계에서 보낼 URL(newHost 세션 사용)
	}
	if(presentURL == 'http://localhost:8081/p5/host/registration/facilities'){
		ajaxRefreshURL = "refresh/newHost"; // 등록 1단계에서 보낼 URL(newHost 세션 사용)
	}
	
	
	
	return ajaxRefreshURL; // 설정한 URL을 return.
}
////////////////////////////////// setRefreshURL-END /////////////////////////////////////////////



///////////////////////////////////// refresh /////////////////////////////////////////////////
function refresh(host){
	
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
	
	
	
	
	
	
	
	
	
}
///////////////////////////////////// refresh-END //////////////////////////////////////////////








 


