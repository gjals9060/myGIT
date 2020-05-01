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
			<%
			if(session.getAttribute("user") == null){
			%>
				<!--클릭시 로그인  modal pop-up -->
				<button id="login-btn" class="btn">로그인</button>
				<!--클릭시 회원가입 modal pop-up -->
				<button id="useradd-btn" class="btn">회원가입</button>
			<%
			} else{
			%>
				<!-- 이름만 출력 -->
				${user.firstName }
				<button id='btnLogOut'>로그아웃</button>
				<a href='host/registration/roomType'>호스트 등록</a>
			<%
			}
			%>
		</div>
		
		
		
		
		
	<div style="margin: 10px; text-align: center;grid-column-start: 1;grid-column-end: 4;">
		
		<!-- 헤더에 있어서 절대경로로 -->
		<a href="/p5/reservationList">리스트</a> 
		<a href="/p5/userInfoUpdate">회원정보수정</a>
		<a href="/p5/userInfoReservationList">예약 리스트</a>
		<a href="/p5/hostReservationUpdate">숙소 수정</a>
	
	</div>
	</header>
	
		<div id="modalLogin" class="modal">
	
	      	<!-- 닫기버튼 -->
	      	<span id="login-close" class="close">&times;</span>
	
	      	<div class="modal-popup">
	         	<h1>로그인</h1>
	         	<hr>
	         	<br>
				<form action="" onsubmit="return userLogin()">
	         	<div class="loginTitle">이메일</div>
	         	<div class="loginInput">
	            	<input type="text" class="user-login-input-value" id="userEmail" name="userEmail" />
	         	</div>
	
	         	<div class="loginTitle">비밀번호</div>
	         	<div class="loginInput">
	            	<input type="password" class="user-login-input-value" id="userPassword" name="userPassword" />
	         	</div>
	         	<br />
	         	<div class="loginCheck"></div>
	
		        <br> 
		        <input type="submit" value="로그인" />
		        </form> 
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
	               <input type="password" class="input-value" id="inputPasswordCheck" name="passwordCheck" />
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
	
	
	if(height >80){ // 스크롤의 위치가 80보다  클경우 
		$('header').css({
			"position":"fixed",
			"box-shadow":"1px 1px 10px 0px #bbb",
			"opacity": "0.97"
		});
		
		$('.title-logo-img ').css("height","80px");
	}else{ /// 80보다 낮은 위치라면 
		$("header").css({
			"position": "static",
			"box-shadow" : "0px 0px"
		});
		$('.title-logo-img ').css("height","100px");
		
	}
	
});











//==========================================================================
//======================= 회원가입, 로그인, 로그아웃 =============================
//==========================================================================

	
	//modal OFF
function modalOff(){
	$('#modalLogin').css("display", "none");
	$('#modalUseradd').css("display", "none");
	$('#modalEmailCheck').css("display", "none");
}
	// 로그인 modal ON	
function logInModalOn(){
	modalOff();
	$('.user-login-input-value').val("");
	$('.loginCheck').empty();
	$('#modalLogin').css("display", "block");
	$('#userEmail').focus();
}
	// 회원가입 modal ON
function signUpModalOn(){
	modalOff();
	$('.input-value').val("");
	$('#modalUseradd').css("display", "block");
	$('#inputEmail').focus();
}
	// 이메일인증 modal ON
function emailAuthenticationModalOn(){
	modalOff();
	$('#toEmail').text($('input[name="email"]').val()+"으로 인증번호가 전송되었습니다.");
	$('#inputCode').val("");
	$('#modalEmailCheck').css("display", "block");
	$('#inputCode').focus();
}

	
	

	// modal 닫기
$('.close').on('click', modalOff);
	// '로그인' 클릭
$('#login-btn').on('click', logInModalOn);
	// '이메일로 가입하기' 클릭
$('#emailUserAdd').on('click', signUpModalOn);
	// '회원가입' 클릭
$('#useradd-btn').on('click', signUpModalOn);
	// 회원가입 modal에서 '다음' 클릭
$('#btnSendEmail').on('click', function(){
	emailAuthenticationModalOn(); // 화면 전환
	
	var params = $('form[name="newMember"]').serialize();
	
    $.ajax({
      type : "POST",
      url : "ajax/emailAuthentication",
      data : params,
      success : function(data) {
    	  if(!data){ /// 인증번호 전송에 실패했을 때 
    		  alert("인증메일 발송에 실패했습니다.");
    	  }else{ // 인증번호 전송에 성공했을 때 
    		  $("#authenticationCode").val(data); /// 인증번호 적용
    	  }
      },
      error: function() {
          alert("통신 실패..");
      }
   }); // ajax-end
});
	
	
	
	// 이메일 인증에서 뒤로가기
