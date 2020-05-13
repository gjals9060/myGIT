<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>p5 메인 홈페이지</title>

<!-- css  -->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/home.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<!--javascript  -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">



<!-- viewport  -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>	
		
		<div id="presentationTitle">Peace / Place / Pleasure / Present / People </div>


	 
	 <div id="backgroundColor">
		 <section>
			
			<div class="pop-img-block" id="fristBlock">
		 		<img src="img/bedroom.jpg" alt="" class="push-area-img" id="fristImg" />
		 		<div class="figcaption" >여기는 종로구 입니다.</div>
		 	</div>
		 
		 	<div class="pop-img-block">
		 		<img src="img/cafe.jpg" alt="" class="push-area-img" />
		 		<div class="figcaption">경복궁</div>
		 	</div>
		 		
		 	<div class="pop-img-block">
		 		<img src="img/berry.jpg" alt="" class="push-area-img" />
		 		<div class="figcaption">연신내</div>
		 	</div>
		 	
		 	<div class="pop-img-block">
		 	<img src="img/juice.jpg" alt="" class="push-area-img" />
		 		<div class="figcaption">신림</div>
		 	</div>
		 	
		 	<div class="pop-img-block">
		 		<img src="img/back.jpg" alt="" class="push-area-img" />
		 		<div class="figcaption">을지로</div>
		 	</div>

		 </section>
	 </div>
	

	 
	<div id="wrap" >

	 <!-- 스와이퍼 이미지   -->
	  <!-- Swiper -->
 
  	<div class="popular">인기숙소 </div>
  
  	<div class="swiper-container">
    	<div class="swiper-wrapper">
      		<div class="swiper-slide">
	      		<div class="swiper-flex">
	      			<div class="popular-img">
						<img src="img/room1.jpg" alt="" />
					</div>
					<div class="popular-description">
						종로구 전통적인 한옥
						<div class="popular-facilities">편의시설</div>
						<div class="star">
							<span class="fa fa-star checked"></span> <span class="fa fa-star checked"></span> 
							<span class="fa fa-star checked"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span>
						</div>
					</div>
	     	 	</div>
     	 	</div>
      		<div class="swiper-slide">
	      		<div class="swiper-flex">
	      			<div class="popular-img">
						<img src="img/room1.jpg" alt="" />
					</div>
					<div class="popular-description">
						종로구 전통적인 한옥
						<div class="popular-facilities">편의시설</div>
						<div class="star">
							<span class="fa fa-star checked"></span> <span class="fa fa-star checked"></span> 
							<span class="fa fa-star checked"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span>
						</div>
					</div>
	     	 	</div>
     	 	</div>
      		<div class="swiper-slide">
	      		<div class="swiper-flex">
	      			<div class="popular-img">
						<img src="img/room1.jpg" alt="" />
					</div>
					<div class="popular-description">
						종로구 전통적인 한옥
						<div class="popular-facilities">편의시설</div>
						<div class="star">
							<span class="fa fa-star checked"></span> <span class="fa fa-star checked"></span> 
							<span class="fa fa-star checked"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span>
						</div>
					</div>
	     	 	</div>
     	 	</div>
      		<div class="swiper-slide">
	      		<div class="swiper-flex">
	      			<div class="popular-img">
						<img src="img/room1.jpg" alt="" />
					</div>
					<div class="popular-description">
						종로구 전통적인 한옥
						<div class="popular-facilities">편의시설</div>
						<div class="star">
							<span class="fa fa-star checked"></span> <span class="fa fa-star checked"></span> 
							<span class="fa fa-star checked"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span>
						</div>
					</div>
	     	 	</div>
     	 	</div>
    	</div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>

  <!-- Swiper JS -->
  <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
  	$(document).ready(function() {
  		console.log('swiper');
	    var swiper = new Swiper('.swiper-container', {
	      navigation: {
    	  	nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev'
	      },
	    });
	    console.dir(swiper);
  	})
  </script>
	
	</div>
	<jsp:include page="./footer.jsp" />

</body>
</html>