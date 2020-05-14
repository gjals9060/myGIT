<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스팅 등록상황</title>
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<input type="hidden" id="hostId" value="${hostId }" />
	<div id="wrap">
		<div class="hosting-status-title">등록한 단계에 따라 변함.</div>
		<div>
			1단계
			<div>
				<a href="modification/roomType?hostId=${hostId }">변경</a>
			</div>

		</div>
		<div>
			2단계
			<div id="registerStep2">
				<a href="registration/photo?hostId=${hostId }">계속</a>
			</div>
			<div id="modifyStep2">
				<a href="modification/photo?hostId=${hostId }">변경</a>
			</div>

		</div>
		<div>
			3단계
			<div id="registerStep3">
				<a href="registration/stayDate?hostId=${hostId }">계속</a>
			</div>
			<div id="modifyStep3">
				<a href="modification/stayDate?hostId=${hostId }">변경</a>
			</div>
		</div>

	</div>

	<script src="/p5/js/jquery-3.4.1.js"></script>
	<script>
		$(window).bind("pageshow", function(event) {

			$.ajax({
				type : "POST",
				url : "/p5/ajax/isIdentified",
				data : "hostId=" + $('#hostId').val(),
				success : function(result) {
					if (!result) {
						alert("접근 권한이 없는 페이지입니다.");
						location.replace("/p5"); // 홈으로 이동
						return;
					}
					// 접근 권한 통과하면 화면 갱신 수행
					//	refresh();

				},
				error : function() {
					alert("접근 권한 확인에 실패..");
				}
			}); // AJAX-END

			$.ajax({ // 1단계 등록완료하고 세션 초기화
				type : "POST",
				url : "registration/reset",
			}); // AJAX-END
		});

		function refresh() {
			/* 
			$.ajax({
				type : "POST",
				url : "hostingStatus/getHost",
				data : "hostId=" + $('#hostId').val(),
				success : function(host){
				//	alert(JSON.stringify(host)); // 내용 확인
					if(!host.name){ // step2 미완료
						$('#modifyStep2').css("display","none"); // step2 변경 X
						$('#registerStep3').css("display","none"); // step3 계속 X
						$('#modifyStep3').css("display","none"); // step3 변경 X
						return;
					}
					if(!host.creationDate){ // step3 미완료
						$('#registerStep2').css("display","none"); // step2 계속 X
						$('#modifyStep3').css("display","none"); // step3 변경 X
						return;
					}
					// step3 완료(등록 완료된 호스트 수정시 화면)
					$('#registerStep2').css("display","none"); // step2 계속 X
					$('#registerStep3').css("display","none"); // step3 계속 X
				},	
				error : function(){
					alert("호스팅 상태 보기 실패..");
				}
			}); // AJAX-END
			 */
		}
	</script>
</body>
</html>