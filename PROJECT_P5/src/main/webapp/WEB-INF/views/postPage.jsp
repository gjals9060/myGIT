<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>숙소 상세보기</title>


<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/daterangepicker.css" />
<style type="text/css">
#wrap {
	width: 90%;
	max-width: 1100px;
	margin: 10px auto;
}

table {
	width: 100%;
}

hr {
	margin: 20px 0 20px;
}

button {
	border: none;
	width: 15px;
	background: none;
}

.reservTab input {
	vertical-align: middle;
	text-align: center;
	width: 100%;
}

.personnel_input {
 	width: 60% !important;
 }

.reservTab input[type=submit] {
	border: none;
	width: 100%;
	background: #ed2d55;
	color: white;
	font-size: 18px;
	font-weight: bolder;
	padding: 5px;
	margin: 10px 0 0 0;
}

/* modalImgSlide */
.modalImgSlide {
	display: none;
	background: black;
	background: rgb(0, 0, 0, 0.8);
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background: black;
}

/* --- postImgSlide --- */
.postImgSlide {
	position: relative;
}

.postImg, .modalImg {
	display: none;
	text-align: center;
}

.postImg img, .modalImg img {
	max-width: 500px;
	cursor: pointer;
	transition: 0.3s;
	padding-top: 0.5%;
}

.modalImg img {
	width: 100%;
	height: auto;
	min-width: 600px;
	max-width: 900px;
}

.postImg:hover {
	opacity: 0.7;
}

.modalImgSlideButton {
	color: white;
}

.postImgSlideButton, .modalImgSlideButton {
	text-align: center;
	margin: 15px;
}

.prev, .next {
	cursor: pointer;
	padding: 10px;
	font-weight: bold;
	font-size: 20px;
	border-radius: 0 3px 3px 0;
}

.next {
	left: 550px;
	border-radius: 3px 0 0 3px;
}

.prev:hover, .next:hover {
	background: rgba(0, 0, 0, 0.5);
}

.modalImgNumber {
	color: white;
}

.postImgNumber, .modalImgNumber {
	font-size: 12px;
	top: 0px;
	padding-top: 0.5%;
}

.postImgThumbnails, .modalImgThumbnails {
	width: 100%;
	min-width: 500px;
	margin: 0 auto;
}

.postImgThumbnails, .modalImgThumbnails {
	width: 90%;
	margin: 0 auto;
}

.postImgThumbnails:after, .modalImgThumbnails:after {
	content: "";
	display: table;
	clear: both;
}

.postImgThumbnail.active img, .postImgThumbnail img:hover,
	.modalImgThumbnail.active img, .modalImgThumbnail img:hover {
	opacity: 1;
}

.postImgThumbnail img, .modalImgThumbnail img {
	cursor: pointer;
	float: left;
	opacity: 0.6;
	object-fit: cover;
	object-position: center;
	width: 20%;
	height: 100px;
}

/* --- postContent --- */
.postContent {
	min-width: 320px;
}

.postContentTable td:first-child {
	width: 75%;
	/* min-width: 500px; */
	max-width: 1px;
	font-size: 95%;
	line-height: normal;
}

.postContent td:nth-child(2) {
	text-align: right;
}

.contentTitle {
	font-size: 28px;
	font-weight: bolder;
}

.Title {
	font-size: 19px;
	margin: 0px 0px 25px 0px;
	font-weight: bolder;
}

.contentIntro table td:first-child {
	vertical-align: middle;
	min-height: 400px;
}

.contentConven {
	word-break: keep-all;
}

.contentConven img {
	width: 25px;
	height: 25px;
}

.contentProfile img {
	width: 50px;
	height: 50px;
}

.contentReview {
	word-break: break-all;
}

.contentReview table td {
	padding: 10px;
	text-align: center;
	vertical-align: middle;
}

.contentReview table td:nth-child(2) {
	text-align: left;
}

.contentReview img {
	width: 50px;
	height: 50px;
	object-fit: cover;
	object-position: center;
}

.contentReviewInput img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	object-position: center;
}

.reviewStar {
	width: 20px !important;
	height: 20px !important;
}

.contentReviewInput {
	vertical-align: middle;
}

.contentReviewInput td:nth-child(2) {
	width: 100%;
	min-width: 300px;
}

