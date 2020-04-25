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
<div>${user.firstName } ${user.lastName } <button id="btnLogOut">로그아웃</button></div>
<button id="btnRegisterHost">호스트 등록</button>
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
            <input type="text" id="userEmail" />
         </div>
         <div class="loginCheck"></div>

         <div class="loginTitle">비밀번호</div>
         <div class="loginInput">
            <input type="password" id="userPassword" />
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
            <!-- 유효성 검사 (이메일) -->
            <div class="formCheck"></div>
            <br>
            <div class="formTitle">비밀번호</div>
            <div class="formInput">
               <input type="password" class="input-value" id="inputPassword" name="password" />
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
               <input type="text" class="input-value" id="inputLastName" name="firstName" />
            </div>
            <div class="formCheck"></div>
            <br>
            <div class="formTitle">성</div>
            <div class="formInput">
               <input type="text" class="input-value" id="inputFristName" name="lastName" />
            </div>
            <div class="formCheck"></div>
            <br>
            <div class="formTitle">생년월일</div>
            <div class="formInput">
               <input type="date" class="input-value" id="inputDate" name="birthDate" />
            </div>
            <div class="formCheck"></div>
            <br>
            <div class="formTitle">전화번호</div>
            <div class="formInput">
               <input type="text" class="input-value" id="inputTel" name="mobilePhone" />
            </div>
            <div class="formCheck"></div>

            <br> <input type="button" value="다음" id="btnSendEmail" />
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


/// [다음] 클릭시 이벤트 // 유효성 검사를 하고 이상이 없다면 이메일 인증 modal로 넘어가기
$("#btnSendEmail").on("click", function() {
   ///// 유효성 검사 
   var params = $('form[name="newMember"]').serialize();

   $.ajax({
      type : "POST",
      url : "ajax/emailAuthentication", // 요청보낼주소 
      data : params,
//      async : "false",
//      dataType: 'json', // json으로 받으려면 안됨
      success : function(data) {
    	  if(!data){
    		  alert("인증번호 전송에 실패했습니다..");
    	  } else{
    		  $("#authenticationCode").val(data); /// 인증번호를 넣어야함
              modalUseradd.css("display", "none");
              modalEmailCheck.css("display", "block");
              $('#toEmail').text($('input[name="email"]').val()+"으로 인증번호가 전송되었습니다.");  
    	  }	
      },
      error: function() {
          alert("통신 실패..");
      }
   }); // ajax-end
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

$("#rerequest").on("click", function() {
    /// 재요청시 
    $.ajax({
       type: "POST",
       url: "ajax/rerequest",
       success:function(data){
    	   if(!data){
    		   alert("인증번호 재전송에 실패했습니다..");
    	   } else{
    		   $("#authenticationCode").val(data); // 인증번호 값
          		alert("인증번호를 재전송했습니다. 이전 번호는 사용 못함");
    	   }
       },
       error: function() {
            alert("통신 실패..");
       }
   });
});


///// 완료
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
    	   
    	   	// 회원가입 완료 이후의 처리 로직..
    	   	
    	   
    	   	
    	   	
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
				alert("없는 아이디");
				// 이후 로직
				
				
				
			} else if(result == 1){
				alert("비밀번호 불일치");
				// 이후 로직
				
				
				
			} else if(result == 2){
				alert("로그인 성공");
				location.reload(true); // 페이지 새로고침
				// 이후 로직
				
				
			}
		},
		error : function(){
			alert("통신 실패..");
		}
	});
});

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





/*    
$("#userLoginBtn").on("click", function() {
   
}) */
 
</script>

</body>
</html>