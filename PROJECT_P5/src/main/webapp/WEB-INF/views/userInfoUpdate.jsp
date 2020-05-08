<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>

<link rel="stylesheet" href="css/userInfoUpdate.css?ver0.1" />

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	
	<!--  -->
	<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="css/reset.css" />
	
</head>
<body>
	<%@include file="header.jsp" %> 
	
	<div id="wrap">
		<div class="user-info-update-container">
			<div class="user-info-update-title">회원정보수정</div>

			<!-- 프로필 사진  -->
			<!-- ${user.profilePhotoPath } -->
			 <div class="profilePhotoTitle">프로필 사진</div>
      <div class="profilePhoto">
         <table>
            <tr>
               <td><div class="photo">
                     <img src="img/berry.jpg" alt=""
                        class="nowProfilePhoto select" />
                  </div></td>
               <td><div class="profilePhotolist">
                     <img src="img/berry.jpg" alt="" class="inputProfilePhoto select" /> <img
                        src="img/bedroom.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/flower.jpg" alt="" class="inputProfilePhoto" />
                     <img src="img/bread.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/away.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/hair.png" alt="" class="inputProfilePhoto" /> <img
                        src="img/berry.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/bedroom.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/flower.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/bread.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/away.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/hair.png" alt="" class="inputProfilePhoto" /> <img
                        src="img/berry.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/bedroom.jpg" alt="" class="inputProfilePhoto" /> <img
                        src="img/flower.jpg" alt="" class="inputProfilePhoto" />
                  </div></td>
            </tr>
         </table>
      </div>
      <button class="photoUpload">사진 등록</button>
      <script type="text/javascript">
   

   var menu = '<span class="photoButton">'
         + '<button onclick="' + 'alert();' + '">'
         + '<i class="fas fa-times fa-2x"></i></button></span>';

   var list = document.getElementsByClassName("inputProfilePhoto");
   
   $(".inputProfilePhoto").on({
      'mouseover' : function() {
         $(".photoButton").detach();
      },
      'click' : function() {
         $(".inputProfilePhoto").attr("class", "inputProfilePhoto");
         var index = $(this).index();
         $(".inputProfilePhoto").eq(index).attr("class", "inputProfilePhoto select");
         $(".photo").html('<img src="' + $(".inputProfilePhoto").eq(index).attr("src") + '" alt="" class="nowProfilePhoto select" />');
         $("#userImg").attr("src", $(".inputProfilePhoto").eq(index).attr("src"));
      }
   })
   
   $(".photo").on({
      'mouseover' : function() {
         $(".photoButton").detach();
         $(this).after(menu);
      
      }, 
      'click' : function() {
         $(".photoButton").detach();
         $(this).after(menu);
        
   }
   })
   