.contentReviewInput input {
	width: -webkit-fill-available
}

.commentSlider {
	-webkit-appearance: none;
	appearance: none;
	width: 100%;
	height: 25px;
	background: #d3d3d3;
	outline: none;
	opacity: 0.7;
	-webkit-transition: .2s;
	transition: opacity .2s;
}

.commentSlider:hover {
	opacity: 1;
}

.commentSlider::-webkit-slider-thumb {
	-webkit-appearance: none;
	appearance: none;
	width: 25px;
	height: 25px;
	border: 0;
	background-image: url('img/back.jpg');
	cursor: pointer;
}

.contentReserv {
	border: 1px solid black;
	padding: 8%;
	margin: 0 10% 0;
	position: sticky;
	top: 10%;
	bottom: 30%;
	left: 65%;
	text-align: center;
}

.contentReservTitle {
	font-size: 17px;
	margin: 15px 0 10px;
	font-weight: bolder;
}

.personInput {
	width: 100%;
}

#dateCount {
	margin: 20px 0 10px;
}

/* 지도 */

.contentMap {
	width: 60vw;
	max-width: 700px;
}

.map {
 	width: 500px; 
	height: 400px;
	margin-top: 10px;
	z-index: 3;
	text-align: center;
	margin: 0 auto;
	margin-bottom: 30px;
}

/* 반응형 */
.contentReservFix {
	display: none;
	position: fixed;
    bottom: 0;
    width: 100%;
    margin: 0;
    padding: 0;
    left: 0;
    vertical-align: middle;
    text-align: center;
	background: #eee;
}

.contentReservFix table {
	padding: 0 15px;
}

.contentReservFix td:nth-child(3) {
	width: 20%;
	min-width: 120px;
}


.contentReservFix input {
	vertical-align: middle;
	text-align: center;
	width: -webkit-fill-available;
	
}


.contentReservFix input[type=submit] {
	border: none;
	width: 100%;
	background: #ed2d55;
	color: white;
	font-size: 18px;
	font-weight: bolder;
	padding: 5px;
	margin: 10px 0 0 0;
}

/* 페이징 */
.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}




@media (min-width: 480px) and (max-width: 880px) {
	
	#wrap {
		width: 90%;
		max-width: 880px;
		background: red;
	}
	
	.postContent div {
		width: 85vw;
	}
	
	.contentTitle {
		width: none;
	}
	
	.reservTab {
		display: none;
	}
	
	.contentReservFix {
		display: block;
	}
		
	.postImg img, .modalImg img {
		max-width: 400px;
		padding-top: 0.5%;
	}
	
	.modalImg img {
		width: 100%;
		height: auto;
		min-width: 400px;
		max-width: 800px;
	}
	
	.postImgThumbnails, .modalImgThumbnails {
		min-width: 300px;
	}
	
	.postImgThumbnails img, .modalImgThumbnails img {
		height: 70px;
	}
}

@media (min-width: 0px) and (max-width: 480px) {
 	
	#wrap {
		width: 90%;
		max-width: 480px;
		min-width: 360px;
		background: blue;
	}
	
	.postContent div {
		width: 85vw;
	
	}
	
	.reservTab {
		display: none;
	}
	
	.contentReservFix {
		display: block;
	}
	
	
	.postImg img, .modalImg img {
		max-width: 360px;
		padding-top: 0.5%;
	}
	
	.modalImg img {
		width: 100%;
		height: auto;
		min-width: 300px;
		max-width: 500px;
	}
	
	.postImgThumbnails, .modalImgThumbnails {
		min-width: 300px;
	}
	
	.postImgThumbnails img, .modalImgThumbnails img {
		height: 50px;
	}
}

</style>

</head>
<body>
   <div id="wrap">
      <div class="postImgSlide">
         <!-- 사진 데이터 입력 시 반목문으로  >  .postImgSlide[0] 아래로 append
         <div class="postImg">
            <div class="postImgNumber">(i값)/(전체 사진 갯수)</div>
            <img src="이미지 링크" onclick="modalOn()">
         </div>
         -->

         <!-- start 호스트포토 리스트 출력 작업 by 허민 -->
         <c:forEach var="photo" items="${hostPhoto}" varStatus="status">
			<div class="postImg">
            	<div class="postImgNumber">${status.count} / ${fn:length(hostPhoto)}</div>
            	<img src="${photo.path}" alt="${photo.originalName}" onclick="modalOn()">
			</div>
         
         </c:forEach>
         
         <!-- end 호스트포토 리스트 출력 작업 by 허민 -->
         
