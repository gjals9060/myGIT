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

<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/home.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">


<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>	
	<div id="wrap" >
		
		<div id="presentationTitle">Peace / Place / Pleasure / Present / People </div>

 <!--이미지  -->
	 <article>
		<img src="img/cafe.jpg" alt="" class="presentation-img" id="presenttationImg"/>
		<img src="img/coffee.jpg" alt="" class="presentation-img"/>
		<img src="img/elevator.png" alt="" class="presentation-img"/>
		<img src="img/iron.png" alt="" class="presentation-img"/>
		<img src="img/fox.jpg" alt="" class="presentation-img"/>
	 </article>
	 
	 <script>
	 	$('#presenttationImg').on("mouseover", function() {

	 		$('#presenttationImg').css({
	 			"opacity":"0.4",
	 			"transition":"0.5s"
	 		});
	 	});
	 	
	 	$('#presenttationImg').on('mouseout', function(){
	 		$('#presenttationImg').css({
	 			"opacity":"1",
	 			"transition":"0.5s"
	 		});
	 	})
	 </script>
	 

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
    var swiper = new Swiper('.swiper-container', {
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
	
	</div>

	<footer>
		<hr />
		<div class="footer-text">
			<div>소개</div>
			<div>지원센터</div>
			<div>호스트</div>
			<div>뉴스룸</div>
			<div>사이트맵</div>
			<div>호스트등록</div>
			<div>이벤트</div>
			<div>도움말</div>
		</div>
		<hr />
		<div class="footer-inline-text">
			<ul>
				<li>개인정보처리|</li>
				<li>이용약관|</li>
				<li>사이트맵|</li>
				<li>환불정책|</li>
			</ul>
		</div>
	</footer>


</body>
</html>