</script>
      
      <!-- profilePhoto end -->


			<!-- 계정 -->
			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">계정</div>
				<div class="user-info-update-value">${user.email }</div>
			</div>

			<!-- 실명 -->
			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">실명</div>
				<div class="user-info-update-value">
					<input class="user-info-update-value-input"
						id="userInfoUpdateValueFirstName" type="text"
						value=${user.firstName } disabled /> <input
						class="user-info-update-value-input"
						id="userInfoUpdateValueLastName" type="text"
						value=${user.lastName } disabled />
					<button class="user-info-update-value-cancel"
						id="userInfoNameCancelBtn">취소</button>
					<button class="user-info-update-value-btn"
						id="userInfoUpdateValueNameBtn">수정하기</button>
				</div>
			</div>

			<!-- 생년월일 -->
			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">생년월일</div>
				<div class="user-info-update-value">
					<input class="user-info-update-value-input"
						id="userInfoUpdateValueBirthDate" type="date"
						value=${user.birthDate } disabled />
					<button class="user-info-update-value-cancel" 
						id="userInfoDateCancelBtn">취소</button>
					<button class="user-info-update-value-btn"
						id="userInfoUpdateValueBirthDateBtn">수정하기</button>
				</div>
			</div>

			<!-- 전화번호 -->

			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">전화번호</div>
				<div class="user-info-update-value">
					<input class="user-info-update-value-input"
						id="userInfoUpdateValuePhone" type="text"
						value=${user.mobilePhone } disabled /> 
						<%-- <input type="hidden" name="mobileAuthentication" value="${user.mobileAuthentication }" /> --%>
					<span id="authenticationResult"></span>
					<button id="mobileAuthenticationResult"></button>
				</div>
			</div>

			<!-- 비밀번호 변경 -->
			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">
					비밀번호 변경
					<button id="modalBtn">수정하기</button>
				</div>
			</div>

		</div>

	</div>
	<!-- wrap end -->


	<!-- 비밀번호 변경 modal -->
	<div id="userInfoUpdatePasswordModify" class="user-info-modal">
		<span class="close">&times;</span>
		<div id="modalPopup">
			<div class="user-info-update-password-container">
				<div class="user-info-update-password-label">비밀번호 변경</div>
				<!-- 임시 로그인으로 진입 여부 확인 -->
   		 <%
   		 if(request.getParameter("t") != null){
   		 %>
         <input type="hidden" id="isTemporaryLogIn" value="true" />
         <%
   		 } else{
         %>
   		<input type="hidden" id="isTemporaryLogIn" />
   		<%
   		 }
   		%>	 
				<div class="user-info-update-password-block">
					<div class="user-info-update-password-title">현재 비밀번호</div>
					<div class="user-info-update-password-value">
						<input class="user-info-update-password-input" type="password" id="userInputPassword" />
					</div>
				</div>

				<div class="user-info-update-password-error"></div>

				<div class="user-info-update-password-block">
					<div class="user-info-update-password-title">변경 비밀번호</div>
					<div class="user-info-update-password-value">
						<input class="user-info-update-password-input" type="password" id="newPassword" />
					</div>
				</div>
				<div class="user-info-update-password-error"></div>

				<div class="user-info-update-password-block">
					<div class="user-info-update-password-title">비밀번호확인</div>
					<div class="user-info-update-password-value">
						<input class="user-info-update-password-input" type="password" />
					</div>
				</div>
				<div class="user-info-update-password-error"></div>

				<button onclick="updateUserPassword()">변경</button>
			</div>
		</div>
	</div>

	<!-- 전화번호 인증에 사용되는 modal -->
	<div id="blockingModal" class="user-info-modal">
		<div id="blockingModalCon">
			<img src="img/PopupLoader.gif" alt="" style="pointer-eventsm: none" />
			<p>팝업창을 확인해주세요!</p>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>

<script>
	////////////// 모든 취소 버튼 ///////////////	
	var cancelBtn = $(".user-info-update-value-cancel");
	
	cancelBtn.on("click", function() {
		$('.user-info-update-value-input').attr("disabled",true);
		cancelBtn.css("display","none");
	});
	
	
	/////////////////// 이름 수정하기 /////////////////////
	var cancleName=$('#userInfoNameCancelBtn');
	
	var firstNameInput = $("#userInfoUpdateValueFirstName");
	var lastNameInput = $("#userInfoUpdateValueLastName");

	$("#userInfoUpdateValueNameBtn").on('click',function(){
		if(firstNameInput.is(":disabled")){ //// firstName이 disabled라면 
			firstNameInput.attr("disabled",false);
			lastNameInput.attr("disabled",false);
			cancleName.css("display","inline");
		}else{
			/////// ajax로 값 처리
			
			/*
			/// 임시 ajax
			var firstName = firstNameInput.val();
			var lastName= lastNameInput.val();
			
			 $.ajax({
				url : "",
				data : "firstName:"+firstName
					+ "lastName:"+lastName,
				type: "POST",
				success: function(result){
					alert("성공");
					
					// 성공 후 input
					firstNameInput.attr("disabled",true);
					lastNameInput.attr("disabled",true);
				},
				error:function(result){
					alert("통신실패")
				}
			}); */
			
			firstNameInput.attr("disabled",true);
			lastNameInput.attr("disabled",true);
			cancleName.css("display","none");
			
		
		} ////// if end
		
	}); 
	/////이름 수정하기 끝 
	
	////////////////// 생년월일 /////////////////
	var birthDate = $("#userInfoUpdateValueBirthDate"); // input
	var birthDateBtn = $("#userInfoUpdateValueBirthDateBtn"); // 수정 
	var cancelDate = $("#userInfoDateCancelBtn");
	
	birthDateBtn.on("click", function() {
		
		if(birthDate.is(":disabled")){
			birthDate.attr("disabled",false);
			cancelDate.css("display","inline");
		}else{
			////// ajax 처리 후 
			birthDate.attr("disabled",true);
			cancelDate.css("display","none");
		}
	});
	


