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
<title>지도 정보 얻어오기</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/home.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>
<body>
<header>
P5
</header>
<nav>
<ul>
<li>  <!--클릭시 로그인  modal pop-up -->
   <button id="login-btn" class="btn">로그인</button></li>
  
<li> <!--클릭시 회원가입 modal pop-up -->
   <button id="useradd-btn" class="btn">회원가입</button></li>
</ul>
</nav>

	<div id="modalLogin" class="modal">

		<!-- 닫기버튼 -->
		<span id="login-close" class="close">&times;</span>

		<div class="modal-popup">
			<h1>로그인</h1>
			<h2>로그인</h2>
			<hr>
			<br>

			<div class="loginTitle">이메일</div>
			<div class="loginInput">
				<input type="text" />
			</div>
			<div class="loginCheck"></div>

			<div class="loginTitle">비밀번호</div>
			<div class="loginInput">
				<input type="password" />
			</div>
			<div class="loginCheck"></div>

			<br> 
			<input type="button" value="로그인" id="userLoginBtn"/> <br> 
			<input type="button" value="카카오톡으로 로그인하기" /> 
			<br> 
			<br> 
			<input type="button" value="이메일로 가입하기" />
		</div>
	</div>


	<!-- 회원가입 -->
	<form action="" name="useraddTest">
		<div id="modalUseradd" class="modal">

			<!-- 닫기버튼 -->
			<span id="useradd-close" class="close">&times;</span>

			<!-- 회원가입 1단계 ( 정보입력 )  -->
			<div class="modal-popup">

				<div class="formTitle">이메일</div>
				<div class="formInput">
					<input type="text" class="input-value" id="inputEmail"
						name="userEmail" />
				</div>
				<!-- 유효성 검사 (이메일) -->
				<div class="formCheck"></div>
				<br>
				<div class="formTitle">비밀번호</div>
				<div class="formInput">
					<input type="password" class="input-value" id="inputPassword" name="userPassword" />
				</div>
				<!-- 유효성 검사 (비밀번호) -->
				<div class="formCheck"></div>
				<br>
				<div class="formTitle">비밀번호 확인</div>
				<div class="formInput">
					<input type="password" class="input-value" id="inputPasswordCheck" name="userPasswordCheck" />
				</div>
				<div class="formCheck"></div>
				<br>
				<div class="formTitle">이름</div>
				<div class="formInput">
					<input type="text" class="input-value" id="inputLastName" name="userLastName" />
				</div>
				<div class="formCheck"></div>
				<br>
				<div class="formTitle">성</div>
				<div class="formInput">
					<input type="text" class="input-value" id="inputFristName" name="userFristName" />
				</div>
				<div class="formCheck"></div>
				<br>
				<div class="formTitle">생년월일</div>
				<div class="formInput">
					<input type="date" class="input-value" id="inputDate" name="userDate" />
				</div>
				<div class="formCheck"></div>
				<br>
				<div class="formTitle">전화번호</div>
				<div class="formInput">
					<input type="text" class="input-value" id="inputTel" name="userTel" />
				</div>
				<div class="formCheck"></div>
				<br> <input type="button" value="다음" id="emailSendBtn" />
				<!-- <input type="submit" value="다음" /> -->
				<!-- 이후에 바로 이메일 인증받는 페이지로 이동 -->

			</div>
		</div>
	</form>

	<!-- 회원가입 2단계 ( 이메일 인증 )  -->
	<div id="modalEmailCheck" class="modal">
		<span id="emailCheckBack" class="back">&lt;</span> <span
			id="email-check-close" class="close">&times;</span>
		<div class="modal-popup">
			<h1>이메일 인증</h1>
			<br />
			<!-- 이메일 인증 input -->
			<input type="text" name="emailCheck" /> 
			<input type="button" name="emailCheckBtn" value="재요청" id="emailCheckBtn" />
			<!-- 이메일 인증번호 input --> 
			 <input type="hidden" id="emailAuthenticationId" /> 
			<br />
			<br />
			 <input type="button" value="완료" onclick="useraddTest.submit()" />
		</div>

	</div>




<form action="">
<!--지역 입력  -->
<div class="wrap" id="idWrap">
<div class="reservation">

<span class="input-text">지역</span><input type="text" name="address" id="" />
<!--달력에 필요할 jquery plugin  -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" href="css/daterangepicker.css" /> 
<!--  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /> --> 
<span class="input-text">날짜</span><input type="text" name="checkInDatecheckOutDate" value="01/01/2018 - 01/15/2018" />

<script type="text/javascript">



