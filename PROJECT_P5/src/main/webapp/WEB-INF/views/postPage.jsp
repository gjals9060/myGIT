<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 상세보기</title>

<link rel="stylesheet" href="reset.css" />
<style type="text/css">
#wrap {
	width: 100%;
	max-width: 1100px;
	margin: 0 auto;
}

/* modalImgSlide */
.modalImgSlide {
	display: none;
	background: black;
	background: rgb(0, 0, 0, 0.8);
	position: fixed;
	z-index: 1;
	padding-top: 10%;
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

.modalImg img {
	max-width: 1100px;
	height: 700px;
}

.postImg img, .modalImg img {
	max-width: 900px;
	height: 500px;
	cursor: pointer;
	transition: 0.3s;
	cursor: pointer;
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
}

.postImgThumbnails, .modalImgThumbnails {
	width: 100%;
	min-width: 500px;
	max-width: 900px;
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
/* 
.postContent table {
	width: -webkit-fill-available;
} */
.postContentTable td:first-child {
	width: 75%;
	min-width: 500px;
}

.postContent td:nth-child(2) {
	min-width: 200px;
	text-align: end;
}

.contentTitle {
	font-size: 25px;
	font-weight: bolder;
}

.Title {
	font-size: 20px;
}

.contentIntro table td:first-child {
	width: 100%;
	min-height: 400px;
}

.contentConven img {
	width: 30px;
	height: 30px;
}

.contentProfile img {
	width: 50px;
	height: 50px;
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
	-webkit-appearance: none; /* Override default CSS styles */
	appearance: none;
	width: 100%; /* Full-width */
	height: 25px; /* Specified height */
	background: #d3d3d3; /* Grey background */
	outline: none; /* Remove outline */
	opacity: 0.7; /* Set transparency (for mouse-over effects on hover) */
	-webkit-transition: .2s; /* 0.2 seconds transition on hover */
	transition: opacity .2s;
}

.commentSlider:hover {
	opacity: 1; /* Fully shown on mouse-over */
}

.commentSlider::-webkit-slider-thumb {
	-webkit-appearance: none; /* Override default look */
	appearance: none;
	width: 25px;
	height: 25px;
	border: 0;
	background-image: url('img/back.jpg');
	cursor: pointer;
}

.contentReserv {
	border: 1px solid black;
	padding: 10%;
	margin: 5%;
	position: sticky;
	top: 30%;
	bottom: 10%;
	left: 65%;
	position: sticky;
	text-align: center;
}

/* 별점 */
.star {
	display: inline-block;
	width: 15px;
	height: 30px;
	cursor: pointer;
}

.starLeft {
	background: url(img/star2.png) no-repeat 0 0;
	background-size: 30px;
	margin-right: -3px;
}

.starRight {
	background: url(img/star2.png) no-repeat -15px 0;
	background-size: 30px;
	margin-left: -3px;
}

.star.on {
	background-image: url(img/star1.png);
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
			<div class="postImg">
				<div class="postImgNumber">1 / 8</div>
				<img src="img/back.jpg" onclick="modalOn()">
			</div>
			<div class="postImg">
				<div class="postImgNumber">2 / 8</div>
				<img src="img/bread.jpg" onclick="modalOn()">
			</div>
			<div class="postImg">
				<div class="postImgNumber">3 / 8</div>
				<img src="img/away.jpg" onclick="modalOn()">
			</div>
			<div class="postImg">
				<div class="postImgNumber">4 / 8</div>
				<img src="img/berry.jpg" onclick="modalOn()">
			</div>
			<div class="postImg">
				<div class="postImgNumber">5 / 8</div>
				<img src="img/first.png" onclick="modalOn()">
			</div>
			<div class="postImg">
				<div class="postImgNumber">6 / 8</div>
				<img src="img/water.jpg" onclick="modalOn()">
			</div>
			<div class="postImg">
				<div class="postImgNumber">7 / 8</div>
				<img src="img/flower.jpg" onclick="modalOn()">
			</div>
			<div class="postImg">
				<div class="postImgNumber">8 / 8</div>
				<img src="img/rose.jpg" onclick="modalOn()">
			</div>

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
			<!-- 사진 데이터 입력 시 반목문으로  >  .modalImgSlide[0] 아래로 append
			<div class="modalImg">
				<div class="modalImgNumber">(i값)/(전체 사진 갯수값)</div>
				<img src="이미지 링크" onclick="modalOff()">
			</div> -->

			<div class="modalImg">
				<div class="modalImgNumber">1 / 8</div>
				<img src="img/back.jpg" onclick="modalOff()">
			</div>
			<div class="modalImg">
				<div class="modalImgNumber">2 / 8</div>
				<img src="img/bread.jpg" onclick="modalOff()">
			</div>
			<div class="modalImg">
				<div class="modalImgNumber">3 / 8</div>
				<img src="img/away.jpg" onclick="modalOff()">
			</div>
			<div class="modalImg">
				<div class="modalImgNumber">4 / 8</div>
				<img src="img/berry.jpg" onclick="modalOff()">
			</div>
			<div class="modalImg">
				<div class="modalImgNumber">5 / 8</div>
				<img src="img/first.png" onclick="modalOff()">
			</div>
			<div class="modalImg">
				<div class="modalImgNumber">6 / 8</div>
				<img src="img/water.jpg" onclick="modalOff()">
			</div>
			<div class="modalImg">
				<div class="modalImgNumber">7 / 8</div>
				<img src="img/flower.jpg" onclick="modalOff()">
			</div>
			<div class="modalImg">
				<div class="modalImgNumber">8 / 8</div>
				<img src="img/rose.jpg" onclick="modalOff()">
			</div>

			<div class="modalImgSlideButton">
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>

			<div class="modalImgThumbnails">
				<div class="modalImgThumbnail"></div>
			</div>

		</div>

		<br>
		<hr>

		<div class="postContent">
			<table class="postContentTable">
				<tr>
					<td>
						<div class="contentIntro">
							<table>
								<tr>
									<td><div class="contentTitle">${host.name}</div></td>
									<td rowspan="2"><div class="contentProfile">
											<!-- 프로필 사진 경로 넣기 -->
											<img src="img/fox.jpg" alt="" />
										</div> <br>가나다</td>
								</tr>
								<tr>
									<td><div class="contentLocation">서울특별시 종로구</div></td>
								</tr>
								<tr>
									<td colspan="2">인원 3명 방 2개 침대 2개</td>
							</table>
						</div> <!-- postContentIntro end --> <br>
						<hr> <br>

						<div class="contentConven">
							<div class="contentConven Title">편의시설</div>
							<!-- if문으로 해당하는 것만 나오도록 -->
							<span class="convenTv"><img src="img/tv.png" alt="" /> TV</span>
							<span class="convenWifi"><img src="img/wifi.png" alt="" />
								WiFi</span> <span class="convenAirconditioner"><img
								src="img/airconditioner.png" alt="" /> 에어컨</span> <span
								class="convenAirpurifier"><img src="img/airpurifier.png"
								alt="" /> 공기청정기</span> <span class="convenHairdryer"><img
								src="img/hairdryer.png" alt="" /> 헤어드라이어</span> <span
								class="convenIron"><img src="img/iron.png" alt="" /> 다리미</span>
							<span class="convenKitchen"><img src="img/kitchen.png"
								alt="" /> 주방</span> <span class="convenWashingmachine"><img
								src="img/washingmachine.png" alt="" /> 세탁기</span> <span
								class="convenElevator"><img src="img/elevator.png" alt="" />
								엘리베이터</span> <span class="convenParking"><img
								src="img/parking.png" alt="" /> 주차장</span>
						</div> <br>
						<hr> <br>

						<div class="contentExplain">
							<div class="contentExplain Title">숙소 설명</div>
							경복궁 근처에 있는 한옥집입니다. 집 주변에 많은 관광지가 있기 때문에 관광하기 정말 좋고 주차장도 있습니다.
						</div> <br>
						<hr> <br>

						<div class="contentEct">
							<div class="contentEct Title">기타 사항</div>
							기타 설명 사항 <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>

						</div> <br>
						<hr> <br>
						<div class="contentMap">
							<div class="contentMap Title">지도</div>
							(지도 들어갈 자리) <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>

						</div> <br>
						<hr> <br>
					</td>
					<td>

						<div class="contentReserv">
							<div class="contentReservTitle">예약</div>
							35,000 / 1박<br>
							<div class="contentReservTitle">날짜</div>
							(date~캘린더)<br>
							<div class="contentReservTitle">인원</div>
							(암튼 따서 복붙하기)<br> <br> <br> <br> <br> <br>
							<input type="button" value="예약하기" />
						</div>
					</td>
				</tr>
			</table>

			<div class="contentReview">
				<div class="contentReview Title">후기</div>
				<div class="contentReviewStar">★ 4.5 (21)</div>
				<br> <br>
				<table class="contentReviewInput">
					<tr>
						<td><img src="img/fox.jpg" /><br> 내닉네임</td>
						<td>
							<div class="starBox">
								<span class="star starLeft"></span> <span class="star starRight"></span>
								<span class="star starLeft"></span> <span class="star starRight"></span>
								<span class="star starLeft"></span> <span class="star starRight"></span>
								<span class="star starLeft"></span> <span class="star starRight"></span>
								<span class="star starLeft"></span> <span class="star starRight"></span>
								<span class="starNumber" id="starNum">0</span>
							</div> <input type="text" id="commentReview" placeholder="내용을 입력해주세요." />
						</td>
						<td><input type="button" value="등록" onclick="commentUp()" /></td>
					</tr>
				</table>
				<br> <br>
				<table class="contentReviewList" id="reviewList">
				<tr>
					<td></td>
					<td></td>
				</tr>
					<!-- 					<tr>
						<td><img src="img/rose.jpg" alt="" /><br>가나다</td>
						<td>★★★★★<br>숙소가 굉장히 좋아요! 주변에 관광지도 많고 무엇보다 Host분이 굉장히
							친절하세요!!
						</td>
					</tr>
					<tr>
						<td><img src="img/flower.jpg" alt="" /><br>라마바</td>
						<td>★★★<br>별로입니다.
						</td>
					</tr> -->
				</table>
			</div>
			<!-- contentReview end -->

			<br>
			<hr>
			<br>
			<div class="contentRefund">
				<div class="contentRefund Title">환불정책</div>
				체크인 30일 전까지는 전액환불 가능합니다.
			</div>

			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br>

		</div>
		<!-- postContent end-->




	</div>
	<!-- wrap end -->

</body>

<script type="text/javascript" src="jquery-3.4.1.js"></script>
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

	/* 댓글 작성 */
	var commentCount = 0;
	var commentStar = 0;

	function commentLoad() {

	}

	function commentUp() {
		var reviewList = document.getElementById("reviewList");
		var contentReviewStar = document
				.getElementsByClassName("contentReviewStar");
		var contentReviewInput = document
				.getElementsByClassName("contentReviewInput");
		
		$("#reviewList").children("tbody").after('<tr><td><img src="'
		+ contentReviewInput[0].getElementsByTagName("img")[0].src
		+ '" /><br>' + '닉네임' + '</td><td>' +
		'<img src="img/star1.png" class="reviewStar" />' +
		$(".starNumber").text()
		+ '<br>'
 		+ $("#commentReview").val() + '</td></tr>');
		
		commentCount++;
		commentStar = (commentStar + Number($(".starNumber").text())) / 2;

		contentReviewStar[0].innerHTML = '★' + commentStar + ' ('
				+ commentCount + ')';
	}

	/* 별점 */

	$(".star").on('click', function() {
		var idx = $(this).index();
		$(".star").removeClass("on");
		for (var i = 0; i <= idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		var printIdx = idx + 0.5;
		if (printIdx >= 1)
			printIdx = (idx / 2) + 0.5;

		$(".starNumber").html(printIdx);
	});
</script>

</html>
