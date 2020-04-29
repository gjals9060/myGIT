<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<!-- <script type="text/javascript" src="js/header.js"></script> -->
<script type="text/javascript" src="js/daternagepicker.js"></script>
	
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="css/daterangepicker.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/header.css" />


<body>

<header>
		<div class="title-logo-img">
			<img src="img/p5_logo.png" id="titleLogoImg" /> <!-- 로고 이미지 들어갈 자리 -->
		</div>	
		
		
		<!-- 정보입력-->
		<div class="input-info">
			<form action="">
			<!--지역 입력  -->				
				<span class="input-text">지역</span><input type="text" name="address" id="" />
				<!--달력에 필요할 jquery plugin  -->
				
				<!--  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /> --> 
				<span class="input-text">날짜</span><input type="text" name="checkInDatecheckOutDate"  />
					
					
		<script type="text/javascript">
            var date=new Date();
            var maxDate=new Date();
            maxDate.setMonth(date.getMonth()+3);
               $(function() {
                 $('input[name="checkInDatecheckOutDate"]').daterangepicker({
                    "autoApply": true,
                
                      "minDate": date,
                      "maxDate":maxDate
                  }, function(start, end, label) {
                    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
                    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
                    
                  });
               });
            </script>
					
					
				<!--인원  -->
				<span class="input-text">인원</span> 
				<input type='text' name='personnel' class="personnel_input" value="0" >
				<button id="increaseQuantity">▲</button>
				<button id="decreaseQuantity">▼</button>
					        <!--인원 카운트 다운 0미만은 줄일수 없게함  -->
				
				
					<!-- <i class="fa fa-search" aria-hidden="true"></i> -->
				 	<input type="submit" id="searchBtn" value="검색" />
			 </form>
		 </div>
			
	

		<div class="useradd-login-form">
			<!--클릭시 로그인  modal pop-up -->
			<button id="login-btn" class="btn">로그인</button>
					 
			<!--클릭시 회원가입 modal pop-up -->
			<button id="useradd-btn" class="btn">회원가입</button>
		</div>
		
		
		
		
		
	<!-- <div style="margin: 10px; text-align: center;grid-column-start: 1;grid-column-end: 4;">
	
		<a href="./reservation1">리스트</a> 
		<a href="./userInfoUpdate">회원정보수정</a>
		<a href="./userinfoReservationList">예약 리스트</a>
		<a href="host/registration/roomType">숙소등록</a>
		<a href="./hostReservationUpdate">숙소 수정</a>
	
	</div> -->
	</header>
	
		<div id="modalLogin" class="modal">
	
	      	<!-- 닫기버튼 -->
	      	<span id="login-close" class="close">&times;</span>
	
	      	<div class="modal-popup">
	         	<h1>로그인</h1>
	         	<hr>
	         	<br>
	
	         	<div class="loginTitle">이메일</div>
	         	<div class="loginInput">
	            	<input type="text" class="user-login-input-value" id="userEmail" />
	         	</div>
	
	         	<div class="loginTitle">비밀번호</div>
	         	<div class="loginInput">
	            	<input type="password" class="user-login-input-value" id="userPassword" />
	         	</div>
	         	<br />
	         	<div class="loginCheck"></div>
	
		        <br> 
		        <input type="button" value="로그인" id="userLoginBtn"/> 
		        <br> 
		        <input type="button" value="카카오톡으로 로그인하기" /> 
		        <br> 
		        <br> 
		        <input type="button" id="emailUserAdd" value="이메일로 가입하기" />
	      </div>
	   </div>
	
	
	   <!-- 회원가입 -->
	   <form name="newMember">
	      <div id="modalUseradd" class="modal">
	
	         <!-- 닫기버튼 -->
	         <span id="useradd-close" class="close">&times;</span>
	
	         <!-- 회원가입 1단계 ( 정보입력 )  -->
	         <div class="modal-popup">
	
	            <div class="formTitle">이메일</div>
	            <div class="formInput">
	               <input type="text" class="input-value" id="inputEmail" name="email" />
	            </div>
	            <div class="form-input-check" id="idCheck"></div>
	            <br>
	            
	            <div class="formTitle">비밀번호</div>
	            <div class="formInput">
	               <input type="password" class="input-value" id="inputPassword" name="password" />
	            </div>
	            <div class="form-input-check" id="passwordCheck"></div>
	            <br>
	            
	            <div class="formTitle">비밀번호 확인</div>
	            <div class="formInput">
	               <input type="password" class="input-value" id="inputPasswordCheck" name="userPasswordCheck" />
	            </div>
	            <div class="form-input-check" id="passwordReCheck" ></div>
	            <br>
	            
	            <div class="formTitle">이름</div>
	            <div class="formInput">
	               <input type="text" class="input-value" id="inputFirstName" name="firstName" />
	            </div>
	            <div class="form-input-check" id="firstNameCheck"></div>
	            <br>
	            
	            <div class="formTitle">성</div>
	            <div class="formInput">
	               <input type="text" class="input-value" id="inputLastName" name="lastName" />
	            </div>
	            <div class="form-input-check" id="lastNameCheck"></div>
	            <br>
	            
	            <div class="formTitle">생년월일</div>
	            <div class="formInput">
	               <input type="date" class="input-value" id="inputDate" name="birthDate" />
	            </div>
	            <div class="form-input-check" id="dateCheck"></div>
	            <br>
	            
	            <div class="formTitle">전화번호</div>
	            <div class="formInput">
	               <input type="text" class="input-value" id="inputTel" name="mobilePhone" />
	            </div>
	            <div class="form-input-check" id="telCheck"></div>
	            <br>
	            
	            <input type="button" value="다음" id="btnSendEmail" />
	            <!-- <input type="submit" value="다음" /> -->
	            <!-- 이후에 바로 이메일 인증받는 페이지로 이동 -->
	         </div>
	      </div>
	   </form>
	
	   <!-- 회원가입 2단계 ( 이메일 인증 )  -->
	   <div id="modalEmailCheck" class="modal">
	      <span id="emailCheckBack" class="back">&lt;</span> 
	      <span id="email-check-close" class="close">&times;</span>
	      <div class="modal-popup">
	         <h1>이메일 인증</h1>
	         <br />
	         <!-- 이메일 인증 input -->
	         <div id="toEmail"></div>
	         <input type="text" id="inputCode" />
	         <input type="button" value="재요청" id="rerequest" />
	         <!-- 이메일 인증번호 input --> 
	         <input type="hidden" id="authenticationCode" /> 
	         <br />
	         <br />
	         <input type="button" value="완료" id="completeSignUp" />
	      </div>
	   </div>

</body>
<script>


//////인원수 
$(function(){
	$('#decreaseQuantity').click(function(e){
	   	e.preventDefault();
	   	var stat = $('.personnel_input').val();
	   	var num = parseInt(stat,10);
	   	num--;
	  
	  	if(num<0){
		   alert('더이상 줄일수 없습니다.');
		   num =1;
	   	}
	   
		$('.personnel_input').val(num);
		
	}); /* click이벤트  */

	$('#increaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $('.personnel_input').val();
		var num = parseInt(stat,10);
		num++;

	   $('.personnel_input').val(num);
	});
});


/// header scroll event 
$(window).scroll(function () {
	var height = $(document).scrollTop();
	$('#scrollId').val(height);
	
	
	if(height >80){
		$('header').css({
			"position":"fixed",
			"box-shadow":"1px 1px 10px 0px #bbb",
			"opacity": "0.97"
		});
		
		$('.title-logo-img ').css("height","80px");
	}else{
		$("header").css({
			"position": "static",
			"box-shadow" : "0px 0px"
		});
		$('.title-logo-img ').css("height","100px");
		
	}
	
});
	


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

</html>