<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 등록</title>
<style>
 li {
	list-style: none;
}
/*
.efg {
	margin: 5px;
	padding: 5px;
	border-width: 2px;
	border-color: #aaa;
	border-style: outset;
	width: 500px;
} */

#wrap {
	width:100%;
	max-width: 1100px;
	margin: auto;
}

/* hostingList 총괄 */
.hosting-list {
	margin: 30px 0px; 
	padding: 30px 0px;
}


/* 메인 제목 */
.hosting-list-main-title {
	font-size: 30px;
	font-weight: bold;
	margin: 40px 0px;
}

.hosting-list-li,
.hosting-list-li_2 {
	margin: 50px 0px;
}

/* hostingList 설명 block */
.hosting-list-description {
    display: inline-table;
    vertical-align: middle;
    margin-left: 20px;
    width: 30%;
}

/* 제목  */
.hosting-list-title {
	width: 100%;
    display: table;	
    padding-bottom: 10px;
}

/* 설명 */
.hosting-list-room {
	color: #bbb;
}

/* list block */
.hosting-list-block {
   	padding: 50px 300px 50px 0px;
    border-bottom: 0.5px solid #bbb;
    
}

/* 호스트가 등록한 사진 */
.hosting-list-img {
	width: 96px;
	height: 64px;
	object-fit: contain;
	object-position:center;
	display: inline-block;
    vertical-align: middle;
}

/* 라디오 버튼 label 처리 */
input[type="radio"]{
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0px;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
} 

input[type="radio"] + label {
	display: inline-block;
   	position: relative;
   	cursor: pointer;
   	-webkit-user-select: none;
	
}

input[type="radio"]:checked+label:before {
   background: #008489;
   border-color: #008489;
}


/* 미등록 숙소   */
.hosting-list-type {
	font-size: 20px;
}

.hosting-list-btn {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	float: left;
}
</style>
</head>
<body>
	<%@include file="../header.jsp" %>
	<!-- <form action=""> -->
	<div id="wrap">
	
		<div class="hosting-list">
			<div class="hosting-list-main-title">새로운 숙소 진행을 시작해볼까요?</div>
			<div id="list">
				<ul id="hosting-list-ul">
					<!-- 새로운 숙소 등록  -->
					<li class="hosting-list-li">
						<label for="newHosting" class="hosting-list-block"> 
							<input class="hosting-list-input" id="newHosting" type="radio" name="hostId" value="0" /> 
							<img class="hosting-list-img" src="/p5/img/room1.jpg" alt="사진" /> 
							<span class="hosting-list-description">
								<span class="hosting-list-title">새로운 숙소 등록하기</span>
							</span>
						</label>
				<!-- 		<script>
							if($('.hosting-list-input').is('checked',true)){
								$('hosting-list-li').css('background','#bbb');
							}else {
								$('hosting-list-li').css('background','none');
							}
						</script> -->
					</li>

					<li><span class="hosting-list-type">숙소 등록중</span></li>
					
					
				</ul>
			</div>
			<!-- 버튼 -->
			<div class="hosting-list-btn">
				<button onclick="deleteHost()">삭제</button>
				<button onclick="next()">다음</button>
			</div>
		</div>
	</div>
	
<!-- <script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
<script>
	function next() {
		// 체크 여부
		var isChecked = $('input[name="hostId"]:checked').length;
		// 선택 호스팅의 호스트ID
		var hostId = $('input[name="hostId"]:checked').val();

		if (!isChecked) { // 체크하지 않았으면
			alert("선택해라..");
		} else { // 체크했으면
			location.href = "hostingStatus?hostId=" + hostId;
		}

	} // next-END

	$(window).bind("pageshow",function(event) {
		refresh(); // 화면 갱신

		$.ajax({
			type : "POST",
			url : "registration/reset",
		}); // AJAX-END
	});
	
	// 화면 갱신
function refresh(){
	$.ajax({
		type : "POST",
		url : "getHostingList",
		//			async : false,
		success : function(hostingList) {
			//	alert(hostingList.length);
			var result = ''; var hostName; 
			
			$.each(hostingList,function(i, hosting) {
				var hostingListId;
				if(!hosting.hostName){
					hostName = "";
				} else{
					hostName = hosting.hostName;
				}
				hostingListId='hostingListId_'+i;
			
				
				hostName = 
				result += '	<li class="hosting-list-li_2"> '
						+ ' <label for="'+ hostingListId +'" class="hosting-list-block" >'
						+ '	<input id="'+ hostingListId + '" type="radio" name="hostId" value="' + hosting.hostId + '" />	'
						+ '	<img class="hosting-list-img" src="' + hosting.coverPhotoPath + '" alt="사진" />	' 
						+ ' <span class="hosting-list-description">'
						+ ' <span class="hosting-list-title">' + hostName +  ' </span> '
						+ ' <span class="hosting-list-room"> '+ hosting.roomTypeName +' </span> '
						+ ' </span> '
						+ '	</label></li>';
				}); // each-END
				
			$('.hosting-list-li_2').remove();
			$('#hosting-list-ul').append(result);
			
	
		},
		
		error : function() {
			alert("통신 실패..");
		}
	});
}	
	
	
	
	// 호스트 삭제 메소드
	function deleteHost(){
	// 체크 여부
	var isChecked = $('input[name="hostId"]:checked').length;
	// 선택 호스팅의 호스트ID
	var hostId = $('input[name="hostId"]:checked').val();

	if (!isChecked) { // 체크하지 않았으면
		alert("삭제할 호스팅을 선택해주세요.");
		return;
	}
	if(hostId == 0){
		alert("삭제할!! 호스팅!!!");
		return;
	}
	
		$.ajax({
			type : "POST",
			url : "deleteHost",
			data : "hostId=" + hostId,
			success : function(result) {
				if(result){ // 호스트 삭제 성공
					alert("삭제 성공");
					refresh(); // 화면 갱신 
					location.href="http://localhost:8081/p5/host/hostingList";
				} else{
					alert("호스팅 삭제 실패..");
				}
			},
			error : function() {
				alert("통신 실패..");
			}
		});
	}
</script>
	
	<jsp:include page="../footer.jsp"/>


</body>
</html>