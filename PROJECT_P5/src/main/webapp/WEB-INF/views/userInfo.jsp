<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>


<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"/>
	<div id=wrap>
		<section>
			<div class="userinfo-img-content">
				<img id="userinfoImg" src="./img/어린왕자.jpg" alt="" />
			</div>
			<div class="userinfo-update-content">
				<div class="userinfo-update-title">회원정보</div>
				<div class="userinfo-input">
					<div class="userinfo-input-block">
						<div class="userinfo-input-title">이메일</div>
						<div class="userinfo-input-value">
							${user.id }
						</div>
					</div>
					<div class="userinfo-input-block">
						<div class="userinfo-input-title">이름</div>
						<div class="userinfo-input-value">
							${user.firstName }
						</div>
					</div>
					<div class="userinfo-input-block">
						<div class="userinfo-input-title">성</div>
						<div class="userinfo-input-value">
							${user.lastName }
						</div>
					</div>
					<div class="userinfo-input-block">
						<div class="userinfo-input-title">생년월일</div>
						<div class="userinfo-input-value">
							${user.birthDate }
						</div>
					</div>
					<div class="userinfo-input-block">
						<div class="userinfo-input-title">전화번호</div>
						<div class="userinfo-input-value">
							<span> ${user.phoneNumber }</span>
							<button id="phoneCertificationBtn">인증</button>
							<span id="phoneCertificationOk">인증완료</span>
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
						
					<div class="userinfo-input-submit">
						<a href="/p5/userInfoUpdate">수정하기</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- wrap-end -->

</body>
</html>