$(function() {
  $('input[name="checkInDatecheckOutDate"]').daterangepicker({
	  "autoApply": true,
	  "startDate": "04/17/2020",
	    "endDate": "05/30/2020",
	    "minDate": "04/17/2020"
	}, function(start, end, label) {
	  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});
});
</script>
<!--인원  -->

 
<span class="input-text">인원</span> <input type='text' name='personnel' class="personnel_input" value="0" >
      
        <button id="increaseQuantity">▲</button>
        <button id="decreaseQuantity">▼</button>
        <!--인원 카운트 다운 0미만은 줄일수 없게함  -->

<script >
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
	});
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('.personnel_input').val();
	var num = parseInt(stat,10);
	num++;


	$('.personnel_input').val(num);
	});
	});
 </script>

 <i class="fa fa-search" aria-hidden="true"></i><input type="submit" value="검색" />

 </div>
 
 </div>
 <!--이미지  -->
 <article>

    <div class="home-img1">
            <img src="img/bedroom.jpg" alt="" />
         </div>
            <div class="home-img2">
            <div class="home-img3"><img src="img/bedroom.jpg" alt="" /></div>
            <div class="home-img4"><img src="img/bedroom.jpg" alt="" /></div>
            <div class="home-img5"><img src="img/bedroom.jpg" alt="" /></div>
            <div class="home-img6"><img src="img/bedroom.jpg" alt="" /></div>
            
            </div>
 
 </article>
 <section>
 <div class="popular">인기숙소</div>
 <div class="popular-img"><img src="img/bedroom.jpg" alt="" /></div>
 <div class="popular-description">
 종로구 전통적인 한옥
 <div class="popular-facilities">
 편의시설
 </div>
 <div class="star">
 <span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
<span class="fa fa-star"></span>
</div>
  </div>
 
 </section>

</form>
</body>
<script>
//로그인 modal
var modalLogin = $("#modalLogin");
$("#loginBtn").on("click", function() {
	modalLogin.css("display", "block");
});


// 회원가입 modal
var modalUseradd = $("#modalUseradd");

$("#useraddBtn").on("click", function() {
	modalUseradd.css("display", "block");
});


// 이메일 인증 modal
var modalEmailCheck = $("#modalEmailCheck");


/// [다음] 클릭시 이벤트 // 유효성 검사를 하고 이상이 없다면 이메일 인증 modal로 넘어가기
	$("#emailSendBtn").on("click", function() {

		// ajax처리 후 진행이 되야함.
		var httpRequest = new XMLHttpRequest();
		
		///// 유효성 검사 
		var userInputEmail = $('#inputEmail').val();
		
		$("#inputEmail").on.keyup(function() {
			alert("aa");			
		})
		
		
		// json으로 넘겨줄 변수
		var userValue = {
			email : userInputEmail,
			password : $("#inputPassword").val(),
			fristName : $("#inputFristName").val(),
			lastName : $("#inputLastName").val(),
			birthDate : $("#inputDate").val(),
			phoneNumber : $("#inputTel").val()
		}
		
		
	
		$.ajax({
			url : "", // 요청보낼주소 
			data : userValue,
			type : "POST",
//		 	async : "true",
			dataType: "json", 
			success : function(data) {
				if(true) { /// 유효성 결과 : true
					modalUseradd.css("display", "none");
					modalEmailCheck.css("display", "block");
					alert(userInputEmail+"으로 인증번호가 전송되었습니다.");
					$("emailAuthenticationId").val(); /// 인증번호를 넣어야함
				} else { //// 유효성 결과 : false
					
				
				}
					
			},
			error:
				alert("통신실패")
			});
	});
	


// 닫기 버튼
var close = [ "login-close", "useradd-close", "email-check-close" ];

for (var i = 0; i < close.length; i++) {
	document.getElementById(close[i]).onclick = function() {

		if (modalLogin.css("display") === "block") {
			modalLogin.css("display", "none");

		} else if (modalUseradd.css("display")==="block") {
			modalUseradd.css("display", "none");

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

//////// 실시간 유효성 검사, 인증시 form 이동, 레이아웃


//// 재요청 

$("#emailCheckBtn").on("click", function() {
	 /// 재요청시 
	 $.ajax({
		 url: "",
	 	data: "email:"+userInputEmail,
	 	type: "POST",
	 	dataType : "text",
	 	success:function(){
		 alert(userInputEmail+"으로 인증번호가 전송되었습니다.");
		 $("emailAuthenticationId").val(); // 인증번호 값 추가
	 	}
	})
})


/* 	
$("#userLoginBtn").on("click", function() {
	
}) */
 
</script>
</html>