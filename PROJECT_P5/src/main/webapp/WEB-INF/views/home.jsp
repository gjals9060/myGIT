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
<div id="modal-login" class="modal">

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

            <br> <input type="button" value="로그인" /> <br> <input
               type="button" value="카카오톡으로 로그인하기" /> <br> <br> <input
               type="button" value="이메일로 가입하기" />
      </div>
   </div>


   <!-- 회원가입 -->
   <form action="modalTest.jsp" name="useraddTest">
   <div id="modal-useradd" class="modal">

      <!-- 닫기버튼 -->
      <span id="useradd-close" class="close">&times;</span>

      <!-- 회원가입 1단계 ( 정보입력 )  -->
      <div class="modal-popup">

         <div class="formTitle">이메일</div>
         <div class="formInput">
            <input type="text" class="inputValue" id="inputEmail"/>
         </div>
         <!-- 유효성 검사 (이메일) -->
         <div class="formCheck"></div>
         <br>
         <div class="formTitle">비밀번호</div>
         <div class="formInput">
            <input type="password" class="inputValue" />
         </div>
         <!-- 유효성 검사 (비밀번호) -->
         <div class="formCheck"></div>
         <br>
         <div class="formTitle">비밀번호 확인</div>
         <div class="formInput">
            <input type="password" class="inputValue"/>
         </div>
         <div class="formCheck"></div>
         <br>
         <div class="formTitle">이름</div>
         <div class="formInput">
            <input type="text" class="inputValue"/>
         </div>
         <div class="formCheck"></div>
         <br>
         <div class="formTitle">성</div>
         <div class="formInput">
            <input type="text" class="inputValue"/>
         </div>
         <div class="formCheck"></div>
         <br>
         <div class="formTitle">생년월일</div>
         <div class="formInput" >
            <input type="date" class="inputValue"/>
         </div>
         <div class="formCheck"></div>
         <br>
         <div class="formTitle">전화번호</div>
         <div class="formInput">
            <input type="text" class="inputValue"/>
         </div>
         <div class="formCheck"></div>
         <br> <input type="button" value="다음" id="email-send-btn" />
         <!-- <input type="submit" value="다음" /> -->
         <!-- 이후에 바로 이메일 인증받는 페이지로 이동 -->

      </div>
   </div>
   </form>
   
   <!-- 회원가입 2단계 ( 이메일 인증 )  -->
   <div id="modal-email-check" class="modal">
      <span id="email-check-back" class="back" >&lt;</span>
      <span id="email-check-close" class="close">&times;</span>
      <div class="modal-popup">
         <h1>이메일 인증</h1>
         <br />
         <!-- 이메일 인증 input -->
         <input type="text" name="emailCheck" />
         <input type="button"name="emailCheckBtn" value="인증" /> 
         <input type="hidden" /> <br />
         <br />
         <input type="button" value="회원가입" onclick="useraddTest.submit()" />
      </div>

   </div>


<main>
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
</main>
</form>
</body>
<script>
   // 로그인 modal
   var modalLogin = document.getElementById("modal-login");
var wrap=document.getElementById("idWrap");
   document.getElementById("login-btn").onclick = function() {
      modalLogin.style.display = "block";
      wrap.style.display="none";
   };

   // 회원가입 modal
   var modalUseradd = document.getElementById("modal-useradd");

   document.getElementById("useradd-btn").onclick = function() {
      modalUseradd.style.display = "block";
      wrap.style.display="none";
   }

   // 이메일 인증 modal
   var modalEmailCheck = document.getElementById("modal-email-check");

   document.getElementById("email-send-btn").onclick = function() {

      // ajax처리 후 진행이 되야함.
      
      modalUseradd.style.display = "none";
      modalEmailCheck.style.display = "block";
   }

   // 닫기 버튼
   var close = [ "login-close", "useradd-close", "email-check-close" ];
   
   for (var i = 0; i < close.length; i++) {
      document.getElementById(close[i]).onclick = function() {
         
         if(modalLogin.style.display === "block"){
            modalLogin.style.display = "none";  
            wrap.style.display="block";
            modalLogin.style.transition = "0.3s";
            
         }else if (modalUseradd.style.display === "block"){
            modalUseradd.style.display = "none";
            wrap.style.display="block";
            
         }else if (modalEmailCheck.style.display==="block"){
            modalEmailCheck.style.display = "none";
            wrap.style.display="block";
         }
      }
   }
   
   //이메일 인증에서 뒤로가기
   
   var back=document.getElementById("email-check-back");
   
   var inputReset = document.getElementsByClassName("inputValue"); 
   
   // 이메일만 남기고 싶을때는 id로 처리 
   /* var inputReset = document.getElementById("inputEmail"); */
   
   back.onclick = function(){
      
      for(var i= 0; i < inputReset.length; i++){
         inputReset[i].value="";
      }
      
      modalEmailCheck.style.display = "none";
      modalUseradd.style.display = "block";
   }   
</script>
</html>