// 임시 비밀번호로 로그인해서 왔으면 비밀번호 변경 modal 활성화
$('document').ready(function(){
	var t = $('#isTemporaryLogIn').val();
	if(t === 'true'){
		$("#userInfoUpdatePasswordModify").css("display","block");
	}
});


function updateUserPassword(){
	alert($("#userInputPassword").val());
	var params = {
			userPassword : $('#userInputPassword').val(),
			newPassword : $('#newPassword').val()
	}
	
	$.ajax({
		type : "POST",
		url : "ajax/updateUserPassword",
		data : params,
		async : false,
		success : function(result){
			if(result == 0){
				
				alert("기존의 비밀번호가 일치하지 않습니다.");
				
			} else if(result == 1){
				
				alert("비밀번호 변경 완료.");
				location.replace("userInfoUpdate");
				
			} else{
				
				alert("비밀번호 변경 실패.");
				
			}
		},	
		error : function(){
			alert("통신 실패..");
		}
	});
}

	
	/////////////// 비밀번호 변경 모달 /////////////
		$('#modalBtn').on("click", function() {
			$("#userInfoUpdatePasswordModify").css("display","block");
		});
	
	
	/// 비밀번호 변경을 눌렀을 때
		$("#passwrodModifyBtn").on('click',function(){
			alert("ㅇㅇ");
		});
	
	////////////// 닫기 버튼 ///////////////
		$(".close").on("click",function(){
			$("#userInfoUpdatePasswordModify").css("display","none");
		});


   
   ///// 전화번호 인증을 한 사용자라면 인증완료를 보여주고 아니라면 인증하기 버튼을 보여준다.
   $(document).ready(function(){
      var authentication = $('input[name="mobileAuthentication"]').val();
      
      if(authentication == 'Y'){
         $('#authenticationResult').text("인증완료");
         $('#authenticationResult').css("color", "blue");
         $('#authenticationResult').css("font-weight", "bold");
         $('#mobileAuthenticationResult').remove();
      } else{
     	 $('#mobileAuthenticationResult').text("인증하기");
      }
   });
   
   ////////// 팝업창
	$('#mobileAuthenticationResult').on('click', function() {
		/* $('.modal').css("display","none") */
		
		var phoneURL = '/p5/phoneCertification';
		
	    var left = Math.ceil(( window.screen.width - 370 )/2);
	    var top = Math.ceil(( window.screen.height - 360 )/2)-100;


		var phoneOption =  "width=370, height=360, resizable=no, scrollbars=no, status=no, top="+top+", left="+left+";";
		

		var windowPop = window.open(phoneURL,"popwin",phoneOption);
		
		
		$('#blockingModal').css("display","block");
		
		$('#blockingModal').on("click",function(){
			windowPop.focus();
		});
		
		
		var intervalPop = window.setInterval(function() {
			try{
				// 창의 상태를 0.5초 마다 확인
				if(windowPop == null || windowPop.closed){
					window.clearInterval(intervalPop);
					window = null;
					$('#blockingModal').css('display',"none");					
				}
			}catch(e){}
		}, 500)
	});
   
   
   
   
</script>
</html>