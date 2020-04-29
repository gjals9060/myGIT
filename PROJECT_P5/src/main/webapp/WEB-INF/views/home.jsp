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
<link rel="stylesheet" href="css/daterangepicker.css" /> 

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript" src="js/daterangepicker.js"></script>
	
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
	 
	 <!-- 스와이퍼 이미지   -->
	  <!-- Swiper -->
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

	<script>
	//로그인 modal
	var modalLogin = $("#modalLogin");
	
	$("#login-btn").on("click", function() {
	   modalLogin.css("display", "block");
	});
	
	
	// 회원가입 modal
	var modalUseradd = $("#modalUseradd");
	
	$("#useradd-btn").on("click", function() {
	   modalUseradd.css("display", "block");
	});
	
	
	// 이메일 인증 modal
	var modalEmailCheck = $("#modalEmailCheck");
	
	
	/////////////////// 이메일 유효성 검사
	$(document).ready(function(){
		$('#inputEmail').on('keyup',function(){
			var email = $("#inputEmail").val();
			var emailCheck = new RegExp
			(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
			

			if(email != 0 ){
				if(emailCheck.test(email)){
					$('#idCheck').css({
						"color": "blue"
					});
					$('#idCheck').html("통과");
					
				}else {
					$('#idCheck').css({
						"color": "red"
					});
					$('#idCheck').html("안돼");
				}
			}else{
				$('#idCheck').empty();
			}
		});
	});
	
	
	/////////////////////////// 비밀번호 유효성
	$(document).ready(function(){
		$('#inputPassword').on('keyup', function() {
			var password = $('#inputPassword').val();
			var passwordCheck = RegExp(/^[A-Za-z0-9~!@#$%^&*()_+|<>?:{}]{8,16}$/);
			
			if(password != 0){
				if(passwordCheck.test(password)){
					
					$('#passwordCheck').css({
						"color": "rgb(0,0,255)"
					});
					$('#passwordCheck').html('ㅇㅋㅇㅋ');
					
				}else {
					
					$('#passwordCheck').css({
						"color": "rgb(255,0,0)"
					});
					$('#passwordCheck').html('안됌');
					
				}
			} else {
				
				$('#passwordCheck').empty();
				
			}
		});
	});

	/////////////////////////// 비밀번호 확인 유효성
	$(document).ready(function(){
		$('#inputPasswordCheck').blur(function(){
			var password = $('#inputPassword').val(); /// 비빌번호
			var passwordReCheck = $('#inputPasswordCheck').val(); // 비밀번호 확인
			
			if(passwordReCheck != 0){ /// 빈값이 아니라면
				if(password == passwordReCheck){
					$('#passwordReCheck').css({
						"color": "rgb(0,0,255)"
					});
					$('#passwordReCheck').html('ㅇㅋㅇㅋ');
				}else {
					$('#passwordReCheck').css({
						"color": "rgb(255,0,0)"
					});
					$('#passwordReCheck').html('안됌');
				}
			}else {
				$('#passwordReCheck').empty();
			}
		});
	});
	
	
	
	/////////////////////////// 이름
	$(function(){
		$('#inputFirstName').on('keyup',function(){
			var firstName = $('#inputFirstName').val();
			var firstNameCheck =  RegExp(/^[가-힣A-Za-z]+$/); // 한글, 영문 대 소문자만 사용
			
			if(firstName != 0 ){
				if(firstNameCheck.test(firstName)){
					$('#firstNameCheck').css({
						"color":"rgb(0,0,255)"
					});
					$('#firstNameCheck').html('ㅇㅋ');
				}else{
					$('#firstNameCheck').css({
						"color":"rgb(255,0,0)"
					});
					$('#firstNameCheck').html('안됌');
				}
			}else{
				$('#firstNameCheck').empty();
			}
		});
	});
	
	
	/////////////////////////// 성
	
	$(function(){
		$('#inputLastName').on('keyup',function(){
			var firstName = $('#inputLastName').val();
			var firstNameCheck =  RegExp(/^[가-힣A-Za-z]+$/); // 한글, 영문 대 소문자만 사용
			
			if(firstName != 0 ){
				if(firstNameCheck.test(firstName)){
					$('#lastNameCheck').css({
						"color":"rgb(0,0,255)"
					});
					$('#lastNameCheck').html('ㅇㅋ');
				}else{
					$('#lastNameCheck').css({
						"color":"rgb(255,0,0)"
					});
					$('#lastNameCheck').html('안됌');
				}
			}else{
				$('#lastNameCheck').empty();
			}
		});
	});
	
	
	
	/////////////////////////// 생년월일
	
	$(document).ready(function(){
		$('#inputDate').change(function(){ //// 변경할 때마다 유효성 검사 
			var inputDate = $('#inputDate').val();
			var inputDateCheck = RegExp(/^\d{4}-?\d{2}-?\d{2}$/);
			var by = parseInt(inputDate.substring(0,4));
			
			
			if(inputDate != 0){ ///// inputDate가 0 이 아니라면,
			
				
				if(inputDateCheck.test(inputDate)){ //// 정규식에 맞춰서 잘 되어 있다면
					
					if(by > 2001 || by < 1900){ // 미성년자는 안됌
						$('#dateCheck').css({
							"color":"rgb(255,0,0)"
						});
						$('#dateCheck').html("안돼");
					}else{ /// 그렇지 않다면 
						
						$('#dateCheck').css({
							"color":"rgb(0,0,255)"
						});
						$('#dateCheck').html("확인");
					}
					
				}else { //// 정규식대로 되어있지 않다면
					$('#dateCheck').css({
						"color":"rgb(255,0,0)"
					});
					$('#dateCheck').html("안돼");
				}
				
			}else{//// inputDate가 0이라면
				$('#dateCheck').empty(); /// 경고문을 비움. ( 자리는 남아 있음.)
			}
		});
	});
		
	
	/////////////////////////// 전화번호
	$(document).ready(function(){
		$('#inputTel').blur(function(){
			var inputTel = $('#inputTel').val();
			var inputTelCheck = RegExp(/^01[016789]-?([0-9][0-9]{2,3})-?([0-9]{4})$/);
			
			if(inputTel != 0 ){ /////// 전화번호가 비어있지 않다면.
				if(inputTelCheck.test(inputTel)){
					$('#telCheck').css({
						"color":"rgb(0,0,255)"
					});
					$('#telCheck').html("확인");
				}else {
					$('#telCheck').html("안돼");
					$('#telCheck').css({
						"color":"rgb(255,0,0)"
					});
					
					
					
				}
			}else { // 전화번호가 비어있다면.
				$('#telCheck').empty();
			}
			
		
			/////// 정규 표현식을 통과했다면 -과 공백을 replace
			var inputTelCheckValue = inputTel.replace(/\-/g, '');
			$('#inputTel').val(inputTelCheckValue);
		});
	});
	
	
	
	/// [다음] 클릭시 이벤트 // 유효성 검사를 하고 이상이 없다면 이메일 인증 modal로 넘어가기
	$("#btnSendEmail").on("click", function() {
		
	/* 	
	데이터 확인	
		//// 확인용
		alert($('#inputEmail').val()+""+$('#inputPassword').val()
				+$('#inputFirstName').val()+""+$('#inputLastName').val()+
				""+$('#inputDate').val()+""+$("#inputTel").val()
				); 
	*/
		
		/// 유효성 검사 조건문 - 변경해야함
		if($(".form-input-check").css("color")==="rgb(0,0,255)"){
			
	  		var params = $('form[name="newMember"]').serialize();
	
		   $.ajax({
		      type : "POST",
		      url : "ajax/emailAuthentication", // 요청보낼주소 
		      data : params,
		//      async : "false",
		//      dataType: 'json', // json으로 받으려면 안됨
		      success : function(data) {
		    	  if(!data){ /// 인증번호 전송에 실패했을 때 
		    		  alert("인증번호 전송에 실패했습니다..");
		    	  } else{ // 인증번호 전송에 성공했을 때 
		    		  alert(data); // 인증번호 확인
		    		  $("#authenticationCode").val(data); /// 인증번호를 넣어야함
		    		 
		    		  /// 통신을 한 이후에 이메일 인증 modal을 띄움.
		    		  modalUseradd.css("display", "none");
		    		   modalEmailCheck.css("display", "block");
		    		   $('#toEmail').text($('input[name="email"]').val()+"으로 인증번호가 전송되었습니다.");
		    	  }	
		      },
		      error: function() {
		          alert("통신 실패..");
		      }
		   }); // ajax-end
	   
		}else{ //////// 유효성 검사가 안됐을 때
			
			/////// 수정중..... 
			var result =true;
			
			alert($('#idCheck').val());
			alert("빈칸없이 작성해주세요");
			
			
			if($("#idCheck").val()== "통과"){
				result = true;
			}else{
				result = false;
			}
			
			alert(result);
		}

	   
	});
	   
	
	
	// 닫기 버튼
	var close = [ "login-close", "useradd-close", "email-check-close" ];
	
	for (var i = 0; i < close.length; i++) {
	   document.getElementById(close[i]).onclick = function() {
	
		   // 로그인 닫기 시에 input 태그 비우기
	      if (modalLogin.css("display") === "block") {
	    	  $('.user-login-input-value').val('');
	    	  $('.loginCheck').empty();
	    	  modalLogin.css("display", "none");
	
	      } else if (modalUseradd.css("display")==="block") {
	         modalUseradd.css("display", "none");
	         $("#idCheck").empty();
	         
	      } else if (modalEmailCheck.css("display")=="block") {
	         modalEmailCheck.css("display", "none");
	      }
	   }
	}
	
	
	//이메일 인증에서 뒤로가기
	
	var back = $("#emailCheckBack");
	
	var inputReset = $(".input-value");
	
	
	
	back.on("click", function() {
	   inputReset.val("");
	   
	   modalEmailCheck.css("display", "none");
	   modalUseradd.css("display","block");
	});
	
	
	//// 재요청 
	
	$("#rerequest").on("click", function() {
	    /// 재요청시 
	    $.ajax({
	       type: "POST",
	       url: "ajax/rerequest",
	       success:function(data){
	    	   if(!data){
	    		   alert("인증번호 재전송에 실패했습니다..");
	    	   } else{
	    		   alert(data); // 인증번호 확인
	    		   $("#authenticationCode").val(data); // 인증번호 값
	    	   }
	       },
	       error: function() {
	            alert("통신 실패..");
	       }
	   });
	    alert("인증번호를 재전송했습니다. 이전 번호는 사용 못함");
	});
	
	
	///// 완료 ( 회원가입)
	$("#completeSignUp").on("click", function() {
		var params = {
			authenticationCode : $('#authenticationCode').val(), // 인증번호(해시)
			inputCode : $('#inputCode').val().trim() // 입력값
		}
	//	alert($('#authenticationCode').val());
	//	alert($('#inputCode').val().trim());
	    $.ajax({
	       type: "POST",
	       url: "ajax/completeSignUp",
	       data: params,
	       dataType: 'json',
	       success:function(data){
	    	   if(data){ // 일치하면 DB에 저장하고 성공
	    		   alert("회원가입 완료.");
	    	   
	    	   	// 회원가입 완료 이후, 페이지 새로고침으로 처리하여 다시 로그인하도록 처리.
	    	   		location.reload(true); 
	    	   
	    	   ////////////////////////////
	    	   
	    	   } else{ // 일치하지 않으면 DB에 저장 안함
	    		   alert("인증번호가 일치하지 않습니다.")
	    	   }
	       },
	       error: function() {
	            alert("통신 실패..");
	       }
	   });
	});
	
	
	/// login 버튼
	$('#userLoginBtn').on('click', function(){
		var params = {
			userEmail : $('#userEmail').val(),
			userPassword : $('#userPassword').val()
		}
		
		$.ajax({
			type : "POST",
			url : "ajax/logIn",
			data : params,
			success : function(result){
				if(result == 0){
					// 이후 로직
					
					$('.loginCheck').empty();
					
					$('.loginCheck').css({
						"color":"red"
					});
					
					$('.loginCheck').append(
						'아이디가 존재하지 않습니다.'		
					);
					
					
					
				} else if(result == 1){
					alert("비밀번호 불일치");
					// 이후 로직
					$('.loginCheck').empty();
					
					$('.loginCheck').css({
						"color":"red"
					});
					
					$('.loginCheck').append(
						'비밀번호가 일치하지 않습니다.'		
					);
										
					
				} else if(result == 2){
					alert("로그인 성공");
					location.reload(true); // 페이지 새로고침
					// 이후 로직
					
					//// 로그인 버튼을 remove, 회원정보와 호스트 등록을 가져옴.
					/// div 내부를 지우고 
					$(".useradd-login-form").empty();
					/// div 다시 채워넣기
					$(".useradd-login-form").append(
						"${user.firstName }"+" ${user.lastName }"+
						"<button id='btnLogOut'>로그아웃</button>"+
						"<a href='host/registration/roomType'>호스트 등록</a>"
					);
					
				}
			},
			error : function(){
				alert("통신 실패..");
			}
		});
	});
	
	//// 카카오톡으로 가입하기 버튼을 눌렀을 때 처리.
	
	
	//// 이메일로 가입하기 버튼을 눌렀을 때 회원가입 modal을 띄움
	$('#emailUserAdd').on('click', function() {
		
		
		// 로그인 modal을 none, 회원가입 modal은 block.
		///// 로그인 input 지우고 
		$('.user-login-input-value').val('');
		////////// 경고 div 비우고		
		$('.loginCheck').empty();
		modalLogin.css("display", "none");
		modalUseradd.css("display","block");
	})
	
	
	//// 로그아웃 버튼
	$('#btnLogOut').on('click', function(){
		$.ajax({
			type : "POST",
			url : "ajax/logOut",
			success : function(){
				alert("로그아웃 했다");
				location.reload(true); // 페이지 새로고침
			},	
			error : function(){
				alert("통신 실패..");
			}
		});
	});
	
	</script>

</body>
</html>