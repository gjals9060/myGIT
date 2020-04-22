<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 숙소 수정</title>
<style>
h1,
h2 {
	margin: 0px;
	padding: 0px;
}
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
}

/* tab hover */
.host-reservation-update-btn:hover {
	border: 1px solid red;
	transition: 0.6s ease-out;
}

.host-reservation-update-container {
	display: none;
	width: 100%;
	border: 1px solid;
	height: 800px;
	animation: com 0.3s ease-out;
	border-top: none;
}

@
keyframes com {from { left:100px;
	opacity: 0.2;
}

to {
	left: 0px;
	opacity: 1;
}
}
</style>
</head>
<body>
	<div id="wrap">
		<!-- tab block -->
		<div class="host-reservation-update-tab-container">
			<button class="host-reservation-update-btn" onclick="hostContainer(0)">숙소형태</button>
			<button class="host-reservation-update-btn" onclick="hostContainer(1)">수용인원</button>
			<button class="host-reservation-update-btn" onclick="hostContainer(2)">지역</button>
			<button class="host-reservation-update-btn" onclick="hostContainer(3)">편의시설</button>
			<button class="host-reservation-update-btn" onclick="hostContainer(4)">사진등록</button>
			<button class="host-reservation-update-btn" onclick="hostContainer(5)">제목/설명</button>
			<button class="host-reservation-update-btn" onclick="hostContainer(6)">숙박일</button>
			<button class="host-reservation-update-btn" onclick="hostContainer(7)">예약불가날짜</button>
			<button class="host-reservation-update-btn" onclick="hostContainer(8)">동일기본요금</button>
		</div>

