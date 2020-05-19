<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>

<link rel="stylesheet" href="css/userInfoUpdate.css" />

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

			<div class="profilePhotoTitle">프로필 사진</div>
			<div class="profilePhoto">
				<table>
					<tr>
						<td><div id="forMouseOut">
								<div class="photo"></div>
							</div></td>
						<td>
							<div class="profilePhotolist"></div>
						</td>
					</tr>
				</table>
			</div>

			<div class="photoUploadButton">
				<button class="photoUpload"
					onclick="$('#photoFile').trigger('click')">사진 등록</button>
			</div>
			<form id="fileUpload">
				<input type="file" id="photoFile" name="photoFile" accept="image/*"
					style="display: none" />
			</form>
			<script type="text/javascript">
				function apply() { // DB값으로 화면 갱신하고 적용시켜줘야 됨
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
							+ '<button onclick="'
							+ 'deleteProfilePhoto('
							+ profileId
							+ ');">'
							+ '<i class="fas fa-times fa-2x"></i></button></span>';

					var list = document.getElementsByClassName("inputProfilePhoto");

					$(".inputProfilePhoto").on({'click' : function() {
						changeProfilePhoto($(this).attr("data-id"));
				
						}
					})

					$(".photo").on({'mouseover' : function() {
						$(".photoButton").detach();
						$(this).after(menu);

					},'click' : function() {
						$(".photoButton").detach();
						$(this).after(menu);

						}
					})

					$("#forMouseOut").on({'mouseleave' : function() {
						$(".photoButton").detach();
						}
					})

				}

				//*************************************** 백엔드에서 ************************************************
				function unapply() {
					$(".photo").on({
						'mouseover' : function() {
							$(".photoButton").detach();
						},
						'click' : function() {
							$(".photoButton").detach();
						}
					});
				}

				$(function() {
					showProfilePhoto();
				})
				// 프로필 사진 출력
				function showProfilePhoto() {
					$.ajax({
						type : "POST",
						url : 'ajax/getProfilePhotoList',
						async : false,
						success : function(photoList) {
							$('.profilePhotolist').empty(); // 일단 비우고

							if (!photoList.length) { // 출력할 사진이 없다면

								// 기본 이미지 출력				
								$(".photo").html(
									'<img src="img/defaultProfile.png" alt="defaultProfile.png" class="nowProfilePhoto select" />'
								);
									// 헤더 이미지에도 기본 이미지 적용
								$("#userImg").attr("src","img/defaultProfile.png");
								$(".profilePhotolist").html("호스트 이용을 위해서는 프로필 사진 등록이 필요합니다.");
								$(".profilePhotolist").css("text-align", "center");
									unapply(); // 버튼 생성 해제(지우는 효과만 적용)

							} else { // 있으면..
								$(".profilePhotolist").html("");
								$(".profilePhotolist").css("text-align", "left");
								var photoResult = '';
								$.each(photoList,function(i, photo) {
								// 화면에 출력되는 사진
									photoResult += '	<img src="' + photo.path + '" alt="' + photo.originalName + '"'
		        					+'	data-id="' + photo.id + '" data-isProfile="' + photo.isProfile + '" class="inputProfilePhoto" />';
								});

								// 내용을 넣고
								$('.profilePhotolist').append(photoResult);

								// 효과 적용
								apply();

							}
						},
						error : function(e) {
							alert("통신 실패");
						}
					});
				}

				// 파일 업로드 이벤트
				$("#photoFile").on("change", function() {

					var formData = new FormData($('#fileUpload')[0]);
					addProfilePhoto(formData);

					$('#photoFile').val(""); // 초기화 - 취소를 누르면 작동하지 않는 효과를 줌 + 같은 이름의 파일 계속해서 업로드 가능
				});
				// 사진 추가(변경)
				function addProfilePhoto(formData) {
					$.ajax({
						type : "POST",
						url : 'ajax/addProfilePhoto',
						enctype : 'multipart/form-data', // 필수 
						data : formData, // 필수 
						processData : false, // 필수 
						contentType : false, // 필수
						cache : false,
						async : false,
						success : function(result) {
							if (result) { // 성공

								showProfilePhoto(); // 사진 갱신

							} else {
								alert("사진 추가(변경) 실패..");
							}
						},
						error : function(e) {
							alert("통신 실패");
						}
					});
				}
				// 사진 삭제
				function deleteProfilePhoto(profileId) {
					$.ajax({
						type : "POST",
						url : 'ajax/deleteProfilePhoto',
						data : 'photoId=' + profileId,
						async : false,
						success : function(result) {
							if (result) { // 성공

								showProfilePhoto(); // 사진 갱신

							} else {
								alert("사진 삭제 실패..");
							}
						},
						error : function(e) {
							alert("통신 실패");
						}
					});
					$(".photoButton").remove();
				}

				// 사진 선택 변경
				function changeProfilePhoto(profileId) {
					$.ajax({
						type : "POST",
						url : 'ajax/changeProfilePhoto',
						data : 'photoId=' + profileId,
						async : false,
						success : function(result) {
							if (result) { // 성공

								showProfilePhoto(); // 사진 갱신

							} else {
								alert("사진 선택 변경 실패..");
							}
						},
						error : function(e) {
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
						<fmt:parseDate var="date1" value="${user.registrationDate }"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${date1 }" pattern="yyyy.MM.dd" />
					</div>
				</div>

				<!-- 실명 -->
				<div class="user-info-update-value-block">
					<div class="user-info-update-value-title">실명</div>
					<div class="user-info-update-value">
						<input class="user-info-update-value-input" id="userInfoUpdateValueFirstName" 
							type="text" value=${user.firstName } disabled /> 
						<input class="user-info-update-value-input" id="userInfoUpdateValueLastName" 
							type="text" value=${user.lastName } disabled />
						
						<button class="user-info-update-value-cancel btnTheme"
							id="userInfoNameCancelBtn">취소</button>
						<button class="user-info-update-value-btn btnTheme"
							id="userInfoUpdateValueNameBtn">수정하기</button>
						<!-- 유효성 검사  -->
						<div class="user-info-name-error" id="userFirstNameError"></div>
						<div class="user-info-name-error" id="userLastNameError"></div>
						
						<input type="hidden" id="userFirstNamePass" value="y" />
						<input type="hidden" id="userLastNamePass" value="y"/>
					
						
					</div>
				</div>

				<!-- 생년월일 -->
				<div class="user-info-update-value-block">
					<div class="user-info-update-value-title">생년월일</div>
					<div class="user-info-update-value">
						<input class="user-info-update-value-input" id="userInfoUpdateValueBirthDate" 
							type="date" value=${user.birthDate } disabled />
							
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
						<input class="user-info-update-value-input" id="userInfoUpdateValuePhone" 
							type="text" value=${user.mobilePhone } disabled /> 
							
						<input type="hidden" name="mobileAuthentication" value="${user.mobileAuthentication }" />

						<span id="authenticationResult" class="user-info-update-value-btn"></span>
						<button id="mobileAuthenticationResult"
							class="user-info-update-value-btn btnTheme"></button>
					</div>
				</div>

				<!-- 비밀번호 변경 -->
				<div class="user-info-update-value-block">
					<div class="user-info-update-value-title">비밀번호 변경</div>
					<button id="modalBtn" class="btnTheme">수정하기</button>
				</div>
			</div>
		</div>

	</div>
	<!-- wrap end -->


	<!-- 비밀번호 변경 modal -->
	<div id="userInfoUpdatePasswordModify" class="user-info-modal">
		<span class="close">&times;</span>
		<div id="modalPopup" class="modal-popup">
		<div class="modalWrap">
		<br><br><br>
			<div class="user-info-update-password-container">
				<div class="user-info-update-password-label">비밀번호 변경</div>
				<hr>
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
					<span class="user-info-update-password-title">현재 비밀번호</span>
					<span class="user-info-update-password-value">
						<input class="user-info-update-password-input" type="password" id="userInputPassword" />
					</span>
					<div class="user-info-update-password-error" id="passwordError_1"></div>
				</div>


				<div class="user-info-update-password-block">
					<span class="user-info-update-password-title">변경 비밀번호</span>
					<span class="user-info-update-password-value">
						<input class="user-info-update-password-input" type="password" id="newPassword" />
					</span>
					<div class="user-info-update-password-error" id="passwordError_2"></div>
				</div>
				<!-- <div class="user-info-update-password-error"></div> -->

				<div class="user-info-update-password-block">
					<span class="user-info-update-password-title">비밀번호확인</span>
					<span class="user-info-update-password-value">
						<input class="user-info-update-password-input" type="password" id="newPasswordCheck" />
					</span>
					<div class="user-info-update-password-error" id="passwordError_3"></div>
				</div>
				
				
				<input type="hidden" id="userPasswordPass" value="n"/>
				<input type="hidden" id="userPasswordCheckPass" value="n"/>
				
				<button onclick="updateUserPassword()" class="modalBtnTheme">변경</button>
				<br><br><br>&nbsp;
			</div>
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

	//// 취소 후에 이름을 저장하기 위해서 만들어둔 변수 
	var saveFirstName =$("#userInfoUpdateValueFirstName").val();
	var saveLastName = $("#userInfoUpdateValueLastName").val(); 
	var saveBirthDate = $('#userInfoUpdateValueBirthDate').val();

	
	/////////////////// 실명 수정하기 /////////////////////
	var cancleName=$('#userInfoNameCancelBtn'); // 실명 취소버튼 
	
	var firstNameInput = $("#userInfoUpdateValueFirstName");
	var lastNameInput = $("#userInfoUpdateValueLastName");
	
	//////// 실명 유효성 검사 ///

	// 유효성 검사에 필요한 변수 
	var userFirstNamePass = $('#userFirstNamePass');
	var userLastNamePass = $('#userLastNamePass');
	
	/// 이름 
	firstNameInput.on('keyup', function() {
		
		var firstNameCheck = RegExp(/^[가-힣]{1,20}$|^[A-Za-z]{1,60}$/);
		
		if(firstNameCheck.test(firstNameInput.val())){
			$('#userFirstNameError').text('통과');
			userFirstNamePass.val("y");
		}else{
			$('#userFirstNameError').text('이름은 최대 한글 20글자 or 영문 60글자');
			userFirstNamePass.val("n");
		}
	});
	
	// 성
	lastNameInput.on('keyup',function(){
		var lastNameCheck = RegExp(/^[가-힣]{1,10}$|^[A-Za-z]{1,30}$/);
		
		console.log(lastNameCheck.test(lastNameInput.val()));
		if(lastNameCheck.test(lastNameInput.val())){
			$('#userLastNameError').text('통과');
			userLastNamePass.val("y");
		}else {
			$('#userLastNameError').text('성은 최대 한글 10글자 or 영문 30글자');
			userLastNamePass.val("n");
		}
	});
	
	
	
	/// 이름 완료 버튼 클릭시
	$("#userInfoUpdateValueNameBtn").on('click',function(){
		if(firstNameInput.is(":disabled")){ //// firstName이 disabled라면 
			firstNameInput.attr("disabled",false);
			lastNameInput.attr("disabled",false);
			cancleName.css("display","inline");
			$('#userInfoUpdateValueNameBtn').text("완료");
						
		}else{
			var firstName = firstNameInput.val();
			var lastName= lastNameInput.val();
			var params = {
				firstName : firstName,
				lastName : lastName
			};
			
			/// 기본적으로는  y로 되어있으며 유효성에 실패하면 n으로 바뀜
			if(userFirstNamePass.val()==="y" && userLastNamePass.val()==="y" ){
				
		 		 $.ajax({
					url : "ajax/updateUserName",
					data : params,
					type: "POST",
					success: function(result){
						if(result){
							alert("회원정보 수정(이름, 성) 완료 :"+firstName);
							
							saveFirstName = firstName;
							saveLastName = lastName;
							// 성공 후 input
							firstNameInput.attr("disabled",true);
							lastNameInput.attr("disabled",true);
							$('#userInfoUpdateValueNameBtn').text("수정하기");
							$('#userFirstNameSpan').text(firstName);
						}
						
						
					},
					error:function(result){
						alert("통신실패")
					}
				});  
	
				firstNameInput.attr("disabled",true);
				lastNameInput.attr("disabled",true);
				cancleName.css("display","none");
				
				$('#userFirstNameError').empty();
				$('#userLastNameError').empty();
				
			}else{
				alert('유효성 통과 못함');
			} /// 유효성 검증
		
		} ////// if end
		
	}); 
	
	// 실명 취소시 
	cancleName.on('click',function(){
		$('#userInfoUpdateValueNameBtn').text("수정하기");
		
 		$("#userInfoUpdateValueFirstName").val(saveFirstName);
		$('#userInfoUpdateValueLastName').val(saveLastName);
		
		$("#userInfoUpdateValueFirstName").attr('disabled',true);
		$('#userInfoUpdateValueLastName').attr('disabled',true);
		cancleName.css('display','none');
		
		$('#userFirstNameError').empty();
		$('#userLastNameError').empty();
		
	});
	
	
	
	
	////////////////// 생년월일 /////////////////
	var cancelDate = $("#userInfoDateCancelBtn");
	
	var birthDateInput = $("#userInfoUpdateValueBirthDate"); // input
	var birthDateBtn = $("#userInfoUpdateValueBirthDateBtn"); // 수정 
	

	
	
	birthDateBtn.on("click", function() {
		var birthDate = birthDateInput.val();
		
		$('#userInfoUpdateValueBirthDateBtn').text('완료');
		
		if(birthDateInput.is(":disabled")){
			birthDateInput.attr("disabled",false);
			cancelDate.css("display","inline");
		}else{
			alert(birthDate);
			$.ajax({
				url : "ajax/updateUserBirthDate",
				type: "POST",
			//	data : "birthDate:"+birthDate,
				data : "birthDate="+birthDate,
				success: function(result){
					if(result){
						
						alert('회원정보 수정(생년월일) 완료');
						saveBirthDate = birthDate;
						
					}
				},
				error: function(){
					alert('실패');
				}
			});
			
			
			////// ajax 처리 후 
			birthDateInput.attr("disabled",true);
			cancelDate.css("display","none");
			
			$('#userInfoUpdateValueBirthDateBtn').text('수정하기');
		}
	});
	
	// 생년월일 취소 
	
	cancelDate.on('click',function(){
		$('#userInfoUpdateValueBirthDateBtn').text("수정하기");
		
		$('#userInfoUpdateValueBirthDate').val(saveBirthDate);
		$('#userInfoUpdateValueBirthDate').attr('disabled',true);
		cancelDate.css('display','none');
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
	
	
	


	// 임시 비밀번호로 로그인해서 왔으면 비밀번호 변경 modal 활성화
	$('document').ready(function(){
		var t = $('#isTemporaryLogIn').val();
		if(t === 'true'){
			$("#userInfoUpdatePasswordModify").css("display","block");
		}
	});



	/// 비밀번호 변경하기 
	// 비밀번호 유효성 
	var newPassword = $('#newPassword');
	var newPasswordCheck = $('#newPasswordCheck');
	
	newPassword.on('keyup',function(){
		
		
		var passwordCheck = new RegExp(/^[A-Za-z0-9~!@#$%^&*()_+|<>?:{}]{8,16}$/);
		
		if(passwordCheck.test(newPassword.val())){
			$('#passwordError_2').text('통과');
			$('#userPasswordPass').val('y');
		}else{
			$('#passwordError_2').text('대소문자,숫자,특수문자 8~16자리');
			$('#userPasswordPass').val('n');
		}
	});
	
	newPasswordCheck.on('keyup',function(){
		if(newPassword.val() === newPasswordCheck.val()){
			$('#passwordError_3').text('통과');
			$('#userPasswordCheckPass').val('y');
		}else{
			$('#passwordError_3').text('일치하지 않습니다.');
			$('#userPasswordCheckPass').val('n');
		}
	});
	
	
	
	
	function updateUserPassword(){
		
		alert($("#userInputPassword").val());
		var params = {
				userPassword : $('#userInputPassword').val(),
				newPassword : $('#newPassword').val()
		}
		
		if($('#userPasswordPass').val()==='y' && $('#userPasswordCheckPass').val()==='y'){
			$.ajax({
				type : "POST",
				url : "ajax/updateUserPassword",
				data : params,
				async : false,
				success : function(result){
					if(result == 0){
						
						alert("기존의 비밀번호가 일치하지 않습니다.");
						$('#passwordError_1').text("기존의 비밀번호가 일치하지 않습니다.");
						$('#passwordError_1').css('color','red');
						
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
		
		}else{
			alert("다시확인하세요");
		}
	}
	
		
	/////////////// 비밀번호 변경 모달 /////////////
		$('#modalBtn').on("click", function() {
			$("#userInfoUpdatePasswordModify").css("display","block");
		});
	
	////////////// 닫기 버튼 ///////////////
		$(".close").on("click",function(){
			$("#userInfoUpdatePasswordModify").css("display","none");
			$('.user-info-update-password-error').empty();
			$('.user-info-update-password-input').val('');
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


		var phoneOption =  "width=500, height=360, resizable=no, scrollbars=no, status=no, top="+top+", left="+left+";";
		

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