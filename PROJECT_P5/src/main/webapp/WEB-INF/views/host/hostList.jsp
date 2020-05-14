<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 숙소 리스트</title>
<style>
#wrap {
	width: 100%;
	max-width: 1100px;
	margin: auto;
	vertical-align: middle;
}

.host-list-room-table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
	padding: 10px 0px 10px 0px;
}

.table-tr {
	border-bottom: 1px solid #bbb;
	cursor: pointer;
	height: 80px;
}

td {
	text-align: center;
}

.table-tr-th {
	height: 50px;
	border-bottom: 1px solid #bbb;
}

.host-number {
	width: 10%;
}

.host-room {
	width: 40%;
	text-align: left;
	vertical-align: middle;
}

.room {
	width: 10%;
}

.bed-room {
	width: 10%;
}

.bed-count {
	width: 10%
}

.address {
	width: 20%
}

.host-room-div {
	border-bottom: none;
	text-align: left;
}

.host-img {
	width: 80px;
	height: 40px;
	object-fit: cover;
	object-position: center;
}

span {
	vertical-align: super;
}

</style>
</head>
<body>

	<%-- <%@include file="../header.jsp" %> --%>

	<div id="wrap">
		<h2>등록한 숙소 몇 개</h2>

		<table class="host-list-room-table">
			<tr class="table-tr-th">
				<th class="host-number">번호</th>
				<th class="host-room">숙소</th>
				<th class="room">방</th>
				<th class="bed-room">침실</th>
				<th class="bed-count">침대</th>
				<th class="">욕실</th>
				<th class="address">위치</th>
			<!-- 	<th class="btn">
					<button>수정</button>
					<button>삭제</button>
				</th> -->
			</tr>

			<tr class="table-tr" onclick="">
				<td>1010</td>
				<td><div class="host-room-div">
						<img class="host-img" src="../img/어린왕자.jpg" alt="" /> <span>어린왕자</span>
					</div></td>
				<td>3</td>
				<td>3</td>
				<td>2</td>
				<td>서울특별시 종로구</td>
			</tr>

			<tr class="table-tr" onclick="">
				<td>1010</td>
				<td><div class="host-room-div">
						<img class="host-img" src="../img/어린왕자.jpg" alt="" /> <span>어린왕자</span>
					</div></td>
				<td>3</td>
				<td>3</td>
				<td>2</td>
				<td>서울특별시 종로구</td>
			</tr>

			<tr class="table-tr" onclick="">
				<td>1010</td>
				<td><div class="host-room-div">
						<img class="host-img" src="../img/어린왕자.jpg" alt="" /> <span>어린왕자</span>
					</div></td>
				<td>3</td>
				<td>3</td>
				<td>2</td>
				<td>서울특별시 종로구</td>
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
				+'		<img class="host-img" src="' + host.coverPhotoPath + '" /> <span>' + hostName + '</span>	'
				+'	</div></td>	'
				+'<td>' + host.roomTypeName + '</td>	'
				+'<td>' + host.roomCount + '</td>	'
				+'<td>' + host.bedCount + '</td>	'
				+'<td>' + host.bathroomCount + '</td>	'
				+'<td>' + host.address + '</td>	'
				+'<th class="btn">	'
				+'<button onclick="location.href=\'./hostStatus?hostId=' + host.id + '\'">수정</button>	'
				+'<button onclick="deleteHost(' + host.id + ')">삭제</button>	'
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