$('#emailCheckBack').on('click', function(){
	modalOff();
		// 비밀번호 관련 input만 초기화
	$('#inputPassword').val("");
	$('#inputPasswordCheck').val("");
	$('#modalUseradd').css("display","block");
	$('#inputPassword').focus();
});


	
	// 인증메일 재요청
$("#rerequest").on("click", function(){
	$("#authenticationCode").val(""); // 인증번호 값을 초기화
	alert("인증번호를 재전송했습니다. 이전 번호는 사용 못함");
	
	$.ajax({
	    type: "POST",
	    url: "ajax/rerequest",
	    success:function(data){
	 	   if(!data){
	 		   alert("인증메일 재발송에 실패했습니다.");
	 	   } else{
	 		   $("#authenticationCode").val(data); // 새로운 인증번호 값 적용
	 	   }
	    },
	    error: function() {
	         alert("통신 실패..");
	    }
	});
});


	// '(회원가입)완료' 클릭
$("#completeSignUp").on("click", function(){
	var params = {
		authenticationCode : $('#authenticationCode').val(), // 인증번호(해시)
		inputCode : $('#inputCode').val().trim() // 입력값
	};
	
	$.ajax({
	   type: "POST",
	   url: "ajax/completeSignUp",
	   data: params,
	   success:function(result){
			 if(result == 0){ // 인증번호 불일치
					alert("인증번호가 일치하지 않습니다.");
			} else if(result == 1){ // 인증번호 일치 , DB에 저장 성공
					alert("회원가입을 완료했습니다.");
					logInModalOn(); // 로그인 modal 전환
			} else if(result == 2){ // 인증번호 일치, DB에 저장 실패
					alert("회원가입을 정상적으로 완료하지 못했습니다.");
			}
	   },
	   error: function() {
	        alert("통신 실패..");
	   }
	});
});


	// 로그인 시도
function userLogin() {
	var params = {
		userEmail : $('#userEmail').val(),
		userPassword : $('#userPassword').val()
	};
	
	 $.ajax({
		type : "POST",
		url : "ajax/logIn",
		data : params,
		async : false,
		success : function(result){
			if(result == 0){ // 존재하지 않는 ID
				
				$('.loginCheck').empty();
				
				$('.loginCheck').css({
					"color":"red"
				});
				
				$('.loginCheck').append(
					'아이디가 존재하지 않습니다.'
				);
				
				
				
			} else if(result == 1){ // 비밀번호 불일치
				
				$('.loginCheck').empty();
				
				$('.loginCheck').css({
					"color":"red"
				});
				
				$('.loginCheck').append(
					'비밀번호가 일치하지 않습니다.'		
				);
									
				
			} else if(result == 2){ // 로그인 성공
				alert("로그인 성공");
				location.reload();
				
			 	/* //// 로그인 버튼을 remove, 회원정보와 호스트 등록을 가져옴.
				/// div 내부를 지우고 
				$(".useradd-login-form").empty();
				/// div 에 로그아웃 append
				$(".useradd-login-form").append(
					"${user.firstName }" +
					"<button id='btnLogOut'>로그아웃</button>" +
					"<a href='host/registration/roomType'>호스트 등록</a>"
				);
				// 로그인 modal 닫기
				modalLogin.css("display", "none"); */
			}
		},
		error : function(){
			alert("통신 실패..");
		}
	});
	 
	return false; //submit은 동작하지 않게
}

//// 카카오톡으로 가입하기 버튼을 눌렀을 때 처리.





	// '로그아웃' 클릭
$('#btnLogOut').on('click', function(){
	$.ajax({
		type : "POST",
		url : "ajax/logOut",
		success : function(){
			alert("로그아웃 했다");
			location.reload(); // 페이지 새로 고침
			
/* 			// 헤더에 로그아웃 결과 반영
			$(".useradd-login-form").empty();
			$(".useradd-login-form").append(
				<!--클릭시 로그인  modal pop-up -->
				'<button id="login-btn" class="btn">로그인</button>' +
				<!--클릭시 회원가입 modal pop-up -->
				'<button id="useradd-btn" class="btn">회원가입</button>'
			); */
		},	
		error : function(){
			alert("통신 실패..");
		}
	});
});



/* for (var i = 0; i < close.length; i++) {
document.getElementById(close[i]).onclick = function() {

	   if (modalLogin.css("display") === "block") {
	 	  modalLogin.css("display", "none");
	
	   } else if (modalUseradd.css("display")==="block") {
	      modalUseradd.css("display", "none");
	      
	   } else if (modalEmailCheck.css("display")=="block") {
	      modalEmailCheck.css("display", "none");
	   }
	}
} */


/* 
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

*/


/* 
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

*/

/* /////////////////////////// 비밀번호 확인 유효성
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

*/

/* 
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

*/

/* 
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

*/

/* 
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

*/

/* 
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


*/
</script>

</html>