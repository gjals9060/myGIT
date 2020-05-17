<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<link rel="stylesheet" href="css/reset.css?ver0.1" />
	
</head>
<body>
	<%@include file="header.jsp" %> 
	
	<div id="wrap">
		<div class="user-info-update-container">
			<!-- 프로필 사진  -->
			<!-- ${user.profilePhotoPath } -->
			 <div class="profilePhotoTitle">프로필 사진</div>
      <div class="profilePhoto">
         <table>
            <tr>
               <td><div id="forMouseOut">
               		<div class="photo">
                     <!-- <img src="img/berry.jpg" alt=""
                        class="nowProfilePhoto select" /> -->
                  </div>
                  </div></td>
               <td><div class="profilePhotolist">
               <!-- 
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
                         -->
                  </div></td>
            </tr>
         </table>
      </div>
      <div class="photoUploadButton">
      <button class="photoUpload" onclick="$('#photoFile').trigger('click')">사진 등록</button>
      </div>
      <form id="fileUpload">
      	<input type="file" id="photoFile" name="photoFile" accept="image/*" style="display: none" />
      </form>
      <script type="text/javascript">
	      
	function apply(){ // DB값으로 화면 갱신하고 적용시켜줘야 됨
	// 프사의 선택자
	var profilePhoto = $('img[data-isProfile="Y"]');
	// DB의 정보 = 프사의 이미지 경로.
	var profilePath = profilePhoto.attr("src");
	// DB의 정보 = 프사의 ID
	var profileId = profilePhoto.attr("data-id");
		
	profilePhoto.attr("class", "inputProfilePhoto select");
	$(".photo").html('<img src="' + profilePath + '" alt="" class="nowProfilePhoto select" />');
	$("#userImg").attr("src", profilePath);
	
	$(".photoButton").detach(); // 버튼 갱신을 위해
		
	   var menu = '<span class="photoButton">'
	         + '<button onclick="' + 'deleteProfilePhoto(' + profileId + ');">'
	         + '<i class="fas fa-times fa-2x"></i></button></span>';
	
	   var list = document.getElementsByClassName("inputProfilePhoto");
	   
	   
	   $(".inputProfilePhoto").on({
	 //     'mouseover' : function() {
	  //       $(".photoButton").detach();
	  //    },
	      'click' : function() {
	    	  
	    	  changeProfilePhoto($(this).attr("data-id"));
	 //        $(".inputProfilePhoto").attr("class", "inputProfilePhoto"); // ??
	 //        var index = $(this).index();
	 //        $(".inputProfilePhoto").eq(index).attr("class", "inputProfilePhoto select");
	 //        $(".photo").html('<img src="' + $(".inputProfilePhoto").eq(index).attr("src") + '" alt="" class="nowProfilePhoto select" />');
	 //        $("#userImg").attr("src", $(".inputProfilePhoto").eq(index).attr("src"));
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
	   
	   $("#forMouseOut").on({
		 'mouseleave' : function(){
		 	$(".photoButton").detach();
		 }
	   })
	   
	}
	   
	   
	   
	//*************************************** 백엔드에서 ************************************************
	function unapply(){
		$(".photo").on({
		      'mouseover' : function() {
		         $(".photoButton").detach();
		      }, 
		      'click' : function() {
		    	 $(".photoButton").detach();
			  }
	   });
	}
	
	$(function(){
		showProfilePhoto();
	})
		// 프로필 사진 출력
	function showProfilePhoto(){
		$.ajax({
			
			type: "POST",
			url: 'ajax/getProfilePhotoList',
			async: false,
			success: function (photoList) {
				$('.profilePhotolist').empty(); // 일단 비우고
				
				if(!photoList.length){ // 출력할 사진이 없다면
					
						// 기본 이미지 출력				
					$(".photo").html('<img src="img/defaultProfile.png" alt="defaultProfile.png" class="nowProfilePhoto select" />');
						// 헤더 이미지에도 기본 이미지 적용
					$("#userImg").attr("src", "img/defaultProfile.png");
						
					unapply(); // 버튼 생성 해제(지우는 효과만 적용)
				
				} else{ // 있으면..
					
					var photoResult = '';
					$.each(photoList, function(i, photo){
						// 화면에 출력되는 사진
						photoResult +=
			        	'	<img src="' + photo.path + '" alt="' + photo.originalName + '"'
		        		+'	data-id="' + photo.id + '" data-isProfile="' + photo.isProfile + '" class="inputProfilePhoto" />	'
			        	;
	              	});
					
					// 내용을 넣고
					$('.profilePhotolist').append(photoResult);
					
					// 효과 적용
					apply();
					
				}
			},
			error: function (e) {
				alert("통신 실패");
			}
		});
	}
	 
		// 파일 업로드 이벤트
	$("#photoFile").on("change", function(){
		
		var formData = new FormData($('#fileUpload')[0]);
		addProfilePhoto(formData);
		
		$('#photoFile').val(""); // 초기화 - 취소를 누르면 작동하지 않는 효과를 줌 + 같은 이름의 파일 계속해서 업로드 가능
	});
		// 사진 추가(변경)
	function addProfilePhoto(formData){
	$.ajax({
			type: "POST",
			url: 'ajax/addProfilePhoto',
			enctype: 'multipart/form-data', // 필수 
			data: formData, // 필수 
			processData: false, // 필수 
			contentType: false, // 필수
			cache: false,
			async: false,
			success: function (result) {
				if(result){ // 성공
					
					showProfilePhoto(); // 사진 갱신
					
				} else{
					alert("사진 추가(변경) 실패..");
				}
			},
			error: function (e) {
				alert("통신 실패");
			}
		});
	}
		// 사진 삭제
	function deleteProfilePhoto(profileId){
		$.ajax({
			type: "POST",
			url: 'ajax/deleteProfilePhoto',
			data: 'photoId=' + profileId,
			async: false,
			success: function (result) {
				if(result){ // 성공
					
					showProfilePhoto(); // 사진 갱신
					
				} else{
					alert("사진 삭제 실패..");
				}
			},
			error: function (e) {
				alert("통신 실패");
			}
		});
		$(".photoButton").remove();
	}
		
		// 사진 선택 변경
	function changeProfilePhoto(profileId){
		$.ajax({
			type: "POST",
			url: 'ajax/changeProfilePhoto',
			data: 'photoId=' + profileId,
			async: false,
			success: function (result) {
				if(result){ // 성공
					
					showProfilePhoto(); // 사진 갱신
					
				} else{
					alert("사진 선택 변경 실패..");
				}
			},
			error: function (e) {
				alert("통신 실패");
			}
		});
	}
   
</script>
      
      <!-- profilePhoto end -->

			 <div class="profilePhotoTitle">회원 정보 수정</div>
			<!-- 계정 -->
			<div class="userUpdateContent">
			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">계정</div>
				<div class="user-info-update-value">${user.email }</div>
			</div>
			
			
			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">가입일</div>
				<div class="user-info-update-value">
					<fmt:parseDate var="date1" value="${user.registrationDate }" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${date1 }" pattern="yyyy.MM.dd"/>
				</div>
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
					<button class="user-info-update-value-cancel btnTheme"
						id="userInfoNameCancelBtn">취소</button>
					<button class="user-info-update-value-btn btnTheme"
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
					<button class="user-info-update-value-cancel btnTheme" 
						id="userInfoDateCancelBtn">취소</button>
					<button class="user-info-update-value-btn btnTheme"
						id="userInfoUpdateValueBirthDateBtn">수정하기</button>
				</div>
			</div>

			<!-- 전화번호 -->

			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">전화번호</div>
				<div class="user-info-update-value">
					<input class="user-info-update-value-input" id="userInfoUpdateValuePhone" type="text"
						value=${user.mobilePhone } disabled /> 
					<input type="hidden" name="mobileAuthentication" value="${user.mobileAuthentication }" />
					
					<span id="authenticationResult"></span>
					<button id="mobileAuthenticationResult" class="btnTheme"></button>
					
					<button class="user-info-update-value-cancel btnTheme" 
						id="userInfoPhoneCancelBtn">취소</button>
					<button class="user-info-update-value-btn btnTheme"
						id="userInfoUpdateValuePhoneBtn">수정하기</button>
					
				</div>
			</div>

			<!-- 비밀번호 변경 -->
			<div class="user-info-update-value-block">
				<div class="user-info-update-value-title">
					비밀번호 변경
				</div>
				<button id="modalBtn" class="btnTheme">수정하기</button>
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

				<button onclick="updateUserPassword()" class="btnTheme">변경</button>
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
	
			var firstName = firstNameInput.val();
			var lastName= lastNameInput.val();
		var params = {
			firstName : firstName,
			lastName : lastName
		};
		//	alert(JSON.stringify(params));
	 		 $.ajax({
				url : "ajax/updateUserName",
		//		data : "firstName:"+firstName
		//			+ "lastName:"+lastName,
				data : params,
				type: "POST",
				success: function(result){
					if(result){
						alert("회원정보 수정(이름, 성) 완료");
						
						// 성공 후 input
						firstNameInput.attr("disabled",true);
						lastNameInput.attr("disabled",true);
					}
					
					
				},
				error:function(result){
					alert("통신실패")
				}
			});  
			
			firstNameInput.attr("disabled",true);
			lastNameInput.attr("disabled",true);
			cancleName.css("display","none");
			
		
		} ////// if end
		
	}); 
	
	
	////////////////// 생년월일 /////////////////
	var birthDateInput = $("#userInfoUpdateValueBirthDate"); // input
	var birthDateBtn = $("#userInfoUpdateValueBirthDateBtn"); // 수정 
	var cancelDate = $("#userInfoDateCancelBtn");
	
	var birthDate = birthDateInput.val();
	birthDateBtn.on("click", function() {
		
		if(birthDateInput.is(":disabled")){
			birthDateInput.attr("disabled",false);
			cancelDate.css("display","inline");
		}else{
			alert(birthDate);
		/* 	$.ajax({
				url : "ajax/updateUserBirthDate",
				type: "POST",
			//	data : "birthDate:"+birthDate,
				data : "birthDate="+birthDate,
				success: function(result){
					if(result){
					alert('회원정보 수정(생년월일) 완료');
						
					}
				},
				error: function(){
					alert('실패');
				}
			}); */
			
			
			////// ajax 처리 후 
			birthDateInput.attr("disabled",true);
			cancelDate.css("display","none");
		}
	});
	
	
	/////////////전화번호 변경//////////
	var phoneInput = $('#userInfoUpdateValuePhone');
	var phoneBtn = $('#userInfoUpdateValuePhoneBtn');
	var cancelPhone =$('#userInfoPhoneCancelBtn');
	var mobilePhone = phoneInput.val();
	
	var mobileAuthenticationResult = $('#mobileAuthenticationResult');
	var authenticationResult = $('#authenticationResult');
	
	
	phoneBtn.on('click',function(){
		
		if(phoneInput.is(':disabled')){
			phoneInput.attr('disabled',false);
			cancelPhone.css("display","inline");
			
			mobileAuthenticationResult.css('display','none');
			authenticationResult.css('display','none');
			
		}else {
			
			$.ajax({
				url:"ajax/updateUserMobilePhone",
				type: "POST",
			//	data: "mobilePhone:"+mobilePhone,
				data: "mobilePhone="+mobilePhone,
				success:function(result){
					if(result){
						alert("회원정보 수정(휴대전화 번호) 완료");
						
					}
				},
				error:function(){
					alert("통신실패");
				}
				
			});
			
			phoneInput.attr('disabled',true);
			cancelPhone.css("display","none");
			mobileAuthenticationResult.css('display','inline');
			authenticationResult.css('display','inline');
		}
		
	});
	
	
	
	
	
	
	////////////// 모든 취소 버튼 ///////////////	
	var cancelBtn = $(".user-info-update-value-cancel");
	
	/// user의 정보를 저장 ( 이름, 성, 생년월일,전화번호)
	var firstName = '${user.firstName}';
	var lastName= '${user.lastName}';
	var birthDate = '${user.birthDate}';
	var phoneNumber = '${user.mobilePhone}';
	
	cancelBtn.on("click", function() {
		firstNameInput.val(firstName);
		lastNameInput.val(lastName);
		birthDateInput.val(birthDate);
		
		
		$('.user-info-update-value-input').attr("disabled",true);
		cancelBtn.css("display","none");
	});
	


// 임시 비밀번호로 로그인해서 왔으면 비밀번호 변경 modal 활성화
$('document').ready(function(){
	var t = $('#isTemporaryLogIn').val();
	if(t === 'true'){
		$("#userInfoUpdatePasswordModify").css("display","block");
	}
});



/// 비밀번호 변경하기 
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