<!-- 
    	<div class="postImg">
            <div class="postImgNumber">1 / 8</div>
            <img src="img/room1.jpg" onclick="modalOn()">
         </div>
         <div class="postImg">
            <div class="postImgNumber">2 / 8</div>
            <img src="img/room1.jpg" onclick="modalOn()">
         </div>
         <div class="postImg">
            <div class="postImgNumber">3 / 8</div>
            <img src="img/room1.jpg" onclick="modalOn()">
         </div>
         <div class="postImg">
            <div class="postImgNumber">4 / 8</div>
            <img src="img/room1.jpg" onclick="modalOn()">
         </div>
         <div class="postImg">
            <div class="postImgNumber">5 / 8</div>
            <img src="img/room1.jpg" onclick="modalOn()">
         </div>
         <div class="postImg">
            <div class="postImgNumber">6 / 8</div>
            <img src="img/room1.jpg" onclick="modalOn()">
         </div>
         <div class="postImg">
            <div class="postImgNumber">7 / 8</div>
            <img src="img/room1.jpg" onclick="modalOn()">
         </div>
         <div class="postImg">
            <div class="postImgNumber">8 / 8</div>
            <img src="img/room1.jpg" onclick="modalOn()">
         </div>
-->

         <div class="postImgSlideButton">
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
               class="next" onclick="plusSlides(1)">&#10095;</a>
         </div>

         <div class="postImgThumbnails">
            <div class="postImgThumbnail"></div>
         </div>
      </div>
      <!-- postImgSlide end -->

      <div class="modalImgSlide">
      
         <!-- start 호스트포토 modal 출력 작업 by 허민 -->
         
         <c:forEach var="photo" items="${hostPhoto}" varStatus="status">
			<div class="modalImg">
            	<div class="modalImgNumber">${status.count} / ${fn:length(hostPhoto)}</div>
            	<img src="${photo.path}" alt="${photo.originalName}" onclick="modalOff()">
			</div>
         
         </c:forEach>
         
         <!-- end 호스트포토 modal 출력 작업 by 허민 -->
      
         <!-- 사진 데이터 입력 시 반목문으로  >  .modalImgSlide[0] 아래로 append
         <div class="modalImg">
            <div class="modalImgNumber">(i값)/(전체 사진 갯수값)</div>
            <img src="이미지 링크" onclick="modalOff()">
         </div> -->

<!--
		 <div class="modalImg">
            <div class="modalImgNumber">1 / 8</div>
            <img src="img/room1.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">2 / 8</div>
            <img src="img/room1.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">3 / 8</div>
            <img src="img/room1.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">4 / 8</div>
            <img src="img/room1.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">5 / 8</div>
            <img src="img/room1.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">6 / 8</div>
            <img src="img/room1.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">7 / 8</div>
            <img src="img/room1.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">8 / 8</div>
            <img src="img/room1.jpg" onclick="modalOff()">
         </div>