<!-- 숙소종류 -->
		<div class="host-reservation-update-container">
			<h2>숙소종류를 등록해봐요</h2>
			<!--숙소 종류 value를 0부터 2까지 설정 0이면 아파트 1이면 주택 2이면 팬션 -->
			<select name="type" id="">
				<option value="0">아파트</option>
				<option value="1">주택</option>
				<option value="2">팬션</option>
			</select>
			<!--숙소 유형 value를 0부터 2까지 설정 0이면 전체 1이면 개인실 2이면 다인실 -->
			<h2>숙소유형을 등록해봐요</h2>
			<select name="roomType" id="">
				<option value="0">전체</option>
				<option value="1">개인실</option>
				<option value="2">다인실</option>
			</select>
		</div>
		
		
		<div class="host-reservation-update-container">
			<form action="">
			최대 숙박인원 <br><input type="text" name="maximumStay" class="maximum-stay" disabled value="1"/>
			<button id="maximum-increase-quantity">▲</button>
			<button id="maximum-decrease-quantity">▼</button><br>
	
			방 갯수를 입력해볼까요? <br><input type="text"name="roomCount"class="room-count" disabled value="1"/>
			<button id="count-increase-quantity">▲</button>
			<button id="count-decrease-quantity">▼</button><br>
			게스트가 사용할 수 있는 침대가 몇 개 인가요?<br> <input type="text"name="bedCount"class="bed-count" disabled value="0"/>
			<button id="bed-increase-quantity">▲</button>
			<button id="bed-decrease-quantity">▼</button><br>
			게스트가 사용할 수 있는 욕실은요?<br>
			<input type="text"name="bathroomCount"name="bathroomCount"class="bathroom-count" disabled value="1"/>
			<button id="bathroom-increase-quantity">▲</button>
			<button id="bathroom-decrease-quantity">▼</button>
			<!--index.jsp랑 똑같음  침대개수는 0이 낮은값 나머지는 1이 낮은값 그이상을줄일수 없음 -->
			<!-- <script>
			/*최대 숙박인원  */
				$(function() {
					$('#maximum-decrease-quantity').click(function(e) {
						e.preventDefault();
						var stat = $('.maximum-stay').val();
						var num = parseInt(stat, 10);
						num--;
						if (num <= 0) {
							/* 	alert("더이상 줄일수 없습니다") */
							num = 1;
	
						}
						$('.maximum-stay').val(num);
					});
					$('#maximum-increase-quantity').click(function(e) {
						e.preventDefault();
						var stat = $('.maximum-stay').val();
						var num = parseInt(stat, 10);
						num++;
	
						$('.maximum-stay').val(num);
					});
				});
			
			/*방갯수  */
				$(function() {
					$('#count-decrease-quantity').click(function(e) {
						e.preventDefault();
						var stat = $('.room-count').val();
						var num = parseInt(stat, 10);
						num--;
						if (num <= 0) {
							/* 	alert("더이상 줄일수 없습니다") */
							num = 1;
	
						}
						$('.room-count').val(num);
					});
					$('#count-increase-quantity').click(function(e) {
						e.preventDefault();
						var stat = $('.room-count').val();
						var num = parseInt(stat, 10);
						num++;
	
						$('.room-count').val(num);
					});
				});
			/*게스트가 사용할 침대개수  */
					$(function() {
					$('#bed-decrease-quantity').click(function(e) {
						e.preventDefault();
						var stat = $('.bed-count').val();
						var num = parseInt(stat, 10);
						num--;
						if (num < 0) {
							/* 	alert("더이상 줄일수 없습니다") */
							num = 0;
	
						}
						$('.bed-count').val(num);
					});
					$('#bed-increase-quantity').click(function(e) {
						e.preventDefault();
						var stat = $('.bed-count').val();
						var num = parseInt(stat, 10);
						num++;
	
						$('.bed-count').val(num);
					});
				});
			/*욕실  */
					$(function() {
					$('#bathroom-decrease-quantity').click(function(e) {
						e.preventDefault();
						var stat = $('.bathroom-count').val();
						var num = parseInt(stat, 10);
						num--;
						if (num <=0) {
							/* 	alert("더이상 줄일수 없습니다") */
							num = 1;
	
						}
						$('.bathroom-count').val(num);
					});
					$('#bathroom-increase-quantity').click(function(e) {
						e.preventDefault();
						var stat = $('.bathroom-count').val();
						var num = parseInt(stat, 10);
						num++;
	
						$('.bathroom-count').val(num);
					});
				});
			</script> -->
				<input type="submit" value="다음" />
			</form>
		</div>
		
		
		<div class="host-reservation-update-container">
			지도
		</div>
		
		<!-- 편의시설 -->
		<div class="host-reservation-update-container">
			<h1>편의시설이 어떤게 있나요?</h1>
			<input type="checkbox" name="facilities" value="isTv" />TV<br>
			<input type="checkbox" name="facilities" value="isWifi" />Wifi<br>
			<input type="checkbox" name="facilities" value="isAirConditioner" />에어컨<br>
			<input type="checkbox" name="facilities" value="isHairDryer" />헤어드라이기<br>
			<input type="checkbox" name="facilities" value="isIron" />다리미<br>
			<hr>
			<h1>이용가능한 시설</h1>
			<input type="checkbox" name="availableFacilities" value="isKitchen" />주방<br>
			<input type="checkbox" name="availableFacilities" value="isWashingMachine" />세탁기<br>
			<input type="checkbox" name="availableFacilities" value="isElevator" />앨리베이터<br>
			<input type="checkbox" name="availableFacilities" value="isParkingLot" />주차<br>
			
			<input type="submit" value="다음" />
		</div>
		
		<!-- 사진등록 -->
		<div class="host-reservation-update-container">
			<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
			<script>
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
					filesArr
							.forEach(function(f) {
								if (!f.type.match("image.*")) {
									alert("확장자는 이미지 확장자만 가능합니다.");
									return;
								}
								sel_files.push(f);
								var reader = new FileReader();
								reader.onload = function(e) {
									var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
											+ index
											+ ")\" id=\"img_id_"
											+ index
											+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' width=\"150px\" ></a>";
									$(".imgs_wrap").append(html);
									index++;
								}
								reader.readAsDataURL(f);
							});
				}
				function deleteImageAction(index) {
					console.log("index : " + index);
					console.log("sel length : " + sel_files.length);
					sel_files.splice(index, 1);
					var img_id = "#img_id_" + index;
					$(img_id).remove();
				}
				function fileUploadAction() {
					console.log("fileUploadAction");
					$("#picture").trigger('click');
				}
				function submitAction() {
					console.log("업로드 파일 갯수 : " + sel_files.length);
					var data = new FormData();
					for (var i = 0, len = sel_files.length; i < len; i++) {
						var name = "image_" + i;
						data.append(name, sel_files[i]);
					}
					data.append("image_count", sel_files.length);
					if (sel_files.length < 1) {
						alert("한개이상의 파일을 선택해주세요.");
						return;
					}
					var xhr = new XMLHttpRequest();
					xhr.open("POST", "./register4.jsp");
					xhr.onload = function(e) {
						if (this.status == 200) {
							console.log("Result : "
									+ e.currentTarget.responseText);
						}
					}
					xhr.send(data);
				}
			</script>

			<div class="upload_List_Block">
                  
                  <div class="upload_List_Title">사진</div>
                  
                  <div class="upload_List_Input">
                     <div class="input_wrap">
                        <div class="imgs_wrap">
                           <img id="img" />
                        </div>
                        <a href="javascript:" onclick="fileUploadAction();" class="my_button"></a>  
                        <input type="file" id="picture" multiple="multiple"/>
                     </div>
                  </div>
               </div>
               <input type="submit" value="다음" />
		</div>
		
		<!-- 숙소명과 이름 -->
		<div class="host-reservation-update-container">
			<h1>숙소의 이름과 설명을 적어주세요!</h1>
			<h3>숙소명</h3>
			<input type="text" name="name" placeholder="숙소 이름" />
			<h3>숙소 설명</h3>
			<textarea name="description" rows="10" cols="50"></textarea>
			<h3>기타사항(선택)</h3>
			<textarea name="description_etc" rows="10" cols="50"></textarea>
			<input type="submit" value="다음" />
		</div>
		
		<!-- 숙박일 -->
		<div class="host-reservation-update-container">
			<h1>최대,최소 숙박일을 정해주세요</h1>
			최소 숙박 <input type="number" name="minimumStay"
				class="minimum-date" disabled value="1" />
			<button id="minimum-date-increase-quantity">▲</button>
			<button id="minimum-date-decrease-quantity">▼</button>
			<br>
			<div id="minium-warning"></div>

			최대 숙박 <input type="number" name="maximumStay"
				class="maximum-date" disabled value="1" />
			<button id="maximum-date-increase-quantity">▲</button>
			<button id="maximum-date-decrease-quantity">▼</button>
			<br>
			<div id="maximum-warning"></div>
			<input type="submit" value="다음" />
		</div>
		
		<!-- 예약불가날짜 -->
		<div class="host-reservation-update-container">예약불가날자</div>
		
		<!-- 동일기본요금 -->
		<div class="host-reservation-update-container">
			<h1>날짜마다 동일한 금액을 정해주세요!</h1>
			<!--0부터 9까지 숫자를 입력하지않으면 ""로 replace됨  -->
			금액 <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			<div id="warning"></div>
			<input type="submit" value="다음" />
		</div>
	</div>
</body>

<script>

	// hostReservationContainer tab 처리 
	var hostReservationContainer = document.getElementsByClassName("host-reservation-update-container");
	var hostReservationBtn = document.getElementsByName("host-reservation-update-btn");

	function hostContainer(num) {
		for (var i = 0; i < hostReservationContainer.length; i++) {
			var count = i;
			if( count === num){
				hostReservationContainer[num].style.display = "block";
				continue;
			}else if(count != num){
				hostReservationContainer[count].style.display="none";
			}
		}
			
	}
	// tab end
</script>
</html>