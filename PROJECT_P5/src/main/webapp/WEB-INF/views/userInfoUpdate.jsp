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
	height: 500px;
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
.userinfo-update-img-block>img {
	width: 20%;
	border-radius: 50%;
}

/* 회원정보 수정 버튼 */
.userinfo-input-submit {
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

@keyframes downFrame {from { transform:translateY(-5%);
	opacity: 0.2;
}

to {
	transform: translateY(0%);
	opacity: 1;
}

}

/* 비밀번호 유효성 검사 경고문 */
.userinfo-input-value-error {
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

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
</head>
<body>
	<div id=wrap>
		<section>
			<div class="userinfo-img-content">
				<img id="userinfoImg" src="../img/어린왕자.jpg" alt="" />
			</div>
			<div class="userinfo-update-content">
				<div class="userinfo-update-title">회원정보</div>
				<div class="userinfo-input">
				
					<form action="" name="userinfoUpdateSubmit">
						<div class="userinfo-input-block">
							<div class="userinfo-input-title">이름</div>
							<div class="userinfo-input-value">
								<input type="text" value= ${user.firstName } />
							</div>
						</div>
						<div class="userinfo-input-block">
							<div class="userinfo-input-title">성</div>
							<div class="userinfo-input-value">
								<input type="text" value=${user.lastName }/>
							</div>
						</div>
						<div class="userinfo-input-block">
							<div class="userinfo-input-title">전화번호</div>
							<div class="userinfo-input-value">
								<button id="phoneCertificationBtn">인증</button>
								<div id="phoneCertificationOk">인증완료</div>
							</div>
							<!-- 핸드폰 인증 결과 / 인증 1 , no 0 --> 
							<input type="hidden" id="phoneCertificationInput" value="0"/> 
							
							<!-- 전화번호 인증이 되어있다면 인증버튼이 필요없음. -->
							<script>
								var phoneCertification=$("#phoneCertificationBtn");
								var phoneCertificationOk = $("#phoneCertificationOk");
								var phoneCertificationResult = $("#phoneCertificationInput").val();
	
								$(document).ready(function() {
									if(phoneCertificationResult == 1){ /// 인증이 된 회원 
										phoneCertification.hide();
									}else if(phoneCertificationResult == 0){
										phoneCertificationOk.hide();
									}
								});
								
							</script>
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
						<input type="submit" value="수정"/>
					</div>
					
					
					
					
				</div>
				<!-- 사용자 프로필 사진  -->
				<div class="userinfo-update-img-block">
					<!-- 사용자 프로필 사진 업로드 -->
					
				<script>
			 	//이미지 정보들을 담을 배열   
				var sel_files = [];
				$(document).ready(function() {
					$("#picture").on("change", handleImgFileSelect);
				}); 
				
				
				
				function fileUploadAction() {
					console.log("fileUploadAction");
					$("#picture").trigger('click');
				} 
				
				function handleImgFileSelect(e) {
				// 이미지 정보들을 초기화   
					sel_files = [];
					  $(".imgs_wrap").empty();  
					var files = e.target.files;
					var filesArr = Array.prototype.slice.call(files);
					var index = 0; 
					filesArr.forEach(function(f) {
								if (!f.type.match("image.*")) {
									alert("확장자는 이미지 확장자만 가능합니다.");
									return;
								}
								sel_files.push(f);
								var reader = new FileReader();
								reader.onload = function(e) {
								/* 	var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
											+ index
											+ ")\" id=\"img_id_"
											+ index
											+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='클릭 시 삭제됩니다.' width=\"150px\" ></a>";
									$(".imgs_wrap").append(html);
									index++; */
									
									///// 이미지를 추가하면 그 이미지를 가져옴
									$(".userinfo-img-content *").remove();
									$(".userinfo-img-content").append(
										"<img src=\"" + e.target.result + "\"id='userinfoImg'></a>"		
									);
									
									alert($("#userinfoImg").attr("src"));
								}
								reader.readAsDataURL(f);
							});
				}
				
	
				function deleteImageAction(index) {
					console.log("index : " + index);
					console.log("sel length : " + sel_files.length);
					sel_files.splice(index, 1);
					var img_id = "#img_id_" + index;
					$(img_id).remove();
					
					/// 이미지 삭제시 프로필 사진을 기본 이미지로 변경.
					$(".userinfo-img-content *").remove();
					$(".userinfo-img-content").append(
							"<img src=\"../img/어린왕자.jpg\"id='userinfoImg'></a>"		
						);
				}
				
				function fileUploadAction() {
					console.log("fileUploadAction");
					$("#picture").trigger('click');
				}
				
				function submitAction() {
					console.log("업로드 파일 갯수 : " + sel_files.length);
					var data = new FormData();
					for (var i = 0, len = sel_files.length; i < len; i++) {
						var name = "image_" + i;
						data.append(name, sel_files[i]);
					}
					data.append("image_count", sel_files.length);
					if (sel_files.length < 1) {
						alert("한개이상의 파일을 선택해주세요.");
						return;
					}
					var xhr = new XMLHttpRequest();
					xhr.open("POST", "./register4.jsp");
					xhr.onload = function(e) {
						if (this.status == 200) {
							console.log("Result : "
									+ e.currentTarget.responseText);
						}
					}
					xhr.send(data);
				}
			</script>

					<div class="upload_List_Block">

						<div class="upload_List_Title">사진</div>

						<div class="upload_List_Input">
							<div class="input_wrap">
								<div class="imgs_wrap">
									<img id="img" />
								</div>
								<a href="javascript:" onclick="fileUploadAction();" class="my_button"></a> 
								<input type="file" id="picture" multiple="multiple" />
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
	</div>
	<!-- wrap-end -->

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
	
	
	$('#phoneCertificationBtn').on('click', function() {
		var phoneURL = '../home.jsp';
		var phoneOption =  "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		
		window.open(phoneURL,"",phoneOption);	
	});
	
	
	
	
	
</script>
</html>