-->
         <div class="modalImgSlideButton">
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
               class="next" onclick="plusSlides(1)">&#10095;</a>
         </div>

         <div class="modalImgThumbnails">
            <div class="modalImgThumbnail"></div>
         </div>

      </div>
      <hr>

		<div class="postContent">
			<table class="postContentTable">
				<tr>
					<td>
						<div class="contentIntro">
							<table>
								<tr>
									<td><div class="contentTitle">${host.name}</div></td>
									<td rowspan="4"><span class="contentProfile"><img
											src="img/room1.jpg" alt="" /></span><br>${host.firstName }님</td>
								</tr>
								<tr>
									<td>작성일 ${host.creationDate } | 수정일${host.modificationDate }</td>
								</tr>
								<tr>
									<td><span class="contentLocation">${host.address }</span></td>
								</tr>
								<tr>
									<td>${host.type }${host.roomType }|인원
										${host.capacity }명 방 ${host.roomCount }개 침대 ${host.bedCount }개
										욕실 ${host.bathroomCount }개</td>
								</tr>
							</table>
						</div> <!-- postContentIntro end -->
						<hr>
						<div class="contentConven" id="contentConven">
							<div class="contentConven Title">편의시설</div>
						</div>
						<hr>
						<div class="contentExplain">
							<div class="contentExplain Title">숙소 설명</div>
							${host.description }
						</div>
						<hr>

						<div class="contentEct">
							<div class="contentEct Title">기타 사항</div>
							${host.descriptionEtc }
						</div>
						<hr>
						<div class="contentMap">
							<div class="contentMap Title">지도</div>
							<div id="map" class="map" style="width: 90%">
								<button
									style="background: #FFFFFF; width: 33px; margin-right: 2px; padding: unset; position: absolute; top: 105px; right: 0; z-index: 5; border: none; border-radius: 10px;"
									onclick="panTo()">
									<img alt="focus" src="./img/focus.png"
										style="width: 30px; height: 30px;">
								</button>
							</div>
							</div>
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6252091adcb28726fdb95ebdf0b78361"></script>
							<script>
                     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                         mapOption = { 
                             center: new kakao.maps.LatLng(37.240910457871784, 131.86707687050958), // 지도의 중심좌표
                             level: 3 // 지도의 확대 레벨
                         };
                     
                     var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                     
                     map.setMinLevel(2);
                     map.setMaxLevel(4);
                     
                     var latitude = ${host.latitude};
                     var longitude = ${host.longitude};
                     
                     map.setCenter(new kakao.maps.LatLng(latitude, longitude));
                  
                     // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                     var zoomControl = new kakao.maps.ZoomControl();
                     map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                     
                     
                     // center 좌표에 마커 생성
                     var imageSrc = './img/marker2.png', // 마커이미지의 주소입니다    
                         imageSize = new kakao.maps.Size(65, 70), // 마커이미지의 크기입니다
                         imageOption = {offset: new kakao.maps.Point(30, 60)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                     
                     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                         markerPosition = new kakao.maps.LatLng(latitude, longitude); // 마커가 표시될 위치입니다
                         
                     // 마커를 생성합니다
                     var marker = new kakao.maps.Marker({
                        position: markerPosition,
                        image: markerImage, // 마커이미지 설정
                        title: "${host.name}",
                        zIndex: 4
                     });
                     // 마커가 지도 위에 표시되도록 설정합니다
                     marker.setMap(map);
                     
                     function panTo() {
                         // 이동할 위도 경도 위치를 생성합니다 -> 마커 위치로
                         var moveLatLon = markerPosition;
                         
                         // 지도 중심을 부드럽게 이동시킵니다
                         // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
                         map.panTo(moveLatLon);            
                     }    
                     
                     function resizeMap() {
                    	    var mapContainer = document.getElementById('map');
                    	    mapContainer.style.width = '90%';
                    	    /* mapContainer.style.height = '650px'; */ 
                    	}

                    	function relayout() {
                    	    map.relayout();
                    	}
                    	
                    	resizeMap();
                    	relayout();

                    	</script>
					</td>
					<td class="reservTab">
						<div class="contentReserv">
							<form action="reservationPurchase" method="post">
								<div class="contentReservTitle">예약</div>
								${host.price}/1박
								<div class="contentReservTitle">날짜</div>
								<input type="text" id="checkDate" name="checkInDatecheckOutDate"
									value="${checkInDatecheckOutDate}" onchange="countDate()" />
								<div class="contentReservTitle">인원</div>
								<span class="personInput"><input type='text' name='personnel' class="personnel_input"
									value="${capacity}">
								<!-- ${capacity}는 검색할때의 인원 설정 조건임, ${host.capacity} 와 다름 -->
								<button id="increaseQuantity">▲</button>
								<button id="decreaseQuantity">▼</button>
								</span>
								<div id="dateCount"></div>
								<input type="hidden" id="hostId" name="hostId"
									value="${host.id}"> <input type="hidden" id="userId"
									name="userId" value="${user.id}"> <input type="hidden"
									id="hostName" name="hostName" value="${host.name}"> <input
									type="hidden" id="hostPrice" name="hostPrice"
									value="${host.price}"> <input type="hidden"
									id="dateCnt" name="dateCnt" value=""> <input
									type="submit" value="예약하기" />
							</form>
						</div>
					</td>
				</tr>
			</table>
			<hr>
			<div class="contentReview">
				<div class="contentReview Title">후기<span class="contentReviewStar">★ 4.5 (21)</span></div>
				<table class="contentReviewList" id="reviewList">
<!-- 					<tr></tr> -->
				</table>
				<div class="pagination">
					<div class="pagingPrev"><a class="paging" onclick="commentLoad(nowCommentPage-1)">&laquo;</a></div>
					<div class="pagingNum">
		  				<a class="paging active" onclick="commentLoad(1)">1</a>
						<a class="paging" onclick="commentLoad(2)">2</a>
						<a class="paging" onclick="commentLoad(3)">3</a>
						<a class="paging" onclick="commentLoad(4)">4</a>
						<a class="paging" onclick="commentLoad(5)">5</a>
					</div>
					<div class="pagingNext"><a class="paging" onclick="commentLoad(nowCommentPage+1)">&raquo;</a></div>
			</div>
			</div>
			<!-- contentReview end -->
			<br>
			<hr>
			<div class="contentRefund">
				<div class="contentRefund Title">환불정책</div>
				체크인 30일 전까지는 전액환불 가능합니다.
			</div>
		</div>

		<div class="contentReservFix">
			<form action="reservationPurchase" method="post">
				<table>
					<tr>
						<td><div class="contentReservTitle">예약</div></td>
						<td><div class="contentReservTitle">날짜</div></td>
						<td><div class="contentReservTitle">인원</div></td>
					</tr>
					<tr>
						<td>${host.price}/1박</td>
						<td><input type="text" id="checkDate2"
							name="checkInDatecheckOutDate" value="${checkInDatecheckOutDate}"
							onchange="countDate2()" /></td>
						<td><input type='text' name='personnel'
							class="personnel_input" value="${capacity}">
							<!-- ${capacity}는 검색할때의 인원 설정 조건임, ${host.capacity} 와 다름 -->
							<button id="increaseQuantity">▲</button>
							<button id="decreaseQuantity">▼</button></td>
					</tr>
					<tr>
						<td colspan="3">
							<div id="dateCount2"></div>
						</td>
					</tr>
				</table>
				<input type="hidden" id="hostId" name="hostId" value="${host.id}">
				<input type="hidden" id="userId" name="userId" value="${user.id}">
				<input type="hidden" id="hostName" name="hostName"
					value="${host.name}"> <input type="hidden" id="hostPrice"
					name="hostPrice" value="${host.price}"> <input
					type="hidden" id="dateCnt" name="dateCnt" value=""> <input
					type="submit" value="예약하기" />
			</form>
		</div>
		<!-- postContent end-->
   </div>
   <!-- wrap end -->

</body>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript">

   /* 이미지 슬라이드 */
   var slideIndex = 1;
   showSildes(slideIndex);

   function showSildes(n) {
      var i;
      var slides = document.getElementsByClassName("postImg");
      var slidesList = document.getElementsByClassName("postImgSlide");
      var thumb = document.getElementsByClassName("postImgThumbnail");
      var thumbList = document.querySelector(".postImgThumbnails");

      var Mslides = document.getElementsByClassName("modalImg");
      var MslidesList = document.getElementsByClassName("modalImgSlide");
      var Mthumb = document.getElementsByClassName("modalImgThumbnail");
      var MthumbList = document.querySelector(".modalImgThumbnails");

      if (n > slides.length) {
         slideIndex = 1;
      }
      if (n < 1) {
         slideIndex = slides.length;
      }

      for (var i = 0; i < thumb.length; i++) {
         thumb[i].className = thumb[i].className.replace(" active", "");
         thumb[i].style.display = "none";
         Mthumb[i].className = Mthumb[i].className.replace(" active", "");
         Mthumb[i].style.display = "none";
      }

      for (var i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";
         Mslides[i].style.display = "none";
      }

      slides[slideIndex - 1].style.display = "block";
      Mslides[slideIndex - 1].style.display = "block";

      thumbList.innerHTML = "";
      MthumbList.innerHTML = "";

      for (var i = -3; i < 2; i++) {
         if (slideIndex + i < 0) {
            thumbList.innerHTML += '<div class="postImgThumbnail"><img src="'
                  + slides[slideIndex + i + slides.length]
                        .getElementsByTagName("img")[0].src
                  + '" onclick="currentSlide('
                  + (slideIndex + i + slides.length + 1) + ')" /></div>';
            MthumbList.innerHTML += '<div class="modalImgThumbnail"><img src="'
                  + Mslides[slideIndex + i + slides.length]
                        .getElementsByTagName("img")[0].src
                  + '" onclick="currentSlide('
                  + (slideIndex + i + slides.length + 1) + ')" /></div>';
         } else if (slideIndex + i >= slides.length) {
            thumbList.innerHTML += '<div class="postImgThumbnail"><img src="'
                  + slides[slideIndex + i - slides.length]
                        .getElementsByTagName("img")[0].src
                  + '" onclick="currentSlide('
                  + (slideIndex + i - slides.length + 1) + ')" /></div>';

            MthumbList.innerHTML += '<div class="modalImgThumbnail"><img src="'
                  + Mslides[slideIndex + i - slides.length]
                        .getElementsByTagName("img")[0].src
                  + '" onclick="currentSlide('
                  + (slideIndex + i - slides.length + 1) + ')" /></div>';
         } else {
            thumbList.innerHTML += '<div class="postImgThumbnail"><img src="'
                  + slides[slideIndex + i].getElementsByTagName("img")[0].src
                  + '" onclick="currentSlide('
                  + (slideIndex + i + 1)
                  + ')" /></div>';

            MthumbList.innerHTML += '<div class="modalImgThumbnail"><img src="'
                  + slides[slideIndex + i].getElementsByTagName("img")[0].src
                  + '" onclick="currentSlide('
                  + (slideIndex + i + 1)
                  + ')" /></div>';
         }
      }
      thumb[2].className += " active";
      Mthumb[2].className += " active";
   }

   function plusSlides(n) {
      showSildes(slideIndex += n);
   }

   function currentSlide(n) {
      showSildes(slideIndex = n);
   }

   /* 모달 이미지 */

   function modalOn() {
      var modalImgSlide = document.getElementsByClassName("modalImgSlide");
      modalImgSlide[0].style.display = "block";
   }

   function modalOff() {
      var modalImgSlide = document.getElementsByClassName("modalImgSlide");
      modalImgSlide[0].style.display = "none";
   }

   function spanOnoff() {
      var conventCount = 0;
      var convenList = ["${host.isTv }", "${host.isWifi }", "${host.isAirConditioner }", "${host.isAirPurifier }", "${host.isHairDryer }", "${host.isIron }", "${host.isKitchen }", "${host.isWashingMachine }", "${host.isElevator }", "${host.isParkingLot }"];

      for (var i = 0; i < convenList.length; i++) {
         if(convenList[i] == "Y") {
            switch (i) {
            case 0:
               $("#contentConven").append('<span class="convenImg Tv"><img src="./img/tv.png" alt="" /> TV </span>');
               conventCount++;
               break;
            case 1:
               $("#contentConven").append('<span class="convenImg Wifi"><img src="./img/wifi.png" alt="" /> WiFi </span>');
               conventCount++;
               $("#contentConven").append('&nbsp;&nbsp;');
               break;
            case 2:
               $("#contentConven").append('<span class="convenImg Airconditioner"><img src="./img/airconditioner.png" alt="" /> 에어컨 </span>');
               conventCount++;
               break;
            case 3:
               $("#contentConven").append('<span class="convenImg Airpurifier"><img src="./img/airpurifier.png" alt="" /> 공기청정기 </span>');
               conventCount++;
               break;
            case 4:
               $("#contentConven").append('<span class="convenImg Hairdryer"><img src="./img/hairdryer.png" alt="" /> 헤어드라이어 </span>');
               conventCount++;
               break;
            case 5:
               $("#contentConven").append('<span class="convenImg Iron"><img src="./img/iron.png" alt="" /> 다리미 </span>');
               conventCount++;
               break;
            case 6:
               $("#contentConven").append('<span class="convenImg Kitchen"><img src="./img/kitchen.png" alt="" /> 주방 </span>');
               conventCount++;
               break;
            case 7:
               $("#contentConven").append('<span class="convenImg Washingmachine"><img   src="./img/washingmachine.png" alt="" /> 세탁기 </span>');
               conventCount++;
               break;
            case 8:
               $("#contentConven").append('<span class="convenImg Elevator"><img src="./img/elevator.png" alt="" /> 엘리베이터 </span>');
               conventCount++;
               break;
            case 9:
               $("#contentConven").append('<span class="convenImg Parking"><img src="./img/parking.png" alt="" /> 주차장 </span>');
               conventCount++;
               break;
            default:
               break;
            }
            $("#contentConven").append('&nbsp;');
         }
/*        if(conventCount == 5) $("#contentConven").append('<br>'); */  

      }
   }
   spanOnoff();
   
   
   /* 댓글 */
   var commentCount = 0;
   var commentStar = 0;
/* 
   function commentLoad() {
      $("#reviewList").children("tbody").after('<tr>'+'<td><img src="img/room1.jpg" alt="" /><br>가나다</td>'
            + '<td>★4<br>숙소가 굉장히 좋아요! 주변에 관광지도 많고 무엇보다 Host분이 굉장히 친절하세요!!</td>'
            + '</tr>');
      $("#reviewList").children("tbody").after('<tr>'+
      '<td><img src="img/room1.jpg" alt="" /><br>라마바</td><td>★1<br>별로입니다.</td></tr>');
   }
   commentLoad(); */
   
   function commentMore() {
      /* 댓글 더보기 (상단부터 오래된 댓글) -> 화면 프린트 시 최근 댓글이 위로 프린트됨 */
       $("#reviewList").children("tr:last").after('<tr>'+'<td><img src="img/berry.jpg" alt="" /><br>가나다</td>'
            + '<td>★5<br>숙소가 굉장히 좋아요! 주변에 관광지도 많고 무엇보다 Host분이 굉장히 친절하세요!!</td>'
            + '</tr>');
      $("#reviewList").children("tr:last").after('<tr>'+
      '<td><img src="img/room1.jpg" alt="" /><br>라마바</td><td>★2<br>별로입니다.</td></tr>');
      
      /* (만약 next가 없다면) */
/*       $("#reviewList").children("tr:last").after('<tr>'+
      '<td colspan="2">마지막 후기입니다.</td></tr>'); */
   }
   
   /* 캘린더 */

   var date = new Date();
   var date2 = new Date();
   date2.setMonth(date.getMonth() + 3);
   $(function() {
      $('input[name="checkInDatecheckOutDate"]').daterangepicker(
            {
               "autoApply" : true,
               "startDate" : "${startDate}",
               "endDate" : "${endDate}",
               "minDate" : date,
               "maxDate" : date2,
            },
            function(start, end, label) {
               console.log('New date range selected: '
                     + start.format('YYYY-MM-DD') + ' to '
                     + end.format('YYYY-MM-DD') + ' (predefined range: '
                     + label + ')');
            });
   });
   
   function countDate() {
   var date = $("#checkDate").val().split(" - ");
   var checkInDate = date[0].split("/");
   var checkInDate1 = new Date(checkInDate[2], checkInDate[0]-1, checkInDate[1]);
   var checkOutDate = date[1].split("/");
   var checkOutDate1 = new Date(checkOutDate[2], checkOutDate[0]-1, checkOutDate[1]);
   var dateCount = parseInt(checkOutDate1-checkInDate1)/(24*60*60*1000);
   
   $('#dateCnt').val(dateCount);
   
   $("#dateCount").html(dateCount + "박 " + (dateCount+1) + "일<br>" + ("${host.price }"*dateCount) + "원");
   }
   
   function countDate2() {
   var date = $("#checkDate2").val().split(" - ");
   var checkInDate = date[0].split("/");
   var checkInDate1 = new Date(checkInDate[2], checkInDate[0]-1, checkInDate[1]);
   var checkOutDate = date[1].split("/");
   var checkOutDate1 = new Date(checkOutDate[2], checkOutDate[0]-1, checkOutDate[1]);
   var dateCount = parseInt(checkOutDate1-checkInDate1)/(24*60*60*1000);
   
   $('#dateCnt').val(dateCount);
   
   $("#dateCount2").html(dateCount + "박 " + (dateCount+1) + "일 / " + ("${host.price }"*dateCount) + "원");
   }
   
   /* 인원 선택 */
   $(function() {
      $('#decreaseQuantity').click(function(e) {
         e.preventDefault();
         var stat = $('.personnel_input').val();
         var num = parseInt(stat, 10);
         num--;

         if (num < 0) {
            alert('더이상 줄일수 없습니다.');
            num = 1;
         }

         $('.personnel_input').val(num);

      }); /* click이벤트  */

      $('#increaseQuantity').click(function(e) {
         e.preventDefault();
         var stat = $('.personnel_input').val();
         var num = parseInt(stat, 10);
         var capacity
         num++;
         
         if(num > ${host.capacity }) {
        	 alert("host의 최대 수용 인원 보다 많습니다.");
        	 num--;
         }
         $('.personnel_input').val(num);
      });
   });
   
   /* 페이징 */
   
   var nowCommentPage = 1;
	commentLoad(nowCommentPage);

	function commentLoad(n) {
			nowCommentPage = n;
			var nn = Math.ceil(n/5)-1;
	
			/* 댓글 정보 리스트 */
	/* 		var commentWriterImgList = ["img/back.jpg", "img/berry.jpg", "img/bread.jpg", "img/coffee.jpg", "img/fox.jpg", "img/water.jpg", "img/flower.jpg"];
			var commentWriterList = ["가나", "다라", "마바", "사아", "자차", "카타", "파하"];
			var commentStarList = ["1", "1.5", "2", "2.5", "3", "4.5", "5"];
			var commentContentList = ["좋아요", "숙소가 굉장히 좋아요!", "주변에 관광지도 많아요", "무엇보다 Host분이 굉장히 친절하세요!!", "별로입니다.", "그냥 그래요", "ㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇ" ];
	 */		
			/* 한페이지당 댓글 출력 갯수 3개로 설정 */
		 var paging = document.getElementsByClassName("paging");
	
	/* 		var commentNum = 3;
		   var pagingNumber = Math.ceil(commentWriterList.length/commentNum); 
		  */
		   /* 화살표 */
	/* 	   if(n == 1){
			   $(".pagingPrev").css("display", "none");
		   } else if(n == pagingNumber){
			   $(".pagingNext").css("display", "none");
		   } else {
			   $(".pagingPrev").css("display", "block");
			   $(".pagingNext").css("display", "block");
		   }
	 */	   
		   /* 페이징 번호 */
	/* 	   $(".pagingNum").html("");
		   for (var i = (1+nn*5); i < (1+nn*5+5); i++) {
			   $(".pagingNum").append('<a class="paging" onclick="commentLoad(' + i + ')">' + i + '</a>');
		}
		    */
		   for (var i = 0; i < paging.length; i++) {
			   paging[i].className = paging[i].className.replace(" active", "");
			}
		    
			paging[n].className += " active";		    
		   /* paging[n-(nn*5)].className += " active"; */
		   
		   /* 01234
		   56789
		   1011121314 
		   n-(nn*5)
		   */
		   /* 1 123
		   	2 456
		   	3 789
		   */
		   /* 
		   var startNum = 1+(commentNum*(n-1))-1;
				$("#reviewList").children("tbody").html('<tr>'+'<td><img src="' + commentWriterImgList[startNum] +'" alt="" /><br>' + commentWriterList[startNum] + ' </td>'
			            + '<td>★' + commentStarList[startNum] +'<br>'+ commentContentList[startNum] +'</td></tr>');
				
				$("#reviewList").children("tbody").children("tr:last").after('<tr>'+'<td><img src="' + commentWriterImgList[startNum+1] +'" alt="" /><br>' + commentWriterList[startNum+1] + ' </td>'
			            + '<td>★' + commentStarList[startNum+1] +'<br>'+ commentContentList[startNum+1] +'</td></tr>');
				$("#reviewList").children("tbody").children("tr:last").after('<tr>'+'<td><img src="' + commentWriterImgList[startNum+2] +'" alt="" /><br>' + commentWriterList[startNum+2] + ' </td>'
			            + '<td>★' + commentStarList[startNum+2] +'<br>'+ commentContentList[startNum+2] +'</td></tr>');
 */
 }
 
</script>
</html>
