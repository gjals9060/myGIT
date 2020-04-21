<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
#wrap {
	width: 1100px;
	margin: auto;
}

/* 회원이미지 프로필 */
.userinfo-img-content>img {
	width: 100%;
	border-radius: 50%;
}

section {
	display: grid;
	grid-template-columns: 35% 65%;
	box-sizing: border-box;
	height: 400px;
}

/* 회원정보 img  */
.userinfo-img-content {
	padding: 5px;
	margin: auto;
	width: 100%;
}

/* 회원정보 content  */
.userinfo-update-content {
	height: 100%;
	border: 1px solid;
	border-radius: 5px;
	box-sizing: border-box;
	margin-left: 10px;
}

/* 회원정보 input (margin 정리)*/
.userinfo-input {
	margin: auto;
	width: 60%;
	padding: 10px;
}

/* 회원정보 title */
.userinfo-update-title {
	font-size: 30px;
	text-align: center;
	padding-top: 10px;
}

/* 회원정보 input block */
.userinfo-input-block {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	padding: 10px;
}

/* 회원정보 input title */
.userinfo-input-title {
	text-align: left;
	font-size: 20px;
	width: 40%;
}

/* 회원정보 input 값 */
.userinfo-input-value {
	width: 60%;
}

/* input text 설정 (크기 / 디자인 ) */
.userinfo-input-value>input[type="text"] {
	width: 100%;
}

/* input password 설정 */
.userinfo-input-value>input[type=password] {
	width: 300px;
}

/* 회원 프로필 사진 block*/
.userinfo-update-img-block {
	width: 100%;
	margin: 50px;	
}

/* 회원 프로필 사진 이미지 */
.userinfo-update-img-block>img{
	width: 20%;
	border-radius: 50%;
}

/* 회원정보 수정 버튼 */
.userinfo-input-submit>input[type=button] {
	float: right;
	width: 100px;
}


/* 회원 비밀번호변경 modal */
.userinfo-password-update-modal {
	display: none;
	position: fixed;
	background-color: rgb(0, 0, 0, 0.9);
	width: 100%;
	height: 105%;
	top: 0;
	right: 0;
	padding: auto;
	top: 0;
}

/* 회원 비밀번호변경 modal-container */
.userinfo-password-update-container {
	width: 50%;
	height: 20%;
	background-color: white;
	margin: auto;
	margin-top: 300px;
	padding: 50px;
}

/* modal 애니메이션 설정 */
.userinfo-password-update-modal .userinfo-password-update-container {
	animation: downFrame 0.3s ease-out;
}

@keyframes downFrame {
	from {
		transform: translateY(-5%);
		opacity: 0.2;
	}
	to {
		transform: translateY(0%);
		opacity: 1;
	}
}


/* 비밀번호 유효성 검사 경고문 */
.userinfo-input-value-error{
	display: none;
	width: 40%;
	margin: auto;
}

/* 회원 비밀번호 변경 modal colse */
#userinfoPasswordUpdateClose {
	display: block;
	position: absolute;
	top: 0;
	right: 10px;
	cursor: pointer;
	font-size: 50px;
	font-style: bold;
	color: rgb(255, 255, 255);
}


</style>
</head>
<body>
	<div id=wrap>
		<section>
			<div class="userinfo-img-content">
				<img src="../img/어린왕자.jpg" alt="" />
			</div>
			<div class="userinfo-update-content">
				<div class="userinfo-update-title">회원정보</div>
				<div class="userinfo-input">
					<form action="../modal/loginModal.jsp" name="userinfoUpdateSubmit">
						<div class="userinfo-input-block">
							<div class="userinfo-input-title">이름</div>
							<div class="userinfo-input-value">
								<input type="text" />
							</div>
						</div>
						<div class="userinfo-input-block">
							<div class="userinfo-input-title">성</div>
							<div class="userinfo-input-value">
								<input type="text" />
							</div>
						</div>
						<div class="userinfo-input-block">
							<div class="userinfo-input-title">전화번호</div>
							<div class="userinfo-input-value">
								<input type="text" />
							</div>
						</div>
					</form>

					<!-- 비빌번호는 form에 포함이 되지 않게  -->
					<div class="userinfo-input-block">
						<div class="userinfo-input-title">비밀번호</div>
						<div class="userinfo-input-value">
							<input type="button" value="변경" id="userinfoPasswordUpdateBtn" />
						</div>
					</div>
					<div class="userinfo-input-submit">
						<input type="button" value="수정"
							onclick="userinfoUpdateSubmit.submit()" />
					</div>
				</div>
				<!-- 사용자 프로필 사진  -->
				<div class="userinfo-update-img-block"> 
				<!-- 변경해야할 부분 -->
					<img src="../img/어린왕자.jpg" alt="" />
				</div>
			</div>
			
		</section>
	</div> <!-- wrap-end -->

	<!-- 비밀번호 변경 modal -->
	<div class="userinfo-password-update-modal"
		id="userInfoPasswordUpdateModal">
		<span id="userinfoPasswordUpdateClose">&times;</span>
		<div class="userinfo-password-update-container">
		<!-- 비밀번호 form 설정해야함. -->
			<form action="" name="userinfoPasswordUpdateSubmit">
				<div class="userinfo-input-block">
					<div class="userinfo-input-title">현재 비밀번호</div>
					<div class="userinfo-input-value">
						<input type="password" class="password-value" />
					</div>
				</div>
				<div class="userinfo-input-value-error">
					<input type="text" disabled="disabled" />
				</div>
				<div class="userinfo-input-block">
					<div class="userinfo-input-title">비밀번호</div>
					<div class="userinfo-input-value">
						<input type="password" class="password-value" />
					</div>
				</div>
				<div class="userinfo-input-value-error">
					<input type="text" disabled="disabled" />
				</div>
				<div class="userinfo-input-block">
					<div class="userinfo-input-title">비밀번호확인</div>
					<div class="userinfo-input-value">
						<input type="password" class="password-value" />
					</div>
				</div>
				<div class="userinfo-input-value-error">
					<input type="text" disabled="disabled" />
				</div>
				<div class="userinfo-input-submit">
					<input type="button" value="변경"
						onclick="userinfoPasswordUpdateSubmit.submit()" />
				</div>
			</form>
		</div>
	</div>

</body>

<script>
	// 비밀번호 modal(div) popup
	var userinfoPasswordModal = document
			.getElementById("userInfoPasswordUpdateModal");
	var userinfoPasswordModalBtn = document
			.getElementById("userinfoPasswordUpdateBtn");
	userinfoPasswordModalBtn.onclick = function() {
		userinfoPasswordModal.style.display = "block";
	}
	
	// 비밀번호 modal close // modal close하면 input value ""로 초기화
	var passwordValue= document.getElementsByClassName("password-value")
	
	document.getElementById("userinfoPasswordUpdateClose").onclick = function(){
		for(var i = 0 ; i < passwordValue.length; i++){
			passwordValue[i].value="";
		}
		userinfoPasswordModal.style.display="none";
		
	}
	
	
	
	
	
</script>
</html>