<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 숙소 리스트</title>
<link rel="stylesheet" href="/p5/css/hostList.css" />
<!-- viewport  -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

</head>
<body>

	<%@include file="../header.jsp" %>

	<div id="wrap">
		<h2>등록한 숙소 </h2>

		<table class="host-list-room-table">
			<tr class="table-tr-th">
				<th class="host-number">번호</th>
				<th class="host-room">숙소</th>
				<th class="room">방</th>
				<th class="bed-room">침실</th>
				<th class="bed-count">침대</th>
				<th class="bed-count">욕실</th>
				<th class="address">위치</th>
				<th class="btn">설정</th>
			</tr>



		</table>

	</div>
	<script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script>
$(function(){
	refresh(); // 화면 갱신
})

// 화면 갱신 메소드
function refresh(){
	$.ajax({
		type : "POST",
		url : "getHostList",
		success : function(hostList) {
		//		alert(hostList.length); // 몇 개 받았나
				console.log(JSON.stringify(hostList)); // 받은 내용 확인

			var resultList = '';
		 	$.each(hostList,function(i, host) { // 그 외 host.capacity, host.creationDate ...
		 		var hostName;
		 		if(!host.name){
		 			hostName = "";
		 		} else{
		 			hostName = host.name;
		 		}
		 		resultList +=
		 		 '<tr class="table-tr">	'
				+'<td>' + host.id + '</td>	'
				+'<td><div class="host-room-div">	'
				+'		<img class="host-img" src="' + host.coverPhotoPath + '" onError='+'"this.src='+"'/p5/img/defaultImg.jpg'"+'" />	' 
				+'		<span>' + hostName + '</span>	'
				+'	</div></td>	'
				+'<td>' + host.roomTypeName + '</td>	'
				+'<td>' + host.roomCount + '</td>	'
				+'<td>' + host.bedCount + '</td>	'
				+'<td>' + host.bathroomCount + '</td>	'
				+'<td>' + host.address + '</td>	'
				+'<th class="btn">	'
				+'<button class="hosting-list-btn-group" "id="hostListModifyBtn" onclick="location.href=\'./hostingStatus?hostId=' + host.id + '\'">수정</button>	'
				+'<button class="hosting-list-btn-group" onclick="deleteHost(' + host.id + ')">삭제</button>	'
				+'</th>	'
				+'</tr>	'
				;
			}); // each-END
			
			$('.table-tr').remove();
			$('.host-list-room-table').append(resultList);
		},
		error : function() {
			alert("통신 실패..");
		}
	});
}
// 호스트 삭제 메소드
function deleteHost(hostId){
	$.ajax({
		type : "POST",
		url : "deleteHost",
		data : "hostId=" + hostId,
		success : function(result) {
			if(result){ // 호스트 삭제 성공
				alert("삭제 성공");
				refresh(); // 화면 갱신
			} else{
				alert("호스트 삭제 실패..");
			}
		},
		error : function() {
			alert("통신 실패..");
		}
	});
}



</script>
</body>
</html>